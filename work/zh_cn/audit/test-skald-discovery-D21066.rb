#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-skald-discovery-D21066'

class SkaldDiscoveryD21066Test < Minitest::Test
  def test_atlas_is_a_name_not_a_map_book
    assert_equal '스칼드 아틀라스(Skald Atlas)',
                 SkaldDiscoveryD21066.edit_name('스칼드 지도서')
  end

  def test_full_and_repeated_short_names_and_particles
    assert_equal(
      '스칼드 아틀라스(Skald Atlas)는 스칼드(Skald)에게 스칼드(Skald)의 일을 맡겼다.',
      SkaldDiscoveryD21066.edit_name('스칼드 아틀라스는 스칼드에게 스칼드의 일을 맡겼다.')
    )
    assert_equal '스칼드(Skald)에겐',
                 SkaldDiscoveryD21066.edit_name('스칼드에겐')
  end

  def test_already_paired_names_are_idempotent
    value = '스칼드 아틀라스(Skald Atlas)와 스칼드(Skald)'
    assert_equal value, SkaldDiscoveryD21066.edit_name(value)
  end

  def test_complete_place_titles_are_outside_person_scope
    %w[23359 62878].each do |id|
      assert SkaldDiscoveryD21066.excluded?('resource' => 'default', 'ID_Linha' => id)
    end
    refute SkaldDiscoveryD21066.excluded?('resource' => 'default', 'ID_Linha' => '10063')
  end
end
