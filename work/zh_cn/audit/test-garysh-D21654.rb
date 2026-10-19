#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-garysh-D21654'

class GaryshD21654Test < Minitest::Test
  M = ReviewGaryshD21654

  def test_applied_review_preserves_rank_hold_and_registers_name
    review_path = File.join(__dir__, 'proper-name-discovery-D21654.tsv')
    reviews = M::M.table(review_path).map(&:to_h)
    definition = M::M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
      .find { |row| row['entity_key'] == M::ENTITY }

    assert_equal [
      ['default', '11517', ''],
      ['default', '23479', ''],
      ['default', '32236', '']
    ], reviews.map { |row| M.key(row) }
    assert_equal %w[not-an-issue accepted accepted], reviews.map { |row| row['status'] }
    assert_equal '게리시(Garysh)', definition.fetch('korean_canonical')
    assert_includes reviews.find { |row| row['ID_Linha'] == '11517' }['evidence'],
      "preserve D-3363's separate uncertainty"
  end
end
