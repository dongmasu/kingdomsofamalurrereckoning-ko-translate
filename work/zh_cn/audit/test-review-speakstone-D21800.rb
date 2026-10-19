#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-speakstone-D21800'

class ReviewSpeakstoneD21800Test < Minitest::Test
  M = ReviewSpeakstoneD21800

  def test_full_source_scope_includes_capitalized_labels_and_lowercase_mentions
    assert_equal 7, M::KEYS.length
    assert_equal 5, M::REPLACEMENTS.length
    assert_equal 7, M::SPECS.first.fetch(:count)
    assert_equal 'item:speakstone', M::SPECS.first.fetch(:key)
  end

  def test_canonical_item_name_is_bilingual_and_reuses_established_form
    assert_equal '발화석(Speakstone)', M::SPECS.first.fetch(:korean)
    assert_includes M::SPECS.first.fetch(:notes), 'Japanese さえずり石'
    assert_includes M::EDIT_EVIDENCE, 'Chinese 传音石'
    assert_includes M::EDIT_EVIDENCE, 'default:7770'
  end

  def test_existing_canonical_rows_remain_unchanged
    assert_nil M::REPLACEMENTS[['default', '7770', '']]
    assert_nil M::REPLACEMENTS[['default', '28801', '']]
  end

  def test_only_the_item_name_questions_are_narrowly_resolved
    assert_includes M::SPECS.first.fetch(:notes), 'D-9005’s other deferred terms'
    assert_includes M::EDIT_EVIDENCE, 'broader sentence/lore findings remain open'
  end
end
