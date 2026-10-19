#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-god-fang-D21816'

class ReviewShortLabelGodFangD21816Test < Minitest::Test
  M = ReviewShortLabelGodFangD21816

  def test_all_four_exact_labels_are_normalized_without_entity_typing
    assert_equal 4, M::EXPECTED.length
    assert M::EXPECTED.values.all? { |_old, new_text| new_text == '신의 송곳니(The God Fang)' }
    assert_includes M::EVIDENCE, "D-4847's uncertainty"
    assert_includes M::EVIDENCE, 'no entity is registered'
  end

  def test_scope_is_exactly_the_candidate_snapshot_memberships
    inventory = M::M.refresh_inventory
    index = M::M.table(M::M::INDEX).map(&:to_h)
    candidates = M::M.table(M::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = M.build_reviews(inventory, index, candidates)

    assert_equal M::EXPECTED.keys.to_set, reviews.map { |row| M.key(row) }.to_set
    assert_equal 4, reviews.map { |row| M.key(row) }.uniq.length
    assert reviews.all? { |row| row['disposition'] == 'accepted' }
    assert_equal ['The Isles'], M::M.table(M::INPUT).map { |row| row['english_candidate'] }.drop(1).first(1)
  end
end
