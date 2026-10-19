#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-proud-warsworn-D21821'

class ReviewShortLabelProudWarswornD21821Test < Minitest::Test
  M = ReviewShortLabelProudWarswornD21821

  def test_target_uses_complete_source_label_not_nested_component_name
    old, revised, disposition = M::EXPECTED.fetch(['default', '4852', ''])
    assert_equal '긍지 높은 워스원(Warsworn)', old
    assert_equal '긍지 높은 워스원(The Proud Warsworn)', revised
    assert_equal 'accepted', disposition
    refute_match(/\(Warsworn\).*\(The Proud Warsworn\)/, revised)
  end

  def test_existing_faction_disposition_is_preserved
    assert_includes M::EVIDENCE, 'D-20771'
    assert_includes M::EVIDENCE, 'not-an-issue'
    assert_includes M::EVIDENCE, 'does not establish a new faction'
  end

  def test_snapshot_memberships_match_expected_keys
    candidates = M::M.table(M::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch('The Proud Warsworn')
    keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    assert_equal M::EXPECTED.keys.to_set, keys.to_set
  end
end
