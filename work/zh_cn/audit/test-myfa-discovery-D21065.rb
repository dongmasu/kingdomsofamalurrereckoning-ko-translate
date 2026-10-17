#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-myfa-discovery-D21065'

class MyfaDiscoveryD21065Test < Minitest::Test
  def test_full_name_spelling_is_standardized_and_paired
    assert_equal(
      '마이파 론웬(Myfa Rhonwen)의 일기',
      MyfaDiscoveryD21065.edit_name('미파 론웬(Myfa Rhonwen)의 일기')
    )
    assert_equal(
      '마이파 론웬(Myfa Rhonwen)의 일기',
      MyfaDiscoveryD21065.edit_name('마이파 론웬의 일기')
    )
  end

  def test_short_name_is_paired_without_duplicating_full_name
    assert_equal(
      '마이파(Myfa)에게 돌아가 마이파 론웬(Myfa Rhonwen)을 만나자',
      MyfaDiscoveryD21065.edit_name('미파에게 돌아가 미파 론웬을 만나자')
    )
    assert_equal(
      '마이파(Myfa)를 외교 임무에 보냈다.',
      MyfaDiscoveryD21065.edit_name('미파(Myfa)를 외교 임무에 보냈다.')
    )
  end

  def test_opaque_allowance_token_rows_are_excluded
    %w[4602 11869 24832].each do |id|
      assert MyfaDiscoveryD21065.excluded?(
        'resource' => 'default', 'ID_Linha' => id
      )
    end
    refute MyfaDiscoveryD21065.excluded?(
      'resource' => 'default', 'ID_Linha' => '5921'
    )
    refute MyfaDiscoveryD21065.excluded?(
      'resource' => 'base', 'ID_Linha' => '4602'
    )
  end
end
