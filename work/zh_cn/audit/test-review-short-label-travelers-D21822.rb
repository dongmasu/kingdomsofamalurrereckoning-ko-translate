#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-short-label-travelers-D21822'

class ReviewShortLabelTravelersD21822Test < Minitest::Test
  M = ReviewShortLabelTravelersD21822

  def test_candidate_scope_is_two_unpaired_labels_and_one_paired_reference
    candidate = M::M.table(M::INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == 'The Travelers'
    end
    refute_nil candidate
    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    assert_equal [%w[default 1206], %w[default 14458]].map { |r, id| [r, id, ''] }, unpaired
    assert_equal [['default', '3427', '']], paired
  end

  def test_edit_preserves_the_localized_faction_root_and_plural_marker
    assert_equal '트래블러(The Travelers)들',
                 M::TARGETS.fetch(['default', '1206', '']).fetch(:new)
    assert_equal '트래블러(The Travelers)',
                 M::TARGETS.fetch(['default', '14458', '']).fetch(:new)
    assert_equal M::TARGETS.fetch(['default', '3427', '']).fetch(:old),
                 M::TARGETS.fetch(['default', '3427', '']).fetch(:new)
  end

  def test_prior_faction_decisions_are_explicitly_preserved
    assert_includes M::EVIDENCE, 'D-20770'
    assert_includes M::EVIDENCE, 'D-20771'
    assert_includes M::EVIDENCE, 'D-20775'
    assert_includes M::EVIDENCE, 'not a new entity'
  end
end
