#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
d = 21_193
inventory = m.refresh_inventory
prior = m.table(File.join(__dir__, 'proper-name-discovery-D21189.tsv'))
targets = {
  '10454' => ['암흑 엠피리언(Dark Empyrean)의 몰락를',
              '암흑 엠피리언(Dark Empyrean)이 몰락한 이유를'],
  '41311' => ['암흑 엠피리언(Dark Empyrean)가',
              '암흑 엠피리언(Dark Empyrean)이']
}
reviews = targets.map do |id, (from, to)|
  old = inventory.fetch(['default', id, '']).fetch('work_text')
  raise "expected correction span missing/ambiguous at #{id}" unless old.scan(from).length == 1
  prior_row = prior.find { |row| row['resource'] == 'default' && row['ID_Linha'] == id }
  raise "missing D-21189 finding at #{id}" unless prior_row && prior_row['status'] == 'accepted'
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => prior_row.fetch('entity_key'), 'status' => 'accepted',
    'old' => old, 'new' => old.sub(from, to),
    'evidence' => "Corrective Korean particle/phrase audit of D-21189, not a new entity finding. D-21189 established the English-led Empyrean label, but final read-through found an erroneous object particle in the fall clause at default #{id == '10454' ? id : '10454'} and a subject particle attached incorrectly after the bilingual parenthetical at default 41311. Correct the Korean grammar while preserving the accepted Empyrean dispositions, Ciara Sydanus decision, English meaning, tokens, and line breaks. The immutable D-21189 manifest and its evidence are retained in previous_evidence.",
    'english' => prior_row.fetch('english'),
    'japanese' => prior_row.fetch('japanese'),
    'chinese' => prior_row.fetch('chinese'),
    'entity_dispositions_json' => prior_row.fetch('entity_dispositions_json')
  }
end
path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'correction manifest already exists' if File.exist?(path)
m.write_table(path, m::HEADERS, reviews)
before_counts = m.table(m::INDEX).group_by { |row| row['status'] }.transform_values(&:length)
m.run(path, d, nil, review_states: ['accepted'])
after_counts = m.table(m::INDEX).group_by { |row| row['status'] }.transform_values(&:length)
raise 'corrective audit changed entity/decision counts' unless before_counts == after_counts
puts 'PASS Empyrean grammar corrections preserve all entity/disposition counts'
