#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-wreath-short-references-D21457'

class WreathShortReferencesD21457Test < Minitest::Test
  M = WreathShortReferencesD21457

  def test_pronoun_expansion_changes_spelling_without_inventing_an_english_mention
    assert_equal '화관(wreath)의 모양, 화관을 모으는 과정',
      M.normalize('화환의 모양, 화환을 모으는 과정', '40038')
  end

  def test_two_explicit_references_are_paired
    assert_equal '화관(Wreath)의 월계, 화관(Wreath)을 완성',
      M.normalize('화관의 월계, 화관을 완성', '26481')
  end

  def test_existing_pair_is_retained
    assert_equal '화관(Wreath)을 손에', M.normalize('화관(Wreath)을 손에', '7265')
  end
end
