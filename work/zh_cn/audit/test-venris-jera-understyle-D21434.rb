#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-venris-jera-understyle-D21434'

class VenrisJeraUnderstyleD21434Test < Minitest::Test
  M = VenrisJeraUnderstyleD21434

  def item(entity)
    M::CONFIG.find { |config| config.fetch(:entity) == entity }
  end

  def test_source_scopes_are_explicit_and_disjoint
    scopes = M::CONFIG.flat_map { |config| M.keys(config) }
    assert_equal 80, scopes.length
    assert_equal scopes.length, scopes.uniq.length
    assert_equal 5, M::CONFIG.length
    refute M::CONFIG.any? { |config| config.fetch(:aliases).split('|').include?('Lyra') }
    refute M::CONFIG.any? { |config| config.fetch(:aliases).split('|').include?('Jera') }
  end

  def test_repeated_name_annotations_are_idempotent
    config = item('person:venris')
    expected = '벤리스(Venris)의 늑대가 벤리스(Venris)를 찾는다.'
    assert_equal expected, M.transform(config, '벤리스(Venris)의 늑대가 벤리스를 찾는다.', 'Venris')
    assert_equal expected, M.transform(config, expected, 'Venris')
    assert_equal '벤리스(Venris)의 시신', M.transform(config, '베니스(Venris)의 시신', 'Venris')
  end

  def test_jera_full_source_variants_keep_local_surname
    config = item('person:jera-soren')
    assert_equal '제라 소렌(Jera Soren)의 무덤',
                 M.transform(config, '제라 소렌의 무덤', 'Jera Soren')
    assert_equal '제라 데이스(Jera Dace)의 무덤',
                 M.transform(config, '제라 데이스의 무덤', 'Jera Dace')
  end

  def test_theater_alias_and_understyle_are_atomic
    config = item('place:theater-of-fate')
    assert_equal '운명의 극장(Theater of Fate)에서',
                 M.transform(config, '운명의 극장(Theater of Fates)에서', 'Theater of Fates')
    config = item('place:the-understyle')
    assert_equal '언더스타일(The Understyle)', M.transform(config, '하층 정원', 'The Understyle')
    assert_equal '언더스타일(The Understyle)에', M.transform(config, '언더스타일(Understyle)에', 'Understyle')
  end
end
