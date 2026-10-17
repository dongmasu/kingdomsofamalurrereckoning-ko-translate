#!/usr/bin/env ruby
require 'csv'
require 'digest'

PATH = 'work/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
BACKUP = '/private/tmp/ko-translate-backups/20261014/before-ursin-context-D20383/locatexts_zh_cn.koalocatext_default.csv'
INITIAL_BACKUP = '/private/tmp/ko-translate-backups/20261014/before-person-single-words-D20383/locatexts_zh_cn.koalocatext_default.csv'
EXPECTED = '89f8bed738c2a43e3bfe80b2aa26e2be3ca0aaa1b6d889bc1cb1518e727c773c'
REPORT = 'work/zh_cn/audit/person-single-word-edits-D20383.tsv'
CHANGES = {
  '26788' => ['어르신 케틀', '우르신 케틀(Ursin Kettle)'],
  '29279' => ['얼신 케틀(Ursin Kettle)', '우르신 케틀(Ursin Kettle)']
}.freeze

source = File.binread(PATH)
abort 'active CSV hash differs' unless Digest::SHA256.hexdigest(source) == EXPECTED
abort 'byte-identical backup differs' unless File.binread(BACKUP) == source

updated = source.dup
CHANGES.each do |id, (old, replacement)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "old cell missing or duplicated at #{id}" unless row.scan(old.b).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(old.b, replacement.b)
end

inverse = updated.dup
CHANGES.each do |id, (old, replacement)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing during inverse at #{id}" unless match
  row = match[0]
  abort "new cell missing or duplicated at #{id}" unless row.scan(replacement.b).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(replacement.b, old.b)
end
abort 'inverse edit did not restore original bytes' unless inverse == source

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
abort 'BOM, line endings, or ID order changed' unless shape.call(source) == shape.call(updated)

File.binwrite(PATH, updated)

initial_rows = CSV.read(INITIAL_BACKUP, encoding: 'bom|utf-8', col_sep: ';', headers: true).map(&:to_h)
active_rows = CSV.read(PATH, encoding: 'bom|utf-8', col_sep: ';', headers: true).map(&:to_h)
active_by_id = active_rows.to_h { |row| [row['ID_Linha'], row] }
sources = %w[en_us ja_jp zh_cn].to_h do |locale|
  rows = CSV.read("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv",
                  encoding: 'bom|utf-8', col_sep: ';', headers: true)
  [locale, rows.to_h { |row| [row['ID_Linha'], row['Texto']] }]
end
manifest = initial_rows.each_with_object([]) do |before, rows|
  id = before['ID_Linha']
  after = active_by_id.fetch(id)
  next if before['Texto'] == after['Texto']
  rows << {
    'ID' => id,
    'English' => sources['en_us'][id],
    'Japanese' => sources['ja_jp'][id],
    'Chinese' => sources['zh_cn'][id],
    'Previous Korean' => before['Texto'],
    'Korean with English' => after['Texto']
  }
end
abort 'final manifest must contain exactly 464 changed cells' unless manifest.length == 464
File.open(REPORT, 'w') do |file|
  headers = ['ID', 'English', 'Japanese', 'Chinese', 'Previous Korean', 'Korean with English']
  file.write(CSV.generate_line(headers, col_sep: "\t"))
  manifest.each do |row|
    file.write(CSV.generate_line(headers.map { |header| row[header] }, col_sep: "\t"))
  end
end

puts "pre=#{EXPECTED} post=#{Digest::SHA256.hexdigest(updated)} edited=#{CHANGES.keys.join(',')} inverse/BOM/endings/order=OK"
