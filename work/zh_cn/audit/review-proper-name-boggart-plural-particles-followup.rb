#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
inventory = m.refresh_inventory
ids = %w[1475 4240 11318 12072 12298 14757 22433 25208 34984 38292 44492 46885 47308 50685 54491]
pattern = /(?<![가-힣])(?:보가트|보기트)(?=들을|들에게|야|들아|처럼|들이|들의|들은)/
reviews = ids.map do |id|
  source = inventory.fetch(['default', id, ''])
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
  raise "cross-locale creature context changed at #{id}" unless
    english.match?(/\bBoggarts\b/i) && japanese.include?('ボガート') &&
    source.fetch('zh_text').include?('博格特')
  old = source.fetch('work_text')
  raise "expected one reviewed unpaired Boggart span at #{id}" unless old.scan(pattern).length == 1
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => 'monster:boggart', 'status' => 'accepted',
    'old' => old, 'new' => old.sub(pattern, '보가트(Boggart)'),
    'evidence' => 'Focused EN Boggarts / JA ボガート / ZH 博格特 comparison confirms the same registered creature in each sentence. The prior hold was only a suffix-boundary limitation: plural+case suffixes 들을/들에게/들이/들의/들은, vocative 들아, copular 야, or comparative 처럼. Standardize 보기트 to 보가트 and place (Boggart) before the unchanged suffix. Keep the singular dictionary form for the English plural alias, as Korean plural inflection is already retained. Existing other creature labels and all remaining prose are untouched. Resolve the existing held entity/row key, not a new occurrence.',
    'entity_dispositions_json' => JSON.generate('monster:boggart' => 'accepted')
  }
end
out = File.join(__dir__, "proper-name-reviewed-boggart-plural-particles-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil, review_states: ['uncertain'])
