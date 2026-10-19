#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21794'

class ReviewShortLabelCandidatesD21794Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21794

  def test_complete_title_forms_and_full_source_scope
    assert_equal [20, 25, 15], M::ENTITIES.values.map { |row| row.fetch(:count) }
    assert_equal 60, M::ENTITIES.values.sum { |row| row.fetch(:count) }
    assert_equal 38, M::REPLACEMENTS.length
    assert_equal(
      {
        'Sir Airmer' => 15,
        'Sir Farrara' => 19,
        'Sister Zelda' => 4
      },
      M::REPLACEMENTS.group_by { |(term, _id), _value| term }
        .transform_values(&:length)
    )
  end

  def test_sister_zelda_compound_label_remains_atomic
    assert_nil M::REPLACEMENTS[['Sister Zelda', '52994']]
    assert_equal '젤다 수녀(Sister Zelda)',
                 M::REPLACEMENTS.fetch(['Sister Zelda', '14105']).last
  end

  def test_duplicate_person_owners_are_not_created
    assert_equal %w[person:airmer person:farrara person:zelda],
                 M::ENTITIES.values.map { |row| row.fetch(:key) }
  end
end
