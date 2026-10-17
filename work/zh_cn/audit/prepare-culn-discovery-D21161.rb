#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
inventory = m.refresh_inventory

specs = [
  [
    'place:culn', 'Culn', '컬른(Culn)', '', 'place',
    'English identifies Culn as the original village on the Tywili Coast. Japanese uses カルン/クルン and Chinese 考伦. Reuse the established majority form 컬른, normalize 쿨른/컬른 variants, and add the requested English pairing. Keep New Culn as a distinct settlement, not an alias for the original village. The official Korean manual has no Culn entry and is not an exhaustive place-name list.'
  ],
  [
    'place:new-culn', 'New Culn', '뉴 컬른(New Culn)', '', 'place',
    'English explicitly names the refugee settlement New Culn, distinct from the original village of Culn. Japanese ニュー・カルン and Chinese 新考伦 corroborate the New modifier. Reuse 뉴 컬른 and add the complete bilingual name; do not merge this settlement with place:culn. The official Korean manual has no Culn entry and is not an exhaustive place-name list.'
  ]
]

definitions = specs.map do |entity, english, korean, aliases, category, note|
  values = {
    'entity_key' => entity,
    'english_canonical' => english,
    'category' => category,
    'korean_canonical' => korean,
    'english_aliases' => aliases,
    'korean_variants' => '',
    'evidence_ids' => 'D-21161-D-21162',
    'status' => 'confirmed',
    'notes' => note
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end

generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
counts = generated.group_by { |row| row.fetch('entity_key') }
  .transform_values { |rows| rows.map { |row| m.key(row) }.uniq.length }
raise "unexpected source counts: #{counts.inspect}" unless counts ==
  { 'place:culn' => 73, 'place:new-culn' => 8 }

by_key = generated.group_by { |row| m.key(row) }
reviews = by_key.keys.sort_by do |resource, id, variant|
  [m::RESOURCES.index(resource), id.to_i, variant]
end.map do |key|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  english_for_culn = english.gsub(/\bNew Culn\b/i, '')
  entities = by_key.fetch(key).map { |row| row.fetch('entity_key') }.sort
  decisions = {}
  new_text = source.fetch('work_text').dup

  if entities.include?('place:new-culn')
    new_text.gsub!(/(?:뉴|새)\s+컬른(?:\(New Culn\))?/i, '뉴 컬른(New Culn)')
  end
  if entities.include?('place:culn')
    new_text.gsub!(
      /(?<!뉴 )(?<!새 )(?:컬른|쿨른)(?:\(Culn\))?(?!\(New Culn\))/,
      '컬른(Culn)'
    )
  end

  entities.each do |entity|
    if entity == 'place:culn' && !english_for_culn.match?(/\bCuln\b/i)
      decisions[entity] = 'excluded'
    else
      decisions[entity] = new_text == source.fetch('work_text') ? 'not-an-issue' : 'accepted'
    end
  end

  status = if new_text != source.fetch('work_text')
             'accepted'
           elsif decisions.values.all? { |decision| decision == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  evidence = specs.select { |spec| entities.include?(spec[0]) }
    .map { |spec| spec[5] }.join(' ')
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'),
    'status' => status,
    'old' => source.fetch('work_text'),
    'new' => new_text,
    'evidence' => "#{evidence} Only the scoped place-name spans change. English is the identity anchor; aligned Japanese and Chinese corroborate. All three active resources were searched. Prior entity/key decisions and historical global totals are preserved.",
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(decisions)
  }
end

raise 'expected 73 distinct place-name row keys' unless reviews.length == 73

definition_path = File.join(__dir__, 'proper-name-discovery-definitions-D21161.tsv')
review_path = File.join(__dir__, 'proper-name-discovery-D21161.tsv')
[definition_path, review_path].each do |path|
  raise "already exists: #{path}" if File.exist?(path)
end
m.write_table(definition_path, glossary.headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
puts "D-21161-D-21162: #{reviews.length} distinct keys; #{counts.inspect}; batches 50+23"
puts "Proposed cells: #{reviews.count { |row| row['old'] != row['new'] }}; dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
