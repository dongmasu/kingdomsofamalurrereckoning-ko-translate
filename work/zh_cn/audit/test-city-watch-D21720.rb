#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-city-watch-D21720'

class CityWatchD21720Test < Minitest::Test
  M = CityWatchD21720

  def source(key)
    english = key == M::COMPOUND_KEY ? 'Rathir City Watch' : 'City Watch at Rathir.'
    japanese = key == M::COMPOUND_KEY ? 'ラシーアの警備隊' : '警備隊へ向かう。'
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => M::ZH_EVIDENCE.fetch(key)
    }
  end

  def test_exact_scope_is_one_base_and_forty_nine_default_keys
    assert_equal 50, M::KEYS.length
    assert_equal 50, M::KEYS.uniq.length
    assert_equal 1, M::KEYS.count { |key| key[0] == 'base' }
    assert_equal 49, M::KEYS.count { |key| key[0] == 'default' }
    assert_equal 50, M::SOURCE_SPANS.length
    assert_equal 50, M::ZH_EVIDENCE.length
    assert_equal %w[968 2885 4365 4441 4640 5711 5949 6260 6516 7109
                    8622 9034 11425 11950 12353 15823 15984 17195 17885
                    18597 19360 22296 25688 28157 29092 30610 32535 35421
                    39724 42239 42812 42975 44990 47921 49065 49154 51355
                    52214 53240 54514 54594 54691 57563 57746 60519 60890
                    62627 64621 65061], M::KEYS.drop(1).map { |key| key[1] }
  end

  def test_registers_only_the_organization_and_keeps_compound_atomic
    assert_equal 'organization:city-watch', M::SPEC.fetch(:key)
    assert_equal 'organization', M::SPEC.fetch(:category)
    assert_equal '도시 경비대(City Watch)', M::SPEC.fetch(:korean)
    assert_equal 7, M::ALREADY_PAIRED_IDS.length
    assert_equal M::RATHIR_COMPOUND, M::SOURCE_SPANS.fetch(M::COMPOUND_KEY)
    assert_includes M::NOTE, 'does not name the City Watch'
  end

  def test_normalizes_only_the_reviewed_span_and_preserves_surrounding_text
    M::KEYS.each do |key|
      old = M::SOURCE_SPANS.fetch(key)
      text = "앞말\r\n{1} #{old}에 가. 그녀는 그곳을 살펴봤어.\n뒷말"
      replacement = old == M::RATHIR_COMPOUND ? old : M::CANONICAL
      expected = "앞말\r\n{1} #{replacement}에 가. 그녀는 그곳을 살펴봤어.\n뒷말"
      assert_equal [expected, false], M.transform(M::SPEC, key, text, source(key)),
                   key.inspect
    end
  end

  def test_already_paired_labels_and_rathir_compound_are_idempotent
    (M::ALREADY_PAIRED_IDS.map { |id| ['default', id, ''] } +
      [M::COMPOUND_KEY]).each do |key|
      text = M::SOURCE_SPANS.fetch(key)
      assert_equal [text, false], M.transform(M::SPEC, key, text, source(key))
    end
  end

  def test_existing_enlistment_wording_is_not_rewritten
    key = ['default', '49065', '']
    text = "도시 경비대의 도움을 받아. 허락한다면 그들과 함께 가."
    expected = "도시 경비대(City Watch)의 도움을 받아. 허락한다면 그들과 함께 가."
    assert_equal [expected, false], M.transform(M::SPEC, key, text, source(key))
  end

  def test_each_aligned_locale_is_required
    M::KEYS.each do |key|
      assert M.validate_source!(key, source(key)), key.inspect
      %w[en_texts_json ja_texts_json zh_text].each do |field|
        changed = source(key)
        changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
        assert_raises(RuntimeError, "#{key.inspect} #{field}") do
          M.validate_source!(key, changed)
        end
      end
    end
  end

  def test_unreviewed_keys_and_wrong_entities_fail_closed
    assert_raises(RuntimeError) do
      M.transform(M::SPEC, ['default', '1', ''], '도시 경비대',
                  source(M::KEYS.first))
    end
    wrong = M::SPEC.merge(key: 'faction:city-watch')
    key = M::KEYS.first
    assert_raises(RuntimeError) do
      M.transform(wrong, key, M::SOURCE_SPANS.fetch(key), source(key))
    end
  end
end
