#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
source = m.refresh_inventory.fetch(['default', '48093', ''])
old = source.fetch('work_text')
raise 'Windemere kingdom source changed' unless
  JSON.parse(source['en_texts_json']).compact.join.include?("Maid's private kingdom of Windemere")
raise 'Windemere kingdom Korean span changed' unless old.include?('사적인 왕국 한복판')
review = {
  'resource' => 'default', 'ID_Linha' => '48093', 'Tipo_Variante' => '',
  'entity_key' => 'place:windemere', 'status' => 'accepted',
  'old' => old, 'new' => old.sub('사적인 왕국 한복판', '사적인 윈더미어 왕국(Kingdom of Windemere) 한복판'),
  'evidence' => 'Focused full-sentence comparison resolves the bounded-span limitation: English explicitly names the Maid\'s private kingdom of Windemere, Japanese ウィンダメア王国 and Chinese 温德米尔王国 corroborate the kingdom. Restore its full place name in the existing 사적인 왕국 phrase; retain the separate Maid of Windemere person/title and all remaining prose. This updates the existing held place/row key, adding no occurrence.',
  'entity_dispositions_json' => JSON.generate('place:windemere' => 'accepted')
}
out = File.join(__dir__, "proper-name-reviewed-windemere-subject-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, [review])
m.run(out, start_d, nil, review_states: ['uncertain'])
