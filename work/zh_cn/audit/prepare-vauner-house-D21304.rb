#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21304.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21304.tsv')

entity = 'organization:vauner-house'
canonical = '바우너 가문(Vauner House)'
definition = {
  'entity_key' => entity,
  'english_canonical' => 'Vauner House',
  'category' => 'organization',
  'korean_canonical' => canonical,
  'english_aliases' => '',
  'korean_variants' => '바우너(Vauner)의 집|바우너 가문',
  'evidence_ids' => 'D-21304|base:1001:11|default:16024|default:62222',
  'status' => 'confirmed',
  'notes' => 'The exact base/default labels name the Vauner House. English default:62222 explicitly identifies the Vauner family as an established Canneroc family and describes its anti-spider protection; aligned Japanese ボーナ家 and Chinese 沃纳尔家族 corroborate the family reading. Standardize the two named-house labels as 바우너 가문(Vauner House). Keep this group distinct from individuals Syllareta Vauner and Jennery Vauner; no global Vauner person alias is added. The official Korean manual does not enumerate this Canneroc family; its omission is not contrary evidence.'
}.freeze

evidence = 'English names Vauner House in the exact label; default:62222 explicitly identifies the Vauner family as an established Canneroc family and describes its anti-spider protection. Japanese ボーナの家 and Chinese 沃纳尔的家/沃纳尔家族 corroborate the house/family reading. Use 바우너 가문(Vauner House) for these two labels. This organization/family entry is distinct from people Syllareta Vauner and Jennery Vauner; do not create a global person alias.'

if File.exist?(DEFINITIONS)
  existing = M.table(DEFINITIONS)
  raise 'refusing to replace unrelated D-21304 definitions' unless
    existing.map { |row| row['entity_key'] } == [entity]
end
if File.exist?(REVIEWS)
  existing = M.table(REVIEWS)
  raise 'refusing to replace unrelated D-21304 review output' unless
    existing.length == 2 && existing.map { |row| M.key(row) }.uniq.length == 2
end

inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = [
  ['base', '1001', '11'],
  ['default', '16024', '']
].sort_by { |resource, id, variant| [M::RESOURCES.index(resource), id.to_i, variant] }
actual = generated.map { |row| M.key(row) }.sort_by do |resource, id, variant|
  [M::RESOURCES.index(resource), id.to_i, variant]
end
raise "expected exact two Vauner House source keys, got #{actual.inspect}" unless actual == expected

expected_old = {
  ['base', '1001', '11'] => '바우너(Vauner)의 집',
  ['default', '16024', ''] => '바우너 가문'
}.freeze
reviews = generated.sort_by do |row|
  resource, id, variant = M.key(row)
  [M::RESOURCES.index(resource), id.to_i, variant]
end.map do |row|
  key = M.key(row)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  raise "unexpected active Korean for #{key.inspect}: #{old.inspect}" unless old == expected_old.fetch(key)

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
puts 'Prepared D-21304: Vauner House family entity; 2 exact rows; 2 Korean text edits.'
