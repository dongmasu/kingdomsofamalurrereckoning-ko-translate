#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-adath-short-references-D21444'

class AdathShortReferencesD21444Test < Minitest::Test
  M = AdathShortReferencesD21444

  def test_short_references_are_row_scoped_and_particles_survive
    assert_equal 11, M::IDS.length
    assert_equal '아다스(Adath)의 반지',
      '아다스의 반지'.gsub(M::PATTERN, "#{M::KOREAN}(#{M::SHORT})")
    assert_equal '아다스(Adath)가 진실을 숨겼다.',
      '아다스가 진실을 숨겼다.'.gsub(M::PATTERN, "#{M::KOREAN}(#{M::SHORT})")
    assert M::NOTE.include?('scope the short form to individually reviewed source rows')
  end

  def test_name_only_hold_is_retained
    text = '아다스(Adath)'
    assert_equal text, text.gsub(M::PATTERN, "#{M::KOREAN}(#{M::SHORT})")
    assert_equal ['10048'], M::UNCERTAIN_IDS
  end
end
