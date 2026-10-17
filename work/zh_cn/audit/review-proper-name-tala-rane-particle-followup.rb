#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
source = m.refresh_inventory.fetch(['default', '14964', ''])
english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
raise 'Tala-Rane source changed' unless english.include?('Tala-Rane') &&
  JSON.parse(source.fetch('ja_texts_json')).compact.join.include?('タラ＝レイン') &&
  source.fetch('zh_text').include?('塔拉莱恩')
old = source.fetch('work_text')
raise 'expected one Tala-Rane comparison span' unless old.scan('탈라레인과는').length == 1
review = {
  'resource' => 'default', 'ID_Linha' => '14964', 'Tipo_Variante' => '',
  'entity_key' => 'place:tala-rane', 'status' => 'accepted',
  'old' => old, 'new' => old.sub('탈라레인과는', '탈라레인(Tala-Rane)과는'),
  'evidence' => 'Full EN/JA/ZH comparison confirms the eastern region Tala-Rane / タラ＝レイン / 塔拉莱恩. The prior hold was only a regex limitation on the compound particle 과는. Insert the English label before the unchanged suffix and retain the rest of the sentence. Resolve only the existing held entity/row key.',
  'entity_dispositions_json' => JSON.generate('place:tala-rane' => 'accepted')
}
out = File.join(__dir__, "proper-name-reviewed-tala-rane-particle-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, [review])
m.run(out, start_d, nil, review_states: ['uncertain'])
