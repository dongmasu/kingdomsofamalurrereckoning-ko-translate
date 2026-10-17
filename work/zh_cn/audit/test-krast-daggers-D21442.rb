#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-krast-daggers-D21442'

class KrastDaggersD21442Test < Minitest::Test
  M = KrastDaggersD21442

  def test_exact_item_scopes_and_titles
    assert_equal 4, M::ITEMS.sum { |item| item.fetch(:ids).length }
    medgar = M::ITEMS.find { |item| item.fetch(:english) == "Medgar's Dagger" }
    osgar = M::ITEMS.find { |item| item.fetch(:english) == "Osgar's Dagger" }
    assert_equal "메드가르의 단검(Medgar's Dagger)",
      M.transform(medgar, '메드가의 단검(Medgar\'s Dagger)')
    assert_equal "메드가르의 단검(Medgar's Dagger)",
      M.transform(medgar, '메드거의 단검')
    assert_equal "오스가르의 단검(Osgar's Dagger)",
      M.transform(osgar, '오스가의 단검')
    assert_equal "오스가르의 단검(Osgar's Dagger)",
      M.transform(osgar, '오스가르의 단검')
  end

  def test_complete_item_title_remains_atomic_and_idempotent
    item = M::ITEMS.first
    assert_equal "메드가르의 단검(Medgar's Dagger)",
      M.transform(item, "메드가르의 단검(Medgar's Dagger)")
  end
end
