#!/usr/bin/env ruby

require_relative 'prepare-firstsworn-hall-variants-D21089'
require_relative 'proper-name-test-replay'

m = ReviewedNameBatches
f = FirstswornHallVariantsD21089
inventory = ProperNameTestReplay.inventory_at(21_089)
path = File.join(m::AUDIT, 'proper-name-edits-D21089.tsv')
recorded = File.file?(path) ? m.table(path).map(&:to_h) : []
recorded.each do |row|
  source = inventory.fetch(m.key(row))
  raise 'active Hall text differs from manifest' unless source['work_text'] == row['new']
  source['work_text'] = row['old']
end
reviews = f.reviews(inventory)
raise 'wrong Hall variant scope' unless reviews.map { |row| row['ID_Linha'] } == %w[40118 44231]
reviews.each do |row|
  _english, from, to, _evidence = f::CASES.fetch(row['ID_Linha'])
  raise 'non-reviewed Hall edit' unless row['new'] == row['old'].sub(from, to)
  raise 'Hall evidence missing' unless
    row['japanese'].include?('ファーストスウォーン') && row['chinese'].include?('首誓者')
end
recorded.each do |expected|
  actual = reviews.find { |row| row['ID_Linha'] == expected['ID_Linha'] }
  raise 'Hall variant generation differs from manifest' unless
    %w[entity_key status old new].all? { |field| actual[field] == expected[field] }
end
puts 'PASS D-21089 exact Hall plural/source-typo scope and complete bilingual place labels'
