#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-paddy-alias-D21076'

class PaddyAliasD21076Test < Minitest::Test
  P = PaddyAliasD21076

  def test_short_and_particles
    old = '패디는 패디에게 가서 패디와 이야기하라고 했다. 패디라고 불러.'
    expected = '패디(Paddy)는 패디(Paddy)에게 가서 패디(Paddy)와 이야기하라고 했다. 패디(Paddy)라고 불러.'
    assert_equal expected, P.replace_names(old, 'Paddy said to speak with Paddy.')
  end

  def test_full_alias_atomic_and_personal_full_name_unchanged
    old = '패드리그 다워(Padrig Dower)는 패디 다워라고도 한다. 패디가 왔다.'
    expected = '패드리그 다워(Padrig Dower)는 패디 다워(Paddy Dower)라고도 한다. 패디(Paddy)가 왔다.'
    assert_equal expected, P.replace_names(old, 'Padrig Dower is Paddy Dower, or Paddy.')
    paired = '패디 다워(Paddy Dower)는 언제나 제시간에 마친다.'
    assert_equal paired, P.replace_names(paired, 'Paddy Dower always finishes on time.')
  end

  def test_idempotence_and_partially_paired_repetitions
    old = '패디(Paddy)가 끝냈다. 이제 패디가 고른다.'
    once = P.replace_names(old, 'Paddy finished. Paddy chooses.')
    assert_equal '패디(Paddy)가 끝냈다. 이제 패디(Paddy)가 고른다.', once
    assert_equal once, P.replace_names(once, 'Paddy finished. Paddy chooses.')
  end

  def test_terminal_filtering_is_entity_specific_and_preserves_evidence
    terminal = { 'entity_key' => P::ENTITY, 'resource' => 'default',
                 'ID_Linha' => '12504', 'Tipo_Variante' => '',
                 'status' => 'accepted', 'evidence' => 'Original decision, unchanged.' }
    unrelated = terminal.merge('entity_key' => 'place:gravehal', 'ID_Linha' => '859')
    generated = [terminal.dup, terminal.merge('ID_Linha' => '859')]
    before = Marshal.dump([terminal, unrelated])
    missing = P.missing_occurrences(generated, [terminal, unrelated])
    assert_equal ['859'], missing.map { |row| row['ID_Linha'] }
    assert_equal before, Marshal.dump([terminal, unrelated])
    assert_equal 121, (P.keys(P::PADDY_IDS) - P.keys(P::TERMINAL_IDS)).length
    assert_equal %w[12504 27852 31645], (P::PADDY_IDS & P::TERMINAL_IDS)
  end

  def test_duplicate_index_is_rejected
    row = { 'entity_key' => P::ENTITY, 'resource' => 'default',
            'ID_Linha' => '859', 'Tipo_Variante' => '' }
    assert_raises(RuntimeError) { P.missing_occurrences([row], [row, row.dup]) }
  end

  def test_parentheses_opaque_spans_and_line_breaks
    old = "(메모 패디) {$패디} <패디> $패디\r\n패디에게\n패디 다워는"
    expected = "(메모 패디) {$패디} <패디> $패디\r\n패디(Paddy)에게\n패디 다워(Paddy Dower)는"
    assert_equal expected, P.replace_names(old, 'Paddy and Paddy Dower')
    P.invariant!(old, expected)
  end

  def test_unknown_annotations_full_compounds_and_unsupported_full_alias_hold
    assert_raises(RuntimeError) { P.replace_names('패디(별명)는', 'Paddy') }
    assert_raises(RuntimeError) { P.replace_names('패디 다워는', 'Paddy') }
    assert_raises(RuntimeError) { P.replace_names('패디스트', 'Paddy') }
    assert_equal '패디는', P.replace_names('패디는', 'Padrig Dower')
  end

  def test_no_forced_name_counts_or_pronoun_expansion
    assert_equal '패디(Paddy)는 추천했다. 그는 기다렸다.',
                 P.replace_names('패디는 추천했다. 그는 기다렸다.', 'Paddy suggested it. Paddy waited.')
    assert_equal '패디(Paddy)에게 줘. 패디(Paddy)와 너 모두 잘되길.',
                 P.replace_names('패디에게 줘. 패디와 너 모두 잘되길.', 'You gave Paddy his dream. Good luck to him and you.')
  end

  def entity(aliases = '')
    { 'entity_key' => P::ENTITY, 'english_canonical' => 'Padrig Dower',
      'category' => 'person', 'korean_canonical' => '패드리그 다워(Padrig Dower)',
      'status' => 'confirmed', 'english_aliases' => aliases,
      'korean_variants' => '패드리그 다워', 'evidence_ids' => 'D20842',
      'notes' => 'Existing notes.' }
  end

  def test_metadata_existing_entity_only_and_alias_collision
    original = entity
    updated = P.updated_entity([original])
    assert_equal 'Paddy|Paddy Dower', updated['english_aliases']
    assert_equal '', original['english_aliases']
    assert_equal P::ENTITY, updated['entity_key']
    assert_equal original['korean_canonical'], updated['korean_canonical']
    assert_raises(RuntimeError) { P.updated_entity([entity('Dower')]) }
    other = { 'entity_key' => 'person:other', 'english_canonical' => 'Other',
              'english_aliases' => 'pAdDy' }
    assert_raises(RuntimeError) { P.updated_entity([original, other]) }
  end

  def test_manifest_cannot_include_terminal_or_nonaccepted_edit
    row = { 'resource' => 'default', 'ID_Linha' => '12504', 'Tipo_Variante' => '' }
    assert_raises(RuntimeError) { P.validate_reviews!([row], [], {}) }
    assert_raises(RuntimeError) { P.invariant!("패디\r\n", "패디(Paddy)\n") }
    assert_raises(RuntimeError) { P.invariant!('패디 {TOKEN}', '패디(Paddy) {OTHER}') }
  end

  def test_nonaccepted_edit_and_source_evidence_tampering_are_rejected
    source = { 'resource' => 'default', 'ID_Linha' => '859', 'Tipo_Variante' => '',
               'en_texts_json' => JSON.generate(['Paddy waits.']),
               'ja_texts_json' => JSON.generate(['パディー']), 'zh_text' => '帕迪',
               'work_text' => '패디(Paddy)는 기다린다.' }
    review = { 'resource' => 'default', 'ID_Linha' => '859', 'Tipo_Variante' => '',
               'entity_key' => P::ENTITY, 'status' => 'not-an-issue',
               'old' => source['work_text'], 'new' => source['work_text'],
               'evidence' => P.evidence('859'), 'english' => 'Paddy waits.',
               'japanese' => 'パディー', 'chinese' => '帕迪',
               'entity_dispositions_json' => JSON.generate(P::ENTITY => 'not-an-issue'),
               'previous_status' => '', 'previous_evidence' => '' }
    inventory = { ['default', '859', ''] => source }
    # Synthetic single-row fixtures intentionally bypass only the full-scope
    # checksum, never the manifest's status/evidence/transformation checks.
    P.stub(:name_guard!, nil) do
      bad_edit = review.merge('new' => '패디(Paddy)는 떠난다.')
      assert_raises(RuntimeError) { P.validate_reviews!([bad_edit], [source], inventory) }
      bad_source = review.merge('japanese' => '別人')
      assert_raises(RuntimeError) { P.validate_reviews!([bad_source], [source], inventory) }
    end
  end

  def test_nonoverlapping_other_entity_edit_is_preserved
    old = '패디는 올리에게 말했다.'
    proposed = '패디(Paddy)는 올리에게 말했다.'
    current = '패디는 올리(Ollie)에게 말했다.'
    rebased = P::M.rebase_review(old, proposed, current)
    assert_equal '패디(Paddy)는 올리(Ollie)에게 말했다.', rebased
    assert_equal rebased, P.replace_names(current, 'Paddy spoke to Ollie.')
  end
end
