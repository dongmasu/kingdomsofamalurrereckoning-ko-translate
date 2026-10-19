#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-chicken-overlord-D21712'

class ReviewChickenOverlordD21712Test < Minitest::Test
  M = ReviewChickenOverlordD21712

  def source(english)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['チキン・オーバーロード']),
      'zh_text' => '鸡领主'
    }
  end

  def test_standalone_name_gets_the_existing_canonical_pair
    revised, = M.transform(nil, ['default', '20002', ''],
                           '치킨 오버로드', source('Chicken Overlord'))
    assert_equal '치킨 오버로드(Chicken Overlord)', revised
  end

  def test_objective_name_is_standardized_without_changing_its_action
    revised, = M.transform(nil, ['default', '11055', ''],
                           '닭 대군주(Chicken Overlord)의 습격을 막아라.',
                           source('Fend of the Chicken Overlord Attack.'))
    assert_equal '치킨 오버로드(Chicken Overlord)의 습격을 막아라.', revised
  end

  def test_unreviewed_key_is_rejected
    assert_raises(KeyError) do
      M.transform(nil, ['default', '99999', ''], '치킨 오버로드',
                  source('Chicken Overlord'))
    end
  end
end
