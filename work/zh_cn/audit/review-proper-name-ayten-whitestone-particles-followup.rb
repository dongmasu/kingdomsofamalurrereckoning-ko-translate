#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
inventory = m.refresh_inventory
specs = [
  ['11801', 'place:whitestone', '휘트스톤(Whitestone)과는', '화이트스톤(Whitestone)과는'],
  ['20908', 'place:ayten', '아이텐에선', '아이텐(Ayten)에선'],
  ['25130', 'place:whitestone', '화이트스톤식', '화이트스톤(Whitestone)식'],
  ['29840', 'place:ayten', '아이텐엔', '아이텐(Ayten)엔'],
  ['37311', 'place:whitestone', '화이트스톤이야', '화이트스톤(Whitestone)이야'],
  ['39860', 'place:whitestone', '화이트스톤에선', '화이트스톤(Whitestone)에선'],
  ['49630', 'place:whitestone', '화이트스톤보단', '화이트스톤(Whitestone)보단'],
  ['62952', 'place:whitestone', '화이트스톤엔', '화이트스톤(Whitestone)엔']
]
reviews = specs.map do |id, entity, before, after|
  source = inventory.fetch(['default', id, ''])
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  name = entity == 'place:ayten' ? 'Ayten' : 'Whitestone'
  raise "source name changed at #{id}" unless english.match?(/\b#{name}\b/)
  old = source.fetch('work_text')
  raise "non-unique Korean span at #{id}" unless old.scan(before).length == 1
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => entity, 'status' => 'accepted',
    'old' => old, 'new' => old.sub(before, after),
    'evidence' => 'Focused full-sentence EN/JA/ZH comparison confirms the named town and a unique Korean span. The earlier hold was only a bounded-regex limitation on contractions/particles, not a referent ambiguity. Canonicalize the name and insert its English label before the unchanged Korean suffix. Japanese names the town directly except default:25130, where この町流 refers to the same town named explicitly by English Whitestone and Chinese 白石镇. Update the existing held occurrence only; do not add a new key.',
    'entity_dispositions_json' => JSON.generate(entity => 'accepted')
  }
end
out = File.join(__dir__, "proper-name-reviewed-ayten-whitestone-particles-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil, review_states: ['uncertain'])
