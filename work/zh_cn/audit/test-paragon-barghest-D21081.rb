#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-paragon-barghest-D21081'

class ParagonBarghestD21081Test < Minitest::Test
  def test_complete_qualified_name_and_every_attested_variant
    ['파라곤 바게스트(Barghest)', '파라곤 바르게스트(Paragon Barghest)',
     '패러곤 바르게스트(Paragon Barghest)', '최상급 바게스트(Barghest)'].each do |value|
      assert_equal '파라곤 바게스트(Paragon Barghest)의 심장',
                   ParagonBarghestD21081.edit_name("#{value}의 심장")
    end
  end

  def test_generic_species_reference_is_not_changed
    old = '바게스트(Barghest) 심장, 파라곤 바르게스트(Paragon Barghest)의 심장'
    assert_equal '바게스트(Barghest) 심장, 파라곤 바게스트(Paragon Barghest)의 심장',
                 ParagonBarghestD21081.edit_name(old)
  end

  def test_idempotence
    value = '파라곤 바게스트(Paragon Barghest)'
    assert_equal value, ParagonBarghestD21081.edit_name(value)
  end
end
