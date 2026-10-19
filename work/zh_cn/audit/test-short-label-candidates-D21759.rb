#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21759'

class ReviewShortLabelCandidatesD21759Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21759

  def test_candidate_key_limit_and_full_source_sizes
    terms = ['Hireling', 'Hoplon', 'Ice Wolf']
    assert_equal [43, 2, 3], terms.map { |term| M::GROUPS.fetch(term).fetch(:expected_keys) }
    assert_equal 48, M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }
    assert_operator M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }, :<=, 50
  end

  def test_hireling_is_a_formal_rank_not_a_person_or_generic_hireling
    assert_equal 'title', M::HIRELING.fetch(:category)
    assert_equal 'title:warsworn-hireling', M::HIRELING.fetch(:key)
    assert_includes M::HIRELING.fetch(:notes), 'Pledgeshield and Oathblade'
    assert_equal 'uncertain', M::GROUPS.fetch('Ice Wolf').fetch(:disposition)
  end

  def test_full_source_counts_and_candidate_manifest_fit_the_batch
    inventory = M::M.refresh_inventory
    assert_equal 43, M.full_source_keys(inventory, 'Hireling').length
    assert_equal 2, M.full_source_keys(inventory, 'Hoplon').length
    assert_equal 3, M.full_source_keys(inventory, 'Ice Wolf').length
  end

  def test_rank_transform_preserves_complete_rank_person_label
    source = { 'en_texts_json' => '["Hireling Folmoric is dead."]' }
    old = '고용병 폴모릭(Hireling Folmoric)이 죽었어.'
    assert_equal [old, false],
                 M.transform_hireling(['default', '52717', ''], old, source)
  end

  def test_rank_transform_pairs_translation_without_touching_particles
    source = { 'en_texts_json' => '["Work as a Hireling."]' }
    assert_equal ['고용병(Hireling)으로 왔다.', false],
                 M.transform_hireling(['default', '25776', ''], '고용병으로 왔다.', source)
  end
end
