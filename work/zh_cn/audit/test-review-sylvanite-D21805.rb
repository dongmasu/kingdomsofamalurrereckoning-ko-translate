#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-sylvanite-D21805'

class ReviewSylvaniteD21805Test < Minitest::Test
  M = ReviewSylvaniteD21805

  def test_full_source_scope_covers_all_three_resources
    assert_equal 'resource:sylvanite', M::ENTITY
    assert_equal 24, M::SOURCE_KEYS.length
    assert_equal 6, M::SOURCE_KEYS.count { |key| key.first == 'affix' }
    assert_equal 15, M::SOURCE_KEYS.count { |key| key.first == 'base' }
    assert_equal 3, M::SOURCE_KEYS.count { |key| key.first == 'default' }
  end

  def test_canonical_material_name_and_source_mismatch_are_separate
    assert_equal '실바나이트(Sylvanite)', M::CANONICAL
    assert_includes M::EDIT_EVIDENCE, 'sylvan spear'
    assert_includes M::SPECS.first.fetch(:notes), 'not Sylvanite'
  end

  def test_existing_paired_lines_remain_canonical
    %w[3476 4730].each do |id|
      assert M::CANDIDATE_KEYS.include?(['default', id, ''])
    end
    assert_equal 9, M::CANDIDATE_KEYS.length
  end
end
