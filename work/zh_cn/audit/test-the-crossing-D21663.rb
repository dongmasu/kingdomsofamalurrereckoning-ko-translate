#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-the-crossing-D21663'

class TheCrossingD21663Test < Minitest::Test
  def source
    {
      'en_texts_json' => JSON.generate(['The Crossing']),
      'ja_texts_json' => JSON.generate(['力の交差点']), 'zh_text' => '关口'
    }
  end

  def test_independent_spellings_and_annotations
    %w[크로싱 교차로 교차점 크로싱(Crossing) 교차점(The\ Crossing)].each do |old|
      assert_equal [TheCrossingD21663::CANONICAL, false],
        TheCrossingD21663.transform(nil, ['default', '3023', ''], old, source)
    end
  end

  def test_existing_organization_annotation_is_not_nested
    old = '교차점의 힘과 교차점으로 가는 길. 교차점의 수호자들(Crossing Keepers).'
    expected = '크로싱(The Crossing)의 힘과 크로싱(The Crossing)으로 가는 길. 교차점의 수호자들(Crossing Keepers).'
    assert_equal [expected, false],
      TheCrossingD21663.transform(nil, ['default', '48605', ''], old, source)
  end

  def test_font_compound_is_excluded_without_resolving_basin_or_spring
    old = '교차로의 샘(Font of the Crossing)'
    assert_equal [old, true],
      TheCrossingD21663.transform(nil, ['default', '51297', ''], old, source)
  end

  def test_source_destination_is_restored_without_changing_keeper_term
    old = '페이(Fae)의 공허인 케어 엘라사(Caer Elatha)의 통로를 지나려면 감시관의 의식이 필요하다.'
    expected = '페이(Fae)의 공허인 케어 엘라사(Caer Elatha)에 있는 크로싱(The Crossing)에 들어가려면 감시관의 의식이 필요하다.'
    assert_equal [expected, false],
      TheCrossingD21663.transform(nil, ['default', '26306', ''], old, source)
  end
end
