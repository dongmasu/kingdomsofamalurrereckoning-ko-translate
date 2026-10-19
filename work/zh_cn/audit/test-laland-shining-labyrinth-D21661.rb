#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-laland-shining-labyrinth-D21661'

class LalandShiningLabyrinthD21661Test < Minitest::Test
  def test_exact_locale_evidence_and_korean_targets
    LalandShiningLabyrinthD21661::TARGETS.each do |key, values|
      english, japanese, chinese, old, expected = values
      source = {
        'en_texts_json' => JSON.generate([english]),
        'ja_texts_json' => JSON.generate([japanese]), 'zh_text' => chinese
      }
      assert_equal [expected, false],
        LalandShiningLabyrinthD21661.transform(nil, key, old, source)
      assert_equal [expected, false],
        LalandShiningLabyrinthD21661.transform(nil, key, expected, source)
      assert_raises(RuntimeError) do
        LalandShiningLabyrinthD21661.transform(nil, key, '예상하지 않은 문자열', source)
      end
    end
  end
end
