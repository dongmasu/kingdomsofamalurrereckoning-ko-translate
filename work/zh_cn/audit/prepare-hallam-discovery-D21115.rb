#!/usr/bin/env ruby

require 'csv'
require 'json'

HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese entity_dispositions_json
].freeze
DEFINITION_HEADERS = %w[
  entity_key english_canonical category korean_canonical english_aliases
  korean_variants evidence_ids status notes
].freeze
NAME_PATTERN =
  /(?<lead>백색의|백색|백의|흰\s*자|흰색|하얀)?\s*(?<name>할람|할럼|핼럼|하람|할렘)(?:\((?<label>Hallam(?: the White)?)\))?/i
ENGLISH_NAME_PATTERN = /\bHallam the White\b|\bHallam\b/i

def source_names(text)
  text.to_enum(:scan, ENGLISH_NAME_PATTERN).map do
    Regexp.last_match[0].casecmp('Hallam the White').zero? ? 'Hallam the White' : 'Hallam'
  end
end

def reviewed_text(english, korean)
  names = source_names(english)
  matches = korean.to_enum(:scan, NAME_PATTERN).map { Regexp.last_match }
  raise "English Hallam source has no Korean name: #{english[0, 100]}" if matches.empty?

  match_index = 0
  updated = korean.gsub(NAME_PATTERN) do
    match = Regexp.last_match
    source_name = names[match_index] || 'Hallam'
    match_index += 1
    epithet = source_name == 'Hallam the White'
    display = if epithet || match[:lead]
                '백색의 할람'
              else
                '할람'
              end
    label = epithet ? 'Hallam the White' : 'Hallam'
    "#{display}(#{label})"
  end

  raise 'Hallam edit changed line breaks' unless
    korean.scan(/\r\n|\r|\n/) == updated.scan(/\r\n|\r|\n/)
  raise 'Hallam edit changed opaque tokens' unless
    korean.scan(/\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/) ==
      updated.scan(/\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/)

  updated
end

def write_tsv(path, headers, rows)
  CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << headers
    rows.each { |row| csv << headers.map { |header| row[header] } }
  end
end

abort 'usage: prepare-hallam-discovery-D21115.rb INVENTORY DEFINITIONS_OUT REVIEWS_OUT' unless ARGV.length == 3

inventory_path, definitions_path, reviews_path = ARGV
inventory = CSV.read(inventory_path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
rows = inventory.select do |row|
  JSON.parse(row.fetch('en_texts_json') || '[]').compact.any? do |text|
    text.match?(ENGLISH_NAME_PATTERN)
  end
end
rows.sort_by! do |row|
  [row.fetch('resource'), row.fetch('ID_Linha').to_i, row['Tipo_Variante'].to_s]
end

raise "expected 93 Hallam rows, found #{rows.length}" unless rows.length == 93
raise 'Hallam matches must all be default rows' unless rows.all? { |row| row['resource'] == 'default' }
raise 'duplicate Hallam source key' unless
  rows.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == rows.length

edits = rows.map do |row|
  english = JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(row.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = row.fetch('zh_text')
  old = row.fetch('work_text')
  new_text = reviewed_text(english, old)
  status = old == new_text ? 'not-an-issue' : 'accepted'
  evidence = [
    'English identifies the same person in every occurrence; the aligned Japanese ハラム and Chinese 哈拉姆 forms corroborate pronunciation and identity.',
    'Use 할람(Hallam) for the bare name. When English explicitly says Hallam the White, use 백색의 할람(Hallam the White), reusing D-2134; do not extend the epithet to bare Hallam references.',
    'Normalize observed Korean spelling/title variants only within this exact source-keyed Hallam occurrence. Preserve all unrelated wording, titles, particles, line breaks, and opaque tokens.'
  ].join(' ')
  {
    'resource' => row.fetch('resource'),
    'ID_Linha' => row.fetch('ID_Linha'),
    'Tipo_Variante' => row['Tipo_Variante'].to_s,
    'entity_key' => 'person:hallam',
    'status' => status,
    'old' => old,
    'new' => new_text,
    'evidence' => evidence,
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate('person:hallam' => status)
  }
end

definition = {
  'entity_key' => 'person:hallam',
  'english_canonical' => 'Hallam',
  'category' => 'person',
  'korean_canonical' => '할람(Hallam)',
  'english_aliases' => 'Hallam the White',
  'korean_variants' => '할럼|핼럼|하람|할렘|백색의 핼럼|백색의 할럼|백색의 할렘|백색 할람|백의 할럼|흰 자 하람|흰색 할람|하얀 할람',
  'evidence_ids' => (['D-21115-D-21116', 'D-2134'] +
    rows.map { |row| "default:#{row['ID_Linha']}" }).join('|'),
  'status' => 'confirmed',
  'notes' => 'English identifies Hallam as a person. Japanese ハラム and Chinese 哈拉姆 corroborate the name. Use 할람(Hallam) for bare Hallam and 백색의 할람(Hallam the White) only when the English source explicitly includes the epithet, reusing D-2134. A title or epithet is not inferred from an unqualified source mention.'
}

write_tsv(definitions_path, DEFINITION_HEADERS, [definition])
write_tsv(reviews_path, HEADERS, edits)
puts "Prepared #{edits.length} reviewed Hallam rows: #{edits.count { |row| row['status'] == 'accepted' }} accepted, #{edits.count { |row| row['status'] == 'not-an-issue' }} not-an-issue."
