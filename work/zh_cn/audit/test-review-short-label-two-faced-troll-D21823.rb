#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-short-label-two-faced-troll-D21823'

class ReviewShortLabelTwoFacedTrollD21823Test < Minitest::Test
  M = ReviewShortLabelTwoFacedTrollD21823

  def test_candidate_contains_only_the_default_and_base_label_keys
    candidate = M::M.table(M::INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == M::LABEL
    end
    refute_nil candidate
    assert_equal [['default', '18848', '']],
                 JSON.parse(candidate.fetch('unpaired_label_keys_json'))
                   .map { |parts| parts.map(&:to_s) }
    assert_equal [['base', '1221', '11']],
                 JSON.parse(candidate.fetch('paired_evidence_keys_json'))
                   .map { |parts| parts.map(&:to_s) }
  end

  def test_only_annotation_and_spacing_change
    assert_equal '두 얼굴의 트롤(The Two-Faced Troll)',
                 M::TARGETS.fetch(['default', '18848', ''])[1]
    assert_equal '두 얼굴의 트롤(The Two-Faced Troll)',
                 M::TARGETS.fetch(['base', '1221', '11'])[1]
    assert_includes M::EVIDENCE, 'Preserve'
    assert_includes M::EVIDENCE, 'D-5952'
  end

  def test_existing_entity_dispositions_are_not_reclassified
    assert_includes M::EVIDENCE, 'not resolve or recount it'
    refute_includes M::EVIDENCE, 'Register a new'
  end
end
