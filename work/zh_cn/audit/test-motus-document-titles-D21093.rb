#!/usr/bin/env ruby

require_relative 'prepare-motus-document-titles-D21093'
require_relative 'proper-name-test-replay'

m = ReviewedNameBatches
f = MotusDocumentTitlesD21093
inventory = ProperNameTestReplay.inventory_at(21_093)
path = File.join(m::AUDIT, 'proper-name-edits-D21093.tsv')
recorded = File.file?(path) ? m.table(path).map(&:to_h) : []
recorded.each do |row|
  source = inventory.fetch(m.key(row))
  raise 'active Motus title differs from manifest' unless source['work_text'] == row['new']
  source['work_text'] = row['old']
end
reviews = f.reviews(inventory)
generated = build_occurrences(inventory.values, f.definitions)
raise 'unexpected Motus document scope' unless
  reviews.length == 5 && generated.length == 5 &&
    reviews.map { |row| m.key(row) }.uniq.length == 5
reviews.each do |row|
  raise 'missing Motus title evidence' unless
    row['japanese'].include?('モータス') && row['chinese'].include?('莫图斯')
  raise 'nested Motus-only label' if row['new'].include?('(Motus)')
  raise 'Motus document title content changed' unless
    row['new'].delete_suffix("(#{row['english']})") == row['old'].gsub('(Motus)', '')
end
recorded.each do |expected|
  actual = reviews.find { |row| m.key(row) == m.key(expected) }
  raise 'Motus title generation differs from manifest' unless
    %w[entity_key status old new].all? { |field| actual[field] == expected[field] }
end
puts 'PASS D-21093 full Motus titles, exact Roman volume numbers, and source spelling'
