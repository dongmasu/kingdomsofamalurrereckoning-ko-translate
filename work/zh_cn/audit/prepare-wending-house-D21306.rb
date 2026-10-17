#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21306.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21306.tsv')

entity = 'title:wending-house'
canonical = '웬딩 하우스(Wending House)'
definition = {
  'entity_key' => entity,
  'english_canonical' => 'Wending House',
  'category' => 'title',
  'korean_canonical' => canonical,
  'english_aliases' => '',
  'korean_variants' => '',
  'evidence_ids' => 'D-21306|base:4224:11|default:44400',
  'status' => 'confirmed',
  'notes' => 'English provides the exact standalone capitalized label Wending House in base:4224:11 and default:44400; Japanese ウェンディング・ハウス/ウェンディングの家 and Chinese 前行家族 corroborate it as a named label. The current Korean 웬딩 하우스(Wending House) is already paired consistently. The source does not identify a narrower entity subtype; classify only as title. Do not merge it with the separately used Wending form in place/person contexts or infer a family, faction, or physical place.'
}.freeze

inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = [
  ['base', '4224', '11'],
  ['default', '44400', '']
].sort_by { |resource, id, variant| [M::RESOURCES.index(resource), id.to_i, variant] }
actual = generated.map { |row| M.key(row) }.sort_by do |resource, id, variant|
  [M::RESOURCES.index(resource), id.to_i, variant]
end
raise "expected exact two Wending House source keys, got #{actual.inspect}" unless actual == expected

evidence = 'English presents the exact capitalized label Wending House; Japanese and Chinese sources corroborate the named form. Use the complete paired Korean label 웬딩 하우스(Wending House). The source does not establish whether it is a family, faction, or place, so no narrower subtype is inferred and separately scoped Wending references are not merged.'
expected_old = {
  ['base', '4224', '11'] => canonical,
  ['default', '44400', ''] => '웬딩 하우스'
}.freeze
reviews = generated.sort_by do |row|
  resource, id, variant = M.key(row)
  [M::RESOURCES.index(resource), id.to_i, variant]
end.map do |row|
  key = M.key(row)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  raise "unexpected Korean label for #{key.inspect}: #{old.inspect}" unless old == expected_old.fetch(key)

  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entity,
    'status' => old == canonical ? 'not-an-issue' : 'accepted',
    'old' => old,
    'new' => canonical,
    'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => old == canonical ? 'not-an-issue' : 'accepted')
  }
end

M.write_table(DEFINITIONS, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers, [definition])
M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
puts 'Prepared D-21306: Wending House title; 2 exact rows; 1 bilingual-label edit.'
