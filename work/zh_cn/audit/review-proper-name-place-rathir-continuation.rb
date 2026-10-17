#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:rathir'
raise 'Rathir already registered' if glossary.any? { |row| row['entity_key'] == entity }
definition = glossary.headers.zip([
  entity, 'Rathir', 'place', '라시르(Rathir)', '', '라시어|라티르',
  'base:193|default:24602|default:49237', 'confirmed',
  'English identifies the Dokkalfar city Rathir. Japanese ラシーア and Chinese 拉瑟里 corroborate identity. Retain established 라시르, replacing 라시어/라티르 in source-confirmed city spans. Already paired complete facility, organization and book titles retain one full label, not component annotation. Manual p. 1 explains Dokkalfar context but does not specify this city spelling.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
raise 'Rathir source count changed' unless generated.length == 520
complete_labels = {
  'Rathir Tavern' => '라시르 선술집',
  'Rathir Catacombs' => '라시르 지하 묘지',
  'Scholia Arcana Rathir Chapter' => '라시르 아르카나 학회 지부',
  'Rathir Prison Key' => '라시르 감옥 열쇠',
  'Rathir Jail' => '라시르 감옥',
  'The Little Prince of Rathir' => '라시르의 어린 왕자',
  'Rathir Chapter' => '라시르 지부',
  'Rathir - Upper City' => '라시르 - 상층 도시',
  'Rathir - Lower City' => '라시르 - 하층 도시',
  'Rathir Watch' => '라시르 감시대',
  'Rathir City Watch' => '라시르 시 경비대',
  'The Founding of Rathir' => '라시르의 건국'
}.freeze
reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible = english.gsub(/\$[^$]*\$/, ' ').match?(/(?<![A-Za-z])Rathir(?![A-Za-z])/i)
  text = old.gsub(/라시어|라티르/, '라시르')
  if complete_labels.key?(english)
    text = "#{complete_labels.fetch(english)}(#{english})"
  else
    text.to_enum(:scan, /라시르(?:\(Rathir\))?/).map { Regexp.last_match.dup }.reverse_each do |match|
      prefix = text[0...match.begin(0)]
      next if prefix.count('(') > prefix.count(')')
      tail = text[match.end(0)..]
      full_label = tail.match(/\A[^()\r\n,.!?;]{0,80}\((?<label>[^()]*)\)/)
      next if full_label && full_label[:label].match?(/\bRathir\b/i) &&
        !tail[0...full_label.begin(:label)].include?('라시르')
      replacement = '라시르(Rathir)'
      text[match.begin(0)...match.end(0)] = replacement unless match[0] == replacement
    end
  end
  raise "missing Rathir Korean span #{key.inspect}" if visible && !old.match?(/라시르|라시어|라티르/)
  status = !visible ? 'excluded' : (old == text ? 'not-an-issue' : 'accepted')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => visible ? 'English identifies the city Rathir; Japanese ラシーア and Chinese 拉瑟里 corroborate. Standardized source-confirmed 라시르/라시어/라티르 spans to 라시르(Rathir). Exact named facility, chapter, book and district labels use one complete English pair; existing full compound labels are retained. Attached particles, repeated mentions, tokens, other names, quantities and line breaks remain unchanged. Official manual p. 1 supplies Dokkalfar context, not the city spelling.' : 'Rathir occurs only inside an opaque runtime variable, not visible player-facing text. Excluded without changing the variable or other text.',
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
index = m.table(m::INDEX)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, "proper-name-reviewed-rathir-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil)
