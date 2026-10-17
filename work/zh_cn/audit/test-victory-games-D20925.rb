#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'apply-victory-games-D20925'

class VictoryGamesD20925Test < Minitest::Test
  M = ApplyVictoryGamesD20925
  LABEL = M::CANONICAL

  def test_name_and_particles
    assert_equal "#{LABEL}를 안전하게 열다.", M.replacement('승리 게임(Victory Games)을 안전하게 열다.')
    assert_equal "#{LABEL}가 연기됐어.", M.replacement('승리 게임(Victory Games)이 연기됐어.')
    assert_equal "#{LABEL}는 단순해.", M.replacement('승리의 게임은 단순해.')
    assert_equal "#{LABEL}로 이동", M.replacement('빅토리 게임즈로 이동')
  end

  def test_preserve_arena_as_a_separate_noun
    assert_equal "#{LABEL} 경기장을 확보", M.replacement('승리의 경기장(Victory Games)을 확보')
  end

  def test_preserve_copula
    text = "#{LABEL}이라는 행사"
    assert_equal text, M.replacement(text)
  end

  def test_canonical_label_is_idempotent
    text = "#{LABEL}에 참가하고 #{LABEL}에서 이겼다."
    assert_equal text, M.replacement(text)
  end

  def test_generic_game_is_not_an_alias
    assert_equal '경기에서 이겼다.', M.replacement('경기에서 이겼다.')
  end
end
