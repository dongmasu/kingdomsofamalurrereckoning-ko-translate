#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).map(&:to_h)
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
additions = m.table(File.join(__dir__, 'proper-name-world-additions.tsv')).map(&:to_h)
existing = glossary.map { |row| row['entity_key'] }
additions.reject! { |row| existing.include?(row['entity_key']) }
additions.each do |entry|
  next unless entry['entity_key'] == 'place:detyre'
  entry['korean_variants'] = '데티르|데타이어|디타이어|데이트어|데티레'
  entry['notes'] += ' Continuation reviews all region mentions, including repeated prose mentions; preserve Detyre Prototype as a complete bilingual title.'
end
index = m.table(m::INDEX)
new_occurrences = build_occurrences(inventory, additions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
family_ids = %w[10747 27523 42674 49434 57733]
family_sources = inventory.select { |row| row['resource'] == 'default' && family_ids.include?(row['ID_Linha']) }
family_sources.each do |row|
  raise 'family residual already indexed' if index.any? { |o| o['entity_key'] == 'faction:house-anwon' && m.key(o) == m.key(row) }
  new_occurrences << {
    'entity_key' => 'faction:house-anwon', 'resource' => row['resource'],
    'ID_Linha' => row['ID_Linha'], 'Tipo_Variante' => row['Tipo_Variante'].to_s,
    'matched_english' => 'Anwon (contextual family collective)',
    'english_source' => JSON.parse(row['en_texts_json']).compact.join("\n"),
    'korean_current' => row['work_text'], 'status' => 'needs-context',
    'evidence' => 'Family collective missed by the literal House Anwon phrase matcher; English/Japanese/Chinese context checked separately from the person:anwon false-positive disposition.'
  }
end
reviews = family_sources.map do |source|
  old = source['work_text']
  replacement = case source['ID_Linha']
                when '10747' then old.sub('안원', '안원(Anwon)')
                when '27523' then old.sub('안원 가문(Anwon)', '안원(Anwon) 가문')
                when '42674', '49434' then old.gsub(/안원(?!\()/, '안원(Anwon)')
                when '57733' then old.sub('앤원 가문', '안원(Anwon) 가문')
                end
  source.merge(
    'entity_key' => 'faction:house-anwon', 'old' => old, 'new' => replacement,
    'status' => replacement == old ? 'not-an-issue' : 'accepted',
    'evidence' => 'English Anwon names the great family or its bloodline, not an individual. Japanese アンウォン家 and Chinese 安文家族 corroborate the collective. Keep the source-shortened form Anwon bilingual, rather than inventing a full personal name.',
    'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text'])
end
inventory.select do |source|
  JSON.parse(source['en_texts_json']).compact.any? { |text| text.match?(/\bDetyre\b/i) }
end.each do |source|
  old = source['work_text']
  replacement = old.gsub(/(?:데티르|데타이어|디타이어|데이트어|데티레|데티어)(?:\(Detyre\))?/, '데티어(Detyre)')
  replacement.gsub!('데티어(Detyre) 시제품(Detyre Prototype)', '데티어 시제품(Detyre Prototype)')
  reviews << source.merge(
    'entity_key' => 'place:detyre', 'old' => old, 'new' => replacement,
    'status' => replacement == old ? 'not-an-issue' : 'accepted',
    'evidence' => 'English geographical context identifies the region Detyre, including its deserts, routes, settlements, and region-derived epithets. Japanese デティア and Chinese 迪特里 corroborate. Reuse the established 데티어(Detyre) spelling; pair every repeated mention. Detyre Prototype retains its complete bilingual title. The official manual setting context is applicable, but it does not establish a different spelling for this region.',
    'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text'])
end
raise 'expected 128 reviewed keys' unless reviews.length == 128
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + additions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + new_occurrences)
m.write_table(File.join(__dir__, 'proper-name-reviewed-detyre-family-continuation.tsv'), m::HEADERS, reviews)
File.write(File.join(__dir__, 'world-index-registration-20261015.md'), <<~TEXT)
  # Established World-Name Queue Registration

  Date: 2026-10-15

  Added #{additions.length} previously recorded world-name entries from
  `proper-name-world-additions.tsv` to the active glossary and their
  English-source occurrence map. Added five context-identified Anwon-family
  rows missed by the literal faction matcher. #{new_occurrences.length} matches
  are newly queued as `needs-context`; this is not a review or acceptance.
  Existing exact-key dispositions were preserved without regeneration.

  The independently reviewed Detyre/family continuation manifest contains
  128 unique row keys and is applied separately in consecutive 50-key batches.
  Other world-name rows remain unreviewed until their own source comparison.
  No historical global translation tally was adjusted.
TEXT
puts "Registered #{additions.length} world entries / #{new_occurrences.length} queue matches; prepared #{reviews.length} reviewed keys."
