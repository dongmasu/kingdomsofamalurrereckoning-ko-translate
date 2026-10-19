#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-southern-lights-D21798'

class ReviewSouthernLightsD21798Test < Minitest::Test
  M = ReviewSouthernLightsD21798

  def test_all_exact_hits_are_reviewed_as_the_same_phenomenon
    assert_equal 5, M::SPECS.first.fetch(:count)
    assert_equal 5, M::REPLACEMENTS.length
    assert_equal 'lore:southern-lights', M::SPECS.first.fetch(:key)
    assert_equal '남극광(Southern Lights)', M::SPECS.first.fetch(:korean)
  end

  def test_prior_uncertain_keys_are_resolved_only_for_the_term
    assert_includes M::SPECS.first.fetch(:notes), 'D-3546/default:12143'
    assert_includes M::SPECS.first.fetch(:notes), 'D-13055/default:42656'
    assert_includes M::SPECS.first.fetch(:notes), 'D-15704/default:51561'
    assert_includes M::SPECS.first.fetch(:notes), 'do not close D-16512'
  end

  def test_rhetorical_dialogue_translation_changes_only_the_name_span
    before, after = M::REPLACEMENTS.fetch('54539').first
    assert_equal '남쪽 빛(Southern Lights)', before
    assert_equal '남극광(Southern Lights)', after
  end
end
