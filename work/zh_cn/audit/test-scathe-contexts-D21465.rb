#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-scathe-contexts-D21465'

class ScatheContextsD21465Test < Minitest::Test
  M = ScatheContextsD21465

  def test_title_form_reference_is_exact_and_idempotent
    source = '스케이스 여의사는 우리 수석 외과의야. 그런데 요즘은 한 번에 몇 시간씩 자리를 비우곤 해.'
    expected = '스케이스 여사(Mistress Scathe)는 우리 수석 외과의야. 그런데 요즘은 한 번에 몇 시간씩 자리를 비우곤 해.'
    assert_equal expected, M.normalize(source, '35226')
    assert_equal expected, M.normalize(expected, '35226')
    already_paired = '요즘 스케이스 여사(Mistress Scathe)는 점점 더 마음을 닫는 것 같아.'
    assert_equal already_paired, M.normalize(already_paired, '27452')
  end

  def test_item_is_not_linked_to_person_and_stays_bilingual
    assert_equal 'item:scathe', M::ITEM
    assert_equal 'person:corialia-scathe', M::PERSON
    refute_equal M::ITEM, M::PERSON
    assert_equal M::ITEM_KO, M.normalize(M::ITEM_KO, '4596')
  end

  def test_unreviewed_rows_fail_closed
    assert_raises(RuntimeError) { M.normalize('Scathe', '6059') }
    assert_raises(RuntimeError) { M.normalize('스케이스 여의사', '27452') }
    assert_raises(RuntimeError) { M.normalize('스케이스(Scathe)', '35226') }
  end
end
