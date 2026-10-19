#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21761'

class ReviewShortLabelCandidatesD21761Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21761

  def test_bounded_groups_fit_one_batch
    assert_equal 29, M::GROUPS.values.sum { |group| group.fetch(:count) }
    assert_operator M::GROUPS.values.sum { |group| group.fetch(:count) }, :<=, 50
    assert_equal 19, M::GROUPS.fetch('King Wencen').fetch(:count)
  end

  def test_existing_ambiguous_scopes_remain_unresolved
    %w[Judgment Knave\ of\ Pride Kollossae\ Litany].each do |term|
      assert_equal 'uncertain', M::GROUPS.fetch(term).fetch(:status)
    end
    assert_equal 'not-an-issue', M::GROUPS.fetch('King Wencen').fetch(:status)
  end

  def test_snapshot_keys_and_english_source_alignment
    candidates = M::M.table(M::INPUT).to_h do |row|
      [row.fetch('english_candidate'), row.to_h]
    end
    actual = M::GROUPS.to_h do |term, group|
      [term, M.candidate_keys(candidates.fetch(term)).length]
    end
    assert_equal M::GROUPS.transform_values { |group| group.fetch(:count) }, actual
    inventory = M::M.table(M::M::INVENTORY).map(&:to_h).to_h do |row|
      [M.row_key(row), row]
    end
    M::GROUPS.each_key do |term|
      M.candidate_keys(candidates.fetch(term)).each do |key|
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        assert_match(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i, english)
      end
    end
  end
end
