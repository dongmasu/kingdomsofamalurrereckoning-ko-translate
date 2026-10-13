#!/usr/bin/env ruby
require "csv"
require "json"

# Usage: ruby prepare-reconstructed-open-100.rb START_INDEX DECISION
# START_INDEX is zero-based in the post-D19728 905-key manifest.
index = Integer(ARGV.fetch(0))
decision = Integer(ARGV.fetch(1))
abort "invalid batch" unless index >= 0 && decision >= 19730
persisted_manifest = "work/zh_cn/audit/reconstructed-open-default-after-D19728-20261012.json"
source_manifest = File.exist?(persisted_manifest) ?
  persisted_manifest : "/private/tmp/open-default-after-D19728.json"
manifest = JSON.parse(File.read(source_manifest))
if !File.exist?(persisted_manifest)
  File.write(persisted_manifest, JSON.generate(manifest))
end
if index == manifest.size
  puts "#{persisted_manifest}: #{manifest.size} candidate keys persisted"
  exit
end
batch = manifest.slice(index, 100)
abort "empty or non-unique batch" if batch.nil? || batch.empty? ||
  batch.map { |e| e.fetch("id") }.uniq.size != batch.size
ids = batch.map { |e| e.fetch("id") }
texts = {}
{
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  "ko" => "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
}.each do |locale, path|
  wanted = ids.to_h { |id| [id, true] }
  cells = {}
  raw = File.binread(path)
  record = +"".b
  id = nil
  consume = lambda do
    next unless id && wanted[id]
    parsed = CSV.parse_line(record.dup.force_encoding("UTF-8"),
      col_sep: ";", row_sep: :auto)
    if parsed.nil? || parsed.size < 2
      text = record.sub(/\A(?:\xEF\xBB\xBF)?\d+;/n, "").sub(/\r?\n\z/n, "")
      text = text[1...-1].gsub('""', '"') if text.start_with?('"') && text.end_with?('"')
      cells[id] = text.force_encoding("UTF-8")
    else
      cells[id] = parsed[1]
    end
  rescue CSV::MalformedCSVError
    text = record.sub(/\A(?:\xEF\xBB\xBF)?\d+;/n, "").sub(/\r?\n\z/n, "")
    text = text[1...-1].gsub('""', '"') if text.start_with?('"') && text.end_with?('"')
    cells[id] = text.force_encoding("UTF-8")
  end
  raw.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      consume.call
      id = row_id
      record = line.dup
    elsif id
      record << line
    end
  end
  consume.call
  abort "missing #{locale} rows: #{(ids - cells.keys).inspect}" unless
    (ids - cells.keys).empty?
  texts[locale] = cells
end
out = "work/zh_cn/audit/uncertain-100-D#{decision}-20261012.jsonl"
abort "snapshot already exists: #{out}" if File.exist?(out)
File.open(out, "w") do |file|
  batch.each_with_index do |entry, position|
    id = entry.fetch("id")
    file.puts(JSON.generate(entry.merge(
      "en" => texts.fetch("en").fetch(id),
      "ja" => texts.fetch("ja").fetch(id),
      "zh" => texts.fetch("zh").fetch(id),
      "ko" => texts.fetch("ko").fetch(id),
      "position" => position + 1
    )))
  end
end
puts "#{out} #{batch.size} keys #{ids.first}-#{ids.last}; read-only sources"
