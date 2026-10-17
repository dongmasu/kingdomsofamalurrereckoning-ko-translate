#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-ollie-discovery-D21075'

class OllieDiscoveryD21075Test < Minitest::Test
  def test_full_and_repeated_short_forms
    assert_equal(
      '올리 매드슨(Ollie Madsen)은 올리(Ollie)의 일이다. 올리(Ollie)를 찾아라.',
      OllieDiscoveryD21075.edit_name('올리 매드슨은 올리의 일이다. 올리를 찾아라.')
    )
  end

  def test_paired_names_are_idempotent
    value = '올리 매드슨(Ollie Madsen)과 올리(Ollie)'
    assert_equal value, OllieDiscoveryD21075.edit_name(value)
  end

  def test_other_names_and_tokens_are_preserved
    assert_equal(
      '마이파(Myfa)가 올리(Ollie)에게 {1}을 줬다.',
      OllieDiscoveryD21075.edit_name('마이파(Myfa)가 올리에게 {1}을 줬다.')
    )
  end
end
