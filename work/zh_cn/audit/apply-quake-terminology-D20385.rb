#!/usr/bin/env ruby
require 'csv'
require 'digest'

FILES = {
  'base' => {
    path: 'work/zh_cn/locatexts_zh_cn.koalocatext_base.csv',
    backup: '/private/tmp/ko-translate-backups/20261014/before-quake-terminology-D20385/locatexts_zh_cn.koalocatext_base.csv',
    expected: 'bbe7c14b441a077b25bead2b69fd73a14ae364d6e53523009cbbc128a4c2f55d',
    source: {
      'en_us' => 'src/csv/en_us/locatexts_en_us.koalocatext_base.csv',
      'ja_jp' => 'src/csv/ja_jp/locatexts_ja_jp.koalocatext_base.csv',
      'zh_cn' => 'src/csv/zh_cn/locatexts_zh_cn.koalocatext_base.csv'
    },
    ids: %w[1020]
  },
  'default' => {
    path: 'work/zh_cn/locatexts_zh_cn.koalocatext_default.csv',
    backup: '/private/tmp/ko-translate-backups/20261014/before-quake-terminology-D20385/locatexts_zh_cn.koalocatext_default.csv',
    expected: 'b1e6b7f727f7f924ed7fe673d87eb8abe6b362352341f5653892890b505485ef',
    source: {
      'en_us' => 'src/csv/en_us/locatexts_en_us.koalocatext_default.csv',
      'ja_jp' => 'src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv',
      'zh_cn' => 'src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
    },
    ids: %w[2604 11934 12640 14688 15262 16122 17917 24514 32270 35229 37338 38978 39358 49183 57855 60635]
  }
}.freeze
MANIFEST = 'work/zh_cn/audit/quake-terminology-edits-D20385.tsv'
UTF8_BOM = "\xEF\xBB\xBF".b

def rows_by_id(path)
  CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
     .to_h { |row| [row['ID_Linha'], row] }
end

def record_ranges(bytes)
  ranges = {}
  start = bytes.start_with?(UTF8_BOM) ? 3 : 0
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

def field_value(record, span)
  CSV.parse_line(record.byteslice(span).dup.force_encoding(Encoding::UTF_8), col_sep: ';').first
end

def text_span(bytes, ranges, texto_index, id)
  record = bytes.byteslice(ranges.fetch(id))
  field_spans(record)[texto_index]
end

def canonical_quake(text)
  text.gsub(/(?:지진|퀘이크)(?:\(Quake\))?(?:\s+강타)?/, '퀘이크(Quake)')
end

def escaped(value)
  value.to_s.gsub("\\", "\\\\").gsub("\t", "\\t").gsub("\r", "\\r").gsub("\n", "\\n")
end

def validate_shape(original, updated, expected_rows)
  parsed = CSV.parse(updated.sub(/\A\xEF\xBB\xBF/n, '').force_encoding(Encoding::UTF_8),
                     headers: true, col_sep: ';')
  abort "row count mismatch: #{parsed.length}" unless parsed.length == expected_rows
  abort 'ID order changed' unless parsed.map { |row| row['ID_Linha'].to_i } ==
    CSV.parse(original.sub(/\A\xEF\xBB\xBF/n, '').force_encoding(Encoding::UTF_8),
              headers: true, col_sep: ';').map { |row| row['ID_Linha'].to_i }
  abort 'BOM changed' unless original.start_with?(UTF8_BOM) == updated.start_with?(UTF8_BOM)
  abort 'CRLF count changed' unless original.scan("\r\n".b).length == updated.scan("\r\n".b).length
  abort 'bare-LF count changed' unless original.scan(/(?<!\r)\n/n).length == updated.scan(/(?<!\r)\n/n).length
end

manifest_rows = []
updated_files = {}

FILES.each do |scope, config|
  original = File.binread(config.fetch(:path))
  digest = Digest::SHA256.hexdigest(original)
  abort "#{scope} hash mismatch: #{digest}" unless digest == config.fetch(:expected)
  abort "#{scope} backup differs" unless File.binread(config.fetch(:backup)) == original

  sources = config.fetch(:source).to_h do |locale, path|
    [locale, rows_by_id(path)]
  end
  active_rows = rows_by_id(config.fetch(:path))
  ranges = record_ranges(original)
  header = original.sub(/\A\xEF\xBB\xBF/n, '').split(/\r?\n/, 2).first
  columns = CSV.parse_line(header, col_sep: ';')
  texto_index = columns.index('Texto')
  abort "#{scope}: Texto column missing" unless texto_index

  target_ids = sources.fetch('en_us').each_with_object([]) do |(id, row), ids|
    ids << id if row['Texto'].to_s.match?(/\bQuake\b/)
  end
  abort "#{scope}: unexpected Quake source IDs #{target_ids.inspect}" unless
    target_ids == config.fetch(:ids)

  changes = {}
  target_ids.each do |id|
    source_text = sources.fetch('en_us').fetch(id)['Texto'].to_s
    before = active_rows.fetch(id)['Texto'].to_s
    after = canonical_quake(before)
    changes[id] = [before, after] if before != after
    manifest_rows << [
      scope, id, escaped(source_text),
      escaped(sources.fetch('ja_jp').fetch(id)['Texto']),
      escaped(sources.fetch('zh_cn').fetch(id)['Texto']),
      escaped(before), escaped(after),
      before == after ? 'already canonical' : 'edited'
    ]
  end

  updated = original.dup
  edits = []
  changes.keys.sort_by { |id| -id.to_i }.each do |id|
    range = record_ranges(updated).fetch(id)
    record = updated.byteslice(range)
    span = field_spans(record)[texto_index]
    before = changes.fetch(id).first
    after = changes.fetch(id).last
    abort "#{scope} #{id}: active Texto changed unexpectedly" unless field_value(record, span) == before

    start_at = range.begin + span.begin
    finish_at = range.begin + span.end
    raw_before = updated.byteslice(start_at...finish_at)
    raw_after = raw_before.dup.force_encoding(Encoding::UTF_8).gsub(before, after).b
    abort "#{scope} #{id}: replacement mismatch" unless
      field_value(record, span) == before && raw_after.bytesize > 0
    edits << [start_at, raw_before, raw_after]
    updated[start_at...finish_at] = raw_after
  end

  inverse = updated.dup
  edits.reverse_each do |start_at, raw_before, raw_after|
    inverse[start_at, raw_after.bytesize] = raw_before
  end
  abort "#{scope}: inverse edit did not restore original bytes" unless inverse == original
  validate_shape(original, updated, active_rows.length)

  updated_rows = CSV.parse(updated.sub(/\A\xEF\xBB\xBF/n, '').force_encoding(Encoding::UTF_8),
                           headers: true, col_sep: ';').to_h { |row| [row['ID_Linha'], row] }
  changes.each do |id, (_before, after)|
    abort "#{scope} #{id}: wrong target Texto" unless updated_rows.fetch(id)['Texto'] == after
  end
  abort "#{scope}: changed non-target cells" unless active_rows.all? do |id, row|
    changes.key?(id) || row['Texto'] == updated_rows.fetch(id)['Texto']
  end
  updated_files[config.fetch(:path)] = updated
  puts "#{scope}: source Quake rows=#{target_ids.length}; changed Texto cells=#{changes.length}; sha256=#{Digest::SHA256.hexdigest(updated)}"
end

updated_files.each { |path, bytes| File.binwrite(path, bytes) }
File.write(MANIFEST, [
  %w[scope id english japanese chinese korean_before korean_after result].join("\t"),
  *manifest_rows.map { |row| row.join("\t") }
].join("\n") + "\n")
puts "manifest rows=#{manifest_rows.length}; inverse/BOM/order/row-count/line-endings/non-target-cell checks=OK"
