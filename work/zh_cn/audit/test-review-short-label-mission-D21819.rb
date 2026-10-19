#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-mission-D21819'

class ReviewShortLabelMissionD21819Test < Minitest::Test
  M = ReviewShortLabelMissionD21819

  def test_only_bounded_mission_label_memberships_are_in_scope
    assert_equal 4, M::EXPECTED.length
    assert M::EXPECTED.values.take(3).all? do |old, revised, status|
      old == '선교회' && revised == '선교회(The Mission)' && status == 'accepted'
    end
    assert_equal ['선교회(The Mission)', '선교회(The Mission)', 'not-an-issue'],
                 M::EXPECTED.fetch(['default', '8398', ''])
  end

  def test_locale_conflict_and_historical_uncertainties_are_preserved
    assert_includes M::EVIDENCE, '修道院'
    assert_includes M::EVIDENCE, '布道所'
    %w[D-4705 D-1301 D-2037 D-2347].each do |decision|
      assert_includes M::EVIDENCE, decision
    end
  end

  def test_snapshot_keys_match_expected_memberships
    candidates = M::M.table(M::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch('The Mission')
    keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    assert_equal M::EXPECTED.keys.to_set, keys.to_set
  end
end
