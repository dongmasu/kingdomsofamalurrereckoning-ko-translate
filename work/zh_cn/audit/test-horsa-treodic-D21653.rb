#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-horsa-treodic-D21653'

class HorsaTreodicD21653Test < Minitest::Test
  M = ReviewHorsaTreodicD21653

  def test_definition_keeps_horsa_bynothas_separate
    definition = M.definition(%w[
      entity_key english_canonical category korean_canonical english_aliases
      korean_variants evidence_ids status notes
    ])

    assert_equal 'person:horsa-treodic', definition.fetch('entity_key')
    assert_equal 'Horsa Treodic', definition.fetch('english_canonical')
    assert_equal '호르사 트레오딕(Horsa Treodic)', definition.fetch('korean_canonical')
    refute_includes definition.fetch('notes'), 'Horsa Bynothas is the same person'
  end

  def test_applied_review_records_exact_cross_locale_scope
    review_path = File.join(__dir__, 'proper-name-discovery-D21653.tsv')
    reviews = M::M.table(review_path).map(&:to_h)

    assert_equal [
      ['base', '2056', '11'],
      ['default', '42929', ''],
      ['default', '49509', '']
    ], reviews.map { |row| M.key(row) }.sort
    assert_equal %w[not-an-issue accepted accepted], reviews.map { |row| row['status'] }
    assert_equal 2, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 'Horsa Treodic', M::M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
      .find { |row| row['entity_key'] == M::ENTITY }['english_canonical']
  end
end
