#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-shadowthorn-D21667'

class ShadowthornD21667Test < Minitest::Test
  M = ShadowthornD21667

  def source(kind)
    english, japanese, chinese = case kind
                                 when :anchor
                                   ['I need to find Aurenda in the Fae hollow, Shadowthorn.',
                                    'シャドウソーンにいるオーレンダ', '暗影荆棘灵族洞穴']
                                 when :hollow
                                   ['A valuable Fae relic buried in Shadowthorn Hollow.',
                                    'シャドウソーン洞穴に埋められたフェイの遺物', '影刺谷']
                                 when :base
                                   ['Shadowthorn', 'シャドウソーン', '暗影荆棘']
                                 when :literal
                                   ['Shadowthorn', 'Shadowthorn', 'Shadowthorn']
                                 else
                                   ['Shadowthorn', 'シャドウソーン', '影棘']
                                 end
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end

  def test_registers_only_the_supported_place_and_explicit_hollow_alias
    assert_equal 'place:shadowthorn', M::SPEC.fetch(:key)
    assert_equal 'place', M::SPEC.fetch(:category)
    assert_equal '섀도손(Shadowthorn)', M::SPEC.fetch(:korean)
    assert_equal 'Shadowthorn Hollow', M::SPEC.fetch(:aliases)
    assert_equal '섀도손', M::SPEC.fetch(:variants)
    assert_equal 6, M::SPEC.fetch(:count)
  end

  def test_established_pair_and_refuge_wording_are_unchanged
    old = "아우렌다(Aurenda)의 빛을 찾아 페이(Fae)의 은신처 #{M::CANONICAL}에 가져다줘."
    assert_equal [old, false], M.transform(M::ANCHOR_KEY, old, source(:anchor))
  end

  def test_complete_hollow_pair_preserves_surrounding_text_and_tokens
    old = "이전 문장.\r\n{1} 섀도손 동굴에 묻힌 페이(Fae) 유물.\n다음 문장."
    expected = "이전 문장.\r\n{1} #{M::HOLLOW}에 묻힌 페이(Fae) 유물.\n다음 문장."
    assert_equal [expected, false], M.transform(M::HOLLOW_KEY, old, source(:hollow))
  end

  def test_hollow_pair_is_idempotent_and_not_nested
    old = "#{M::HOLLOW}에 묻힌 유물."
    assert_equal [old, false], M.transform(M::HOLLOW_KEY, old, source(:hollow))
  end

  def test_all_bare_homonyms_remain_excluded_and_unchanged
    M::EXCLUDED.each do |key, old|
      kind = if key[0] == 'base'
               :base
             elsif key[1] == '2357'
               :literal
             else
               :label
             end
      assert_equal [old, true], M.transform(key, old, source(kind)), key.inspect
    end
  end

  def test_unexpected_resource_id_and_variant_fail_closed
    [['affix', '1582', '11'], ['default', '1', ''],
     ['base', '1582', '12'], ['default', '42510', '11']].each do |key|
      assert_raises(RuntimeError) { M.transform(key, '섀도손 동굴', source(:hollow)) }
    end
  end

  def test_each_locale_is_required_for_both_place_keys
    [[M::ANCHOR_KEY, :anchor, M::CANONICAL],
     [M::HOLLOW_KEY, :hollow, '섀도손 동굴']].each do |key, kind, text|
      %w[en_texts_json ja_texts_json zh_text].each do |field|
        changed = source(kind)
        changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
        assert_raises(RuntimeError) { M.transform(key, text, changed) }
      end
    end
  end

  def test_bare_label_is_not_place_evidence
    assert_raises(RuntimeError) do
      M.transform(M::ANCHOR_KEY, M::CANONICAL, source(:label))
    end
    assert_raises(RuntimeError) do
      M.transform(M::HOLLOW_KEY, '섀도손 동굴', source(:label))
    end
  end

  def test_unreviewed_korean_and_annotation_changes_fail_closed
    ['다른 동굴', '섀도손 동굴과 섀도손 동굴',
     '섀도손 동굴(Other)'].each do |text|
      assert_raises(RuntimeError) { M.transform(M::HOLLOW_KEY, text, source(:hollow)) }
    end
    assert_raises(RuntimeError) do
      M.transform(M::ANCHOR_KEY, '섀도손', source(:anchor))
    end
    assert_raises(RuntimeError) do
      M.transform(['base', '1582', '11'], '섀도손(Shadowthorn)', source(:base))
    end
  end

  def test_fixture_scope_has_two_place_rows_and_four_unclassified_homonyms
    assert_equal [
      ['base', '1582', '11'], ['default', '2357', ''],
      ['default', '39881', ''], ['default', '62125', ''],
      M::ANCHOR_KEY, M::HOLLOW_KEY
    ].sort, M::EXPECTED_KEYS.sort
    assert_equal 4, M::EXCLUDED.length
  end

  def test_fixture_transform_can_be_rerun_after_application
    fixtures = {
      M::ANCHOR_KEY => [
        '아우렌다(Aurenda)의 빛을 찾아 페이(Fae)의 은신처 섀도손(Shadowthorn)에 있는 그녀에게 가져다줘.',
        :anchor
      ],
      M::HOLLOW_KEY => [
        "라닐은 섀도손 동굴에 있는 페이(Fae)의 유물이야.\r\n{1}",
        :hollow
      ]
    }
    fixtures.each do |key, (text, kind)|
      first = M.transform(key, text, source(kind))
      second = M.transform(key, first.first, source(kind))
      assert_equal first, second
    end
  end

  def test_bare_homonym_fixtures_remain_excluded
    M::EXCLUDED.each do |key, text|
      kind = case key
             when ['base', '1582', '11'] then :base
             when ['default', '2357', ''] then :literal
             else :label
             end
      assert_equal [text, true], M.transform(key, text, source(kind))
    end
  end

  def test_japanese_and_chinese_evidence_is_required_for_place_rows
    [
      [M::ANCHOR_KEY, M::CANONICAL, :anchor],
      [M::HOLLOW_KEY, '섀도손 동굴', :hollow]
    ].each do |key, text, kind|
      %w[ja_texts_json zh_text].each do |field|
        changed = source(kind)
        changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
        assert_raises(RuntimeError) { M.transform(key, text, changed) }
      end
    end
  end

  def test_unreviewed_keys_and_bare_only_evidence_fail_closed
    assert_raises(RuntimeError) do
      M.transform(['default', '1', ''], '섀도손 동굴', source(:hollow))
    end
    assert_raises(RuntimeError) do
      M.transform(M::ANCHOR_KEY, M::CANONICAL, source(:label))
    end
    assert_raises(RuntimeError) do
      M.transform(M::HOLLOW_KEY, '섀도손 동굴', source(:label))
    end
  end
end
