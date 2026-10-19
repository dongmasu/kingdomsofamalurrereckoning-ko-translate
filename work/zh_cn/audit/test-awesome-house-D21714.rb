#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-awesome-house-D21714'

class ReviewAwesomeHouseD21714Test < Minitest::Test
  M = ReviewAwesomeHouseD21714

  def source(english, japanese, chinese)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end

  def test_house_name_is_translated_and_bilingual
    revised, = M.transform(nil, ['base', '2769', '11'], '멋진 집',
                           source('Awesome House', '素晴らしい家', '惊奇房屋'))
    assert_equal '멋진 집(Awesome House)', revised
  end

  def test_key_relationship_and_particle_are_preserved
    revised, = M.transform(nil, ['base', '1566', '11'],
      '어썸 하우스(Awesome House)의 열쇠',
      source('Key to Awesome House', '素晴らしい家への鍵', '惊奇的家的钥匙'))
    assert_equal '멋진 집(Awesome House)의 열쇠', revised
  end

  def test_wrong_existing_span_is_rejected
    assert_raises(RuntimeError) do
      M.transform(nil, ['base', '2769', '11'], '별채',
                  source('Awesome House', '素晴らしい家', '惊奇房屋'))
    end
  end
end
