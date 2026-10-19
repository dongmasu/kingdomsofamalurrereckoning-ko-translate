#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-llyfarstair-D21685'

class LlyfarstairD21685Test < Minitest::Test
  M = LlyfarstairD21685

  def source(key)
    if M::TITLES.key?(key)
      row = M::TITLES.fetch(key)
      {
        'en_texts_json' => JSON.generate([row.fetch(:english)]),
        'ja_texts_json' => JSON.generate([row.fetch(:japanese)]),
        'zh_text' => row.fetch(:chinese)
      }
    else
      {
        'en_texts_json' => JSON.generate([M::DEFAULT_ENGLISH]),
        'ja_texts_json' => JSON.generate(['ドカルファーの詳しい歴史についてはルリファーステアを読むとよい。']),
        'zh_text' => '要更完整地了解暗精灵的历史，请阅读《利法斯泰尔》。'
      }
    end
  end

  def test_exact_named_work_scope
    assert_equal 5, M::KEYS.length
    assert_equal 4, M::KEYS.count { |key| key.first == 'base' }
    assert_equal [M::DEFAULT_KEY], M::KEYS.select { |key| key.first == 'default' }
    assert_equal 'named work:llyfarstair', M::SPEC.fetch(:key)
  end

  def test_volume_titles_are_paired_as_atomic_full_titles
    M::TITLES.each do |key, row|
      actual = M.transform(M::SPEC, key, row.fetch(:old), source(key))
      assert_equal [row.fetch(:new), false], actual, key.inspect
      assert_includes row.fetch(:new), "(Llyfarstair #{row.fetch(:english)[/ [IVX]+\z/]&.strip})"
    end
  end

  def test_narrative_pairs_the_book_title_inside_existing_quotes
    actual = M.transform(
      M::SPEC, M::DEFAULT_KEY, "『리파르스테어』를 읽어 보라.", source(M::DEFAULT_KEY)
    )
    assert_equal ['『리파르스테어(Llyfarstair)』를 읽어 보라.', false], actual
  end

  def test_locale_evidence_and_unknown_keys_fail_closed
    key = ['base', '308', '11']
    %w[en_texts_json ja_texts_json zh_text].each do |field|
      changed = source(key)
      changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
      assert_raises(RuntimeError, field) { M.validate_source!(key, changed) }
    end
    assert_raises(RuntimeError) do
      M.transform(M::SPEC, ['default', '1', ''], '리파르스테어', source(key))
    end
  end
end
