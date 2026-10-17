#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-scathe-surname-overlaps-D21467'

class ScatheSurnameOverlapsD21467Test < Minitest::Test
  M = ScatheSurnameOverlapsD21467

  def review_inputs
    inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
      .map(&:to_h).to_h { |row| [ReviewedNameBatches.key(row), row] }
    index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX).map(&:to_h)
    return [inventory, index, nil] unless File.file?(M::REVIEW)

    manifest = ReviewedNameBatches.table(M::REVIEW).map(&:to_h)
    keys = manifest.map { |row| [M::ITEM, *ReviewedNameBatches.key(row)] }
    index.reject! do |row|
      keys.include?([row['entity_key'], *ReviewedNameBatches.key(row)])
    end
    [inventory, index, manifest]
  end

  def test_only_corialia_person_contexts_are_excluded_from_item_candidate
    inventory, index, manifest = review_inputs
    reviews = M.build_reviews(inventory, index)

    assert_equal M::IDS.sort, reviews.map { |row| row['ID_Linha'] }.sort
    assert reviews.all? { |row| row['status'] == 'excluded' && row['old'] == row['new'] }
    assert reviews.all? { |row| row['english'].match?(/\b(?:Corialia Scathe|Mistress Scathe)\b/i) }
    assert reviews.all? { |row| row['japanese'].match?(/スケイズ|コリアリア/) }
    assert reviews.all? { |row| row['chinese'].match?(/斯卡|斯凯瑟|科里亚利亚/) }
    assert_equal 21, reviews.count { |row| index.any? do |entry|
      entry['entity_key'] == M::PERSON && ReviewedNameBatches.key(entry) == ReviewedNameBatches.key(row)
    end }
    if manifest
      expected = manifest.to_h do |row|
        [ReviewedNameBatches.key(row), [row['status'], row['old'], row['new'], row['evidence']]]
      end
      actual = reviews.to_h do |row|
        [ReviewedNameBatches.key(row), [row['status'], row['old'], row['new'], row['evidence']]]
      end
      assert_equal expected, actual
    end
  end
end
