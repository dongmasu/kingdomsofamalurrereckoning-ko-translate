#!/usr/bin/env ruby

require "digest"
require "json"

ROOT = File.expand_path("../../..", __dir__)
EN_PATH = File.join(ROOT, "src/csv/en_us/locatexts_en_us.koalocatext_default.csv")
KO_PATH = File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
DECISIONS_PATH = File.join(ROOT, "work/zh_cn/audit/exact-english-duplicate-review-decisions-20261109.jsonl")

Row = Struct.new(:id, :raw, :text, :normalized_text, :field_quoted, :record_eol, :inner_eols)

def records(path)
  result = []
  header = nil
  current = nil

  File.open(path, "rb") do |file|
    file.each_line do |line|
      if line.match?(/\A\d+;/)
        result << current if current
        current = line.dup
      elsif current
        current << line
      elsif header.nil?
        header = line.dup
      else
        raise "unexpected content before first record in #{path}"
      end
    end
  end
  result << current if current
  raise "missing header in #{path}" unless header
  [header, result]
end

def decode_row(raw)
  eol = raw.end_with?("\r\n") ? "\r\n" : raw[-1]
  raise "record is missing its final line ending" unless ["\r\n", "\n", "\r"].include?(eol)
  body = raw.byteslice(0, raw.bytesize - eol.bytesize)
  match = body.match(/\A(\d+);(.*)\z/m)
  raise "malformed row boundary" unless match

  id = Integer(match[1], 10)
  field = match[2]
  quoted = field.start_with?('"')
  if quoted
    raise "unclosed quoted field at ID #{id}" unless field.end_with?('"')
    text = field[1...-1].gsub('""', '"')
  else
    raise "unquoted delimiter or quote at ID #{id}" if field.match?(/[;"]/)
    text = field
  end
  text.force_encoding("UTF-8")
  Row.new(id, raw, text, text.gsub(/\r\n?/, "\n"), quoted, eol, text.scan(/\r\n|\n|\r/))
end

def parse_file(path)
  header, raw_records = records(path)
  rows = raw_records.map { |raw| decode_row(raw) }
  ids = rows.map(&:id)
  raise "duplicate IDs in #{path}" unless ids.uniq.length == ids.length
  [header, rows]
end

def encode_field(text, quoted)
  return %("#{text.gsub('"', '""')}") if quoted
  raise "field requires CSV quoting" if text.match?(/[;"\r\n]/)
  text
end

def serialize_translation(text, row)
  normalized = text.gsub(/\r\n?/, "\n")
  separators = normalized.count("\n")
  if separators.positive?
    styles = row.inner_eols
    if styles.length == separators
      pieces = styles
    else
      fallback = styles.group_by(&:itself).max_by { |style, occurrences| [occurrences.length, style == "\r\n" ? 1 : 0] }&.first || "\r\n"
      pieces = Array.new(separators, fallback)
    end
    parts = normalized.split("\n", -1)
    text = parts.each_with_index.each_with_object(+"") do |(part, index), output|
      output << part
      output << pieces[index] if index < pieces.length
    end
  else
    text = normalized
  end
  encode_field(text, row.field_quoted || text.match?(/[;"\r\n]/))
end

abort "usage: #{$PROGRAM_NAME} EXPECTED_INPUT_SHA256" unless ARGV.length == 1 && ARGV[0] =~ /\A[0-9a-f]{64}\z/
expected_sha = ARGV.fetch(0)
input_bytes = File.binread(KO_PATH)
input_sha = Digest::SHA256.hexdigest(input_bytes)
abort "input changed: expected #{expected_sha}, found #{input_sha}" unless input_sha == expected_sha

_en_header, en_rows = parse_file(EN_PATH)
ko_header, ko_rows = parse_file(KO_PATH)
en_by_id = en_rows.to_h { |row| [row.id, row] }
ko_by_id = ko_rows.to_h { |row| [row.id, row] }
abort "English/Korean ID sets differ" unless en_by_id.keys.sort == ko_by_id.keys.sort

groups = Hash.new { |hash, key| hash[key] = [] }
en_by_id.each { |id, row| groups[Digest::SHA256.hexdigest(row.normalized_text)] << id }
decisions = File.readlines(DECISIONS_PATH, chomp: true).reject(&:empty?).map { |line| JSON.parse(line) }
source_hashes = decisions.map { |decision| decision.fetch("source_sha256") }
abort "duplicate source decision" unless source_hashes.uniq.length == source_hashes.length

rows_to_write = ko_by_id.dup
edited_rows = 0
decisions.each do |decision|
  source_hash = decision.fetch("source_sha256")
  ids = groups.fetch(source_hash) { raise "English source not found: #{source_hash}" }
  raise "group size mismatch for #{source_hash}" unless ids.length == decision.fetch("group_size")
  texts = ids.map { |id| ko_by_id.fetch(id).normalized_text }.uniq
  translations = if decision["keep_current"]
    raise "keep_current conflicts with another translation for #{source_hash}" if decision.key?("translation") || decision.key?("translations_by_id")
    raise "group is not uniform before review: #{source_hash}" unless texts.length == 1
    ids.to_h { |id| [id, texts.first] }
  elsif decision.key?("translations_by_id")
    raise "translations_by_id conflicts with translation for #{source_hash}" if decision.key?("translation")
    by_id = decision.fetch("translations_by_id").to_h do |id, text|
      [Integer(id, 10), text.gsub(/\r\n?/, "\n")]
    end
    raise "per-ID translation IDs mismatch for #{source_hash}" unless by_id.keys.sort == ids.sort

    if texts.length > 1
      current_by_id = ids.to_h { |id| [id, ko_by_id.fetch(id).normalized_text] }
      raise "group has unexpected per-ID translations for #{source_hash}" unless current_by_id == by_id
    end
    by_id
  else
    raise "translation missing for #{source_hash}" unless decision.key?("translation")
    raise "group is not uniform before review: #{source_hash}" unless texts.length == 1
    ids.to_h { |id| [id, decision.fetch("translation")] }
  end

  ids.each do |id|
    row = ko_by_id.fetch(id)
    translation = translations.fetch(id)
    next if row.normalized_text == translation.gsub(/\r\n?/, "\n")
    encoded = serialize_translation(translation, row)
    rows_to_write[id] = decode_row("#{id};#{encoded}#{row.record_eol}".b)
    edited_rows += 1
  end
end

header_bytes = ko_header
output = header_bytes.b + ko_rows.map { |row| rows_to_write.fetch(row.id).raw.b }.join.b
out_rows = ko_rows.map { |row| decode_row(rows_to_write.fetch(row.id).raw) }
raise "record count changed" unless out_rows.length == ko_rows.length
raise "ID order changed" unless out_rows.map(&:id) == ko_rows.map(&:id)
raise "BOM changed" unless output.start_with?("\xEF\xBB\xBF".b)

decisions.each do |decision|
  ids = groups.fetch(decision.fetch("source_sha256"))
  actual = ids.to_h { |id| [id, rows_to_write.fetch(id).normalized_text] }
  if decision.key?("translations_by_id")
    expected = decision.fetch("translations_by_id").to_h do |id, text|
      [Integer(id, 10), text.gsub(/\r\n?/, "\n")]
    end
    raise "per-ID translation mismatch: #{decision.fetch("source_sha256")}" unless actual == expected
  else
    raise "reviewed group did not converge: #{decision.fetch("source_sha256")}" unless actual.values.uniq.length == 1
  end
end

output_sha = Digest::SHA256.hexdigest(output)
File.binwrite(KO_PATH, output)
puts "input_sha256=#{input_sha}"
puts "reviewed_groups=#{decisions.length}"
puts "rows_changed=#{edited_rows}"
puts "output_sha256=#{output_sha}"
