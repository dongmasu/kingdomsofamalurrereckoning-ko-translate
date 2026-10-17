#!/usr/bin/env ruby
require 'csv'
require 'digest'

PATH = 'work/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
EXPECTED = '07981d157152c8a5880c23c16c81e466a23c69a17103d2a4df37d8d63dce31c9'
BACKUP = '/private/tmp/ko-translate-backups/20261014/before-thresh-terminology-D20384/locatexts_zh_cn.koalocatext_default.csv'
MANIFEST = 'work/zh_cn/audit/thresh-terminology-edits-D20384.tsv'

SOURCE_PATHS = {
  'en_us' => 'src/csv/en_us/locatexts_en_us.koalocatext_default.csv',
  'ja_jp' => 'src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv',
  'zh_cn' => 'src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
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
  protected = []
  families = [
    [
      /Grave\s+Thresh/i,
      /(?:무덤약탈자|(?:무덤|그레이브)\s*(?:쓰레시|스레시|스레쉬|트레쉬|트레시))(?:\(Grave Thresh\))?/i,
      '무덤 스레시(Grave Thresh)'
    ],
    [
      /Paragon\s+Thresh/i,
      /(?:(?:최상급|패러곤|파라곤)\s*)(?:쓰레시|스레시|스레쉬|트레쉬|트레시)(?:\(Paragon Thresh\))?/i,
      '파라곤 스레시(Paragon Thresh)'
    ],
    [
      /Bog\s+Thresh/i,
      /늪지\s*(?:쓰레시|스레시|스레쉬|트레쉬|트레시)(?:\(Bog Thresh\))?/i,
      '늪지 스레시(Bog Thresh)'
    ],
    [
      /Kora\s+Thresh/i,
      /코라\s*(?:쓰레시|스레시|스레쉬|트레쉬|트레시)(?:\(Kora Thresh\))?/i,
      '코라 스레시(Kora Thresh)'
    ]
  ]

  families.each do |source_pattern, korean_pattern, canonical|
    next unless source.match?(source_pattern)
    text = text.gsub(korean_pattern) do
      marker = "__D20384_TERM_#{protected.length}__"
      protected << [marker, canonical]
      marker
    end
  end

  text = text.gsub(/(?:쓰레시|스레시|스레쉬|트레쉬|트레시)(?:\((?:Thresh|thresh)\))?/i) do
    marker = "__D20384_TERM_#{protected.length}__"
    protected << [marker, '스레시(Thresh)']
    marker
  end
  protected.each { |marker, canonical| text = text.gsub(marker, canonical) }
  text
end

active_bytes = File.binread(PATH)
abort "active CSV hash differs: #{Digest::SHA256.hexdigest(active_bytes)}" unless
  Digest::SHA256.hexdigest(active_bytes) == EXPECTED

korean_rows = read_rows(PATH)
active_records = record_ranges_by_id(active_bytes)
sources = SOURCE_PATHS.to_h do |locale, path|
  rows = read_rows(path)
  abort "#{locale} row count mismatch" unless rows.length == korean_rows.length
  [locale, rows.to_h { |row| [row['ID_Linha'], row['Texto']] }]
end

english = sources.fetch('en_us')
target_ids = english.each_with_object([]) do |(id, text), ids|
  ids << id if text.to_s.match?(/(?<![a-z])thresh(?:es)?(?![a-z])/i)
end
abort "unexpected Thresh source-row count: #{target_ids.length}" unless target_ids.length == 82

ko_by_id = korean_rows.to_h { |row| [row['ID_Linha'], row['Texto']] }
changes = {}
target_ids.each do |id|
  source = english.fetch(id).to_s
  old = ko_by_id.fetch(id).to_s
  replacement = normalized_text(source, old)
  next if replacement == old
  changes[id] = [old, replacement]
end

header = active_bytes.sub(/\A\xEF\xBB\xBF/n, '').split(/\r?\n/, 2).first
columns = CSV.parse_line(header, col_sep: ';')
texto_index = columns.index('Texto')
abort 'Texto column missing' unless texto_index

changes.each do |id, (old, _replacement)|
  record_range = active_records.fetch(id)
  record = active_bytes.byteslice(record_range)
  span = field_spans(record)[texto_index]
  abort "Texto mismatch at ID #{id}" unless cell_value(record, span) == old
end

puts "source rows=#{target_ids.length}; changed Texto cells=#{changes.length}"
exit unless ENV['APPLY'] == '1'

abort 'byte-identical backup missing or differs' unless File.binread(BACKUP) == active_bytes
updated = active_bytes.dup
changes.keys.sort_by { |id| -id.to_i }.each do |id|
  old, replacement = changes.fetch(id)
  record_range = record_ranges_by_id(updated).fetch(id)
  record = updated.byteslice(record_range)
  span = field_spans(record)[texto_index]
  abort "old target mismatch at ID #{id}" unless cell_value(record, span) == old
  raw_field = record.byteslice(span).dup.force_encoding(Encoding::UTF_8)
  replacement_field = normalized_text(english.fetch(id).to_s, raw_field).b
  abort "unexpected raw Texto transform at ID #{id}" unless
    CSV.parse(replacement_field.force_encoding(Encoding::UTF_8), col_sep: ';').first.first == replacement
  start_at = record_range.begin + span.begin
  end_at = record_range.begin + span.end
  updated =
    updated.byteslice(0, start_at) +
    replacement_field.b +
    updated.byteslice(end_at, updated.bytesize - end_at)
end

inverse = updated.dup
changes.keys.sort_by(&:to_i).each do |id|
  old, replacement = changes.fetch(id)
  record_range = record_ranges_by_id(inverse).fetch(id)
  record = inverse.byteslice(record_range)
  span = field_spans(record)[texto_index]
  begin
    actual = cell_value(record, span)
  rescue CSV::MalformedCSVError => error
    abort "malformed edited field at ID #{id}: #{error.message}"
  end
  abort "new target mismatch at ID #{id}" unless actual == replacement
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

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
abort 'BOM, line endings, or ID order changed' unless shape.call(active_bytes) == shape.call(updated)
parsed = updated.sub(/\A\xEF\xBB\xBF/n, '').force_encoding(Encoding::UTF_8)
unless parsed.valid_encoding?
  parsed.scrub { |invalid| warn "invalid bytes: #{invalid.bytes.inspect}"; '?' }
  abort 'invalid UTF-8 after edits'
end
updated_records = record_ranges_by_id(updated)
abort "record scanner found #{updated_records.length} rows after edits" unless updated_records.length == korean_rows.length + 1
changes.each do |id, (_old, replacement)|
  range = updated_records.fetch(id)
  record = updated.byteslice(range).force_encoding(Encoding::UTF_8)
  fields = CSV.parse(record, col_sep: ';').first
  abort "parsed Texto mismatch at ID #{id}" unless fields[texto_index] == replacement
end
after_rows = CSV.parse(parsed, col_sep: ';', headers: true)
abort 'row count changed' unless after_rows.length == korean_rows.length
changes.each do |id, (_old, replacement)|
  actual = after_rows.find { |row| row['ID_Linha'] == id }['Texto']
  abort "target cell verification failed at #{id}" unless actual == replacement
end

File.binwrite(PATH, updated)
File.open(MANIFEST, 'w') do |file|
  file.puts "ID\tEnglish\tJapanese\tChinese\tPrevious Korean\tKorean with English"
  changes.each do |id, (old, replacement)|
    file.puts [
      id, sources['en_us'][id], sources['ja_jp'][id], sources['zh_cn'][id], old, replacement
    ].map { |value| value.to_s.gsub(/[\t\r\n]/, ' ') }.join("\t")
  end
end
puts "post=#{Digest::SHA256.hexdigest(updated)}; changed=#{changes.length}; inverse/BOM/line endings/order/CSV=OK"
