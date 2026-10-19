#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-bag-of-winds-D21679'

class BagOfWindsD21679Test < Minitest::Test
  M = BagOfWindsD21679

  def source(key)
    chinese = M::CHINESE_EVIDENCE.fetch(key)
    {
      'en_texts_json' => JSON.generate(['Use the Bag of Winds near the Watcher.']),
      'ja_texts_json' => JSON.generate(['衛兵から「旋風の袋」を使う。']),
      'zh_text' => "守卫携带#{chinese}。"
    }
  end

  def test_scope_is_exactly_one_base_and_thirteen_default_rows
    assert_equal 14, M::KEYS.length
    assert_equal 1, M::KEYS.count { |key| key[0] == 'base' }
    assert_equal 13, M::KEYS.count { |key| key[0] == 'default' }
    assert_equal ['base', '1465', '11'], M::KEYS.first
    assert_equal %w[
      10607 15100 32385 37293 45395 51991 52890 53584 55976
      60618 60940 61678 64509
    ], M::KEYS.drop(1).map { |key| key[1] }
    assert_equal 14, M::CHINESE_EVIDENCE.length
    assert_equal 14, M::OLD_SPANS.length
  end

  def test_normalizes_only_the_item_span_and_preserves_surrounding_text
    M::KEYS.each do |key|
      old = M::OLD_SPANS.fetch(key)
      text = "앞말\r\n{1} #{old}를 챙겨. 그녀는 그걸 썼어.\n뒷말"
      expected = "앞말\r\n{1} #{M::CANONICAL}를 챙겨. 그녀는 그걸 썼어.\n뒷말"
      assert_equal [expected, false], M.transform(nil, key, text, source(key)), key.inspect
    end
  end

  def test_transformation_is_idempotent_after_application
    M::KEYS.each do |key|
      text = "그것은 #{M::CANONICAL}를 써."
      assert_equal [text, false], M.transform(nil, key, text, source(key)), key.inspect
    end
  end

  def test_already_paired_default_label_is_unchanged
    key = ['default', '61678', '']
    text = "#{M::CANONICAL} 사용하기"
    assert_equal [text, false], M.transform(nil, key, text, source(key))
  end

  def test_english_japanese_and_chinese_evidence_is_required
    M::KEYS.each do |key|
      M.validate_source!(key, source(key))
      %w[en_texts_json ja_texts_json zh_text].each do |field|
        changed = source(key)
        changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
        assert_raises(RuntimeError, "#{key.inspect} #{field}") do
          M.validate_source!(key, changed)
        end
      end
    end
  end

  def test_unreviewed_keys_and_multiple_or_unknown_spans_fail_closed
    assert_raises(RuntimeError) do
      M.transform(nil, ['default', '1', ''], '바람 주머니', source(M::KEYS.first))
    end
    key = ['default', '10607', '']
    assert_raises(RuntimeError) do
      M.transform(nil, key, '바람 주머니와 바람주머니', source(key))
    end
    assert_raises(RuntimeError) do
      M.transform(nil, key, '다른 가방', source(key))
    end
  end

  def test_added_canonical_has_the_existing_paired_short_label
    assert_equal '바람 주머니(Bag of Winds)', M::SPEC.fetch(:korean)
    assert_equal 'item:bag-of-winds', M::SPEC.fetch(:key)
    assert_equal 'item', M::SPEC.fetch(:category)
  end
end
