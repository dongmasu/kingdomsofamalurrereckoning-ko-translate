#!/usr/bin/env ruby

require_relative 'proper-name-test-replay'

m = ReviewedNameBatches
inventory = ProperNameTestReplay.inventory_at(21_084)
index = m.table(m::INDEX)
prior = index.first(31_822).map(&:to_h)
raise 'prior occurrence index is incomplete' unless prior.length == 31_822
prior.each { |row| row['korean_current'] = inventory.fetch(m.key(row)).fetch('work_text') }
bytes = CSV.generate(col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << index.headers
  prior.each { |row| csv << index.headers.map { |header| row[header] } }
end
expected = 'a37f068e367aabc2bd40dc4a1754ef49a9d655313f81a5dae1275066040146bd'
actual = Digest::SHA256.hexdigest(bytes)
raise "pre-D-21085 index dispositions/order changed: #{actual}" unless actual == expected
puts "PASS all 31822 prior entity keys, dispositions, evidence, and order: #{actual}"

raise 'pre-D-21085 inventory key count changed' unless inventory.length == 73_430
puts 'PASS pre-D-21085 inventory: 73430 distinct CSV row keys'
