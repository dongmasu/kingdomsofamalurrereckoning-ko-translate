#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-dark-sliver-D21717'

class ReviewDarkSliverD21717Test < Minitest::Test
  M = ReviewDarkSliverD21717

  def source(english)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['ダークシルバー']),
      'zh_text' => '暗银'
    }
  end

  def test_all_korean_variants_normalize_to_one_bilingual_item_name
    {
      ['base', '1641', '11'] => '어두운 파편',
      ['base', '4493', '11'] => '어둠의 파편',
      ['default', '16447', ''] => '다크 슬리버(Dark Sliver)',
      ['default', '59908', ''] => '어둠의 조각'
    }.each do |key, old|
      revised, = M.transform(nil, key, old, source('Dark Sliver'))
      assert_equal '어둠의 파편(Dark Sliver)', revised
    end
  end

  def test_staff_description_is_not_changed_outside_the_name_span
    revised, = M.transform(nil, ['default', '16447', ''],
      '또 왔군. 내 지팡이 다크 슬리버(Dark Sliver)가 아직도 탐나나?',
      source('You again. Still interested in my staff, Dark Sliver?'))
    assert_equal '또 왔군. 내 지팡이 어둠의 파편(Dark Sliver)가 아직도 탐나나?',
      revised
  end

  def test_unreviewed_label_is_rejected
    assert_raises(RuntimeError) do
      M.transform(nil, ['base', '1641', '11'], '다른 이름',
                  source('Dark Sliver'))
    end
  end
end
