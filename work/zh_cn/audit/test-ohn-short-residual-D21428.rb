#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-ohn-short-residual-D21428'

class OhnShortResidualD21428Test < Minitest::Test
  M = OhnShortResidualD21428

  def test_name_variants_and_particles
    assert_equal '오운(Ohn)은 오운(Ohn)과 오운(Ohn)의',
                 M.normalize('온은 오언과 오른(Ohn)의', 'Ohn, Ohn, Ohn')
  end

  def test_ordinary_korean_on_is_protected
    assert_equal '적대해 온 이사와 오운(Ohn)은 온 대륙을',
                 M.normalize('적대해 온 이사와 온은 온 대륙을', 'Ysa and Ohn')
  end

  def test_existing_annotation_is_idempotent
    assert_equal '오운(Ohn)의 군대', M.normalize('오운(Ohn)의 군대', "Ohn's army")
  end

  def test_unmatched_name_count_rejected
    assert_raises(RuntimeError) { M.normalize('온 대륙', 'Ohn') }
    assert_raises(RuntimeError) { M.normalize('오언과 온은', 'Ohn') }
  end
end
