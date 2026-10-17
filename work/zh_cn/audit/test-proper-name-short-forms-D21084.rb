#!/usr/bin/env ruby

require_relative 'prepare-short-form-discovery-D21084'

module TestShortFormDiscoveryD21084
  module_function

  def assert(condition, message)
    raise message unless condition
  end

  inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
  inventory = inventory.map(&:to_h)
  by_key = inventory.to_h { |row| [ReviewedNameBatches.key(row), row] }
  manifest = ReviewedNameBatches.table(
    File.join(ReviewedNameBatches::AUDIT, 'proper-name-edits-D21084.tsv')
  )
  manifest.each do |expected|
    source = by_key.fetch(ReviewedNameBatches.key(expected))
    assert(source.fetch('work_text') == expected.fetch('new'),
           "active inventory differs from D-21084 manifest at #{ReviewedNameBatches.key(expected).inspect}")
    source['work_text'] = expected.fetch('old')
  end
  reviews = ShortFormDiscoveryD21084.reviews(by_key)
  statuses = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
  assert(reviews.length == 23, "expected 23 reviewed rows, got #{reviews.length}")
  assert(statuses == { 'accepted' => 14, 'not-an-issue' => 9 },
         "unexpected dispositions: #{statuses.inspect}")
  actual = reviews.to_h do |row|
    [ReviewedNameBatches.key(row),
     [row.fetch('entity_key'), row.fetch('status'), row.fetch('old'), row.fetch('new')]]
  end
  expected = manifest.to_h do |row|
    [ReviewedNameBatches.key(row),
     [row.fetch('entity_key'), row.fetch('status'), row.fetch('old'), row.fetch('new')]]
  end
  assert(actual == expected, 'generated review differs from the D-21084 manifest')
  assert(reviews.map { |row| ReviewedNameBatches.key(row) }.uniq.length == 23,
         'duplicate reviewed row key')
  assert(reviews.all? { |row| row.fetch('english').match?(/Scholia|Shieldring/i) },
         'a review row lacks its exact English proper-name form')
  assert(reviews.all? { |row| row.fetch('japanese').strip != '' && row.fetch('chinese').strip != '' },
         'a review row lacks Japanese or Chinese evidence')
  assert(ShortFormDiscoveryD21084.triage_rows(
           inventory.to_h { |row| [ReviewedNameBatches.key(row), row] }
         ).map { |row| row.fetch('candidate') } == %w[Senshir Aglir],
         'candidate-only triage keys changed')

  puts 'PASS D-21084 short-form candidate scope, source evidence, and dispositions'
end
