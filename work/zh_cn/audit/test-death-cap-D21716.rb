#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-death-cap-D21716'

class ReviewDeathCapD21716Test < Minitest::Test
  M = ReviewDeathCapD21716

  def source(english)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['デスキャップ']),
      'zh_text' => '死亡之帽'
    }
  end

  def test_inconsistent_base_item_name_uses_confirmed_pair
    revised, = M.transform(nil, ['base', '3066', '11'], '죽음갓',
                           source('Death Cap'))
    assert_equal '데스 캡(Death Cap)', revised
  end

  def test_existing_default_pair_is_retained
    text = '데스 캡(Death Cap)'
    assert_equal [text, false],
      M.transform(nil, ['default', '9404', ''], text, source('Death Cap'))
  end

  def test_unreviewed_korean_span_is_rejected
    assert_raises(RuntimeError) do
      M.transform(nil, ['base', '3066', '11'], '죽음의 모자',
                  source('Death Cap'))
    end
  end
end
