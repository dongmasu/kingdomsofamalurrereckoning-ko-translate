#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
inventory = m.refresh_inventory
specs = [
  ['21617', 'monster:boggart', '보가트라면', '보가트(Boggart)라면', 'Boggart'],
  ['28200', 'monster:ettin', '에틴조차', '에틴(Ettin)조차', 'Ettin'],
  ['38711', 'monster:ettin', '에틴들은', '에틴(Ettin)들은', 'Ettin'],
  ['41740', 'monster:ettin', '에틴조차', '에틴(Ettin)조차', 'Ettin'],
  ['63136', 'monster:ettin', '에틴들이', '에틴(Ettin)들이', 'Ettin'],
  ['63276', 'monster:ettin', '에틴들이', '에틴(Ettin)들이', 'Ettin']
]
reviews = specs.map do |id, entity, before, after, english_name|
  source = inventory.fetch(['default', id, ''])
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  raise "source changed at #{id}" unless english.match?(/\b#{english_name}\b/i)
  old = source.fetch('work_text')
  raise "non-unique Korean span at #{id}" unless old.scan(before).length == 1
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => entity, 'status' => 'accepted',
    'old' => old, 'new' => old.sub(before, after),
    'evidence' => 'Full EN/JA/ZH sentence comparison confirms the creature: Boggart / ボガート / 博格特 or Ettin / エティン / 双头魔. The earlier uncertainty was only a Korean suffix-boundary limitation. Insert the canonical English label before the exact unchanged conditional/emphatic/plural suffix; preserve all surrounding narration. In default:63136 the ethnographic dietary journal explicitly identifies these Ettin in all three sources. Resolve only the existing held entity/row key, without a new occurrence or global recount.',
    'entity_dispositions_json' => JSON.generate(entity => 'accepted')
  }
end
out = File.join(__dir__, "proper-name-reviewed-monster-particles-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil, review_states: ['uncertain'])
