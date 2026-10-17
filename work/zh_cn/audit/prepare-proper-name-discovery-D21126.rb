#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
audit = __dir__
d = 21_126
glossary_path = File.join(audit, 'proper-name-glossary.tsv')
definitions_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} artifacts already exist" if
  [definitions_path, reviews_path].any? { |path| File.exist?(path) }

definition_values = [
  [
    'person:driadore-sele',
    'Driadore Sele',
    'person',
    '드리아도어 셀레(Driadore Sele)',
    'Driadore',
    '드리아도레 셀레|드리아도르 셀레|드리아도어 셀레|드리아도어|드리아도르',
    '',
    'confirmed',
    'English identifies Driadore as the apothecary and supplies the full name Driadore Sele in character and objective labels. Japanese ドライアド・セレ / ドライアド and Chinese 德里亚多尔·塞勒 / 迪利亚多 corroborate the person and name forms. Standardize to 드리아도어 셀레(Driadore Sele), with 드리아도어(Driadore) for source-shortened mentions. Existing person:sele decisions are retained as a separate component-name scope and are not reopened.'
  ]
].freeze

patches = {
  ['default', '1148', ''] => [
    ['드리아도레 셀레(Driadore Sele)', '드리아도어 셀레(Driadore Sele)']
  ],
  ['default', '28365', ''] => [
    ['드리아도르(Driadore)', '드리아도어(Driadore)']
  ],
  ['default', '52845', ''] => [
    ['드리아도르(Driadore)', '드리아도어(Driadore)']
  ],
  ['default', '58001', ''] => [
    ['드리아도르 셀레(Driadore Sele)', '드리아도어 셀레(Driadore Sele)']
  ]
}.freeze

glossary = m.table(glossary_path)
raise 'D-21126 entity already registered' if
  glossary.any? { |row| row['entity_key'] == 'person:driadore-sele' }
definition = glossary.headers.zip(definition_values.first).to_h
inventory_rows = m.refresh_inventory.values
inventory = inventory_rows.to_h { |row| [m.key(row), row] }

generated = build_occurrences(inventory_rows, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_ids = %w[1148 12446 28365 33080 52845 58001 63318]
actual_ids = generated.select { |row| row['resource'] == 'default' }
  .map { |row| row['ID_Linha'] }.sort
raise "unexpected exact source IDs: #{actual_ids.inspect}" unless
  actual_ids == expected_ids
raise 'unexpected non-default source occurrence' unless
  generated.length == actual_ids.length

generated_keys = generated.map { |row| m.key(row) }
raise 'duplicate generated source row key' unless
  generated_keys.uniq.length == generated_keys.length
raise "change map contains non-matching rows: #{patches.keys - generated_keys}" unless
  (patches.keys - generated_keys).empty?

rationale = definition.fetch('notes')
reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  old_text = occurrence.fetch('korean_current')
  new_text = old_text.dup
  Array(patches[key]).each do |old_span, new_span|
    count = new_text.scan(Regexp.new(Regexp.escape(old_span))).length
    raise "expected one exact Korean span at #{key.inspect}: #{old_span.inspect}" unless
      count == 1
    new_text.sub!(old_span, new_span)
  end
  source = inventory.fetch(key)
  status = new_text == old_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => definition.fetch('entity_key'),
    'status' => status,
    'old' => old_text,
    'new' => new_text,
    'evidence' => "#{rationale} English is primary; aligned Japanese and Chinese corroborate. Existing person:sele dispositions are not reopened or recounted.",
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(
      definition.fetch('entity_key') => status
    )
  }
end
raise 'expected four corrections and three canonical rows' unless
  reviews.group_by { |row| row['status'] }.transform_values(&:length) ==
    { 'accepted' => 4, 'not-an-issue' => 3 }
raise 'unmatched manual changes' unless
  patches.keys.sort == reviews.select { |row| patches.key?(m.key(row)) }
    .map { |row| m.key(row) }.sort

definition['evidence_ids'] = (
  ["D-#{d}"] + generated.map { |row| "#{row['resource']}:#{row['ID_Linha']}" }.uniq
).join('|')
glossary_rows = glossary.map(&:to_h) + [definition]

index = m.table(m::INDEX)
new_keys = generated.map do |row|
  [row.fetch('entity_key'), *m.key(row)]
end
existing_keys = index.map do |row|
  [row.fetch('entity_key'), *m.key(row)]
end
raise 'new entity occurrence already exists in the active index' unless
  (new_keys & existing_keys).empty?
merged = (index.map(&:to_h) + generated).sort_by do |row|
  [row.fetch('resource'), row.fetch('ID_Linha').to_i,
   row['Tipo_Variante'].to_s, row.fetch('entity_key')]
end
raise 'duplicate merged occurrence key' unless
  merged.map { |row| [row['entity_key'], *m.key(row)] }.uniq.length == merged.length

m.write_table(glossary_path, glossary.headers, glossary_rows)
m.write_table(m::INDEX, index.headers, merged)
m.write_table(definitions_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "Prepared D-#{d}: 1 person, #{reviews.length} exact rows, " \
     "#{patches.length} rows with reviewed corrections."
puts "Dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
