#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-goyen-agnur-residual-D21437'

class GoyenAgnurResidualD21437Test < Minitest::Test
  M = GoyenAgnurResidualD21437

  def test_exact_scopes
    assert_equal 5, M::CONFIG.values.sum { |config| config.fetch(:ids).length }
    assert_equal %w[7511 29394 40189 43931], M::CONFIG.fetch('person:goyen-reen').fetch(:ids)
    refute_includes M::CONFIG.fetch('place:agnur-farhal').fetch(:ids), '7217'
  end

  def test_goyen_repeated_mentions_and_idempotence
    text = '고옌에게 맡겨. 고이엔(Goyen)은 연구자야.'
    expected = '고옌(Goyen)에게 맡겨. 고옌(Goyen)은 연구자야.'
    assert_equal expected, M.transform('person:goyen-reen', text)
    assert_equal expected, M.transform('person:goyen-reen', expected)
  end

  def test_full_source_variant_normalizes_to_existing_place
    assert_equal '아그누르 파르할(Agnur Farhal)',
      M.transform('place:agnur-farhal', '아그누르 파홀(Agnur Farhol)')
  end
end
