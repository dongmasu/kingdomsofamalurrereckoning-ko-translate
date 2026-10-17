#!/usr/bin/env ruby

require_relative 'correct-firstsworn-particles-D21099'
require_relative 'proper-name-test-replay'

m = ReviewedNameBatches
f = FirstswornParticlesD21099
inventory = ProperNameTestReplay.inventory_at(21_099)
path = File.join(m::AUDIT, 'proper-name-edits-D21099.tsv')
recorded = File.file?(path) ? m.table(path).map(&:to_h) : []
recorded.each do |row|
  source = inventory.fetch(m.key(row))
  raise 'active particle correction differs from manifest' unless source['work_text'] == row['new']
  source['work_text'] = row['old']
end
reviews = f.reviews(inventory)
raise 'wrong particle correction scope' unless reviews.map { |row| row['ID_Linha'] } == %w[51339 62666]
reviews.each do |row|
  restored = row['new'].dup
  f::CORRECTIONS.fetch(row['ID_Linha']).each { |from, to| restored = restored.sub(to, from) }
  raise 'change outside three singular particles' unless restored == row['old']
  raise 'plural particle accidentally changed' unless
    row['old'].scan(/첫서약자들\(Firstsworn\)[가-힣]+/) ==
      row['new'].scan(/첫서약자들\(Firstsworn\)[가-힣]+/)
end
if recorded.any?
  active = m.table(m::INVENTORY)
  invalid = active.select do |row|
    row['work_text'].match?(/첫서약자\(Firstsworn\)(?:이(?![름후])|은|을|과|으로|이라)/)
  end
  raise "singular Firstsworn particle residual: #{invalid.map { |row| m.key(row) }.inspect}" unless invalid.empty?
end
puts 'PASS D-21099 three singular particles corrected, plural particles and all other text preserved'
