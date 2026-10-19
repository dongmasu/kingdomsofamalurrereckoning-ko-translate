#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-squire-brio-D21802'

class ReviewSquireBrioD21802Test < Minitest::Test
  M = ReviewSquireBrioD21802

  def test_candidate_scope_and_canonical_full_label
    assert_equal 3, M::GROUP.length
    assert_equal '종자 브리오(Squire Brio)', M::CANONICAL
    assert_equal 'default:33546:', M::GROUP.find { |_key, status| status == 'accepted' }.first
    assert_equal 2, M::GROUP.values.count('not-an-issue')
  end

  def test_prior_sentence_holds_are_explicitly_preserved
    assert_includes M::EVIDENCE, 'D-7680'
    assert_includes M::EVIDENCE, 'D-11766'
    assert_includes M::EVIDENCE, 'all prior indexed statuses/evidence'
  end

  def test_cross_language_label_evidence_is_source_anchored
    assert_includes M::EVIDENCE, 'Japanese 従者ブリオ'
    assert_includes M::EVIDENCE, 'Chinese 乡绅布里奥'
    assert_includes M::EVIDENCE, 'English labels the existing glossary person Brio'
  end
end
