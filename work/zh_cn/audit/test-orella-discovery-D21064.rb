#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-orella-discovery-D21064'

class OrellaDiscoveryD21064Test < Minitest::Test
  def test_full_name_is_standardized_and_paired
    assert_equal(
      '오렐라 액슬(Orella Axl)을 찾아라',
      OrellaDiscoveryD21064.edit_name('오렐라 악슬을 찾아라')
    )
    assert_equal(
      '오렐라 액슬(Orella Axl)을 찾아라',
      OrellaDiscoveryD21064.edit_name('오렐라 액슬을 찾아라')
    )
  end

  def test_short_name_is_paired_without_duplicating_full_name
    assert_equal(
      '오렐라(Orella)의 기록',
      OrellaDiscoveryD21064.edit_name('오렐라의 기록')
    )
    assert_equal(
      '오렐라 액슬(Orella Axl)과 오렐라(Orella)',
      OrellaDiscoveryD21064.edit_name('오렐라 악슬과 오렐라')
    )
  end

  def test_named_notes_are_excluded_from_person_scope
    assert OrellaDiscoveryD21064.excluded?(
      'resource' => 'base', 'ID_Linha' => '1328'
    )
    refute OrellaDiscoveryD21064.excluded?(
      'resource' => 'default', 'ID_Linha' => '15247'
    )
  end
end
