#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21307.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21307.tsv')

entity = 'title:house-of-no-doors'
canonical = '문 없는 집(The House of No Doors)'
definition = {
  'entity_key' => entity,
  'english_canonical' => 'The House of No Doors',
  'category' => 'title',
  'korean_canonical' => canonical,
  'english_aliases' => '',
  'korean_variants' => '문 없는 집',
  'evidence_ids' => 'D-21307|default:2397|default:58213',
  'status' => 'confirmed',
  'notes' => 'English supplies the exact repeated capitalized title The House of No Doors at default:2397 and default:58213. Japanese 扉のない家 and Chinese 没有门的房子 corroborate the meaning; the current Korean wording is semantically correct but lacks the English label. Pair it as 문 없는 집(The House of No Doors). The sources do not establish whether this is a place, book, or other named entity, so classify only as title and infer no narrower subtype.'
}.freeze

inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = [
  ['default', '2397', ''],
  ['default', '58213', '']
]
actual = generated.map { |row| M.key(row) }.sort_by { |key| key[1].to_i }
raise "expected exactly #{expected.inspect}, got #{actual.inspect}" unless actual == expected

evidence = 'English repeats the exact named title The House of No Doors; aligned Japanese 扉のない家 and Chinese 没有门的房子 support the same meaning. Preserve the existing Korean 문 없는 집 and pair the full English title as 문 없는 집(The House of No Doors). The sources do not identify a narrower entity subtype, so do not infer one.'
reviews = generated.sort_by { |row| M.key(row)[1].to_i }.map do |row|
  key = M.key(row)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  raise "unexpected Korean text for #{key.inspect}: #{old.inspect}" unless old == '문 없는 집'

  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entity,
    'status' => 'accepted',
    'old' => old,
    'new' => canonical,
    'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => 'accepted')
  }
end

M.write_table(DEFINITIONS, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers, [definition])
M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
puts 'Prepared D-21307: one named-title entity; two default rows; two bilingual-label edits.'
