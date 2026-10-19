#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-the-keening-D21659'

class TheKeeningD21659Test < Minitest::Test
  def source(english = 'The Keening')
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['キーニング']),
      'zh_text' => english == 'The Keening Curse' ? '哀恸诅咒' : '哀恸之地'
    }
  end

  def test_all_region_rows_normalize_to_the_canonical_display
    TheKeeningD21659::EDITS.each do |key, (old, expected)|
      changed, excluded = TheKeeningD21659.transform(
        nil, key, old, source(key == ['base', '2472', '11'] ||
          %w[14754 30230 31813 52413].include?(key[1]) ? 'The Keening' : 'Keening')
      )
      refute excluded, key.inspect
      assert_equal expected, changed, key.inspect
    end
  end

  def test_keening_curse_is_excluded_as_a_separate_title
    changed, excluded = TheKeeningD21659.transform(
      nil, TheKeeningD21659::EXCLUDED, TheKeeningD21659::EXCLUDED_TEXT,
      source('The Keening Curse')
    )
    assert excluded
    assert_equal TheKeeningD21659::EXCLUDED_TEXT, changed
  end

  def test_source_locale_evidence_is_required
    changed_source = source
    changed_source['ja_texts_json'] = JSON.generate(['別の地域'])
    assert_raises(RuntimeError) do
      TheKeeningD21659.transform(
        nil, ['default', '31813', ''], '키닝', changed_source
      )
    end
  end

  def test_history_paragraph_preserves_surrounding_text
    old = "이전 문장.\r\n키닝(the Keening)에서 철수했다.\r\n다음 문장."
    changed, excluded = TheKeeningD21659.transform(
      nil, ['default', '3201', ''], old, source
    )
    refute excluded
    assert_equal "이전 문장.\r\n키닝(The Keening)에서 철수했다.\r\n다음 문장.", changed
  end

  def test_existing_paired_place_in_a_sentence_is_unchanged
    old = '키닝(The Keening) 깊숙한 곳에서 발견된 일지.'
    assert_equal [old, false], TheKeeningD21659.transform(
      nil, ['default', '7099', ''], old, source
    )
  end

  def test_unreviewed_rows_fail_closed
    assert_raises(RuntimeError) do
      TheKeeningD21659.transform(nil, ['default', '1', ''], '키닝', source)
    end
  end
end
