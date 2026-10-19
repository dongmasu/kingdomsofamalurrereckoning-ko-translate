#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-solstice-short-labels-D21795'

class ReviewSolsticeShortLabelsD21795Test < Minitest::Test
  M = ReviewSolsticeShortLabelsD21795

  def test_full_source_scope_and_explicit_homonym_hold
    assert_equal 7, M::SOURCE_KEYS.length
    assert_equal 4, M::CANDIDATE_DISPOSITIONS.length
    assert_equal 5, M::SOURCE_KEYS.values.count { |row| row[0] == 'accepted' }
    assert_equal 1, M::SOURCE_KEYS.values.count { |row| row[0] == 'not-an-issue' }
    assert_equal 1, M::SOURCE_KEYS.values.count { |row| row[0] == 'uncertain' }
    assert_equal 'uncertain', M::CANDIDATE_DISPOSITIONS[['default', '25061', '']]
  end

  def test_each_corrected_label_uses_the_bilingual_form
    M::SOURCE_KEYS.each do |key, (_status, _old, proposed)|
      next if key == ['default', '25061', '']
      assert_includes proposed, '솔스티스(Solstice)'
    end
  end

  def test_destination_and_weapon_contexts_are_not_merged_as_an_entity
    assert_includes M.evidence(['default', '15467', '']), 'destination'
    assert_includes M.evidence(['default', '30187', '']), 'weapon'
    assert_includes M.evidence(['default', '25061', '']), 'does not identify'
  end
end
