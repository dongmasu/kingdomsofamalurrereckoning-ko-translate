#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-castle-glory-wall-D21662'

class CastleGloryWallD21662Test < Minitest::Test
  def test_two_independent_site_spans_do_not_nest_or_change_other_names
    source = {
      'en_texts_json' => JSON.generate(['Wall of Whispers, beneath Castle Glory']),
      'ja_texts_json' => JSON.generate(['栄光の城のささやきの壁']),
      'zh_text' => '光荣城堡下面的私语墙壁'
    }
    key = ['default', '48605', '']
    old = '성 글로리 아래 속삭임의 장벽에서 퓨라(Pura)를 만났다.'
    castle, = CastleGloryWallD21662.transform({key: 'place:castle-glory'}, key, old, source)
    wall, = CastleGloryWallD21662.transform({key: 'place:wall-of-whispers'}, key, castle, source)
    expected = '영광의 성(Castle Glory) 아래 속삭임의 장벽(Wall of Whispers)에서 퓨라(Pura)를 만났다.'
    assert_equal expected, wall
    assert_equal [expected, false], CastleGloryWallD21662.transform(
      {key: 'place:castle-glory'}, key, wall, source
    )
  end
end
