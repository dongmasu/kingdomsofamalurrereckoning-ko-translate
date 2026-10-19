#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-borm-bone-town-followup-D21708'

class ReviewBormBoneTownFollowupD21708Test < Minitest::Test
  M = ReviewBormBoneTownFollowupD21708

  def test_bounded_scope_and_existing_entity_owners
    assert_equal 4, M::REVIEWS.length
    assert_operator M::REVIEWS.length, :<=, 50
    assert_equal %w[accepted accepted not-an-issue accepted],
      M::REVIEWS.map { |row| row.fetch(:status) }
    assert_equal %w[25932 29681 53271],
      M::REVIEWS.first(3).map { |row| row.fetch(:key)[1] }
  end

  def test_borm_label_pairs_full_english_epithet
    M::REVIEWS.first(2).each_with_index do |review, index|
      assert_equal '활시위의 보름(Borm of Bowstrings)', review.fetch(:new)
      assert_equal %w[25932 29681][index], review.fetch(:key)[1]
      assert_equal 'person:borm', entity_for(review.fetch(:key)[1])
    end
  end

  def test_bone_town_explanation_survives_bilingual_pairing
    review = M::REVIEWS.last
    assert_includes review.fetch(:new), '뼈의 마을'
    assert_includes review.fetch(:new), '본 타운(Bone Town)'
    assert_includes review.fetch(:evidence), 'bone-pale rocks'
  end

  private

  def entity_for(id)
    id == '58643' ? 'place:bone-town' : 'person:borm'
  end
end
