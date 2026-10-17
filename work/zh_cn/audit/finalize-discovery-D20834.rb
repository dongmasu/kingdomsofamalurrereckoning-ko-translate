#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'continue-proper-name-reviewed-batches'

input = '/private/tmp/proper-name-review-D20834/proper-name-reviewed-glossary-pending.tsv'
output = File.join(__dir__, 'proper-name-discovery-D20834.tsv')
table = ReviewedNameBatches.table(input)
overrides = {
  '10304' => ['아스켈 토린이라면', '아스켈 소린(Askel Thorin)이라면'],
  '25466' => ['킬리언과 이야기', '실리언(Cillian)과 이야기'],
  '47305' => ['실리언은 케이프', '실리언(Cillian)은 케이프'],
  '2445' => ['콜름은 그 집단', '콜름(Colm)은 그 집단']
}
overrides.each do |id, (old_span, new_span)|
  rows = table.select { |row| row['resource'] == 'default' && row['ID_Linha'] == id }
  raise "non-unique reviewed row #{id}" unless rows.length == 1

  row = rows.first
  raise "unexpected reviewed span #{id}" unless row['new'].scan(old_span).length == 1
  row['new'] = row['new'].sub(old_span, new_span)
  row['status'] = 'accepted'
  row['entity_dispositions_json'] = JSON.generate(row['entity_key'] => 'accepted')
  row['evidence'] = if id == '10304'
                      'English Askel Thorin, Japanese アスケル・ソリン, and Chinese 阿斯克尔·索林 identify the same alchemist; normalize the complete name before 이라면 without changing the conditional ending.'
                    else
                      "#{row['evidence']} The repeated shortened name in this same English row identifies the preceding full-name person; preserve the short English form in its own bilingual label without creating a global ambiguous first-name alias."
                    end
end
raise 'unexpected review count' unless table.length == 115
raise 'unresolved discovery draft' if table.any? { |row| row['status'] == 'uncertain' }
ReviewedNameBatches.write_table(output, table.headers, table)
puts "Wrote #{table.length} reviewed keys: #{table.group_by { |row| row['status'] }.transform_values(&:length)}"
