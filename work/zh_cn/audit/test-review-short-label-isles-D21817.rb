#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-isles-D21817'

class ReviewShortLabelIslesD21817Test < Minitest::Test
  M = ReviewShortLabelIslesD21817

  def test_one_isolated_label_gets_pairing_without_entity_classification
    target = M::EXPECTED.fetch(['default', '24097', ''])
    assert_equal ['군도', '군도(The Isles)', 'accepted'], target
    assert_includes M::EVIDENCE, "D-7741 and D-19539"
    assert_match(/no entity\s+is registered/i, M::EVIDENCE)
  end

  def test_all_other_candidate_memberships_remain_unchanged
    retained = M::EXPECTED.reject { |key, _value| key == ['default', '24097', ''] }
    assert_equal 10, retained.length
    assert retained.all? do |_key, (old, new_text, disposition)|
      old == new_text && disposition == 'not-an-issue'
    end
  end

  def test_snapshot_memberships_align_with_all_four_locale_inventory
    inventory = M::M.refresh_inventory
    index = M::M.table(M::M::INDEX).map(&:to_h)
    candidates = M::M.table(M::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    rows = M.build_reviews(inventory, index, candidates)

    assert_equal M::EXPECTED.keys.to_set, rows.map { |row| M.key(row) }.to_set
    assert_equal 10, rows.count { |row| row.fetch('disposition') == 'not-an-issue' }
    target = rows.find do |row|
      M.key(row) == ['default', '24097', '']
    end
    assert_equal '군도(The Isles)', target.fetch('new')
  end
end
