#!/usr/bin/env ruby
require 'csv'
require 'digest'

PATH = 'work/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
BACKUP = '/private/tmp/ko-translate-backups/20261014/jewelry-particle-followup-D20388/locatexts_zh_cn.koalocatext_default.csv'
MANIFEST = 'work/zh_cn/audit/jewelry-terminology-edits-D20388.tsv'
EXPECTED = '95380acc6569bdcc0d8b003171d8bad46493f111c02dc3a84708a64bd53059f6'
ID = '13271'
BEFORE = '수호자에게 리덴(Rithen)의 부적를 걸어 두었다. 부적에서 미사루의 눈물(Tear of Mitharu)을 제거하면 수호자는 부적의 저주에 굴복해 무력화될 것이다. 그러면 자유롭게 움직여 앰비언트의 유리잔(Glass of Ambient)을 가져올 수 있다.'
AFTER = '수호자에게 리덴(Rithen)의 부적을 걸어 두었다. 부적에서 미사루의 눈물(Tear of Mitharu)을 제거하면 수호자는 부적의 저주에 굴복해 무력화될 것이다. 그러면 자유롭게 움직여 앰비언트의 유리잔(Glass of Ambient)을 가져올 수 있다.'

def fields(record)
  result = []
  start = 0
  quote = false
  i = 0
  while i < record.bytesize
    byte = record.getbyte(i)
    if byte == 34
      if quote && record.getbyte(i + 1) == 34
        i += 1
      else
        quote = !quote
      end
    elsif byte == 59 && !quote
      result << (start...i)
      start = i + 1
    end
    i += 1
  end
  finish = record.bytesize - (record.end_with?("\r\n".b) ? 2 : 1)
  result << (start...finish)
end

bytes = File.binread(PATH)
abort 'active hash mismatch' unless Digest::SHA256.hexdigest(bytes) == EXPECTED
abort 'backup mismatch' unless File.binread(BACKUP) == bytes
rows = CSV.read(PATH, headers: true, col_sep: ';', encoding: 'bom|utf-8')
row_index = rows.each_with_index.find { |row, _i| row['ID_Linha'] == ID }&.last
abort 'target row missing' unless row_index
header = bytes.byteslice(3, bytes.index("\r\n".b) - 3)
text_index = CSV.parse_line(header, col_sep: ';').index('Texto')
record_ranges = {}
start = 3
first_separator = nil
quoted = false
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
    record_ranges[id] = (start...i + 1)
    start = i + 1
    first_separator = nil
  end
  i += 1
end
range = record_ranges.fetch(ID)
record = bytes.byteslice(range)
span = fields(record).fetch(text_index)
actual = CSV.parse(record.byteslice(span).dup.force_encoding('UTF-8'), col_sep: ';').first.first
abort "target text mismatch: #{actual.inspect}" unless actual == BEFORE
encoded = CSV.generate_line([AFTER], col_sep: ';', row_sep: '').b
updated = bytes.dup
updated[range.begin + span.begin...range.begin + span.end] = encoded
inverse = updated.dup
new_record = inverse.byteslice(range.begin...(range.begin + record.bytesize + encoded.bytesize - span.size))
new_span = fields(new_record).fetch(text_index)
inverse[range.begin + new_span.begin...range.begin + new_span.end] = record.byteslice(span)
abort 'inverse reconstruction mismatch' unless inverse == bytes
abort 'line endings changed' unless updated.scan(/\r\n|\r|\n/n) == bytes.scan(/\r\n|\r|\n/n)
abort 'backup changed before write' unless File.binread(BACKUP) == bytes
exit unless ENV['APPLY'] == '1'

sources = %w[en_us ja_jp zh_cn].map do |locale|
  CSV.read("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv",
           headers: true, col_sep: ';', encoding: 'bom|utf-8').find { |row| row['ID_Linha'] == ID }['Texto']
end
manifest_row = ['default', ID, '', *sources, BEFORE, AFTER, 'Rithen Amulet is an amulet; correct object marker is 을 and keep the artifact category distinct from necklace.']
File.binwrite(PATH, updated)
File.open(MANIFEST, 'ab') { |file| file.write(CSV.generate_line(manifest_row, col_sep: "\t", row_sep: "\n")) }
puts "default/#{ID} particle corrected; SHA-256=#{Digest::SHA256.hexdigest(updated)}"
