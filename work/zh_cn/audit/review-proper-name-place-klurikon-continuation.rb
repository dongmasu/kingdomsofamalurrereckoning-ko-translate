#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0, '20647'))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:klurikon'
raise 'Klurikon already registered' if glossary.any? { |row| row['entity_key'] == entity }
definition = glossary.headers.zip([
  entity, 'Klurikon', 'place', '클루리콘(Klurikon)', '', '',
  'base:1249|default:564|default:61284', 'confirmed',
  'English identifies the eastern region Klurikon; Japanese クルリコン and Chinese 克琉孔 agree. Retain established 클루리콘 and annotate repeated mentions. The official manual p. 1 provides eastern-war setting context, not a regional spelling. Klurikon Arena is annotated as a complete location. default:55520 retains its independently recorded source/Korean mismatch; no other entity hold is reopened.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise 'Klurikon source count changed' unless generated.length == 236
reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  text = old.dup
  if english.include?('Klurikon Arena')
    text.gsub!(/클루리콘(?:\(Klurikon\))? 투기장(?:\(Klurikon Arena\))?/, '클루리콘 투기장(Klurikon Arena)')
  end
  if key == ['default', '19440', '']
    raise 'prototype label changed' unless old == '클루리콘 프로토타입'
    text = '클루리콘 프로토타입(Klurikon Protoype)'
  else
    text.gsub!(/클루리콘(?!\(Klurikon\)| 투기장\(Klurikon Arena\))/, '클루리콘(Klurikon)')
  end
  missing = !old.include?('클루리콘')
  raise "unexpected missing regional span #{key.inspect}" if missing && key != ['default', '55520', '']
  status = missing ? 'uncertain' : (text == old ? 'not-an-issue' : 'accepted')
  evidence = if missing
               'English includes the region Klurikon, whereas Korean contains only 달탄 이임스(Daltan Eames). Existing Walen/Jeibir mismatch holds are retained, not reopened or resolved. No safe Klurikon span exists; no sentence reconstruction attempted.'
             else
               'English names the region Klurikon; aligned Japanese クルリコン and Chinese 克琉孔 corroborate identity. Retained 클루리콘(Klurikon), including repeated mentions and attached particles. Complete Klurikon Arena and source-spelled Klurikon Protoype labels are paired atomically; other names, tokens, numbers and line breaks are unchanged. Manual p. 1 supplies eastern-war context, not this regional spelling.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence, 'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
index = m.table(m::INDEX)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, "proper-name-reviewed-klurikon-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil)
