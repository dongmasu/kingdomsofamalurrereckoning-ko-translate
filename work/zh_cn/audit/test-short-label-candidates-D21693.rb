#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21693'

class ReviewShortLabelCandidatesD21693Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21693

  def test_all_six_candidate_groups_have_explicit_dispositions
    assert_equal 6, M::REVIEWED.length
    assert_equal 5, M::REVIEWED.values.count { |row| row.fetch(:disposition) == 'not-an-issue' }
    assert_equal 1, M::REVIEWED.values.count { |row| row.fetch(:disposition) == 'uncertain' }
  end

  def test_amphora_is_not_promoted_without_identity_scope_evidence
    row = M::REVIEWED.fetch('Amphora')
    assert_equal 'uncertain', row.fetch(:disposition)
    assert_includes row.fetch(:evidence), 'generic vessel type'
    assert_includes row.fetch(:evidence), 'do not register'
  end

  def test_title_and_species_terms_are_not_mistaken_for_missing_names
    assert_includes M::REVIEWED.fetch('Brother Wulf').fetch(:evidence), '울프(Wulf)'
    assert_includes M::REVIEWED.fetch('Captain Dodwyn').fetch(:evidence), '도드윈(Dodwyn)'
    assert_includes M::REVIEWED.fetch('Alfar Warship').fetch(:evidence), '전함'
  end
end
