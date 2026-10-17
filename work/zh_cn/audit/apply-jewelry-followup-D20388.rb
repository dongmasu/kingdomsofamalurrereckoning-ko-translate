#!/usr/bin/env ruby
require 'csv'
require 'digest'

ROOT = 'work/zh_cn'
BACKUP_DIR = '/private/tmp/ko-translate-backups/20261014/jewelry-followup-D20388'
MANIFEST = "#{ROOT}/audit/jewelry-terminology-edits-D20388.tsv"
EXPECTED = {
  'base' => '260c9de0491285cdba527cd2b9d8ccc35f2587860a4dad9e3f24187fd1ec7752',
  'default' => 'a442787f5d5996ba32d23858e9e5b93e79817a3b494a2ee0f1e8419668fa02ec'
}.freeze
EDITS = {
  'base' => {
    '3509' => ['명상의 고리', '명상의 반지',
               'English names a loop; Chinese default 30334 explicitly calls the worn object a ring.']
  },
  'default' => {
    '30334' => ['착용자의 집중력과 인지력을 높여 여러 행동을 더 빠르게 수행하게 해 주는 고리다.',
                '착용자의 집중력과 인지력을 높여 여러 행동을 더 빠르게 수행하게 해 주는 반지다.',
                'Chinese explicitly identifies this worn Loop of Meditation as a ring; base 3509 naming row.'],
    '500' => ['암린시안 관(Amrynthian Band)를 복원할 수 있는 곳은 오나락(Onarach)뿐이다.',
              '암린시안 관(Amrynthian Band)을 복원할 수 있는 곳은 오나락(Onarach)뿐이다.',
              'Korean object particle after 관 takes 을.'],
    '43446' => ['그녀가 암린시안 관(Amrynthian Band)를 복원하는 걸 도와줄 거야.',
                '그녀가 암린시안 관(Amrynthian Band)을 복원하는 걸 도와줄 거야.',
                'Korean object particle after 관 takes 을.'],
    '51870' => ['펜던트 반응이 보이지? 우리가 방문하는 석조물(lith)마다 빛이 더 뚜렷해져.',
                '펜던트의 반응이 보이지? 우리가 방문하는 석조물(lith)마다 빛이 더 뚜렷해져.',
                'Add the Korean genitive particle between pendant and reaction.']
  }
}.freeze

def field_spans(record)
  spans = []
  start = 0
  quoted = false
  i = 0
  while i < record.bytesize
    byte = record.getbyte(i)
    if byte == 34
      if quoted && record.getbyte(i + 1) == 34
        i += 1
      else
        quoted = !quoted
      end
    elsif byte == 59 && !quoted
      spans << (start...i)
      start = i + 1
    end
    i += 1
  end
  finish = record.bytesize
  finish -= 2 if record.byteslice(finish - 2, 2) == "\r\n".b
  finish -= 1 if finish > start && record.getbyte(finish - 1) == 10
  spans << (start...finish)
  spans
end

def records(bytes)
  result = {}
  start = bytes.start_with?("\xEF\xBB\xBF".b) ? 3 : 0
  quoted = false
  first_separator = nil
  i = start
  while i < bytes.bytesize
    byte = bytes.getbyte(i)
    if byte == 34
      if quoted && bytes.getbyte(i + 1) == 34
        i += 1
      else
        quoted = !quoted
      end
    elsif byte == 59 && !quoted && first_separator.nil?
      first_separator = i
    elsif byte == 10 && !quoted
      id = bytes.byteslice(start...first_separator).force_encoding('UTF-8')
      result[id] = (start...i + 1)
      start = i + 1
      first_separator = nil
    end
    i += 1
  end
  abort 'unbalanced CSV quoting' if quoted
  result
end

def cell(record, span)
  CSV.parse(record.byteslice(span).dup.force_encoding('UTF-8'), col_sep: ';').first.first
end

plans = {}
added_rows = []
EDITS.each do |resource, changes|
  path = "#{ROOT}/locatexts_zh_cn.koalocatext_#{resource}.csv"
  original = File.binread(path)
  abort "unexpected #{resource} hash" unless Digest::SHA256.hexdigest(original) == EXPECTED.fetch(resource)
  header = original.byteslice(3, original.index("\r\n".b) - 3)
  text_column = CSV.parse_line(header, col_sep: ';').index('Texto')
  map = records(original)
  updated = original.dup
  changes.each do |id, (before, after, evidence)|
    range = map.fetch(id)
    record = original.byteslice(range)
    spans = field_spans(record)
    actual = cell(record, spans.fetch(text_column))
    abort "unexpected before text at #{resource}/#{id}: #{actual.inspect}" unless actual == before
    field = spans.fetch(text_column)
    encoded = CSV.generate_line([after], col_sep: ';', row_sep: '').b
    updated[range.begin + field.begin...range.begin + field.end] = encoded
    locale_sources = %w[en_us ja_jp zh_cn].map do |locale|
      src = CSV.read("src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{resource}.csv",
                     headers: true, col_sep: ';', encoding: 'bom|utf-8')
      src.find { |row| row['ID_Linha'] == id }['Texto']
    end
    variant = resource == 'base' ? '11' : ''
    added_rows << [resource, id, variant, *locale_sources, before, after, evidence]
  end
  abort 'BOM/line-ending pattern changed' unless original.start_with?("\xEF\xBB\xBF".b) &&
    original.scan(/\r\n|\r|\n/n) == updated.scan(/\r\n|\r|\n/n)
  restored = updated.dup
  changes.each do |id, (before, after, _)|
    range = records(restored).fetch(id)
    row = restored.byteslice(range)
    field = field_spans(row).fetch(text_column)
    abort "unexpected after text at #{resource}/#{id}" unless cell(row, field) == after
    source_record = original.byteslice(map.fetch(id))
    old_field = field_spans(source_record).fetch(text_column)
    restored[range.begin + field.begin...range.begin + field.end] = source_record.byteslice(old_field)
  end
  abort 'inverse edits did not restore original bytes' unless restored == original
  plans[path] = [original, updated]
  puts "#{resource}: follow-up edits=#{changes.size}, SHA256=#{Digest::SHA256.hexdigest(updated)}"
end
exit unless ENV['APPLY'] == '1'

plans.each do |path, (original, _)|
  backup = "#{BACKUP_DIR}/#{File.basename(path)}"
  abort "backup missing/different: #{backup}" unless File.binread(backup) == original
end
plans.each { |path, (_, updated)| File.binwrite(path, updated) }
File.open(MANIFEST, 'ab') do |file|
  added_rows.each { |row| file.write(CSV.generate_line(row, col_sep: "\t", row_sep: "\n")) }
end
puts "Byte-identical follow-up backups verified; inverse reconstruction passed; appended #{added_rows.size} source-comparison rows."
