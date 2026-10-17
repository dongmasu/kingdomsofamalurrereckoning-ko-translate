#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-suner-short-reference-D21443'

class SunerShortReferenceD21443Test < Minitest::Test
  M = SunerShortReferenceD21443

  def test_short_name_is_not_added_as_global_alias
    assert_equal 'Suner', M::SHORT
    assert_equal '수너(Suner)야', '수너야'.gsub(M::PATTERN, "#{M::KOREAN}(#{M::SHORT})")
    refute M::NOTE.include?('Add Suner as a global alias')
  end

  def test_isolated_form_stays_unchanged_and_uncertain
    text = '수너(Suner)'
    assert_equal text, text.gsub(M::PATTERN, "#{M::KOREAN}(#{M::SHORT})")
    assert M::NOTE.include?('insufficient to establish')
  end
end
