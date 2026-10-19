#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-abblier-D21684'

class AbblierD21684Test < Minitest::Test
  M = AbblierD21684

  def source(key)
    case key
    when ['default', '41901', '']
      {
        'en_texts_json' => JSON.generate([M::ALIAS]),
        'ja_texts_json' => JSON.generate(['ぼんやり屋のアブリア']),
        'zh_text' => '混乱的阿比利尔'
      }
    when ['default', '22215', '']
      {
        'en_texts_json' => JSON.generate([M::ENGLISH]),
        'ja_texts_json' => JSON.generate([M::ENGLISH]),
        'zh_text' => M::ENGLISH
      }
    else
      {
        'en_texts_json' => JSON.generate(["Speak with #{M::ENGLISH}."]),
        'ja_texts_json' => JSON.generate(['アブリアと話す。']),
        'zh_text' => '与阿比利尔交谈。'
      }
    end
  end

  def test_exact_scope_and_person_definition
    assert_equal 13, M::KEYS.length
    assert M::KEYS.all? { |key| key.first == 'default' }
    assert_equal 'person:abblier', M::SPEC.fetch(:key)
    assert_equal '아블리에(Abblier)', M::SPEC.fetch(:korean)
    assert_equal 'Abblier the Addled', M::SPEC.fetch(:aliases)
  end

  def test_standardizes_the_korean_name_without_touching_neighboring_text
    key = ['default', '32356', '']
    old = '애블리어가 임무마다 보상을 줄 것이다.'
    expected = '아블리에(Abblier)가 임무마다 보상을 줄 것이다.'
    assert_equal [expected, false], M.transform(nil, key, old, source(key))
  end

  def test_complete_epithet_is_paired_as_the_same_person
    key = ['default', '41901', '']
    assert_equal ['얼빠진 아블리에(Abblier the Addled)', false],
      M.transform(nil, key, '얼빠진 아블리에', source(key))
  end

  def test_existing_canonical_name_is_idempotent
    key = ['default', '22215', '']
    assert_equal [M::CANONICAL, false],
      M.transform(nil, key, M::CANONICAL, source(key))
  end

  def test_locale_evidence_and_unknown_keys_fail_closed
    key = ['default', '32356', '']
    %w[en_texts_json ja_texts_json zh_text].each do |field|
      changed = source(key)
      changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
      assert_raises(RuntimeError, field) { M.validate_source!(key, changed) }
    end
    assert_raises(RuntimeError) do
      M.transform(nil, ['default', '1', ''], '아블리에', source(key))
    end
  end
end
