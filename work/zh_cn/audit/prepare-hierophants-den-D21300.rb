#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21300.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21300.tsv')

definition = {
  'entity_key' => 'place:hierophants-den',
  'english_canonical' => "Hierophant's Den",
  'category' => 'place',
  'korean_canonical' => "대사제의 은신처(Hierophant's Den)",
  'english_aliases' => '',
  'korean_variants' => '대사제의 소굴|히에로판트의 은신처',
  'evidence_ids' => 'D-21300|base:3803|default:37293|default:44486',
  'status' => 'confirmed',
  'notes' => "English base:3803 and default:44486 give the standalone place label; the eight narrative/objective rows independently identify it as a destination or route. Japanese 祈祷師の隠れ家 and Chinese 大祭司的巢穴 corroborate the den/hideout meaning. Use 대사제의 은신처(Hierophant's Den) as one complete place label. Keep the office/title Hierophant distinct, and do not merge this place with Hierophant Shrine. New explicit place-label evidence resolves only this scoped name question; prior decisions about Missives of Sable and other referents remain untouched. The official Korean manual has no direct entry for this DLC location."
}

new_texts = {
  ['base', '3803', '11'] =>
    "대사제의 은신처(Hierophant's Den)",
  ['default', '21322', ''] =>
    '누락의 장막에서 온 서신들을 찾아냈다. 그 때문에 파스머(Phasmer)가 데려온 근위병들이 서신의 위치를 알아내 성소에 혼란을 일으켰다. 아르진(Argine)을 만나 대사제의 은신처(Hierophant\'s Den)에서 탈출해야 한다.',
  ['default', '27874', ''] =>
    '망각의 수의(Shroud of Omission)에서 밀서들을 찾아냈다. 그 결과 근위병들이 밀서가 있는 곳으로 순간 이동해 성소에 혼란을 일으켰다. 그림(Grim)을 만나 대사제의 은신처(Hierophant\'s Den)에서 탈출해야 한다.',
  ['default', '37328', ''] =>
    '아르진(Argine)을 만났다. 노움들이 혼란을 일으키는 동안 그녀와 함께 대사제의 은신처(Hierophant\'s Den)를 빠져나가야 한다. 그림(Grim)은 트래블러(Travelers)들에게 저지른 죄의 책임을 지게 두고 가자.',
  ['default', '37293', ''] =>
    '성소의 감시자를 따돌리려고 바람의 주머니를 사용했다. 대사제의 은신처(Hierophant\'s Den)를 계속 수색해 그림(Grim)과 아르진(Argine)이 만나는 성소를 찾아야 한다. 그곳에서 검은 사절문서를 이용해 대사제를 모함하거나... 그림(Grim)을 배신할 수 있다.',
  ['default', '40030', ''] =>
    '대사제의 은신처(Hierophant\'s Den)에 들어갔지만 아르진(Argine)과 맞닥뜨렸다. 아르진(Argine)은 그림(Grim)의 계획을 간파했고, 내가 그림(Grim)을 배신해 검은 서신을 그에게 씌우면 보상하겠다고 약속했다. 아르진(Argine)은 자기 성소의 열쇠도 건넸다. 크릴가린(Crilgarin)을 찾아 서신을 되찾은 다음 어느 편에 설지 결정해야겠다.',
  ['default', '44486', ''] =>
    "대사제의 은신처(Hierophant's Den)",
  ['default', '54001', ''] =>
    "대사제의 은신처(Hierophant's Den)에서 크릴가린(Crilgarin)을 만나기",
  ['default', '58516', ''] =>
    "이 고대 열쇠는 대사제의 은신처(Hierophant's Den)로 이어지는 고대 문 가운데 하나에 맞도록 만들어졌다.",
  ['default', '61701', ''] =>
    '그림(Grim)과 합류했어. 노움들이 혼란을 일으키는 동안 그와 함께 대사제의 은신처(Hierophant\'s Den)를 통과해 탈출해야 해. 대사제는 노움들에게 맡겨 두고.'
}.freeze

if File.exist?(DEFINITIONS)
  existing = M.table(DEFINITIONS)
  raise 'refusing to replace unrelated D-21300 definitions' unless
    existing.length == 1 && existing.first['entity_key'] == definition['entity_key']
end
if File.exist?(REVIEWS)
  existing = M.table(REVIEWS)
  raise 'refusing to replace unrelated D-21300 review output' unless
    existing.length == 10 && existing.all? { |row| row['entity_key'] == definition['entity_key'] }
end
inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
generated_keys = generated.map { |row| M.key(row) }.sort_by do |resource, id, variant|
  [M::RESOURCES.index(resource), id.to_i, variant]
end
raise "expected exact ten source keys, got #{generated_keys.inspect}" unless
  generated_keys == new_texts.keys.sort_by { |resource, id, variant| [M::RESOURCES.index(resource), id.to_i, variant] }

reviews = generated_keys.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = new_texts.fetch(key)
  evidence = "English identifies the complete named place Hierophant's Den; aligned Japanese 祈祷師の隠れ家 and Chinese 大祭司的巢穴 corroborate the hideout/den. Use 대사제의 은신처(Hierophant's Den) for this exact location, preserving all other wording, names, particles, placeholders, and line breaks. Keep the place distinct from the Hierophant title and Hierophant Shrine. Existing person/entity decisions on the same source row are not reopened."
  status = old == new_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => definition.fetch('entity_key'),
    'status' => status,
    'old' => old,
    'new' => new_text,
    'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(definition.fetch('entity_key') => status)
  }
end

raise 'expected nine text changes and one retained canonical cell' unless
  reviews.count { |row| row['status'] == 'accepted' } == 9 &&
  reviews.count { |row| row['status'] == 'not-an-issue' } == 1

M.write_table(DEFINITIONS, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers,
              [definition])
M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
puts "Prepared D-21300: #{reviews.length} distinct row keys; " \
     "#{reviews.count { |row| row['status'] == 'accepted' }} edits; " \
     "#{reviews.count { |row| row['status'] == 'not-an-issue' }} already canonical."
