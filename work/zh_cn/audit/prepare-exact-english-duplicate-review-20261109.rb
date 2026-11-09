#!/usr/bin/env ruby

require "csv"
require "digest"
require "json"

ROOT = File.expand_path("../../..", __dir__)
EN_PATH = File.join(ROOT, "src/csv/en_us/locatexts_en_us.koalocatext_default.csv")
JA_PATH = File.join(ROOT, "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv")
ZH_PATH = File.join(ROOT, "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
KO_PATH = File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
EDITS_PATH = File.join(ROOT, "work/zh_cn/audit/exact-english-duplicate-edits-20261109.tsv")

Row = Struct.new(:id, :text, :normalized_text)

def parse_rows(path)
  rows = []
  current = nil
  File.open(path, "rb") do |file|
    file.each_line do |line|
      if line.match?(/\A\d+;/)
        rows << current if current
        current = line.dup
      elsif current
        current << line
      elsif rows.empty?
        next
      end
    end
  end
  rows << current if current
  rows.map do |raw|
    eol = raw.end_with?("\r\n") ? 2 : 1
    body = raw.byteslice(0, raw.bytesize - eol)
    id, field = body.split(";", 2)
    raise "malformed row in #{path}" unless id && field
    if field.start_with?('"')
      raise "unclosed field at #{path}:#{id}" unless field.end_with?('"')
      text = field[1...-1].gsub('""', '"')
    else
      text = field
    end
    text.force_encoding("UTF-8")
    Row.new(Integer(id, 10), text, text.gsub(/\r\n?/, "\n"))
  end.to_h { |row| [row.id, row] }
end

def compact_variants(ids, rows, original_ko = nil)
  grouped = Hash.new { |hash, key| hash[key] = [] }
  ids.each do |id|
    text = original_ko ? original_ko.fetch(id) { rows.fetch(id).normalized_text } : rows.fetch(id).normalized_text
    grouped[text.gsub(/\r\n?/, "\n")] << id
  end
  grouped.map do |text, variant_ids|
    { count: variant_ids.length, text: text }
  end
end

offset = Integer(ARGV.fetch(0, "0"), 10)
batch_size = Integer(ARGV.fetch(1, "25"), 10)
abort "offset must be nonnegative and batch_size must be positive" if offset.negative? || !batch_size.positive?

en = parse_rows(EN_PATH)
ja = parse_rows(JA_PATH)
zh = parse_rows(ZH_PATH)
ko = parse_rows(KO_PATH)
original_ko = {}
canonical_by_source = {}
CSV.foreach(EDITS_PATH, headers: true, col_sep: "\t") do |row|
  source_hash = row.fetch("source_sha256")
  original_ko[Integer(row.fetch("changed_id"), 10)] = row.fetch("old_korean")
  canonical_by_source[source_hash] = row.fetch("new_korean")
end

groups = Hash.new { |hash, key| hash[key] = [] }
en.each do |id, row|
  groups[row.normalized_text] << id
end

review_groups = []
groups.each do |source, ids|
  source_hash = Digest::SHA256.hexdigest(source)
  variants = ids.to_h do |id|
    text = original_ko.fetch(id) { canonical_by_source.fetch(source_hash) { ko.fetch(id).normalized_text } }
    [id, text.gsub(/\r\n?/, "\n")]
  end
  next if variants.values.uniq.length < 2

  review_groups << {
    source_sha256: source_hash,
    group_size: ids.length,
    ids: ids,
    english: source,
    japanese_variants: compact_variants(ids, ja),
    chinese_variants: compact_variants(ids, zh),
    korean_variants: variants.values.group_by(&:itself).map do |text, entries|
      { count: entries.length, text: text }
    end,
    applied_translation: ko.fetch(ids.first).normalized_text
  }
end

selected = review_groups.slice(offset, batch_size) || []
puts "review_groups=#{review_groups.length} offset=#{offset} returned=#{selected.length}"
selected.each_with_index do |item, index|
  item[:index] = offset + index
  item[:current_translation] = item.delete(:applied_translation)
  puts JSON.generate(item)
end
