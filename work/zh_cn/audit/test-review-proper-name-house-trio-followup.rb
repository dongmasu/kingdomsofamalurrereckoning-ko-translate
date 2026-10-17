#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-house-trio-followup'

class HouseTrioFollowupTest < Minitest::Test
  def test_expected_source_scope_contains_every_aligned_sorrow_alias_hit
    assert_equal 35, HouseTrioFollowup::EXPECTED.length
    assert_equal 35, HouseTrioFollowup::EXPECTED.uniq.length
    assert_equal 5, HouseTrioFollowup::EXPECTED.count { |key| key[0] == 'base' }
  end

  def test_normalizes_the_poem_house_list
    old = "앞 문장\r\n복수와 긍지와 슬픔을 지나,\r\n뒤 문장"
    expected = "앞 문장\r\n복수의 집(House of Vengeance), 긍지의 집(House of Pride), 비탄의 집(House of Sorrows)을 지나,\r\n뒤 문장"

    assert_equal expected, HouseTrioFollowup.rewrite_text('15644', old)
  end

  def test_normalizes_the_house_exposition_without_rewriting_pride
    old = '한때 고귀했던 비탄의 집과 긍지의 집(House of Pride), 복수의 집이 모두 가드플로의 지배 아래 떨어졌다.'
    expected = '한때 고귀했던 비탄의 집(House of Sorrows), 긍지의 집(House of Pride), 복수의 집(House of Vengeance)이 모두 가드플로의 지배 아래 떨어졌다.'

    assert_equal expected, HouseTrioFollowup.rewrite_text('58325', old)
  end

  def test_keeps_non_house_sorrow_as_excluded
    assert_equal({ HouseTrioFollowup::ENTITY => 'excluded' },
                 HouseTrioFollowup.dispositions('65002'))
    assert_equal 'not-an-issue',
                 HouseTrioFollowup.dispositions('23793').fetch(HouseTrioFollowup::ENTITY)
  end
end
