#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'proper-name-cell-editor'

ROOT = File.expand_path('../../..', __dir__)
MANIFEST = File.join(__dir__, 'proper-name-edits-D20390.tsv')
HASHES = {
  'base' => 'b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac',
  'default' => 'f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234'
}.freeze
HEADERS = %w[resource ID_Linha Tipo_Variante entity_key status old new evidence english japanese chinese].freeze
ALLESTAR = /(?:알레스타|앨레스타|앨러스타|알리스타|올레스타|아리스타|앨리스타)/
EAGONN = /(?:이고넌|에아곤|에이곤|에이건|이아곤|이고언|이가온|이건|이곤|에간|에곤)/
GOSSAMER = /(?:고서머|고사머)(?:의\s*끝|\s*엔드)/

def normalize_example(source, old)
  text = old.dup
  keys = []
  if source.match?(/\bAllestar\b/i)
    keys << 'place:allestar'
    keys << 'place:allestar-tower' if source.match?(/\bAllestar Tower\b/i)
    keys << 'place:allestar-glade' if source.match?(/\bAllestar Glade\b/i)
    text.gsub!(/#{ALLESTAR}(?:\(Allestar\))?\s*(?:탑|타워|고탑)(?:\([^)]*Allestar[^)]*\))?/i,
               '알레스타 탑(Allestar Tower)')
    text.gsub!(/#{ALLESTAR}(?:\(Allestar\))?\s*(?:숲속 빈터|숲터|숲)(?:\([^)]*Allestar[^)]*\))?/i,
               '알레스타 숲속 빈터(Allestar Glade)')
    # Compound names above already have a full source title in parentheses.
    text.gsub!(/#{ALLESTAR}(?:\(Allestar\))?/i) do |name|
      name == '알레스타' && Regexp.last_match.post_match.match?(/\A (?:탑|숲속 빈터)\(Allestar /) ?
        name : '알레스타(Allestar)'
    end
    text.gsub!('알레스타 숲속 빈터(Allestar Glade)으로', '알레스타 숲속 빈터(Allestar Glade)로')
  end
  if source.match?(/\bEagonn\b/i)
    keys << 'person:eagonn'
    # "이건" can also mean "this"; require a personal-name construction.
    pattern = /#{EAGONN}(?:\(Eagonn\))?/i
    text.gsub!(pattern) do |name|
      named = name != '이건' ||
        Regexp.last_match.post_match.match?(/\A(?:의|은|이|을|과|에게| 본인| 왕자)/)
      named ? '이곤(Eagonn)' : name
    end
    text = '이먼과 이곤(Eagonn)' if source == 'Eamonn and Eagonn' && old == '이먼과 이건'
  end
  if source.match?(/\bGossamer End\b/i)
    keys << 'place:gossamer-end'
    text.gsub!(/#{GOSSAMER}(?:\(Gossamer End\))?/i, '고서머 엔드(Gossamer End)')
  end
  [text, keys]
end

rows = []
CSV.foreach('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t") do |row|
  source = JSON.parse(row['en_texts_json']).join("\n---\n")
  next unless source.match?(/\b(?:Allestar|Eagonn|Gossamer End)\b/i)
  old = row.fetch('work_text')
  text, keys = normalize_example(source, old)
  evidence = 'D-20390 English entity context; Japanese '
  evidence += JSON.parse(row['ja_texts_json']).join(' | ')
  evidence += "; Chinese #{row['zh_text']}"
  rows << [
    row['resource'], row['ID_Linha'], row['Tipo_Variante'], keys.join('|'),
    text == old ? 'not-an-issue' : 'accepted', old, text, evidence,
    source, JSON.parse(row['ja_texts_json']).join("\n---\n"), row['zh_text']
  ]
end
CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  rows.each { |row| csv << row }
end
puts "reviewed=#{rows.length}; edited=#{rows.count { |row| row[4] == 'accepted' }}"
puts rows.group_by(&:first).transform_values { |group| [group.length, group.count { |row| row[4] == 'accepted' }] }.inspect
rows.select { |row| row[4] == 'accepted' }.each do |row|
  puts "#{row[0]}:#{row[1]} #{row[5].gsub(/\s+/, ' ')[0,140]} -> #{row[6].gsub(/\s+/, ' ')[0,140]}"
end
if ARGV == ['--apply']
  result = ProperNameCellEditor.apply(
    ROOT, MANIFEST, '/private/tmp/ko-translate-backups/20261015/before-proper-name-D20390', HASHES
  )
  puts JSON.pretty_generate(result)
elsif !ARGV.empty?
  abort 'Usage: review-example-names-D20390.rb [--apply]'
end
