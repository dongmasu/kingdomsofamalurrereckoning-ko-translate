#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-beggars-bluff-tancese-D21436'

class BeggarsBluffTanceseD21436Test < Minitest::Test
  M = BeggarsBluffTanceseD21436

  def item(entity)
    M::ITEMS.find { |config| config.fetch(:entity) == entity }
  end

  def test_scope_and_aliases_do_not_merge_homonyms
    ids = M::ITEMS.flat_map { |config| config.fetch(:ids) }
    assert_equal 27, ids.length
    assert_equal ids.length, ids.uniq.length
    aliases = M::ITEMS.flat_map { |config| config.fetch(:aliases).split('|') }
    refute_includes aliases, 'Fiona'
    refute_includes aliases, 'Lyra'
    refute_includes aliases, 'bluff'
  end

  def test_bluff_is_landform_not_boasting
    config = item('place:beggars-bluff')
    assert_equal "이곳은 '거지의 절벽(Beggar's Bluff)'이야.",
      M.transform(config, "이곳은 '거지의 허세'이야.")
    assert_equal "거지의 절벽(Beggar's Bluff)의 난민",
      M.transform(config, "베거스 블러프(Beggar's Bluff)의 난민")
    assert_equal "'거지의 절벽(Beggar's Bluff)'이라고 부르더군.",
      M.transform(config, "'거지의 허세'라고 부르더군.")
  end

  def test_tancese_name_and_repeated_short_references
    config = item('person:fastrada-tancese')
    assert_equal '성전기사 파스트라다 탄세스(Fastrada Tancese)가',
      M.transform(config, '성전기사 파스트라다 탄체세(Templar Fastrada Tancese)가')
    assert_equal '탄세스(Tancese) 성전기사와 탄세스(Tancese)가',
      M.transform(config, '탄세스(Tancese) 성전기사와 탠시즈(Tancese)가')
  end

  def test_princess_full_title_remains_atomic
    config = item('person:princess-fiona')
    assert_equal '피오나 공주(Princess Fiona)가',
      M.transform(config, '피오나(Fiona) 공주가')
  end
end
