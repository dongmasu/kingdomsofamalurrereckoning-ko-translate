#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-belne-arena-people-D20936'

class BelneArenaPeopleD20936Test < Minitest::Test
  M = BelneArenaPeopleD20936

  def test_belne_spelling_and_particles
    assert_equal '벨른(Belne)이 도왔다.', M.transform('벨네(Belne)가 도왔다.', 'person:belne')
    assert_equal '벨른(Belne)과 이야기', M.transform('벨네와 이야기', 'person:belne')
    assert_equal '벨른(Belne)은 장인', M.transform('벨네는 장인', 'person:belne')
  end

  def test_complete_master_label_is_preserved_without_nesting
    assert_equal '명장 벨른(Master Belne)에게', M.transform('명장 벨네(Master Belne)에게', 'person:belne')
    expected = '마스터 벨른(Master Belne)이'
    assert_equal expected, M.transform('마스터 벨른이', 'person:belne')
    assert_equal expected, M.transform(expected, 'person:belne')
  end

  def test_item_and_card_exclusions
    assert M.excluded?('person:belne', {'resource' => 'base', 'ID_Linha' => '109'})
    assert M.excluded?('person:belne', {'resource' => 'default', 'ID_Linha' => '19647'})
    M::HEX_CARDS.each do |id|
      assert M.excluded?('person:the-hex', {'resource' => 'default', 'ID_Linha' => id})
    end
    assert M.excluded?('person:onionskin', {'resource' => 'default', 'ID_Linha' => '15813'})
    refute M.excluded?('person:onionskin', {'resource' => 'default', 'ID_Linha' => '48132'})
    refute M.excluded?('person:the-hex', {'resource' => 'default', 'ID_Linha' => '61945'})
  end

  def test_fighter_labels_are_not_literal_common_nouns
    assert_equal '어니언스킨(Onionskin)', M.transform('양파 껍질', 'person:onionskin')
    assert_equal '더 헥스(The Hex)', M.transform('주술', 'person:the-hex')
    assert_equal '헥스야. 네가 졌어.', M.transform('헥스야. 네가 졌어.', 'person:the-hex')
  end
end
