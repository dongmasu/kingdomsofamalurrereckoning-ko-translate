#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-rahnil-D21660'

class RahnilD21660Test < Minitest::Test
  def source(english = 'Rahnil')
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['ラーニル']),
      'zh_text' => '拉尼尔'
    }
  end

  def test_established_label_and_spelling_variant
    %w[라닐 라흐닐 라닐(Rahnil) 라흐닐(Rahnil)].each do |old|
      assert_equal [RahnilD21660::CANONICAL, false],
        RahnilD21660.transform(nil, ['default', '50605', ''], old, source)
    end
  end

  def test_both_mentions_and_other_name_bytes_are_preserved
    text = "알레이아(Alleia)는 라닐 안에 있다.\r\n라닐에 가자."
    result, excluded = RahnilD21660.transform(
      nil, ['default', '36130', ''], text, source('Inside Rahnil. Enter Rahnil.')
    )
    refute excluded
    assert_equal "알레이아(Alleia)는 라닐(Rahnil) 안에 있다.\r\n라닐(Rahnil)에 가자.", result
  end

  def test_generic_altar_descriptor_is_not_an_entity
    assert_equal ['라닐(Rahnil)의 제단', false], RahnilD21660.transform(
      nil, ['base', '551', '11'], '라닐(Rahnil)의 제단', source('Rahnil Altar')
    )
  end

  def test_missing_mentions_and_unknown_keys_fail_closed
    assert_raises(RuntimeError) do
      RahnilD21660.transform(nil, ['default', '9668', ''], '동굴', source)
    end
    assert_raises(RuntimeError) do
      RahnilD21660.transform(nil, ['default', '1', ''], '라닐', source)
    end
  end
end
