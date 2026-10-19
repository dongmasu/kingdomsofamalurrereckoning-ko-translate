#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-gelphyne-source-alias-D21675'

class GelphyneSourceAliasD21675Test < Minitest::Test
  M = ReviewGelphyneSourceAliasD21675

  def source(key)
    english, japanese, chinese = case key[1]
                                 when '6817'
                                   ["He wants me to buy Rose-of-Shadows from Gelphyne in the Wending.",
                                    'ウェンディングのジェルファインからシャドウローズを買う',
                                    '从前行之地的格尔菲尼处购买暗影玫瑰']
                                 when '12350'
                                   ["Don't ask why Gelphyne sells it.",
                                    'なぜジェルファインが売っているかもな',
                                    '别问为什么格尔菲尼会出售它']
                                 when '17692'
                                   ['Before you go to Daltan, find Gelphyne in the Wending and ask for some Rose-of-Shadows.',
                                    'ウェンディングにいるジェルファインを探してシャドウローズを手に入れろ',
                                    '在前行之地找到格尔菲尼，向她要暗影玫瑰']
                                 when '36774'
                                   ['Get the Rose-of-Shadows from Gelphyne in the Wending.',
                                    'ウェンディングにいるジェルファインからシャドウローズを手に入れたら',
                                    '在前行之地中得到了格尔菲尼的暗影玫瑰']
                                 when '55456'
                                   ['Gelphyne buys and sells what you please.',
                                    '売り買いならジェルファインに任せるといい',
                                    '格尔菲尼买你想卖的东西，也卖你想买的东西']
                                 when '59918'
                                   %w[Gelphyne Gelphyne Gelphyne]
                                 else
                                   flunk "no fixture for #{key.inspect}"
                                 end
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end

  def test_alias_keeps_existing_person_canonical_fields
    owner = {
      'entity_key' => M::ENTITY, 'english_canonical' => 'Nargyfier',
      'category' => 'person', 'korean_canonical' => '나르지피어(Nargyfier)',
      'korean_variants' => '나르지피어', 'english_aliases' => '',
      'evidence_ids' => 'default:63745', 'status' => 'confirmed', 'notes' => 'prior'
    }
    updated = M.add_alias(owner, [owner])
    assert_equal 'Gelphyne', updated.fetch('english_aliases')
    %w[entity_key english_canonical category korean_canonical korean_variants status].each do |field|
      assert_equal owner.fetch(field), updated.fetch(field), field
    end
  end

  def test_alias_cannot_be_reassigned_from_another_owner
    owner = {
      'entity_key' => M::ENTITY, 'english_canonical' => 'Nargyfier',
      'category' => 'person', 'korean_canonical' => '나르지피어(Nargyfier)',
      'english_aliases' => '', 'status' => 'confirmed'
    }
    other = {
      'entity_key' => 'person:other', 'english_canonical' => 'Other',
      'english_aliases' => 'Gelphyne'
    }
    assert_raises(RuntimeError) { M.add_alias(owner, [owner, other]) }
  end

  def test_six_source_rows_normalize_only_the_given_name_span
    M::TARGETS.each do |key, target|
      text = "앞 문장.\r\n#{target.fetch(:old)}에게 장미를 받아.\n뒤 문장."
      expected = "앞 문장.\r\n#{target.fetch(:new)}에게 장미를 받아.\n뒤 문장."
      revised = M.replacement(key, text)
      assert_equal expected, revised, key.inspect
      assert_equal revised, M.replacement(key, revised), key.inspect
    end
  end

  def test_source_local_english_japanese_and_chinese_evidence
    M::TARGETS.each do |key, _target|
      assert M.validate_source!(key, source(key)), key.inspect
    end
  end

  def test_each_locale_is_required
    M::TARGETS.each do |key, _target|
      %w[en_texts_json ja_texts_json zh_text].each do |field|
        changed = source(key)
        changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
        assert_raises(RuntimeError, "#{key.inspect} #{field}") do
          M.validate_source!(key, changed)
        end
      end
    end
  end

  def test_full_name_labels_are_anchors_not_targets
    assert_equal [
      ['default', '17353', ''], ['default', '36421', '']
    ], M::FULL_NAME_KEYS
    assert_empty M::FULL_NAME_KEYS & M::TARGETS.keys
    assert_equal '겔파인 나르지피어(Gelphyne Nargyfier)', M::FULL_NAME
  end

  def test_unknown_keys_or_unreviewed_spans_fail_closed
    assert_raises(KeyError) { M::TARGETS.fetch(['default', '1', '']) }
    key = ['default', '6817', '']
    assert_raises(RuntimeError) { M.replacement(key, '다른 이름(Gelphyne)') }
    assert_raises(RuntimeError) { M.replacement(key, '겔핀(Gelphyne) 겔핀(Gelphyne)') }
  end
end
