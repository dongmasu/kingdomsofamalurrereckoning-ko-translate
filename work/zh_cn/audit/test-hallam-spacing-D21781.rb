#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'correct-hallam-spacing-D21781'

class TestHallamSpacingD21781 < Minitest::Test
  def test_word_and_sentence_boundaries
    assert_equal '그 말을 할람(Hallam)에게. 할람(Hallam)은?',
                 HallamSpacingD21781.normalize('그 말을할람(Hallam)에게.할람(Hallam)은?')
  end

  def test_existing_spaces_and_epithet_remain_unchanged
    text = '할람(Hallam), 백색의 할람(Hallam the White). 할람(Hallam)은 안다.'
    assert_equal text, HallamSpacingD21781.normalize(text)
  end

  def test_scope_has_thirty_unique_keys
    assert_equal 30, HallamSpacingD21781::IDS.length
    assert_equal HallamSpacingD21781::IDS, HallamSpacingD21781::IDS.uniq
  end
end
