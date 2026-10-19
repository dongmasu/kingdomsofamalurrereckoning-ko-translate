#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-still-manor-D21804'

class ReviewStillManorD21804Test < Minitest::Test
  M = ReviewStillManorD21804

  def test_scope_covers_the_residence_and_both_distinct_entrances
    assert_equal 3, M::SPECS.length
    assert_equal 4, M::MANOR_KEYS.length
    assert_equal 'place:still-manor', M::SPECS[0].fetch(:key)
    assert_equal 'place:still-manor-guard-entrance', M::SPECS[1].fetch(:key)
    assert_equal 'place:still-manor-servants-entrance', M::SPECS[2].fetch(:key)
  end

  def test_canonical_pairs_are_atomic_and_source_exact
    assert_equal '스틸 저택(Still Manor)', M::SPECS[0].fetch(:korean)
    assert_equal '스틸 저택 경비 출입구(Still Manor Guard Entrance)', M::SPECS[1].fetch(:korean)
    assert_equal '스틸 저택 하인 출입구(Still Manor Servants Entrance)', M::SPECS[2].fetch(:korean)
    assert_equal 4, M::SPECS[0].fetch(:count)
    assert_equal 1, M::SPECS[1].fetch(:count)
    assert_equal 1, M::SPECS[2].fetch(:count)
  end

  def test_overlapping_manor_components_are_excluded_in_compound_labels
    assert_includes M::SPECS[0].fetch(:notes), 'exclude the manor component'
    assert_includes M::EDIT_EVIDENCE, 'exclude the overlapping Still Manor component'
    assert_equal 'accepted', M::CANDIDATE_GROUP.fetch('base:1631:11')
    assert_equal 'not-an-issue', M::CANDIDATE_GROUP.fetch('default:12629:')
  end
end
