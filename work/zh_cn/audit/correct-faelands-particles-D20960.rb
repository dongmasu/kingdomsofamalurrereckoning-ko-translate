#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.refresh_inventory
replacements = {
  '64521' => ['패란즈(Faelands)으로', '패란즈(Faelands)로'],
  '64963' => ['패란즈(Faelands)이', '패란즈(Faelands)가']
}
reviews = replacements.map do |id, (before, after)|
  source = inventory.fetch(['default', id, ''])
  old = source.fetch('work_text')
  raise "missing exact particle target #{id}" unless old.scan(before).length == 1
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => 'place:faelands', 'status' => 'accepted',
    'old' => old, 'new' => old.sub(before, after),
    'evidence' => 'Correct the attached Korean particle after the consonant-final descriptive rendering 페이의 땅 was replaced with vowel-final 패란즈 in D-20959. English, Japanese, and Chinese still identify the same Faelands region. Only the exact erroneous 으로/이 particle is changed to 로/가; update the existing entity/key in place without adding or recounting a finding.',
    'entity_dispositions_json' => '{}', 'previous_status' => '', 'previous_evidence' => ''
  }
end
path = File.join(__dir__, 'proper-name-proposals-D20960.tsv')
m.write_table(path, m::HEADERS, reviews)
m.run(path, 20_960, nil, review_states: ['accepted'])
