#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-tallyer-D21806'

class ReviewTallyerD21806Test < Minitest::Test
  M = ReviewTallyerD21806

  def test_all_exact_source_uses_are_scoped
    assert_equal 3, M::KEYS.length
    assert_equal 2, M::CANDIDATE_KEYS.length
    assert_includes M::KEYS, ['default', '21437', '']
  end

  def test_ranked_job_is_not_a_proper_name
    assert_includes M::EVIDENCE, 'Tallyer, first-class'
    assert_includes M::EVIDENCE, 'Tallyer second-class'
    assert_includes M::EVIDENCE, '一等記録官/二等記録官'
    assert_includes M::EVIDENCE, '一等记录官/二等记录官'
    assert_includes M::EVIDENCE, 'Exclude all three exact uses'
  end

  def test_adjacent_entities_are_preserved
    assert_includes M::EVIDENCE, 'Cennar Bruge'
    assert_includes M::EVIDENCE, 'Domus Politica'
    assert_includes M::EVIDENCE, 'Preserve existing Korean'
  end
end
