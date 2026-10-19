#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-blink-bone-town-D21707'

class ReviewBlinkBoneTownD21707Test < Minitest::Test
  M = ReviewBlinkBoneTownD21707

  def test_batch_is_bounded_and_exactly_covers_dispositions
    assert_equal 21, M::DEFINITIONS[0].fetch(:count)
    assert_equal 6, M::DEFINITIONS[1].fetch(:count)
    assert_equal 8, M::BLINK_ABILITY_KEYS.length
    assert_equal 13, M::BLINK_EXCLUDED_KEYS.length
    assert_empty M::BLINK_ABILITY_KEYS & M::BLINK_EXCLUDED_KEYS
    assert_equal 11, M::TRANSFORMS.length
    assert_operator M::DEFINITIONS.sum { |spec| spec.fetch(:count) }, :<=, 50
  end

  def test_standalone_and_prose_ability_names_are_paired
    assert_equal ['점멸(Blink)', false],
      M.transform(M::DEFINITIONS[0], ['default', '531', ''], '점멸',
        source('Blink', 'ブリンク', '闪现'))
    assert_equal ['점멸(Blink) 능력에 독 효과가 더해집니다.', false],
      M.transform(M::DEFINITIONS[0], ['default', '28120', ''],
        '점멸 능력에 독 효과가 더해집니다.',
        source('enhance your Blink ability with poison', 'ブリンクの能力に毒の効果が追加', '闪现能力'))
  end

  def test_generic_blink_and_compound_skills_are_not_nested
    ['435', '24952', '45055', '50802'].each do |id|
      text = 'A blink or Ice Blink ability.'
      assert_equal [text, true],
        M.transform(M::DEFINITIONS[0], ['default', id, ''], text,
          source('Blink', 'ブリンク', '闪现'))
    end
  end

  def test_bone_town_uses_one_paired_place_form
    assert_equal ['본 타운(Bone Town)', false],
      M.transform(M::DEFINITIONS[1], ['default', '6479', ''], '본 타운',
        source('Bone Town', 'ボーン・タウン', '白骨镇'))
    assert_equal ['모래밭 때문에 본 타운(Bone Town)이라고 불러.', false],
      M.transform(M::DEFINITIONS[1], ['default', '58643', ''],
        '모래밭 때문에 뼈의 마을이라고 불러.',
        source('People call it Bone Town because of the pale rocks.', 'ボーンタウン', '白骨镇'))
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
