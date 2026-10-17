#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-five-short-names-D21441'

class FiveShortNamesD21441Test < Minitest::Test
  M = FiveShortNamesD21441

  def test_scope_and_unchanged_titles
    assert_equal 43, M::CONFIG.values.sum { |config| config[:ids].length + config[:base].length }
    assert_equal '메드가의 단검(Medgar\'s Dagger)',
      M.transform('person:medgar-krast', ['default', '6065', ''], '메드가의 단검(Medgar\'s Dagger)')
    assert_equal '힐러레드(Hillared)',
      M.transform('person:hillared-gastyr', ['default', '10575', ''], '힐러레드(Hillared)')
  end

  def test_full_names_and_joint_labels_are_protected
    old = '오스가르와 메드가르 크라스트(Medgar Krast). 오스가르는 북쪽에 있어.'
    assert_equal '오스가르(Osgar)와 메드가르 크라스트(Medgar Krast). 오스가르(Osgar)는 북쪽에 있어.',
      M.transform('person:osgar-krast', ['default', '26414', ''], old)
    joint = '오스가르와 메드가르 크라스트(Osgar and Medgar Krast)가 있다.'
    assert_equal joint, M.transform('person:osgar-krast', ['default', '53413', ''], joint)
    full = '메드가르 크라스트(Medgar Krast)와 메드거'
    assert_equal '메드가르 크라스트(Medgar Krast)와 메드가르(Medgar)',
      M.transform('person:medgar-krast', ['default', '30331', ''], full)
  end

  def test_short_spellings_and_repeated_mentions
    assert_equal '힐러레드(Hillared)와 힐러레드(Hillared)',
      M.transform('person:hillared-gastyr', ['default', '64605', ''], '힐라레드와 힐러레드(Hillared)')
    assert_equal '아드리스(Adrith)는',
      M.transform('person:adrith-deofrit', ['default', '57406', ''], '애드리스(Adrith)는')
    assert_equal '오브리(Aubrey)의 글. 오브리(Aubrey)는',
      M.transform('person:aubrey-gilcrest', ['default', '54495', ''], '오브리의 글. 오브리는')
  end
end
