#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
ids = %w[
  9284 10464 10866 18850 20606 23909 24118 29470 30865 33586
  34815 35360 38324 38642 40393 40717 41063 48066 50111
  54714 57653 59664 60520 62874 63357
]
proposals = m.table(File.join(__dir__, 'proper-name-reviewed-N-R-corrected-final.tsv'))
selected = proposals.select { |row| ids.include?(row['ID_Linha']) && row['entity_key'] != 'person:ouet' &&
  row['ID_Linha'] != '30865' }.map(&:to_h)
trav = m.table(File.join(__dir__, 'proper-name-reviewed-S-T-final.tsv'))
  .find { |row| row['resource'] == 'default' && row['ID_Linha'] == '3917' }
raise 'missing exact Desiderus Trav review' unless trav
selected << trav.to_h
selected.each do |review|
  source = inventory.fetch(m.key(review))
  raise "stale text changed unexpectedly #{m.key(review).inspect}" unless source['work_text'] == review['old']
  # Only the surname spelling changes here; Azo's existing decision is retained.
  review['entity_key'] = 'person:raemund' if review['ID_Linha'] == '38324'
  review['entity_dispositions_json'] = JSON.generate(
    review['entity_key'].split('|').to_h { |entity| [entity, 'accepted'] }
  )
  review['evidence'] += ' Final active-row comparison confirmed this reviewed span was still at the old text. Apply the source-supported full-name/particle repair now, retaining all unrelated terminal entity decisions; this is a subsequent cell correction, not a duplicate global classification.'
end
selected.sort_by! { |row| row['ID_Linha'].to_i }
out = File.join(__dir__, 'proper-name-reviewed-stale-spans-D20605.tsv')
m.write_table(out, m::HEADERS, selected)
m.run(out, 20605, nil, review_states: %w[accepted not-an-issue])
