#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-red-idward-short-references-D21445'

class RedIdwardShortReferencesD21445Test < Minitest::Test
  M = RedIdwardShortReferencesD21445

  def test_complete_nickname_gets_exact_english_pair
    assert_equal '레드 ‘데드’ 이드워드(Red "the Dead" Idward)가 이끄는 조직.',
      M.transform('34250', '레드 ‘데드’ 이드워드가 이끄는 조직.')
  end

  def test_contextual_short_name_is_paired_without_global_alias
    assert_equal '이드워드(Idward)는 알고 있어.',
      M.transform('22830', '이드워드는 알고 있어.')
    complete = "붉은 '망자' 이드워드(Red 'the Dead' Idward)를 들어 봤나?"
    assert_equal complete, M.transform('16927', complete)
    assert M::NOTE.include?('row-scoped')
    assert M::NOTE.include?('do not add a global Idward alias')
  end
end
