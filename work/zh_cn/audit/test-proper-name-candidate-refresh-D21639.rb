#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-candidate-refresh-D21639'

class ProperNameCandidateRefreshD21639Test < Minitest::Test
  def test_shared_alias_context_deduplicates_source_and_terminal_counts
    shared_occurrence = {
      'entity_key' => 'resource:chaos-core',
      'resource' => 'default',
      'ID_Linha' => '9945',
      'Tipo_Variante' => '',
      'matched_english' => 'Chaos Core|Chaos cores',
      'status' => 'accepted',
      'evidence' => 'D-21521: shared terminal source-label decision'
    }

    summary = ProperNameCandidateRefreshD21639.coverage_summary(
      %w[default:9945 default:9945],
      [shared_occurrence, shared_occurrence.dup]
    )

    assert_equal 2, summary[:candidate_context_associations]
    assert_equal 1, summary[:unique_source_contexts]
    assert_equal 2, summary[:candidate_occurrence_links]
    assert_equal 1, summary[:unique_terminal_occurrences]
    assert_equal({ 'accepted' => 1 }, summary[:unique_terminal_status_counts])
  end
end
