#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-kreios-D21427'

class KreiosD21427Test < Minitest::Test
  M = KreiosD21427

  def test_repeated_names
    assert_equal '크레이오스(Kreios)의 시대, 크레이오스(Kreios)가',
                 M.normalize('크레이오스의 시대, 크레이오스가', '44827')
  end

  def test_alias_spellings_and_repetition
    expected = '멧돼지 분쇄자(Boarmasher), 멧돼지 분쇄자(Boarmasher)'
    assert_equal expected, M.normalize('보아마셔(Boarmasher), 멧돼지 분쇄자', '61685')
    assert_equal expected, M.normalize(expected, '61685')
  end

  def test_source_pronoun_expansion_is_protected
    text = "크레이오스가 처음\r\n크레이오스는 새로운 민족\r\n크레이오스의 죽음"
    expected = '크레이오스(Kreios)가 처음' + "\r\n" +
      '크레이오스는 새로운 민족' + "\r\n" + '크레이오스(Kreios)의 죽음'
    assert_equal expected, M.normalize(text, '54628')
  end

  def test_existing_annotations_and_unrelated_text
    text = '크레이오스(Kreios), 에테네(Ethene), 프리모스(Primos)'
    assert_equal text, M.normalize(text, '7190')
  end
end
