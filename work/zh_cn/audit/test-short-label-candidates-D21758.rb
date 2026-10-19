#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21758'

class ReviewShortLabelCandidatesD21758Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21758

  def test_candidate_keys_remain_within_the_batch_limit
    assert_equal 7, M::GROUPS.fetch('Henge').fetch(:expected_keys)
    assert_equal 24, M::GROUPS.fetch('Hexes').fetch(:expected_keys)
    assert_equal 31, M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }
    assert_operator M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }, :<=, 50
  end

  def test_only_the_named_card_game_is_registered
    assert_equal 'named work', M::HEXES.fetch(:category)
    assert_equal 'title:hexes-card-game', M::HEXES.fetch(:key)
    assert_equal 24, M::HEXES.fetch(:count)
    assert_includes M::HEXES.fetch(:notes), 'occurrence-level holds'
  end

  def test_ambiguous_hexes_rows_are_held_without_edits
    %w[9642 13964 25727 29159 49096 50522 59976].each do |id|
      assert_includes M::UNCERTAIN_KEYS, id
      assert_nil M::TRANSFORMS[id]
    end
  end

  def test_confirmed_name_edits_are_exactly_mapped
    assert_equal 15, M::TRANSFORMS.length
    assert_equal ['주술 장수', '헥스(Hexes) 장수'], M::TRANSFORMS.fetch('59722')
    assert_equal ['헥스?', '헥스(Hexes)?'], M::TRANSFORMS.fetch('3977')
  end

  def test_full_source_candidate_manifest_has_31_unique_keys
    inventory = M::M.refresh_inventory
    index = M::M.table(M::M::INDEX).map(&:to_h)
    candidates = M::M.table(M::INPUT).map(&:to_h)
      .to_h { |row| [row.fetch('english_candidate'), row] }
    reviews = M.build_short_label_reviews(inventory, index, candidates)
    assert_equal 31, reviews.length
    assert_equal 31, reviews.map { |row| M.row_key(row) }.uniq.length
    assert_equal 24, M.hexes_keys(inventory).length
  end
end
