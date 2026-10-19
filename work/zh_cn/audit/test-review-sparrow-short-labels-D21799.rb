#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-sparrow-short-labels-D21799'

class ReviewSparrowShortLabelsD21799Test < Minitest::Test
  M = ReviewSparrowShortLabelsD21799

  def test_candidate_scope_is_exact_and_row_classifications_are_explicit
    assert_equal 9, M::GROUP.length
    assert_equal 4, M::CORRECTIONS.length
    assert_equal 4, M::GROUP.values.count('accepted')
    assert_equal 1, M::GROUP.values.count('not-an-issue')
    assert_equal 4, M::GROUP.values.count('uncertain')
  end

  def test_parallel_gwalchmai_categories_use_the_registered_collective_form
    ids = M::CORRECTIONS.select { |row| %w[1963 54044].include?(row['ID_Linha']) }
    assert_equal 2, ids.length
    assert ids.all? { |row| row['new'].include?('참새단(Sparrows)') }
    assert_includes ids.first.fetch('evidence'), 'same speaker'
  end

  def test_unresolved_isolated_and_metaphorical_uses_are_preserved
    %w[default:19179: default:20899: default:3534: default:60431:].each do |key|
      assert_equal 'uncertain', M::GROUP.fetch(key)
    end
    assert_includes M::EVIDENCE.fetch('default:20899:'), 'D-6445'
    assert_includes M::EVIDENCE.fetch('default:60431:'), 'D-17903'
  end

  def test_prior_sparrow_member_decision_is_not_recounted
    assert_equal 'not-an-issue', M::GROUP.fetch('default:31232:')
    assert_includes M::EVIDENCE.fetch('default:31232:'), 'D-21671'
    refute M::CORRECTIONS.any? { |row| row['ID_Linha'] == '31232' }
  end
end
