#!/usr/bin/env ruby
require 'csv'
require 'digest'

PATH = 'work/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
EXPECTED = 'f825a2cf617a15267f9ee1c08f7d79b86b10d6df9fdcf6b42c85e1224befe10a'
BACKUP = '/private/tmp/ko-translate-backups/20261014/before-sagrell-D20387/locatexts_zh_cn.koalocatext_default.csv'
MANIFEST = 'work/zh_cn/audit/sagrell-name-edits-D20387.tsv'

SOURCE_PATHS = {
  'en_us' => 'src/csv/en_us/locatexts_en_us.koalocatext_default.csv',
  'ja_jp' => 'src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv',
  'zh_cn' => 'src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
}.freeze

NAME_PATTERN = /(?:새그렐|세그렐|사그렐|서그렐|세이그렐|새그럴)/.freeze
SOURCE_NAME_PATTERNS = {
  'en_us' => /Sagrell/i,
  'ja_jp' => /サグレル|サグレール/,
  'zh_cn' => /萨格勒尔|撒格雷尔|撒格勒尔/
}.freeze

def read_rows(path)
  CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
end

def record_ranges_by_id(bytes)
  ranges = {}
  start = bytes.start_with?("\xEF\xBB\xBF".b) ? 3 : 0
  first_separator = nil
  quoted = false
  index = start

  while index < bytes.bytesize
    byte = bytes.getbyte(index)
    if byte == 34
      if quoted && bytes.getbyte(index + 1) == 34
        index += 1
      else
        quoted = !quoted
      end
    elsif byte == 59 && !quoted && first_separator.nil?
      first_separator = index
    elsif byte == 10 && !quoted
      finish = index + 1
      id = bytes.byteslice(start...first_separator).force_encoding(Encoding::UTF_8)
      ranges[id] = (start...finish)
      start = finish
      first_separator = nil
    end
    index += 1
  end

  if start < bytes.bytesize
    id = bytes.byteslice(start...first_separator).force_encoding(Encoding::UTF_8)
    ranges[id] = (start...bytes.bytesize)
  end
  ranges
end

def field_spans(record)
  spans = []
  start = 0
  quoted = false
  index = 0
  while index < record.bytesize
    byte = record.getbyte(index)
    if byte == 34
      if quoted && record.getbyte(index + 1) == 34
        index += 1
      else
        quoted = !quoted
      end
    elsif byte == 59 && !quoted
      spans << (start...index)
      start = index + 1
    end
    index += 1
  end
  finish = record.bytesize
  finish -= 2 if record.byteslice(finish - 2, 2) == "\r\n".b
  finish -= 1 if finish > start && record.getbyte(finish - 1) == 10
  spans << (start...finish)
  spans
end

def cell_value(record, span)
  field = record.byteslice(span).dup.force_encoding(Encoding::UTF_8)
  CSV.parse(field, col_sep: ';').first.first
end

def normalized_text(source, korean)
  text = korean.dup
  first_english_name = source.match(/\b(?:(Sir|Lady)\s+)?Sagrell\b/i)
  title = first_english_name && first_english_name[1]
  english_name = title ? "#{title.capitalize} Sagrell" : 'Sagrell'

  # Keep a Sir/Lady title attached to the Korean name rather than its parenthesis.
  text = text.gsub(/#{NAME_PATTERN}\s*\((?:Sir |Lady )?Sagrell\)/i, '사그렐')
  text = text.gsub(NAME_PATTERN, '사그렐')

  if title == 'Sir'
    first_name = text.index('사그렐')
    if first_name && text[0...first_name].match?(/(?:\A|[\s,])서 \z/)
      text = text[0...(first_name - 2)] + text[first_name..-1]
      first_name -= 2
      following = text[(first_name + '사그렐'.length)..-1].to_s
      text = text[0...(first_name + '사그렐'.length)] +
        ' 경' + text[(first_name + '사그렐'.length)..-1] unless
        following.start_with?(' 경')
    end
  end

  # A complete English title or title already paired with the Korean name is enough.
  return text if text.match?(/\([^)]*\bSagrell\b[^)]*\)/i)

  first_name = text.index('사그렐')
  return text unless first_name

  finish = first_name + '사그렐'.length
  suffix = text[finish..-1].to_s
  if suffix.start_with?(' 경')
    finish += ' 경'.length
  elsif suffix.start_with?(' 부인')
    finish += ' 부인'.length
  end

  text[0...finish] + "(#{english_name})" + text[finish..-1].to_s
end

def csv_rows(path)
  read_rows(path).to_a
end

active_bytes = File.binread(PATH)
active_hash = Digest::SHA256.hexdigest(active_bytes)
abort "active CSV hash differs: #{active_hash}" unless active_hash == EXPECTED

korean_rows = read_rows(PATH)
active_records = record_ranges_by_id(active_bytes)
sources = SOURCE_PATHS.to_h do |locale, path|
  rows = read_rows(path)
  abort "#{locale} row count mismatch" unless rows.length == korean_rows.length
  [locale, rows.to_h { |row| [row['ID_Linha'], row['Texto']] }]
end

other_resource_counts = %w[affix base].to_h do |resource|
  counts = SOURCE_PATHS.keys.to_h do |locale|
    path = "src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{resource}.csv"
    rows = CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
    [locale, rows.count { |row| row['Texto'].to_s.match?(SOURCE_NAME_PATTERNS.fetch(locale)) }]
  end
  active = CSV.read(
    "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv",
    headers: true, col_sep: ';', encoding: 'bom|utf-8'
  )
  counts['ko'] = active.count { |row| row['Texto'].to_s.match?(NAME_PATTERN) }
  [resource, counts]
end
abort "unexpected Sagrell rows in affix/base: #{other_resource_counts.inspect}" unless
  other_resource_counts.values.all? { |counts| counts.values.all?(&:zero?) }

english = sources.fetch('en_us')
target_ids = english.each_with_object([]) do |(id, text), ids|
  ids << id if text.to_s.match?(/\bSagrell\b/i)
end
abort "unexpected Sagrell default-row count: #{target_ids.length}" unless target_ids.length == 136

ko_by_id = korean_rows.to_h { |row| [row['ID_Linha'], row['Texto']] }
changes = {}
target_ids.each do |id|
  old = ko_by_id.fetch(id).to_s
  source = english.fetch(id).to_s
  replacement = normalized_text(source, old)
  changes[id] = [old, replacement] if replacement != old
end

header = active_bytes.sub(/\A\xEF\xBB\xBF/n, '').split(/\r?\n/, 2).first
texto_index = CSV.parse_line(header, col_sep: ';').index('Texto')
abort 'Texto column missing' unless texto_index

changes.each do |id, (old, _replacement)|
  record = active_bytes.byteslice(active_records.fetch(id))
  abort "Texto mismatch at ID #{id}" unless
    cell_value(record, field_spans(record)[texto_index]) == old
end

puts "default Sagrell rows=#{target_ids.length}; changed Texto cells=#{changes.length}"
puts "affix/base Sagrell matches=#{other_resource_counts.inspect}"
changes.each do |id, (old, replacement)|
  before = old.gsub(/\s+/, ' ')[0, 100]
  after = replacement.gsub(/\s+/, ' ')[0, 100]
  puts "#{id}: #{before.inspect} -> #{after.inspect}"
end
exit unless ENV['APPLY'] == '1'

abort 'byte-identical backup missing or differs' unless File.binread(BACKUP) == active_bytes

updated = active_bytes.dup
changes.keys.sort_by { |id| -id.to_i }.each do |id|
  old, replacement = changes.fetch(id)
  record_range = record_ranges_by_id(updated).fetch(id)
  record = updated.byteslice(record_range)
  span = field_spans(record)[texto_index]
  abort "old target mismatch at ID #{id}" unless cell_value(record, span) == old
  replacement_field = CSV.generate_line([replacement], col_sep: ';', row_sep: '').b
  start_at = record_range.begin + span.begin
  end_at = record_range.begin + span.end
  updated =
    updated.byteslice(0, start_at) +
    replacement_field +
    updated.byteslice(end_at, updated.bytesize - end_at)
end

inverse = updated.dup
changes.keys.sort_by(&:to_i).each do |id|
  old, replacement = changes.fetch(id)
  record_range = record_ranges_by_id(inverse).fetch(id)
  record = inverse.byteslice(record_range)
  span = field_spans(record)[texto_index]
  abort "new target mismatch at ID #{id}" unless cell_value(record, span) == replacement
  start_at = record_range.begin + span.begin
  end_at = record_range.begin + span.end
  original_range = active_records.fetch(id)
  original_record = active_bytes.byteslice(original_range)
  original_span = field_spans(original_record)[texto_index]
  inverse =
    inverse.byteslice(0, start_at) +
    original_record.byteslice(original_span) +
    inverse.byteslice(end_at, inverse.bytesize - end_at)
end
abort 'inverse edits did not restore original bytes' unless inverse == active_bytes

File.binwrite(PATH, updated)

manifest = +"ID\tEnglish\tJapanese\tChinese\tKorean before\tKorean after\n"
changes.keys.sort_by(&:to_i).each do |id|
  fields = [
    id,
    sources.fetch('en_us').fetch(id),
    sources.fetch('ja_jp').fetch(id),
    sources.fetch('zh_cn').fetch(id),
    *changes.fetch(id)
  ]
  manifest << CSV.generate_line(fields, col_sep: "\t", row_sep: "\n")
end
File.binwrite(MANIFEST, manifest)

puts "post-edit SHA-256=#{Digest::SHA256.hexdigest(updated)}"
puts "manifest=#{MANIFEST}"
