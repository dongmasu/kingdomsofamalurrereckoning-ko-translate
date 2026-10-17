#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-factions-continuation'

class FactionCollisionTest < Minitest::Test
  def entry(entity, canonical, aliases = '')
    { 'entity_key' => entity, 'english_canonical' => canonical,
      'english_aliases' => aliases }
  end

  def test_unrelated_existing_homonyms_do_not_block_new_terms
    glossary = [
      entry('person:cryamor', 'Cryamor'),
      entry('unique-item:cryamor', 'Cryamor')
    ]
    FactionOrganizationContinuation.assert_no_term_collisions!(glossary)
  end

  def test_new_canonical_collision_is_rejected_case_insensitively
    assert_raises(RuntimeError) do
      FactionOrganizationContinuation.assert_no_term_collisions!(
        [entry('other:warsworn', 'warsworn')]
      )
    end
  end

  def test_new_alias_collision_is_rejected
    assert_raises(RuntimeError) do
      FactionOrganizationContinuation.assert_no_term_collisions!(
        [entry('other:traveler', 'Other', 'Traveler')]
      )
    end
  end

  def test_same_entity_existing_terms_are_allowed
    FactionOrganizationContinuation.assert_no_term_collisions!(
      [entry('faction:warsworn', 'Warsworn')]
    )
  end

  def spec(entity)
    FactionOrganizationContinuation::SPECS.find { |row| row['entity_key'] == entity }
  end

  def test_observed_warsworn_alias_preserves_particle_and_token
    text, status, = FactionOrganizationContinuation.transform_korean(
      '전쟁맹약단의 요새{LINE_BREAK}', spec('faction:warsworn'), 'Warsworn'
    )
    assert_equal '워스원(Warsworn)의 요새{LINE_BREAK}', text
    assert_equal 'accepted', status
  end

  def test_observed_scholia_alias
    text, status, = FactionOrganizationContinuation.transform_korean(
      '스콜라 아르카나에서', spec('faction:scholia-arcana'), 'Scholia Arcana'
    )
    assert_equal '스콜리아 아르카나(Scholia Arcana)에서', text
    assert_equal 'accepted', status
  end

  def test_unrelated_parenthetical_is_not_overwritten
    old = '워스원(Other)'
    text, status, = FactionOrganizationContinuation.transform_korean(
      old, spec('faction:warsworn'), 'Warsworn'
    )
    assert_equal old, text
    assert_equal 'uncertain', status
  end

  def test_mitharu_deity_and_mitharan_people_mix_is_held
    old = '미사루(Mitharu)와 미타란'
    text, status, = FactionOrganizationContinuation.review_entity(
      old, spec('people:mitharan'), 'Mitharu and Mitharan',
      'ミサールとミサール人', '米萨鲁和米萨鲁人'
    )
    assert_equal old, text
    assert_equal 'uncertain', status
  end

  def test_warsworn_particle_changes_follow_korean_ending
    text, = FactionOrganizationContinuation.transform_korean(
      '전쟁의 맹세자로 만들어 전쟁의 맹세자여!', spec('faction:warsworn'), 'Warsworn'
    )
    assert_equal '워스원(Warsworn)으로 만들어 워스원(Warsworn)이여!', text
  end

  def test_mitharan_language_suffix_stays_with_korean
    text, = FactionOrganizationContinuation.transform_korean(
      '미타루어란 뭐지?', spec('people:mitharan'), 'Mitharan'
    )
    assert_equal '미타란어(Mitharan)란 뭐지?', text
  end

  def test_existing_mitharan_suffix_after_label_moves_before_label
    text, = FactionOrganizationContinuation.transform_korean(
      '미타란(Mitharan)족은', spec('people:mitharan'), 'Mitharan'
    )
    assert_equal '미타란족(Mitharan)은', text
  end
end
