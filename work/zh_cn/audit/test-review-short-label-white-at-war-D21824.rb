#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-short-label-white-at-war-D21824'

class ReviewShortLabelWhiteAtWarD21824Test < Minitest::Test
  M = ReviewShortLabelWhiteAtWarD21824

  def test_candidate_scope_matches_the_default_and_base_labels
    candidate = M::M.table(M::INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == M::LABEL
    end
    refute_nil candidate
    assert_equal [['default', '13500', '']],
                 JSON.parse(candidate.fetch('unpaired_label_keys_json'))
                   .map { |parts| parts.map(&:to_s) }
    assert_equal [['base', '1712', '11']],
                 JSON.parse(candidate.fetch('paired_evidence_keys_json'))
                   .map { |parts| parts.map(&:to_s) }
  end

  def test_only_parenthetical_pairing_and_spacing_change
    assert_equal '전쟁터의 백색(The White At War)',
                 M::TARGETS.fetch(['default', '13500', ''])[1]
    assert_equal '전쟁 중의 백색(The White At War)',
                 M::TARGETS.fetch(['base', '1712', '11'])[1]
    assert_includes M::EVIDENCE, 'Preserve each existing Korean rendering'
  end

  def test_historical_referent_uncertainty_remains_open
    assert_includes M::EVIDENCE, 'D-4003'
    assert_includes M::EVIDENCE, 'is not'
    assert_includes M::EVIDENCE, 'recounted'
  end
end
