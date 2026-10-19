#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'build-proper-name-discovery-D21757'

class ProperNameDiscoveryD21757Test < Minitest::Test
  M = ProperNameDiscoveryD21757

  def test_exact_candidate_scope_sizes
    assert_equal 14, M::EXPECTED_GROUP_KEYS.values.sum
    assert_equal 19, M::EXPECTED_ENTITY_KEYS.values.sum(&:length)
    assert_equal 16, M::EDIT_SPANS.length
  end

  def test_generic_hammer_is_not_registered_as_a_unique_entity
    assert_nil M::GROUPS.fetch('Hammer')['entity']
    assert_equal 4, M::EXPECTED_GROUP_KEYS.fetch('Hammer')
    assert_empty M::EXPECTED_ENTITY_KEYS.keys.grep(/hammer/i)
  end

  def test_site_and_item_canonicals_use_complete_english_pairs
    definitions = ReviewedNameBatches.table(M::DEFINITION_PATH).map(&:to_h)
    expected = {
      'place:hall-of-accolades' => '영예의 전당(Hall of Accolades)',
      'place:hallowed-tree' => '성목(Hallowed Tree)',
      'place:heart-of-the-sidhe' => '시드의 심장(Heart of the Sidhe)',
      'item:heartstone' => '하트스톤(Heartstone)'
    }
    actual = definitions.to_h do |row|
      [row.fetch('entity_key'), row.fetch('korean_canonical')]
    end
    assert_equal expected, actual
  end

  def test_prior_translation_holds_are_preserved
    assert_match(/D-9231.*historical/, M::GROUPS.fetch('Hall of Accolades')['evidence'])
    assert_match(/D-3288.*historical/, M::GROUPS.fetch('Hallowed Tree')['evidence'])
    assert_match(/D-17963.*historical/, M::GROUPS.fetch('Heart of the Sidhe')['evidence'])
    assert_match(/D-16940.*historical/, M::GROUPS.fetch('Heartstone')['evidence'])
  end

  def test_korean_quotative_particle_is_preserved_with_canonical_tree_name
    assert_equal ['성스러운 나무라고', '성목(Hallowed Tree)이라고'],
      M::EDIT_SPANS.fetch(['default', '33802', ''])
  end
end
