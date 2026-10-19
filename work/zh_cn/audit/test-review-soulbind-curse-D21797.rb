#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-soulbind-curse-D21797'

class ReviewSoulbindCurseD21797Test < Minitest::Test
  M = ReviewSoulbindCurseD21797

  def test_one_named_curse_covers_short_and_full_source_forms
    assert_equal 'Soulbind', M::SPECS.first.fetch(:english)
    assert_equal 'Soulbind Curse', M::SPECS.first.fetch(:aliases)
    assert_equal 13, M::SPECS.first.fetch(:count)
    assert_equal 10, M::REPLACEMENTS.length
    assert_equal 2, M::EXCLUSIONS.length
    assert_equal 1, M::ALREADY_CANONICAL.length
  end

  def test_terminal_rows_are_preserved
    assert_includes M::EXCLUSIONS.fetch('1201'), 'D-19591'
    assert_includes M::EXCLUSIONS.fetch('23313'), 'D-18607'
    assert_equal 'not-an-issue',
                 M::CANDIDATE_DISPOSITIONS[['default', '23313', '']]
  end

  def test_canonical_and_compound_forms_are_bilingual
    assert_equal '영혼 결속(Soulbind)', M::SPECS.first.fetch(:korean)
    assert_equal '영혼 결속 저주(Soulbind Curse)',
                 M::REPLACEMENTS.fetch('18190').first.last
  end
end
