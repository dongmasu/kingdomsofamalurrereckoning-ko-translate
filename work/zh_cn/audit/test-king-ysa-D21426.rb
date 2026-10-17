#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-king-ysa-D21426'

class KingYsaD21426Test < Minitest::Test
  M = KingYsaD21426

  def test_rank_and_short_forms
    expected = '이사 왕(King Ysa), 이사 경(Lord Ysa), 이사(Ysa)는'
    assert_equal expected, M.normalize('이사(Ysa) 왕, 이사 경, 이사는')
  end

  def test_existing_pairs_and_compound_place_are_protected
    text = '이사 경(Lord Ysa)과 이사 왕(King Ysa), 이사의 정원(Gardens of Ysa)'
    assert_equal text, M.normalize(text)
  end

  def test_repeated_short_name_and_line_breaks
    assert_equal "이사 왕(King Ysa)이\r\n이사(Ysa)와 오운(Ohn)",
                 M.normalize("이사 왕이\r\n이사와 오운(Ohn)")
  end

  def test_inverted_rank_phrase
    text = '여름의 왕 이사(Ysa)와 겨울의 군주 오운(Ohn)'
    assert_equal text, M.normalize(text)
  end
end
