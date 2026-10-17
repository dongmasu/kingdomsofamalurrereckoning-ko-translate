#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'continue-proper-name-reviewed-batches'

path = File.join(__dir__, 'proper-name-discovery-D20837.tsv')
table = ReviewedNameBatches.table(path)
{
  '50221' => ['아다스는 남쪽', '아다스(Adath)는 남쪽'],
  '28055' => ['아델린에게 가져가야', '아델린(Adeline)에게 가져가야'],
  '16665' => ['아사를 구해야', '아사(Asa)를 구해야']
}.each do |id, (old_span, new_span)|
  rows = table.select { |row| row['resource'] == 'default' && row['ID_Linha'] == id }
  raise "non-unique reviewed row #{id}" unless rows.length == 1

  row = rows.first
  raise "unexpected reviewed span #{id}" unless row['new'].scan(old_span).length == 1
  row['new'] = row['new'].sub(old_span, new_span)
  row['status'] = 'accepted'
  row['entity_dispositions_json'] = JSON.generate(row['entity_key'] => 'accepted')
  row['evidence'] += ' The same aligned English row repeats the person by a shortened first name; preserve that short form in its own bilingual label. This is a row-local identity, not a global first-name alias.'
end
raise 'unexpected review count' unless table.length == 93
ReviewedNameBatches.write_table(path, table.headers, table)
puts "Wrote #{table.length} reviewed keys: #{table.group_by { |row| row['status'] }.transform_values(&:length)}"
