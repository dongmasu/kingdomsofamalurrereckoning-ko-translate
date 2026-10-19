#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-morning-prayer-D21820'

class ReviewShortLabelMorningPrayerD21820Test < Minitest::Test
  M = ReviewShortLabelMorningPrayerD21820

  def test_both_label_cells_use_the_same_paired_display
    expected = '아침 기도(The Morning Prayer)'
    assert_equal expected, M::EXPECTED.fetch(['default', '40212', ''])[1]
    assert_equal expected, M::EXPECTED.fetch(['base', '3104', '11'])[1]
    assert_equal '아침 기도 (The Morning Prayer)',
                 M::EXPECTED.fetch(['base', '3104', '11'])[0]
  end

  def test_review_does_not_classify_a_distinct_entity
    assert_includes M::EVIDENCE, 'do not establish a unique named rite'
    refute_includes M::EVIDENCE, 'Register'
  end

  def test_snapshot_memberships_match_expected_keys
    candidates = M::M.table(M::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch('The Morning Prayer')
    keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    assert_equal M::EXPECTED.keys.to_set, keys.to_set
  end
end
