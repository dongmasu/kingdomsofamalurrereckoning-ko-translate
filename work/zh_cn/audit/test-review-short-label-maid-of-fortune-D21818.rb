#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-maid-of-fortune-D21818'

class ReviewShortLabelMaidOfFortuneD21818Test < Minitest::Test
  M = ReviewShortLabelMaidOfFortuneD21818

  def test_scope_is_only_the_unpaired_label_and_its_existing_evidence
    assert_equal 2, M::EXPECTED.length
    assert_equal ['행운의 시녀호', '행운의 시녀호(Maid of Fortune)', 'accepted'],
                 M::EXPECTED.fetch(['default', '57264', ''])
    assert_includes M::EVIDENCE, 'D-1281/D-4058'
    assert_includes M::EVIDENCE, 'D-10967'
    assert_includes M::EVIDENCE, 'D-17975'
  end

  def test_nine_source_ids_are_pinned
    assert_equal %w[1151 5239 7568 13675 17546 27645 33962 57264 61973],
                 M::ALL_IDS
  end

  def test_candidate_snapshot_memberships_match_the_review
    inventory = M::M.refresh_inventory
    candidates = M::M.table(M::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch('The Maid of Fortune')
    keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    assert_equal M::EXPECTED.keys.to_set, keys.to_set
    assert_equal 'The Maid of Fortune',
                 JSON.parse(inventory.fetch(['default', '57264', '']).fetch('en_texts_json')).first
  end
end
