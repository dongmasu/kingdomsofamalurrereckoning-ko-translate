#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21792'

class ReviewShortLabelCandidatesD21792Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21792

  def test_two_savant_labels_receive_complete_english_pairing
    savant = M::CHANGES.fetch(['default', '58585', ''])
    assert_equal '사반트(Savant)', savant.fetch(:new)

    full_title = M::CHANGES.fetch(['default', '47690', ''])
    assert_equal '사반트 에이선 엥가르(Savant Aethan Engar)', full_title.fetch(:new)
    assert_equal 'person:aethan-engar', full_title.fetch(:entity)
  end

  def test_prior_decisions_are_explicitly_preserved
    savant = M::CHANGES.fetch(['default', '58585', ''])
    assert_includes savant.fetch(:prior), 'D-19509'
    assert_includes savant.fetch(:prior), 'does not reopen'

    aethan = M::CHANGES.fetch(['default', '47690', ''])
    assert_includes aethan.fetch(:prior), 'D-19512/D-20831'
    assert_includes aethan.fetch(:prior), 'Preserve the terminal'
  end

  def test_only_the_two_short_label_keys_are_in_scope
    assert_equal [
      ['default', '58585', ''],
      ['default', '47690', '']
    ], M::CHANGES.keys
  end
end
