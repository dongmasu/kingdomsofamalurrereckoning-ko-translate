#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_134
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definition = glossary.headers.zip([
  'place:cloudcrest-mountain', 'Cloudcrest Mountain', 'place',
  '클라우드크레스트 산(Cloudcrest Mountain)', '', '클라우드크레스트 산',
  "D-#{d}", 'confirmed',
  'English identifies the mountain holding the Niskaru Lord prison and the Warsworn quest summit. Japanese クラウドクレスト山 and Chinese 云顶山 corroborate. Reuse the bilingual place label at default:54420. Do not merge Cloudcrest Peak or Cloudcrest Passage, or add a global Cloudcrest alias. At default:64664 the same row explicitly uses the short Cloudcrest for the mountain just named; annotate that local short name without expanding it.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
expected = %w[268 2264 7589 15148 17357 19510 21922 22613 25368 27748 34776 35580 48733 54076 54420 60248 64167 64664]
raise 'unexpected mountain source matches' unless
  generated.map { |row| row['ID_Linha'] }.sort_by(&:to_i) == expected &&
  generated.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'].empty? }
reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.gsub(/클라우드크레스트 산(?!\()/, '클라우드크레스트 산(Cloudcrest Mountain)')
  proposed.sub!('클라우드크레스트로 돌아가', '클라우드크레스트(Cloudcrest)로 돌아가') if key[1] == '64664'
  status = proposed == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => definition['entity_key'], 'status' => status,
    'old' => old, 'new' => proposed,
    'evidence' => 'English explicitly names Cloudcrest Mountain; Japanese and Chinese corroborate the named mountain. Add missing English glosses using the existing bilingual label, preserving other names and wording. ID 64664 also has a same-row short Cloudcrest reference; Peak and Passage remain distinct and no global short alias is assumed.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(definition['entity_key'] => status)
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
