#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-travelers-focused-followup'

class TravelersFocusedFollowupTest < Minitest::Test
  def forms(english)
    TravelersFocusedFollowup.source_forms(english)
  end

  def test_preserves_source_supported_singular_label
    old = '트래블러(Traveler)처럼 생각하는군.'
    text, notes, = TravelersFocusedFollowup.transform_korean(
      old, forms('You are thinking like a Traveler.')
    )

    assert_equal old, text
    assert_empty notes
  end

  def test_normalizes_mismatched_label_to_plural_source_form
    text, notes, = TravelersFocusedFollowup.transform_korean(
      '여행자(Traveler)는 도둑으로 알려져 있어.',
      forms('The Travelers are known as thieves.')
    )

    assert_equal '트래블러(Travelers)는 도둑으로 알려져 있어.', text
    assert_empty notes
  end

  def test_mixed_source_forms_hold_unlabeled_mentions
    old = '트래블러(Traveler)들의 배 한 척이 왔어. 트래블러가 있다면 식량도 있겠지.'
    text, notes, = TravelersFocusedFollowup.transform_korean(
      old, forms('A Traveler ship arrived. Where there are Travelers, there is food.')
    )

    assert_equal old, text
    assert notes.any? { |note| note.include?('singular and plural') || note.include?('unlabeled Korean mention') }
  end

  def test_preserves_full_bilingual_compound
    old = '트래블러 달빛 야영지(Travelers Moon Camp)'
    text, notes, = TravelersFocusedFollowup.transform_korean(
      old, forms('Travelers Moon Camp')
    )

    assert_equal old, text
    assert notes.any? { |note| note.include?('full compound') }
  end

  def test_holds_unrelated_adjacent_parenthetical
    old = '여행자(Other)는 여기 없어.'
    text, notes, = TravelersFocusedFollowup.transform_korean(
      old, forms('The Travelers are not here.')
    )

    assert_equal old, text
    assert notes.any? { |note| note.include?('not exactly Traveler or Travelers') }
  end

  def test_holds_full_label_instead_of_reducing_it_to_entity_alias
    old = '여행자(Travelers Camp)는 여기 없어.'
    text, notes, = TravelersFocusedFollowup.transform_korean(
      old, forms('Travelers Camp is not here.')
    )

    assert_equal old, text
    assert notes.any? { |note| note.include?('not exactly Traveler or Travelers') }
  end
end
