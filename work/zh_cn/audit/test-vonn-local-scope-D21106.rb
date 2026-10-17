#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-vonn-local-scope-D21106'

class VonnLocalScopeD21106Test < Minitest::Test
  M = ReviewedNameBatches
  V = VonnLocalScopeD21106

  def test_exact_sources_dispositions_and_single_pairing
    inventory = M.refresh_inventory
    applied = File.join(__dir__, 'proper-name-edits-D21106.tsv')
    rows = File.exist?(applied) ? M.table(applied).map(&:to_h) : V.reviews(inventory)
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    assert_equal 6, rows.length
    assert_equal 6, rows.map { |r| M.key(r) }.uniq.length
    assert_equal({ 'accepted' => 1, 'not-an-issue' => 2, 'excluded' => 3 },
      rows.group_by { |r| r['status'] }.transform_values(&:length))
    rows.each do |r|
      assert_equal r['old'], r['new'] unless r['status'] == 'accepted'
      assert_equal r['status'], JSON.parse(r['entity_dispositions_json']).fetch(V.entity_for(r['ID_Linha']))
      refute_empty r['english']
      refute_empty r['japanese']
      refute_empty r['chinese']
    end
    assert_match(/Cassera Vonn/, rows.find { |r| r['ID_Linha'] == '22447' }['english'])
    assert_equal 'excluded', rows.find { |r| r['ID_Linha'] == '41621' }['status']
    assert_equal 'excluded', rows.find { |r| r['ID_Linha'] == '51766' }['status']
    rasp = rows.find { |r| r['ID_Linha'] == '19818' }
    assert_equal rasp['old'].sub('라스프의', '라스프(Rasp)의'), rasp['new']
    registered = M.table(M::INDEX).select do |r|
      V::CASES.key?(r['ID_Linha']) && r['entity_key'] == V.entity_for(r['ID_Linha'])
    end
    return if registered.empty?

    assert_equal 6, registered.length
    rows.each do |r|
      found = registered.find { |i| M.key(i) == M.key(r) }
      refute_nil found
      assert_equal r['status'], found['status']
      assert_equal r['new'], inventory.fetch(M.key(r))['work_text']
    end
  end
end
