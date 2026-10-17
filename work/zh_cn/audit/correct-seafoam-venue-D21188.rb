#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_188
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
source = inventory.fetch(['default', '55073', ''])
old = source.fetch('work_text')
raise 'Seafoam target changed' unless old.scan('시폼(Seafoam)에서').length == 1
entity = 'place:seafoam-tavern'
index = m.table(m::INDEX)
previous = index.select { |r| r['entity_key'] == entity && m.key(r) == ['default', '55073', ''] }
raise 'expected previous accepted Seafoam decision' unless
  previous.length == 1 && previous.first['status'] == 'accepted' &&
  previous.first['evidence'].start_with?('D-21186:')
review = {
  'resource' => 'default', 'ID_Linha' => '55073', 'Tipo_Variante' => '',
  'entity_key' => entity, 'status' => 'accepted', 'old' => old,
  'new' => old.sub('시폼(Seafoam)에서', '시폼(Seafoam) 선술집에서'),
  'evidence' => 'Corrective venue-descriptor audit of D-21186, not a new occurrence. Independent review found that the short-name replacement unnecessarily removed the existing venue type at default 55073. English be seen at the Seafoam refers to visiting the previously identified Rathir tavern; Japanese 酒場に行く and Chinese 海沫酒馆 explicitly retain tavern context. Restore 선술집 after the short bilingual label without changing the English alias, House Anwon, Lyria, voice, tokens, or line breaks. Manual PDF pp. 1-2 gives general setting/Lyria context, not this venue name. Previous disposition/evidence is retained in the manifest; no global or indexed tally is incremented.',
  'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
  'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
  'chinese' => source.fetch('zh_text'),
  'entity_dispositions_json' => JSON.generate(entity => 'accepted')
}
path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
m.write_table(path, m::HEADERS, [review])
counts = index.group_by { |r| r['status'] }.transform_values(&:length)
m.run(path, d, nil, review_states: ['accepted'])
raise 'corrective audit changed occurrence counts' unless
  counts == m.table(m::INDEX).group_by { |r| r['status'] }.transform_values(&:length)
puts 'PASS Seafoam correction preserves occurrence and disposition counts'
