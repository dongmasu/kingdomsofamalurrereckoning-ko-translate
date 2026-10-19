#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21719'

class ReviewShortLabelCandidatesD21719Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21719

  def test_batch_stays_within_fifty_distinct_source_keys
    assert_equal 43, M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }
    assert_operator M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }, :<=, 50
  end

  def test_longer_grand_champion_title_is_not_nested
    assert_equal [
      ['default', '5070', ''],
      ['default', '40966', '']
    ], M::EXCLUDED_TITLE_KEYS
    M::EXCLUDED_TITLE_KEYS.each do |key|
      assert M::CHAMPION_SPANS.keys.none? { |mapped| mapped == key }
    end
  end

  def test_three_registered_scopes_have_explicit_identity_categories
    assert_equal %w[title monster title],
                 M::SPECS.map { |spec| spec.fetch(:category) }
    assert_equal %w[
      title:champion-of-valor
      monster:chaos-critters
      title:chariot
    ], M::SPECS.map { |spec| spec.fetch(:key) }
  end

  def test_chariot_phonetic_and_generic_vehicle_forms_are_normalized_as_title
    assert_equal '전차를 모는 자(Chariot)',
                 M::CHARIOT_SPANS.fetch(['default', '12470', '']).last
    assert_equal '전차를 모는 자(Chariot)',
                 M::CHARIOT_SPANS.fetch(['default', '36955', '']).last
  end

  def test_circle_keeps_glyph_and_group_contexts_separate
    assert_includes M::GROUPS.fetch('Circle').fetch(:evidence), 'magical glyph'
    assert_includes M::GROUPS.fetch('Circle').fetch(:evidence), 'as uncertain'
  end

  def test_already_canonical_registered_candidate_is_not_an_issue
    key = ['default', '45495', '']
    source = {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'en_texts_json' => '["Chariot"]', 'ja_texts_json' => '["戦車を駆る者"]',
      'zh_text' => '战车', 'work_text' => '전차를 모는 자(Chariot)'
    }
    candidate = {
      'unpaired_label_keys_json' => JSON.generate([key]),
      'paired_evidence_keys_json' => '[]'
    }
    groups = { 'Chariot' => { expected_keys: 1, evidence: 'Fixture title.' } }
    M.stub(:build_occurrences, []) do
      original = M::GROUPS
      M.send(:remove_const, :GROUPS)
      M.const_set(:GROUPS, groups)
      begin
        reviews = M.build_candidate_reviews({ key => source }, [], { 'Chariot' => candidate })
        assert_equal 'not-an-issue', reviews.first.fetch('disposition')
      ensure
        M.send(:remove_const, :GROUPS)
        M.const_set(:GROUPS, original)
      end
    end
  end
end
