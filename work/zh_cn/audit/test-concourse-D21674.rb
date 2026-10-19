#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-concourse-D21674'

class ConcourseD21674Test < Minitest::Test
  def source
    {'en_texts_json' => '["Concourse"]', 'ja_texts_json' => '["コンコース"]', 'zh_text' => '菱形广场'}
  end

  def test_reviewed_name_spans_are_atomic_and_idempotent
    ConcourseD21674::SPANS.each do |id, (old, expected)|
      key = ['default', id, '']
      changed, excluded = ConcourseD21674.transform(nil, key, old, source)
      refute excluded
      assert_equal expected, changed
      assert_equal [expected, false], ConcourseD21674.transform(nil, key, changed, source)
    end
  end

  def test_generic_city_planning_is_not_promoted_to_a_name
    src = source.merge('en_texts_json' => '["city concourse"]')
    assert_equal ['도심 중심부', true],
      ConcourseD21674.transform(nil, ['default', '7190', ''], '도심 중심부', src)
  end

  def test_particles_follow_the_canonical_final_vowel
    assert_equal ['콩코스(Concourse)는 장관이다.', false],
      ConcourseD21674.transform(nil, ['default', '5450', ''], '중앙 광장(Concourse)은 장관이다.', source)
    assert_equal ['콩코스(Concourse)를 완성했다.', false],
      ConcourseD21674.transform(nil, ['default', '30111', ''], '대회랑(Concourse)을 완성했다.', source)
  end
end
