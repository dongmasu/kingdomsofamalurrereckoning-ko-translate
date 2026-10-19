#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-stalwart-D21803'

class ReviewStalwartD21803Test < Minitest::Test
  M = ReviewStalwartD21803

  def test_ship_and_common_adjective_are_separate_scopes
    assert_equal 'item:the-stalwart', M::ENTITY
    assert_equal 'The Stalwart', M::SPECS.first.fetch(:english)
    assert_equal '스톨워트(The Stalwart)', M::SPECS.first.fetch(:korean)
    assert_equal 7, M::CANDIDATE_KEYS.length
    assert_equal 6, M::CANDIDATE_KEYS.count { |key| key.first == 'affix' }
    assert_equal 4, M::SOURCE_KEYS.length
    assert_equal 3, M::COMMON_HOMONYM_KEYS.length
  end

  def test_ship_classification_is_supported_by_all_three_locales
    assert_includes M::EDIT_EVIDENCE, 'named vessel'
    assert_includes M::EDIT_EVIDENCE, 'Japanese スタルワート号'
    assert_includes M::EDIT_EVIDENCE, 'Chinese 忠诚号'
  end

  def test_affix_variants_are_preserved_as_common_adjective
    assert_includes M::EDIT_EVIDENCE, '굳건한'
    assert_includes M::EDIT_EVIDENCE, 'exclude them from this ship identity'
    assert_equal 4, M::SPECS.first.fetch(:count)
    assert_includes M::EDIT_EVIDENCE, 'default:13575, 23481, and 40922'
  end
end
