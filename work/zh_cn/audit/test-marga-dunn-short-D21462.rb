#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-marga-dunn-short-D21462'

class MargaDunnShortD21462Test < Minitest::Test
  M = MargaDunnShortD21462

  def test_korean_pronoun_expansions_are_preserved
    old = '마르가(Marga)가 믿었다. 마르가에게서 벗어나 이 사실을 마르가에게 알려야겠어.'
    expected = '마르가(Marga)가 믿었다. 마르가에게서 벗어나 이 사실을 마르가(Marga)에게 알려야겠어.'
    assert_equal expected, M.normalize('person:sammoc', old, '637')
    assert_equal expected, M.normalize('person:sammoc', expected, '637')
  end

  def test_full_pair_is_protected_and_later_short_name_is_added
    assert_equal '마르가 새목(Marga Sammoc), 마르가(Marga)는',
      M.normalize('person:sammoc', '마르가 새목(Marga Sammoc), 마르가는', '23730')
  end

  def test_spelling_and_surname_pairing
    assert_equal '마르가(Marga)가', M.normalize('person:sammoc', '마가가', '34655')
    assert_equal '던(Dunn)은 던(Dunn)을', M.normalize('person:orwin', '던은 던(Dunn)을', '52166')
    assert_equal '했던', M.normalize('person:orwin', '했던', '52166')
  end
end
