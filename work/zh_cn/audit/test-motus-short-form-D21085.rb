#!/usr/bin/env ruby

require_relative 'prepare-motus-short-form-D21085'
require_relative 'proper-name-test-replay'

module TestMotusShortFormD21085
  module_function

  def assert(condition, message)
    raise message unless condition
  end

  inventory = ProperNameTestReplay.inventory_at(21_086)
  recorded = [21_085, 21_086].flat_map do |d|
    path = File.join(ReviewedNameBatches::AUDIT, "proper-name-edits-D#{d}.tsv")
    File.file?(path) ? ReviewedNameBatches.table(path).map(&:to_h) : []
  end
  recorded.each do |row|
    source = inventory.fetch(ReviewedNameBatches.key(row))
    assert(source.fetch('work_text') == row.fetch('new'),
           "active Motus inventory differs from the recorded manifest: #{row['ID_Linha']}")
    source['work_text'] = row.fetch('old')
  end
  reviews = MotusShortFormD21085.reviews(inventory)
  statuses = reviews.group_by { |row| row.fetch('status') }
    .transform_values(&:length)
  assert(reviews.length == 59, "expected 59 Motus rows, got #{reviews.length}")
  assert(statuses == { 'accepted' => 37, 'not-an-issue' => 19, 'excluded' => 3 },
         "unexpected dispositions: #{statuses.inspect}")
  assert(reviews.map { |row| ReviewedNameBatches.key(row) }.uniq.length == 59,
         'duplicate Motus row key')
  assert(reviews.all? { |row| row.fetch('entity_key') == MotusShortFormD21085::ENTITY },
         'unexpected entity in Motus review')
  assert(reviews.all? do |row|
    row.fetch('english').match?(/(?<![A-Za-z])Motus(?![A-Za-z])/i) &&
      MotusShortFormD21085.paired_source?(row.fetch('japanese'), /モータス/) &&
      MotusShortFormD21085.paired_source?(row.fetch('chinese'), /莫图斯/)
  end, 'a Motus row lacks aligned source evidence')
  assert(reviews.all? do |row|
    if row.fetch('status') == 'accepted'
      row.fetch('old').gsub(/모투스(?!\(Motus\))/i, '모투스(Motus)') == row.fetch('new') &&
        row.fetch('new').gsub('모투스(Motus)', '모투스') ==
          row.fetch('old').gsub('모투스(Motus)', '모투스')
    else
      row.fetch('new') == row.fetch('old')
    end
  end, 'a proposed edit changes text outside the reviewed Motus spans')
  assert(reviews.find { |row| row['ID_Linha'] == '38767' }['status'] == 'excluded',
         'Motus Miner role label must stay outside the organization scope')
  %w[3592 37021].each do |id|
    row = reviews.find { |review| review['ID_Linha'] == id }
    assert(row['status'] == 'excluded' && row['new'] == row['old'],
           "complete document/person name must stay unchanged: #{id}")
  end
  mixed = reviews.find { |row| row['ID_Linha'] == '11969' }
  assert(mixed['new'].scan('모투스(Motus)').length == 2,
         'mixed paired/unpaired references must retain the existing label')
  recorded.each do |expected|
    actual = reviews.find { |row| ReviewedNameBatches.key(row) == ReviewedNameBatches.key(expected) }
    assert(%w[entity_key status old new].all? { |field| actual[field] == expected[field] },
           "Motus generation differs from the recorded manifest: #{expected['ID_Linha']}")
  end

  puts 'PASS D-21085 Motus row scope, four-locale evidence, and exact-span edits'
end
