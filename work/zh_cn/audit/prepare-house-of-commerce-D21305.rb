#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21305.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21305.tsv')

entity = 'title:house-of-commerce'
canonical = '상업 조합(House of Commerce)'
definition = {
  'entity_key' => entity,
  'english_canonical' => 'House of Commerce',
  'category' => 'title',
  'korean_canonical' => canonical,
  'english_aliases' => '',
  'korean_variants' => '상업 조합',
  'evidence_ids' => 'D-21305|base:2300:11',
  'status' => 'confirmed',
  'notes' => 'English base:2300:11 provides the complete standalone capitalized label House of Commerce. Japanese 商業施設, Chinese 商会, and current Korean 상업 조합 support a commerce-related establishment but do not settle whether the referent is a building or organization. Preserve the established Korean wording and pair the complete source title as 상업 조합(House of Commerce); classify only as title and infer no narrower subtype.'
}.freeze

inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_key = ['base', '2300', '11']
raise "expected exactly #{expected_key.inspect}, got #{generated.map { |row| M.key(row) }.inspect}" unless
  generated.length == 1 && M.key(generated.first) == expected_key

source = inventory.fetch(expected_key)
english = JSON.parse(source.fetch('en_texts_json')).compact
japanese = JSON.parse(source.fetch('ja_texts_json')).compact
expected = {
  'english' => ['House of Commerce'],
  'japanese' => ['商業施設'],
  'chinese' => '商会',
  'work' => '상업 조합'
}
actual = {
  'english' => english,
  'japanese' => japanese,
  'chinese' => source.fetch('zh_text'),
  'work' => source.fetch('work_text')
}
raise "unexpected aligned source/current text: #{actual.inspect}" unless actual == expected

review = {
  'resource' => expected_key[0],
  'ID_Linha' => expected_key[1],
  'Tipo_Variante' => expected_key[2],
  'entity_key' => entity,
  'status' => 'accepted',
  'old' => actual.fetch('work'),
  'new' => canonical,
  'evidence' => 'English supplies the complete capitalized label House of Commerce. Japanese 商業施設 and Chinese 商会, alongside the existing 상업 조합, confirm a commerce-related establishment but do not distinguish a building from an organization. Preserve the Korean wording and add the exact English title: 상업 조합(House of Commerce). Do not infer a narrower entity subtype.',
  'english' => english.join("\n"),
  'japanese' => japanese.join("\n---\n"),
  'chinese' => actual.fetch('chinese'),
  'entity_dispositions_json' => JSON.generate(entity => 'accepted')
}

M.write_table(DEFINITIONS, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers, [definition])
M.write_table(REVIEWS, M::HEADERS.take(12), [review])
puts 'Prepared D-21305: one named commerce establishment title; one bilingual-label edit.'
