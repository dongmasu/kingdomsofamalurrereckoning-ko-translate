#!/usr/bin/env ruby

require_relative 'prepare-firstsworn-discovery-D21087'
require_relative 'proper-name-test-replay'

module TestFirstswornDiscoveryD21087
  M = ReviewedNameBatches
  F = FirstswornDiscoveryD21087
  module_function

  def assert(condition, message)
    raise message unless condition
  end

  inventory = ProperNameTestReplay.inventory_at(21_088)
  recorded = [21_087, 21_088].flat_map do |d|
    path = File.join(M::AUDIT, "proper-name-edits-D#{d}.tsv")
    File.file?(path) ? M.table(path).map(&:to_h) : []
  end
  recorded.each do |row|
    source = inventory.fetch(M.key(row))
    assert(source.fetch('work_text') == row.fetch('new'), 'active Firstsworn inventory mismatch')
    source['work_text'] = row.fetch('old')
  end
  reviews = F.reviews(inventory)
  assert(reviews.length == 69, 'expected 69 distinct Firstsworn/Firstworn row keys')
  statuses = reviews.group_by { |row| row['status'] }.transform_values(&:length)
  assert(statuses == { 'excluded' => 36, 'accepted' => 31, 'not-an-issue' => 2 },
         "unexpected Firstsworn dispositions #{statuses.inspect}")
  reviews.each do |row|
    dispositions = JSON.parse(row.fetch('entity_dispositions_json'))
    assert(row['english'].match?(/\bFirsts?worn\b/), 'missing English source name')
    assert(row['japanese'].match?(/ファーストスウォーン|Firstsworn/), 'missing Japanese evidence')
    assert(row['chinese'].match?(/首誓者|Firstsworn/), 'missing Chinese evidence')
    assert(row['old'].scan(/\r\n|\r|\n/) == row['new'].scan(/\r\n|\r|\n/),
           'line-break sequence changed')
    if dispositions[F::GROUP] == 'accepted'
      assert(F.edit_group(row['old']) == row['new'], 'unreviewed group-span edit')
      assert(row['old'].scan(F::ROOT).length == row['english'].scan(/\bFirsts?worn\b/).length,
             "source/Korean group occurrence count mismatch at #{row['ID_Linha']}")
    end
    assert(row['old'] == row['new'], 'excluded compound was edited') if row['status'] == 'excluded'
  end
  by_id = reviews.to_h { |row| [row['ID_Linha'], row] }
  assert(by_id.fetch('40118')['status'] == 'excluded', 'plural Halls needs a place-scoped follow-up')
  assert(by_id.fetch('51339')['new'].scan('(Firstsworn)').length == 4,
         'all four long-book references must be paired')
  assert(by_id.fetch('42039')['new'].include?('첫서약자(Firstsworn)의 챔피언'),
         'historical group must not remain an ordinary oath')
  assert(by_id.fetch('48850')['new'].include?('그녀'), 'female dialogue variant changed')
  assert(by_id.fetch('44286')['new'].include?('그를'), 'male dialogue variant changed')
  assert(by_id.fetch('31960')['new'].include?('첫서약자(Firstsworn)께서'),
         'honorific particle lost')
  %w[4300 27574 34776].each do |id|
    assert(by_id.fetch(id)['new'].include?('첫서약자의 대장간(Forge of the Firstsworn)'),
           "forge full-name pairing missing at #{id}")
  end
  assert(by_id.fetch('45316')['new'] == '첫서약자 성소(Shrine of the Firstsworn)',
         'shrine must remain a separate complete name')
  recorded.each do |expected|
    actual = reviews.find { |row| M.key(row) == M.key(expected) }
    assert(%w[entity_key status old new entity_dispositions_json].all? do |field|
      actual[field] == expected[field]
    end, 'generated Firstsworn review differs from its recorded manifest')
  end
  puts 'PASS D-21087 Firstsworn group/place separation, source evidence, variants, and exact reviewed edits'
end
