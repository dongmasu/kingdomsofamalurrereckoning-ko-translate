#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-elemental-names-D21535'

class ElementalNamesD21535Test < Minitest::Test
  R = ElementalNamesD21535
  M = ReviewedNameBatches

  def reviews
    @reviews ||= R.reviews(M.refresh_inventory)
  end

  def test_exact_entities_rows_and_per_entity_decisions
    assert_equal 4, R.entities.length
    assert_equal 10, reviews.length
    assert_equal 13, reviews.sum { |row| JSON.parse(row['entity_dispositions_json']).length }
    assert_equal 5, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 5, reviews.count { |row| row['status'] == 'not-an-issue' }
    assert_equal 10, reviews.map { |row| M.key(row) }.uniq.length
    assert reviews.all? { |row| row['resource'] == 'default' }
  end

  def test_shared_attack_rows_keep_tokens_and_both_names
    %w[29100 60689 61767].each do |id|
      row = reviews.find { |review| review['ID_Linha'] == id }
      assert_includes row['new'], '{*1원소 탈출}(Elemental Escape)'
      assert_includes row['new'], '{*1비전 격노}(Arcane Fury)'
      assert_equal 2, JSON.parse(row['entity_dispositions_json']).length
    end
    reviews.each do |row|
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
  end

  def test_harmony_and_cloak_do_not_expand_identity_or_duplicate_annotations
    row = reviews.find { |review| review['ID_Linha'] == '18611' }
    assert_equal 1, row['old'].scan('원소 조화(Elemental Harmony)').length
    assert_equal 2, row['new'].scan('원소 조화(Elemental Harmony)').length
    assert_equal row['old'].sub('원소 조화는', '원소 조화(Elemental Harmony)는'), row['new']
    cloak = reviews.select { |review| review['entity_key'] == 'item:elemental-cloak' }
    assert_equal 4, cloak.length
    assert cloak.all? { |review| review['old'] == review['new'] }
    refute reviews.any? { |review| %w[1514 24729 52428].include?(review['ID_Linha']) }
    refute R.entities.any? { |entity| %w[skill:elemental-rage skill:ethereal-guard].include?(entity['entity_key']) }
  end
end
