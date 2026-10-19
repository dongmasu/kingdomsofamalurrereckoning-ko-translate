#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-rose-of-shadows-D21668'

class RoseOfShadowsD21668Test < Minitest::Test
  def source
    {
      'en_texts_json' => JSON.generate(['Rose-of-Shadows']),
      'ja_texts_json' => JSON.generate(['シャドウローズ']), 'zh_text' => '暗影玫瑰'
    }
  end

  def test_all_attested_spelling_variants
    ['그림자 장미', '그림자의 장미', '장미의 그림자', RoseOfShadowsD21668::CANONICAL].each do |old|
      assert_equal [RoseOfShadowsD21668::CANONICAL, false],
        RoseOfShadowsD21668.transform(nil, ['base', '3795', '11'], old, source)
    end
  end

  def test_other_entity_spans_and_tokens_are_unchanged
    old = '겔핀(Gelphyne)에게 그림자의 장미(Rose-of-Shadows)를 사라. {*1 보조인}'
    expected = '겔핀(Gelphyne)에게 그림자 장미(Rose-of-Shadows)를 사라. {*1 보조인}'
    assert_equal [expected, false],
      RoseOfShadowsD21668.transform(nil, ['default', '6817', ''], old, source)
  end

  def test_unreviewed_key_fails_closed
    assert_raises(RuntimeError) do
      RoseOfShadowsD21668.transform(nil, ['default', '1', ''], '그림자 장미', source)
    end
  end
end
