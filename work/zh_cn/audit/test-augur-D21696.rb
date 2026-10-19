#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-augur-D21696'

class ReviewAugurD21696Test < Minitest::Test
  M = ReviewAugurD21696

  def test_exact_fifty_source_keys_include_all_three_resources
    assert_equal 43, M::DEFAULT_IDS.length
    assert_equal 7, M::EXCLUDED_KEYS.length
    assert_equal 50, M::EXPECTED_KEYS.length
    assert_equal 43, M::EDITS.length
    assert_includes M::EXPECTED_KEYS.to_a.map(&:first), 'affix'
    assert_includes M::EXPECTED_KEYS.to_a.map(&:first), 'base'
  end

  def test_name_variants_are_normalized_only_in_the_person_scope
    assert_equal ['예언자(Augur)는 믿을 수 있어.', false],
      M.transform(M::SPEC, ['default', '13635', ''],
        '예언자는 믿을 수 있어.', source('Augur can be trusted.', '予言者は信用できる', '奥格尔可信'))
    assert_equal ['우두머리는 예언자(Augur)라는 사내야.', false],
      M.transform(M::SPEC, ['default', '43738', ''],
        '우두머리는 오거라는 사내야.', source("Their leader's a bloke named Augur.", '予言者と呼ばれる', '首领叫奥格尔'))
  end

  def test_repeated_augur_reference_is_paired_without_touching_other_names
    text = '지도자 예언자(Augur)가 배후다. 야영지에 있는 예언자를 만나야겠다.'
    expected = '지도자인 예언자(Augur)가 배후다. 야영지에 있는 예언자(Augur)를 만나야겠다.'
    actual, excluded = M.transform(M::SPEC, ['default', '7078', ''], text,
      source('Augur is the leader. I must speak to Augur.', '予言者', '奥格尔'))
    assert_equal expected, actual
    refute excluded
  end

  def test_generic_affix_and_gem_are_not_assigned_to_the_person
    assert_equal ['점술가의', true],
      M.transform(M::SPEC, ['affix', '293', '11'], '점술가의',
        source("Augur's", 'オーガーズ', '占卜师'))
    assert_equal ['점술가의 보석', true],
      M.transform(M::SPEC, ['base', '826', '11'], '점술가의 보석',
        source("Augur's Gem", '予言者のジェム', '占卜师宝石'))
  end

  private

  def source(english, japanese, chinese)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end
end
