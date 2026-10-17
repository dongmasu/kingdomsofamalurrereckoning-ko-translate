#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21301.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21301.tsv')

definitions = [
  {
    'entity_key' => 'title:alserund-stone',
    'english_canonical' => 'Alserund Stone',
    'category' => 'title',
    'korean_canonical' => '알세룬드의 돌(Alserund Stone)',
    'english_aliases' => '',
    'korean_variants' => '알세룬드(Alserund)의 돌',
    'evidence_ids' => 'D-21301|base:3296:11',
    'status' => 'confirmed',
    'notes' => 'English base:3296:11 supplies the complete standalone Alserund Stone label; Japanese アルセランドの石 and Chinese 艾尔斯朗德之石 corroborate it. Pair the complete Korean label as 알세룬드의 돌(Alserund Stone), without nesting the separate place label. The source does not establish a narrower item subtype, so retain category title and do not infer one. D-21139 place:alserund remains unchanged.'
  },
  {
    'entity_key' => 'title:a-trip-alserund',
    'english_canonical' => 'A Trip Alserund',
    'category' => 'title',
    'korean_canonical' => '알세룬드 여행(A Trip Alserund)',
    'english_aliases' => '',
    'korean_variants' => '알세룬드(Alserund) 여행',
    'evidence_ids' => 'D-6735|D-21139|D-21301|default:21714',
    'status' => 'confirmed',
    'notes' => 'English default:21714 supplies the exact fragmentary title A Trip Alserund; Japanese アルセランドへの旅 and Chinese 艾尔斯朗德之旅 independently support the trip-to-Alserund reading. Pair the complete label as 알세룬드 여행(A Trip Alserund), preserving the source English rather than silently repairing its grammar. This title is distinct from place:alserund; D-6735 and D-21139 place-scope dispositions remain unchanged. No narrower quest/book subtype is inferred.'
  }
].freeze

new_texts = {
  ['base', '3296', '11'] => '알세룬드의 돌(Alserund Stone)',
  ['default', '21714', ''] => '알세룬드 여행(A Trip Alserund)'
}.freeze

if File.exist?(DEFINITIONS)
  existing = M.table(DEFINITIONS)
  raise 'refusing to replace unrelated D-21301 definitions' unless
    existing.map { |row| row['entity_key'] }.sort == definitions.map { |row| row['entity_key'] }.sort
end
if File.exist?(REVIEWS)
  existing = M.table(REVIEWS)
  raise 'refusing to replace unrelated D-21301 review output' unless
    existing.length == 2 && existing.map { |row| row['entity_key'] }.uniq.sort ==
      definitions.map { |row| row['entity_key'] }.sort
end

inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = new_texts.keys.sort_by do |resource, id, variant|
  [M::RESOURCES.index(resource), id.to_i, variant]
end
actual = generated.map { |row| M.key(row) }.sort_by do |resource, id, variant|
  [M::RESOURCES.index(resource), id.to_i, variant]
end
raise "expected exact two source keys, got #{actual.inspect}" unless actual == expected

reviews = generated.sort_by do |row|
  resource, id, variant = M.key(row)
  [M::RESOURCES.index(resource), id.to_i, variant]
end.map do |generated_row|
  key = M.key(generated_row)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = new_texts.fetch(key)
  entity = generated_row.fetch('entity_key')
  evidence = if entity == 'title:alserund-stone'
               'English names the complete standalone Alserund Stone label; Japanese アルセランドの石 and Chinese 艾尔斯朗德之石 corroborate. Pair the whole label as 알세룬드의 돌(Alserund Stone), without nesting the distinct Alserund place annotation or inferring an item subtype. The existing place:alserund disposition on this row is not reopened.'
             else
               'English supplies the exact standalone title A Trip Alserund; Japanese アルセランドへの旅 and Chinese 艾尔斯朗德之旅 support the trip-to-Alserund meaning. Pair the complete title as 알세룬드 여행(A Trip Alserund), preserving the source English form. The existing place:alserund disposition on this row and D-6735 travel-title decision are not reopened.'
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

raise 'expected two title-annotation edits' unless
  reviews.length == 2 && reviews.all? { |row| row['status'] == 'accepted' }

M.write_table(DEFINITIONS, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers,
              definitions)
M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
puts 'Prepared D-21301: 2 distinct title keys; 2 edits; existing Alserund place decisions retained.'
