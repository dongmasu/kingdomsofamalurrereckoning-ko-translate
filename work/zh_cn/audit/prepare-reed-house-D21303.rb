#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21303.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21303.tsv')

entity = 'place:reed-house'
canonical = '리드 저택(Reed House)'
definition = {
  'entity_key' => entity,
  'english_canonical' => 'Reed House',
  'category' => 'place',
  'korean_canonical' => canonical,
  'english_aliases' => '',
  'korean_variants' => '리드(Reed) 저택|리드의 집|리드 가',
  'evidence_ids' => 'D-21303|base:2592:11|default:20126|default:22347',
  'status' => 'confirmed',
  'notes' => 'English base/default labels and the sentence at default:22347 identify one named residence, the Reed House where people were found. Japanese リード邸 and Chinese 里德之家 corroborate the place reading. Use the complete paired label 리드 저택(Reed House) across all three rows. This is the residence, not the person Reed Buckley or an inferred Reed family entity. No global Reed alias is added. The official Korean manual does not enumerate this residence; its omission is not contrary evidence.'
}.freeze

evidence = 'English identifies the named Reed House residence; Japanese リード邸 and Chinese 里德之家 corroborate. The context at default:22347 says nobody has entered the house since people were found there, establishing a physical site. Standardize this exact place label to 리드 저택(Reed House); do not merge the place with Reed Buckley or infer a separate family entity. No global Reed alias is added.'
expected_old = {
  ['base', '2592', '11'] => '리드(Reed) 저택',
  ['default', '20126', ''] => '리드의 집',
  ['default', '22347', ''] => '그들을 발견한 뒤로 리드 가(Reed House)에 들어간 사람은 아무도 없어....'
}.freeze

if File.exist?(DEFINITIONS)
  existing = M.table(DEFINITIONS)
  raise 'refusing to replace unrelated D-21303 definitions' unless
    existing.map { |row| row['entity_key'] } == [entity]
end
if File.exist?(REVIEWS)
  existing = M.table(REVIEWS)
  raise 'refusing to replace unrelated D-21303 review output' unless
    existing.length == 3 && existing.map { |row| M.key(row) }.uniq.length == 3
end

inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = [
  ['base', '2592', '11'],
  ['default', '20126', ''],
  ['default', '22347', '']
].sort_by { |resource, id, variant| [M::RESOURCES.index(resource), id.to_i, variant] }
actual = generated.map { |row| M.key(row) }.sort_by do |resource, id, variant|
  [M::RESOURCES.index(resource), id.to_i, variant]
end
raise "expected exact three Reed House source keys, got #{actual.inspect}" unless actual == expected

reviews = generated.sort_by do |row|
  resource, id, variant = M.key(row)
  [M::RESOURCES.index(resource), id.to_i, variant]
end.map do |row|
  key = M.key(row)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  raise "unexpected active Korean for #{key.inspect}: #{old.inspect}" unless old == expected_old.fetch(key)
  new_text = if key == ['default', '22347', '']
               old.sub('리드 가(Reed House)', canonical)
             else
               canonical
             end

  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entity,
    'status' => old == new_text ? 'not-an-issue' : 'accepted',
    'old' => old,
    'new' => new_text,
    'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => old == new_text ? 'not-an-issue' : 'accepted')
  }
end

M.write_table(DEFINITIONS, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers, [definition])
M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
puts 'Prepared D-21303: Reed House place entity; 3 exact rows; 2 Korean text edits.'
