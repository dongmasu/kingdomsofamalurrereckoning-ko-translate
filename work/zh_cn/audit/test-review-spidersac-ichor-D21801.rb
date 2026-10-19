#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-spidersac-ichor-D21801'

class ReviewSpidersacIchorD21801Test < Minitest::Test
  M = ReviewSpidersacIchorD21801

  def test_full_source_scope_includes_lowercase_dialogue_references
    assert_equal 7, M::KEYS.length
    assert_equal 6, M::REPLACEMENTS.length
    assert_equal 7, M::SPECS.first.fetch(:count)
    assert_equal 'item:spidersac-ichor', M::SPECS.first.fetch(:key)
  end

  def test_canonical_form_preserves_the_lore_specific_ichor_term
    assert_equal '거미낭 이코르(Spidersac Ichor)', M::SPECS.first.fetch(:korean)
    assert_includes M::SPECS.first.fetch(:notes), 'D-6169'
    assert_includes M::EDIT_EVIDENCE, 'Japanese イコル'
    assert_includes M::EDIT_EVIDENCE, 'Chinese 蜘蛛囊液'
  end

  def test_existing_canonical_acquisition_line_is_not_rewritten
    assert_nil M::REPLACEMENTS[['default', '8633', '']]
  end

  def test_other_recipe_terms_and_prior_findings_are_preserved
    assert_includes M::SPECS.first.fetch(:notes), 'Do not alter Fennwrac, grist, Jottun'
    assert_includes M::EDIT_EVIDENCE, 'other prior decisions'
  end
end
