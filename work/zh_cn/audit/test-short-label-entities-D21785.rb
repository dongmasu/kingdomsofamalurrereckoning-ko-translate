#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-entities-D21785'

class TestShortLabelEntitiesD21785 < Minitest::Test
  def test_confirmed_source_scopes
    assert_equal 5, ShortLabelEntitiesD21785::SPECS.length
    assert_equal [3, 6, 3, 7, 3],
                 ShortLabelEntitiesD21785::SPECS.map { |spec| spec.fetch(:count) }
  end

  def test_canonical_forms_are_complete_bilingual_pairs
    assert_equal [
      '폼베로(Pombero)',
      '로트클로(Rotclaw)',
      '프리즘미어 분지(Prismere Basin)',
      '칸드리안의 장미(Rose of Kandrian)',
      '프리즘미어 구슬(Prismere Orb)'
    ], ShortLabelEntitiesD21785::SPECS.map { |spec| spec.fetch(:korean) }
  end

  def test_particle_and_name_span_transforms
    pombero = ShortLabelEntitiesD21785::SPECS.fetch(0)
    assert_equal '폼베로(Pombero)의 처단자',
                 ShortLabelEntitiesD21785.transform(
                   pombero, ['default', '38683', ''], '폼베로의 처단자',
                   {
                     'en_texts_json' => '["Slayer of Pombero"]',
                     'ja_texts_json' => '["ポンベロを破った者"]',
                     'zh_text' => '庞贝罗的屠戮者'
                   }
                 ).first
  end

  def test_rose_accepts_the_aligned_chinese_genitive_variant
    rose = ShortLabelEntitiesD21785::SPECS.fetch(3)
    assert_equal '다음은 칸드리안의 장미(Rose of Kandrian)야.',
                 ShortLabelEntitiesD21785.transform(
                   rose, ['default', '28656', ''], '다음은 칸드리안의 장미야.',
                   {
                     'en_texts_json' => '["Collect the Rose of Kandrian."]',
                     'ja_texts_json' => '["そしてカンドリアンのバラ"]',
                     'zh_text' => '接下来是坎德利安的玫瑰'
                   }
                 ).first
  end
end
