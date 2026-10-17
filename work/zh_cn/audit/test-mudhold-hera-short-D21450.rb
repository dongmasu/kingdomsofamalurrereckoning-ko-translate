#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-mudhold-hera-short-D21450'

class MudholdHeraShortD21450Test < Minitest::Test
  M = MudholdHeraShortD21450

  def test_short_label_is_not_expanded
    assert_equal '‘머드홀드(Mudhold)’라고', M.normalize('‘머드홀드’라고', '머드홀드', 'Mudhold')
    assert_equal '헤라(Hera)에게', M.normalize('헤라에게', '헤라', 'Hera')
  end

  def test_existing_bilingual_short_label_is_unchanged
    old = '머드홀드(Mudhold)는 데드 켈(Dead Kel)이'
    assert_equal old, M.normalize(old, '머드홀드', 'Mudhold')
  end
end
