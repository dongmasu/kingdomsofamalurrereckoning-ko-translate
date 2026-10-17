#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
audit = __dir__
d = 21_124
definitions_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
refresh = ARGV == ['--refresh']
abort 'usage: prepare-proper-name-discovery-D21124.rb [--refresh]' unless
  ARGV.empty? || refresh
raise "D-#{d} discovery artifacts already exist; use --refresh only for this generated draft" if
  !refresh &&
  [definitions_path, reviews_path].any? { |path| File.exist?(path) }

definition_values = [
  ['person:grinning-vane-spirrick', 'Grinning Vane Spirrick', 'person',
   '웃는 베인 스피릭(Grinning Vane Spirrick)', 'Grinning Vane',
   '웃는 베인|활짝 웃는 베인|씩 웃는 베인|그리닝 베인|그린닝 베인',
   'D-21124', 'confirmed',
   'English identifies the Freeman outlaw as Grinning Vane and gives the full name Grinning Vane Spirrick in item and notice text. Japanese consistently renders the epithet as にやにや and transliterates Vane; Chinese renders the epithet as 微笑 and transliterates the name. Use 웃는 베인(Grinning Vane) for the short form and 웃는 베인 스피릭(Grinning Vane Spirrick) for the full name.'],
  ['person:finola-flanagan', 'Finola Flanagan', 'person',
   '피놀라 플래너건(Finola Flanagan)', 'Mayor Flanagan|Finola',
   '피놀라 플래너건|피놀라|플래너건 시장|시장 플래너건|플래너건(Flanagan) 시장|플래너건(Flanagan) 촌장',
   'D-21124', 'confirmed',
   'English identifies Finola Flanagan as the Revival mayor and explicitly equates the title Mayor Flanagan with Finola. Japanese フラナガン村長 and Chinese 弗拉纳根镇长 corroborate the title; both render Finola as フィノーラ/菲诺拉. Keep the full personal name 피놀라 플래너건(Finola Flanagan) distinct from the title reference 플래너건 시장(Mayor Flanagan).'],
  ['person:fanny-flanagan', 'Fanny Flanagan', 'person',
   '패니 플래너건(Fanny Flanagan)', 'Fanny',
   '패니 플래너건',
   'D-21124|default:44697', 'confirmed',
   'English explicitly names Fanny Flanagan. Japanese ファニー・フラナガン and Chinese 范妮·弗拉纳根 corroborate the full name. The line does not establish that Fanny is Finola; keep this person-name entry separate and make no identity claim.'],
  ['resource:scarlet-flowstone', 'Scarlet Flowstone', 'resource',
   '스칼렛 플로우스톤(Scarlet Flowstone)', '',
   '스칼렛 플로스톤|진홍빛 흐름석|진홍색 유석|진홍 유석|진홍빛 유석|진홍빛 플로우스톤|주홍 유석',
   'D-21124', 'confirmed',
   'English consistently names the alchemical reagent Scarlet Flowstone. Japanese スカーレット・フローストーン supports the established Korean transliteration, while Chinese 猩红流石 corroborates the scarlet/stone meaning. Standardize to 스칼렛 플로우스톤(Scarlet Flowstone).'],
  ['resource:eel-petal', 'Eel Petal', 'resource',
   '일 페탈(Eel Petal)', '',
   '장어 꽃잎|뱀장어 꽃잎|장어꽃',
   'D-21125', 'confirmed',
   'English identifies Eel Petal as a named alchemical plant/reagent; Japanese イールの花びら and Chinese 鳗鱼花 corroborate the plant. Preserve the previously accepted Korean form 일 페탈(Eel Petal) from D-19651, D-19654, and D-19787; do not replace it with a new literal translation.']
].freeze

glossary = m.table(File.join(audit, 'proper-name-glossary.tsv'))
definitions = definition_values.map { |values| glossary.headers.zip(values).to_h }
definitions.each { |row| row['evidence_ids'] = '' }

patches = {
  ['base', '289', '11'] => [['활짝 웃는 베인(Grinning Vane)', '웃는 베인(Grinning Vane)']],
  ['default', '6603', ''] => [['그리닝 베인(Grinning Vane)', '웃는 베인(Grinning Vane)']],
  ['default', '9138', ''] => [['활짝 웃는 베인', '웃는 베인(Grinning Vane)']],
  ['default', '11961', ''] => [['그린닝 베인(Grinning Vane)', '웃는 베인(Grinning Vane)']],
  ['default', '16168', ''] => [['씩 웃는 베인(Grinning Vane)', '웃는 베인(Grinning Vane)']],
  ['default', '19478', ''] => [['활짝 웃는 베인', '웃는 베인(Grinning Vane)']],
  ['default', '20153', ''] => [['씩 웃는 베인 스피릭', '웃는 베인 스피릭(Grinning Vane Spirrick)']],
  ['default', '40213', ''] => [['그리닝 베인', '웃는 베인(Grinning Vane)']],
  ['default', '42827', ''] => [['웃는 베인 스피릭', '웃는 베인 스피릭(Grinning Vane Spirrick)']],
  ['default', '916', ''] => [['시장 플래너건(Mayor Flanagan)', '플래너건 시장(Mayor Flanagan)']],
  ['default', '3282', ''] => [['플래너건(Flanagan) 시장', '플래너건 시장(Mayor Flanagan)']],
  ['default', '4259', ''] => [['플래너건(Flanagan) 촌장', '플래너건 시장(Mayor Flanagan)']],
  ['default', '16382', ''] => [['플래너건(Flanagan) 시장', '플래너건 시장(Mayor Flanagan)']],
  ['default', '25704', ''] => [['플래너건 시장', '플래너건 시장(Mayor Flanagan)']],
  ['default', '32381', ''] => [['피놀라 플래너건', '피놀라 플래너건(Finola Flanagan)']],
  ['default', '39076', ''] => [['피놀라 플래너건', '피놀라 플래너건(Finola Flanagan)']],
  ['default', '40781', ''] => [['피놀라', '피놀라(Finola)']],
  ['default', '42112', ''] => [['플래너건 시장', '플래너건 시장(Mayor Flanagan)']],
  ['default', '43081', ''] => [
    ['피놀라 플래너건', '피놀라 플래너건(Finola Flanagan)'],
    ['플래너건 시장', '플래너건 시장(Mayor Flanagan)']
  ],
  ['default', '44697', ''] => [["패니' 플래너건", "패니' 플래너건(Fanny Flanagan)"]],
  ['default', '47370', ''] => [['피놀라', '피놀라(Finola)']],
  ['default', '47969', ''] => [['플래너건 시장', '플래너건 시장(Mayor Flanagan)']],
  ['default', '48026', ''] => [['플래너건 시장', '플래너건 시장(Mayor Flanagan)']],
  ['default', '48950', ''] => [['피놀라', '피놀라(Finola)']],
  ['default', '57222', ''] => [['플래너건 시장', '플래너건 시장(Mayor Flanagan)']],
  ['base', '589', '11'] => [['주홍 유석', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['base', '2749', '11'] => [['진홍색 유석', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '8529', ''] => [['진홍빛 흐름석(Scarlet Flowstone)', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '13572', ''] => [['스칼렛 플로스톤', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '14986', ''] => [['진홍색 유석', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '16291', ''] => [['진홍 유석', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '20832', ''] => [['스칼렛 플로스톤', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '29693', ''] => [['진홍빛 유석', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '31330', ''] => [['진홍빛 유석', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '32621', ''] => [['스칼렛 플로스톤', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '34913', ''] => [['스칼렛 플로스톤', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '43292', ''] => [['진홍색 유석', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '43689', ''] => [['스칼렛 플로스톤', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['default', '53710', ''] => [['진홍빛 플로우스톤(Scarlet Flowstone)', '스칼렛 플로우스톤(Scarlet Flowstone)']],
  ['base', '1165', '11'] => [['장어 꽃잎', '일 페탈(Eel Petal)']],
  ['base', '1697', '11'] => [['장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '7795', ''] => [['장어 꽃잎(Eel Petal)', '일 페탈(Eel Petal)']],
  ['default', '12453', ''] => [['장어 꽃잎(Eel Petal)', '일 페탈(Eel Petal)']],
  ['default', '13917', ''] => [['일 페탈', '일 페탈(Eel Petal)']],
  ['default', '29833', ''] => [],
  ['default', '30058', ''] => [['일 페탈', '일 페탈(Eel Petal)']],
  ['default', '30847', ''] => [['뱀장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '33789', ''] => [['장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '34826', ''] => [['장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '39322', ''] => [['뱀장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '48816', ''] => [['장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '49709', ''] => [['장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '51166', ''] => [['장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '53686', ''] => [['장어꽃(Eel Petal)', '일 페탈(Eel Petal)']],
  ['default', '58576', ''] => [['뱀장어 꽃잎', '일 페탈(Eel Petal)']],
  ['default', '59501', ''] => [['장어 꽃잎', '일 페탈(Eel Petal)']]
}.freeze

inventory_rows = m.refresh_inventory.values
inventory = inventory_rows.to_h { |row| [m.key(row), row] }
generated = build_occurrences(inventory_rows, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_counts = {
  'person:grinning-vane-spirrick' => 12,
  'person:finola-flanagan' => 22,
  'person:fanny-flanagan' => 1,
  'resource:scarlet-flowstone' => 18,
  'resource:eel-petal' => 20
}
actual_counts = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
raise "unexpected exact source matches: #{actual_counts.inspect}" unless actual_counts == expected_counts
generated_keys = generated.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s] }
raise 'duplicate generated source row key' unless generated_keys.uniq.length == generated_keys.length
raise "change map contains non-matching rows: #{patches.keys - generated_keys}" unless
  (patches.keys - generated_keys).empty?

entity_order = definition_values.map { |values| values[0] }
resource_order = %w[affix base default]
generated.sort_by! do |row|
  [entity_order.index(row['entity_key']), resource_order.index(row['resource']),
   row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
end

rationales = definitions.to_h do |definition|
  [definition['entity_key'], definition['notes']]
end
reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  old_text = occurrence.fetch('korean_current')
  new_text = old_text.dup
  Array(patches[key]).each do |old_span, new_span|
    count = new_text.scan(Regexp.new(Regexp.escape(old_span))).length
    raise "expected one exact Korean span at #{key.inspect}: #{old_span.inspect}" unless count == 1
    new_text.sub!(old_span, new_span)
  end
  source = inventory.fetch(key)
  status = new_text == old_text ? 'not-an-issue' : 'accepted'
  entity = occurrence.fetch('entity_key')
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entity,
    'status' => status,
    'old' => old_text,
    'new' => new_text,
    'evidence' => "#{rationales.fetch(entity)} English is primary; aligned Japanese and Chinese corroborate. This is a new exact entity/row key; prior decisions for other entities and global translation tallies remain unchanged.",
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end

raise 'expected 73 exact source rows' unless reviews.length == 73
raise 'expected 55 corrections and 18 canonical rows' unless
  reviews.group_by { |row| row['status'] }.transform_values(&:length) ==
    { 'accepted' => 55, 'not-an-issue' => 18 }
raise "unmatched manual changes: #{patches.keys - reviews.map { |row| m.key(row) }}" unless
  patches.keys.sort == reviews.select { |row| patches.key?(m.key(row)) }.map { |row| m.key(row) }.uniq.sort

reviews_by_entity = reviews.group_by { |row| row['entity_key'] }
definitions.each do |definition|
  keys = reviews_by_entity.fetch(definition['entity_key']).map do |row|
    "#{row['resource']}:#{row['ID_Linha']}"
  end
  definition['evidence_ids'] = keys.uniq.join('|')
end

m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "Prepared D-#{d}: #{definitions.length} entries, #{reviews.length} exact rows, #{patches.length} row keys with explicit edits."
puts "Entity matches: #{actual_counts.inspect}"
puts "Dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
