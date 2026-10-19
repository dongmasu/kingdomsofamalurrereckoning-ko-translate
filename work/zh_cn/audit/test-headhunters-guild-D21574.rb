#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-headhunters-guild-D21574'

class HeadhuntersGuildD21574Test < Minitest::Test
  R = ReviewHeadhuntersGuildD21574

  def test_guild_and_member_wording_remain_distinct
    assert_equal ['헤드헌터단(Headhunters)', false],
                 R.transform(R::GUILD, ['default', '41074', ''], '현상금 사냥꾼들')
    assert_equal ['흉악한 헤드헌터단원(Headhunter) 노라 페퍼(Nora Pepper)', false],
                 R.transform(R::GUILD, ['default', '26436', ''], '흉악한 현상금 사냥꾼 노라 페퍼(Nora Pepper)')
  end

  def test_complete_title_is_atomic_and_nested_guild_is_excluded
    old = '사냥당한 현상금 사냥꾼들'
    key = ['default', '52264', '']
    assert_equal [old, true], R.transform(R::GUILD, key, old)
    assert_equal ['사냥당한 헤드헌터단(Headhunters Hunted)', false], R.transform(R::QUEST, key, old)
  end

  def test_disbanded_guild_and_individual_members_are_both_preserved
    old = '길드인 헤드헌터가 해체되어 흩어졌다. 헤드헌터 각각의 표식을 모으면 된다.'
    assert_equal ['길드인 헤드헌터단(Headhunters)이 해체되어 흩어졌다. 헤드헌터단원(Headhunters) 각각의 표식을 모으면 된다.', false],
                 R.transform(R::GUILD, ['default', '57407', ''], old)
    assert_raises(KeyError) { R.transform(R::GUILD, ['default', '99999', ''], '일반 현상금 사냥꾼') }
  end
end
