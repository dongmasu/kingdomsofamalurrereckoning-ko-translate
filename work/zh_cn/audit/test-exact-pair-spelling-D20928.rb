#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-exact-pair-spelling-D20928'

class ExactPairSpellingD20928Test < Minitest::Test
  M = ExactPairSpellingD20928

  def test_contextual_species_language_and_village_suffixes
    %w[족 인 어].each { |suffix| assert M.canonical_prefix?("고대 알마인#{suffix}", '알마인') }
    assert M.canonical_prefix?('서쪽에는 고어하트 마을', '고어하트')
    assert M.canonical_prefix?('저는 사그렐 경', '사그렐')
    refute M.canonical_prefix?('전설의 볼건', '볼간')
  end

  def test_duplicate_english_pair_is_detected_but_correct_pair_is_not
    glossary = [{'entity_key' => 'monster:boggart', 'english_canonical' => 'Boggart',
                 'korean_canonical' => '보가트(Boggart)'}]
    row = {'entity_key' => 'monster:boggart', 'resource' => 'default',
           'ID_Linha' => '61548', 'Tipo_Variante' => '', 'status' => 'accepted',
           'korean_current' => '보가트(Boggart)(boggart)들을'}
    assert_equal [['monster:boggart', 'default', '61548', '']], M.mismatch_keys([row], glossary)
    row['korean_current'] = '보가트(Boggart)들을'
    assert_empty M.mismatch_keys([row], glossary)
  end

  def test_held_and_excluded_rows_are_not_reopened
    glossary = [{'entity_key' => 'monster:bolgan', 'english_canonical' => 'Bolgan',
                 'korean_canonical' => '볼간(Bolgan)'}]
    %w[uncertain excluded needs-context].each do |status|
      row = {'entity_key' => 'monster:bolgan', 'resource' => 'default',
             'ID_Linha' => '4163', 'Tipo_Variante' => '', 'status' => status,
             'korean_current' => '볼건(Bolgan)'}
      assert_empty M.mismatch_keys([row], glossary)
    end
  end
end
