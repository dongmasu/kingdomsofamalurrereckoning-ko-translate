#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-meathgra-D21683'

class MeathgraD21683Test < Minitest::Test
  M = MeathgraD21683

  def source(key)
    {
      'en_texts_json' => JSON.generate(['Meathgra is an ancient leanashe.']),
      'ja_texts_json' => JSON.generate(['古代のリアンシー、ミースグラ。']),
      'zh_text' => '古老的蛇身女妖米斯格拉。'
    }
  end

  def test_scope_covers_one_base_and_all_eighteen_default_keys
    assert_equal 19, M::KEYS.length
    assert_equal ['base', '66', '11'], M::KEYS.first
    assert_equal 18, M::KEYS.count { |key| key.first == 'default' }
    assert_equal 21, M::KOREAN_NAME_COUNTS.values.sum
    assert_equal 2, M::KOREAN_NAME_COUNTS.values.count(2)
  end

  def test_only_unpaired_creature_name_spans_are_annotated
    key = ['default', '21127', '']
    old = '미스그라의 기운이 에샤라(Esharra)로 스러졌다.'
    expected = '미스그라(Meathgra)의 기운이 에샤라(Esharra)로 스러졌다.'
    assert_equal [expected, false], M.transform(nil, key, old, source(key))
  end

  def test_every_occurrence_is_paired_and_existing_pairs_are_idempotent
    key = ['default', '28878', '']
    text = '미스그라(Meathgra)라는 리아네시다. 미스그라를 처치했다.'
    expected = '미스그라(Meathgra)라는 리아네시다. 미스그라(Meathgra)를 처치했다.'
    assert_equal [expected, false], M.transform(nil, key, text, source(key))
    assert_equal [expected, false], M.transform(nil, key, expected, source(key))
  end

  def test_source_languages_and_unknown_keys_fail_closed
    key = ['default', '21127', '']
    M.validate_source!(key, source(key))
    %w[en_texts_json ja_texts_json zh_text].each do |field|
      changed = source(key)
      changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
      assert_raises(RuntimeError, field) { M.validate_source!(key, changed) }
    end
    assert_raises(RuntimeError) do
      M.transform(nil, ['default', '1', ''], '미스그라', source(key))
    end
  end

  def test_unexpected_korean_forms_fail_closed
    key = ['default', '21127', '']
    assert_raises(RuntimeError) do
      M.transform(nil, key, '미스그라(다른 이름)', source(key))
    end
    assert_raises(RuntimeError) do
      M.transform(nil, key, '미스그라와 미스그라', source(key))
    end
  end
end
