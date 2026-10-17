#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-victory-games-related-D20927'

class VictoryGamesRelatedD20927Test < Minitest::Test
  M = VictoryGamesRelatedD20927

  def test_full_name_and_contextual_short_surname
    old = '보스 데비언트(Voss Deviant)가 이겼다. 디비언트는 1위다.'
    expected = '보스 디비언트(Voss Deviant)가 이겼다. 디비언트(Deviant)는 1위다.'
    assert_equal expected, M.transform(old, 'person:voss-deviant')
    assert_equal expected, M.transform(expected, 'person:voss-deviant')
  end

  def test_whole_venue_label_replaces_partial_pairing
    assert_equal '에라셀 투기장(Erathell Arena)', M.transform('에라셀(Erathell) 투기장', 'place:erathell-arena')
    assert_equal '미스로스 투기장(Mithros Arena)에서', M.transform('미스로스 경기장(Mithros Arena)에서', 'place:mithros-arena')
  end

  def test_generic_arena_and_region_are_unchanged
    text = '에라셀(Erathell)에서 투기장으로 이동'
    assert_equal text, M.transform(text, 'place:erathell-arena')
  end

  def test_office_and_person_are_separate
    text = '복스 빅토리엄(Vox Victorium)인 재니스입니다.'
    text = M.transform(text, 'title:vox-victorium')
    text = M.transform(text, 'person:janis')
    assert_equal '복스 빅토리움(Vox Victorium)인 재니스(Janis)입니다.', text
    assert_equal text, M.transform(M.transform(text, 'title:vox-victorium'), 'person:janis')
  end
end
