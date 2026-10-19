#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-cowl-of-the-maiden-D21682'

class CowlOfTheMaidenD21682Test < Minitest::Test
  def source(japanese = '乙女の頭巾', chinese = '莉里亚神庙的少女斗篷')
    {
      'en_texts_json' => JSON.generate(['Steal the Cowl of the Maiden.']),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end

  def test_item_name_is_normalized_without_changing_surrounding_sentence
    key = ['default', '8773', '']
    text = "트래블러(Traveler)로군.\r\n시녀의 두건을 훔치러 오라는 의뢰를 받았겠지?"
    expected = "트래블러(Traveler)로군.\r\n처녀의 두건(Cowl of the Maiden)을 훔치러 오라는 의뢰를 받았겠지?"
    assert_equal [expected, false],
      CowlOfTheMaidenD21682.transform(nil, key, text, source)
  end

  def test_already_paired_rows_remain_unchanged
    CowlOfTheMaidenD21682::OLD_SPANS.each do |key, old|
      next unless old == CowlOfTheMaidenD21682::CANONICAL
      assert_equal [old, false],
        CowlOfTheMaidenD21682.transform(nil, key, old, source)
    end
  end

  def test_every_key_requires_all_three_source_languages_and_exact_korean_span
    CowlOfTheMaidenD21682::OLD_SPANS.each do |key, old|
      english = key[0] == 'base' ? 'Cowl of the Maiden' :
        'The Cowl of the Maiden is stolen.'
      text = old == CowlOfTheMaidenD21682::CANONICAL ?
        old : "#{old}를 훔쳐 와."
      valid = {
        'en_texts_json' => JSON.generate([english]),
        'ja_texts_json' => JSON.generate(['乙女の頭巾']),
        'zh_text' => '少女斗篷'
      }
      revised, excluded =
        CowlOfTheMaidenD21682.transform(nil, key, text, valid)
      refute excluded, key.inspect
      assert_includes revised, CowlOfTheMaidenD21682::CANONICAL, key.inspect

      %w[en_texts_json ja_texts_json zh_text].each do |field|
        changed = valid.dup
        changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
        assert_raises(RuntimeError, "#{key.inspect} #{field}") do
          CowlOfTheMaidenD21682.transform(nil, key, text, changed)
        end
      end
    end
  end

  def test_unreviewed_key_and_stale_korean_span_fail_closed
    assert_raises(RuntimeError) do
      CowlOfTheMaidenD21682.transform(
        nil, ['default', '1', ''], '처녀의 두건', source
      )
    end
    assert_raises(RuntimeError) do
      CowlOfTheMaidenD21682.transform(
        nil, ['default', '8773', ''], '다른 두건', source
      )
    end
  end
end
