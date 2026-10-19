#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21793'

class ReviewShortLabelCandidatesD21793Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21793

  def test_full_occurrence_scopes_and_cell_changes_are_bounded
    assert_equal(
      {
        'item:shine-and-shadow' => 10,
        'title:siegebreaker' => 5,
        'place:sioran-crypt' => 4
      },
      M::REPLACEMENTS.group_by { |key, _value| key.first }
        .transform_values(&:length)
    )
    assert_equal 3, M::SPECS.length
    assert_equal %w[item title place], M::SPECS.map { |spec| spec.fetch(:category) }
  end

  def test_replacements_preserve_surrounding_particles_and_line_text
    text = '이게 샤인 앤 섀도라고? 난 중요한 유물을 회수하러 온 거야!'
    assert_equal(
      '이게 빛과 그림자(Shine and Shadow)라고? 난 중요한 유물을 회수하러 온 거야!',
      M.transformed_text(
        'item:shine-and-shadow', ['default', '50123', ''], text
      )
    )
  end

  def test_prior_ambiguous_candidate_is_not_promoted_to_a_translation_finding
    dispositions = M::HEADERS
    assert_includes dispositions, 'prior_index_dispositions_json'
    assert_includes M.summary_addendum, 'not translation-quality dispositions'
    assert_includes M.summary_addendum, 'D-18389 at default:22158 remains untouched'
  end

  def test_prior_index_evidence_is_distinct_from_new_discovery_rows
    rows = [
      { 'entity_key' => 'item:shine-and-shadow', 'status' => 'accepted' },
      { 'entity_key' => 'person:cadoroc', 'status' => 'not-an-issue' }
    ]
    prior = M.prior_index_for_candidate(rows)
    assert_equal ['person:cadoroc'], prior.map { |row| row.fetch('entity_key') }
    assert_equal 27, M::SPECS.sum { |spec| {
      'item:shine-and-shadow' => 11,
      'title:siegebreaker' => 8,
      'place:sioran-crypt' => 8
    }.fetch(spec.fetch(:key)) }
  end

  def test_existing_canonical_rows_are_not_rewritten
    assert_nil M::REPLACEMENTS[['item:shine-and-shadow', 'default', '61231', '']]
    assert_nil M::REPLACEMENTS[['title:siegebreaker', 'default', '33022', '']]
    assert_nil M::REPLACEMENTS[['place:sioran-crypt', 'default', '17189', '']]
  end
end
