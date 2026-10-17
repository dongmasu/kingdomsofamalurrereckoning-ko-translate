#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-walls-remainder-D21463'

class WallsRemainderD21463Test < Minitest::Test
  M = WallsRemainderD21463
  D60 = WallsD21460

  def fixtures
    index = D60::EXPECTED_IDS.each_with_index.map do |id, ordinal|
      {
        'entity_key' => D60::ENTITY, 'resource' => 'default',
        'ID_Linha' => id, 'Tipo_Variante' => '',
        'status' => ordinal < 50 ? 'excluded' : 'needs-context'
      }
    end
    reviews = D60::EXPECTED_IDS.map do |id|
      {
        'entity_key' => D60::ENTITY, 'resource' => 'default',
        'ID_Linha' => id, 'Tipo_Variante' => '',
        'status' => 'excluded', 'old' => 'unchanged', 'new' => 'unchanged'
      }
    end
    [index, reviews]
  end

  def test_selects_only_the_three_deferred_exclusions
    index, reviews = fixtures
    selected = M.pending_reviews(index, reviews)
    assert_equal %w[61540 63792 64126], selected.map { |row| row.fetch('ID_Linha') }
    assert selected.all? { |row| row.fetch('old') == row.fetch('new') }
  end

  def test_fails_closed_on_missing_or_changed_pending_keys
    index, reviews = fixtures
    assert_raises(RuntimeError) { M.pending_reviews(index.drop(1), reviews) }
    assert_raises(RuntimeError) { M.pending_reviews(index, reviews.drop(1)) }
    assert_raises(RuntimeError) do
      M.pending_reviews(index, reviews.map { |row| row.merge('status' => 'accepted') })
    end
    assert_raises(RuntimeError) do
      M.pending_reviews(index, reviews.map { |row| row.merge('new' => 'changed') })
    end
  end

  def test_fails_closed_if_a_deferred_key_was_already_closed
    index, reviews = fixtures
    index[-1] = index[-1].merge('status' => 'excluded')
    assert_raises(RuntimeError) { M.pending_reviews(index, reviews) }
  end
end
