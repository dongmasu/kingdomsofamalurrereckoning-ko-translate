#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-nal-gorwin-D21686'

class NalGorwinD21686Test < Minitest::Test
  M = NalGorwinD21686

  def source(key)
    expected = M::SOURCES.fetch(key)
    {
      'en_texts_json' => JSON.generate([expected.fetch(:english)]),
      'ja_texts_json' => JSON.generate([expected.fetch(:japanese)]),
      'zh_text' => expected.fetch(:chinese)
    }
  end

  def test_scope_is_one_base_and_one_default_grave_label
    assert_equal [
      ['base', '173', '11'],
      ['default', '56341', '']
    ], M::KEYS
    assert_equal 2, M::SOURCES.length
    assert_equal 'person:nal-gorwin', M::SPEC.fetch(:key)
  end

  def test_existing_korean_pair_is_preserved_without_edit
    M::KEYS.each do |key|
      text = "고인의 무덤은 #{M::CANONICAL}이다."
      assert_equal [text, false], M.transform(nil, key, text, source(key))
    end
  end

  def test_all_three_source_locales_are_required
    key = ['default', '56341', '']
    %w[en_texts_json ja_texts_json zh_text].each do |field|
      changed = source(key)
      changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
      assert_raises(RuntimeError, field) { M.validate_source!(key, changed) }
    end
  end

  def test_unknown_key_and_unpaired_korean_fail_closed
    assert_raises(RuntimeError) do
      M.transform(nil, ['default', '1', ''], M::CANONICAL, source(M::KEYS.last))
    end
    assert_raises(RuntimeError) do
      M.transform(nil, M::KEYS.last, '날 고윈의 무덤', source(M::KEYS.last))
    end
  end
end
