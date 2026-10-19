#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-corthis-D21711'

class ReviewCorthisD21711Test < Minitest::Test
  M = ReviewCorthisD21711

  def source
    {
      'en_texts_json' => JSON.generate(['Corthis']),
      'ja_texts_json' => JSON.generate(['コルシス']),
      'zh_text' => '克塞思'
    }
  end

  def test_standalone_name_gets_canonical_bilingual_form
    revised, excluded = M.transform(nil, ['default', '15476', ''],
                                     '코르티스', source)
    assert_equal '코르티스(Corthis)', revised
    refute excluded
  end

  def test_locale_spelling_variant_is_normalized_without_losing_title
    revised, = M.transform(nil, ['default', '13673', ''],
                           '불굴의 코르시스(Corthis)', source)
    assert_equal '불굴의 코르티스(Corthis)', revised
  end

  def test_place_particle_and_surrounding_noun_are_preserved
    revised, = M.transform(nil, ['default', '30623', ''],
                           '코르티스의 고르낙', source)
    assert_equal '코르티스(Corthis)의 고르낙', revised
  end

  def test_complete_bilingual_phrase_is_left_unchanged
    text = '코르티스의 주먹(Fist of Corthis)'
    assert_equal [text, false],
      M.transform(nil, ['default', '13196', ''], text, source)
  end

  def test_wrong_korean_span_is_rejected
    assert_raises(RuntimeError) do
      M.transform(nil, ['default', '15476', ''], '다른 이름', source)
    end
  end
end
