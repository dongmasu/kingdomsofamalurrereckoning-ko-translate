#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
path = File.join(__dir__, 'proper-name-discovery-D21190.tsv')
rows = m.table(path).map(&:to_h)
inventory = m.refresh_inventory

row = rows.find { |entry| entry['resource'] == 'default' && entry['ID_Linha'] == '9305' }
raise 'D-21190 row 9305 missing' unless row
row['new'].sub!('엔턴(Enton) 애스터', '엔턴 애스터(Enton Aster)')
raise 'Enton Aster full-name annotation not added' unless row['new'].include?('엔턴 애스터(Enton Aster)')
row['evidence'] += ' The same row names both the son Heric Aster and father Enton Aster; annotate each complete name exactly once.'

row = rows.find { |entry| entry['resource'] == 'default' && entry['ID_Linha'] == '48979' }
raise 'D-21190 row 48979 missing' unless row
raise 'unexpected existing text at 48979' unless row['old'] == '헤릭 애스터의 무덤'
row['new'] = '헤릭 애스터(Heric Aster)의 무덤'
row['status'] = 'accepted'
row['entity_dispositions_json'] = JSON.generate('person:heric-aster' => 'accepted')
addition = ' The English label explicitly names Heric Aster; add the missing Korean(English) annotation while preserving the possessive grave construction.'
row['evidence'] += addition unless row['evidence'].include?(addition)
raise 'source inventory differs from D-21190 old text' unless
  inventory.fetch(['default', '48979', '']).fetch('work_text') == row['old']

m.write_table(path, m::HEADERS.take(12), rows)
puts 'PASS manifest now annotates both full names at 9305 and the missing name at 48979'
