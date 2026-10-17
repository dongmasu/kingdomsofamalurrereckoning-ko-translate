#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-mixed-short-labels-D21449'

class MixedShortLabelsD21449Test < Minitest::Test
  M = MixedShortLabelsD21449

  def test_full_name_is_protected_and_each_short_name_is_paired
    old = "마루스 토릭스(Marus Torix)\r\n토릭스와 토릭스 스승"
    expected = "마루스 토릭스(Marus Torix)\r\n토릭스(Torix)와 토릭스(Torix) 스승"
    assert_equal expected, M.transform(old, '마루스 토릭스(Marus Torix)', '토릭스', 'Torix', 2)
  end

  def test_unexpected_short_count_is_rejected
    assert_raises(RuntimeError) do
      M.transform('메드가르 크라스트(Medgar Krast)', '메드가르 크라스트(Medgar Krast)', '메드가르', 'Medgar', 1)
    end
  end

  def test_existing_pair_is_not_duplicated
    old = '메드가르 크라스트(Medgar Krast), 메드가르(Medgar), 메드가르'
    assert_equal '메드가르 크라스트(Medgar Krast), 메드가르(Medgar), 메드가르(Medgar)',
      M.transform(old, '메드가르 크라스트(Medgar Krast)', '메드가르', 'Medgar', 1)
  end
end
