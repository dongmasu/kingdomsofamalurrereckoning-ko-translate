#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-named-titles-followup'

class NamedTitlesFollowupTest < Minitest::Test
  M = NamedTitlesFollowup

  def spec(key)
    M::SPECS.find { |entry| entry[:key] == key }
  end

  def test_tome_preserves_source_capitalized_the_and_places_particle_after_pair
    text, status, = M.transform(
      '회개의 서는 드베르가가 훔쳤다.',
      spec('unique_item:tome-of-contrition'),
      'The Tome of Contrition was stolen by the Dverga.'
    )

    assert_equal 'accepted', status
    assert_equal '참회의 서(The Tome of Contrition)는 드베르가가 훔쳤다.', text
  end

  def test_tome_without_capitalized_the_uses_bare_title_and_normalizes_particle
    text, status, = M.transform(
      '회개의 서은 기록이다.',
      spec('unique_item:tome-of-contrition'),
      'the Tome of Contrition is a record.'
    )

    assert_equal 'accepted', status
    assert_equal '참회의 서(Tome of Contrition)는 기록이다.', text
  end

  def test_tome_keeps_the_when_source_row_is_the_standalone_title
    text, = M.transform(
      '참회의 고서 (The Tome of Contrition)',
      spec('unique_item:tome-of-contrition'),
      'The Tome of Contrition'
    )

    assert_equal '참회의 서(The Tome of Contrition)', text
  end

  def test_part_label_is_inside_one_complete_bilingual_named_work_pair
    text, status, = M.transform(
      '기사 2명과 트롤 하나, 제V부',
      spec('work:two-knights-and-a-troll'),
      'Two Knights and a Troll, Part V'
    )

    assert_equal 'accepted', status
    assert_equal '두 기사와 트롤, 제5부(Two Knights and a Troll, Part V)', text
    refute_match(/두 기사와 트롤\(Two Knights and a Troll\), 제5부/, text)
  end

  def test_named_work_particle_follows_complete_pair
    text, status, = M.transform(
      '발라드 두 기사와 트롤에 적혀 있다.',
      spec('work:two-knights-and-a-troll'),
      'The ballad Two Knights and a Troll is written there.'
    )

    assert_equal 'accepted', status
    assert_equal '발라드 두 기사와 트롤(Two Knights and a Troll)에 적혀 있다.', text
  end

  def test_unrelated_existing_parenthetical_holds_without_change
    old = '두 기사와 트롤(The Green Maiden)'
    text, status, = M.transform(
      old,
      spec('work:two-knights-and-a-troll'),
      'Two Knights and a Troll'
    )

    assert_equal 'uncertain', status
    assert_equal old, text
  end

  def test_candidate_is_not_a_confirmed_definition
    assert_equal 'candidate:the-mantle-passes',
                 spec('candidate:the-mantle-passes')[:key]
    assert_nil spec('candidate:the-mantle-passes')[:canonical]
    assert_equal 'work:two-knights-and-a-troll',
                 spec('work:two-knights-and-a-troll')[:key]
    assert_equal 'named work', spec('work:two-knights-and-a-troll')[:category]
  end
end
