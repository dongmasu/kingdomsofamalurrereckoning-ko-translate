#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-sparrows-D21671'

class SparrowsD21671Test < Minitest::Test
  def source(english = 'The Sparrows')
    {'en_texts_json' => JSON.generate([english]), 'ja_texts_json' => '["スズメ"]', 'zh_text' => '麻雀'}
  end

  def test_standalone_full_article_and_necessary_object_particle
    assert_equal ['참새단(The Sparrows)', false],
      SparrowsD21671.transform(nil, ['default', '9725', ''], '참새들', source)
    assert_equal ['참새단(Sparrows)을 모아야 해.', false],
      SparrowsD21671.transform(nil, ['default', '4499', ''], '스패로우단(Sparrows)를 모아야 해.', source)
  end

  def test_member_eulogy_does_not_register_a_global_singular_identity
    old = '참새들아, 라프는 참새였어.'
    expected = '참새단(Sparrows)이여, 라프는 참새단원(Sparrow)이었어.'
    assert_equal [expected, false],
      SparrowsD21671.transform(nil, ['default', '31232', ''], old, source)
  end

  def test_ordinary_birds_in_farming_book_are_excluded
    source = {
      'en_texts_json' => JSON.generate(['Sparrowgrass is nothing to do with Sparrows at all']),
      'ja_texts_json' => JSON.generate(['雀とは何の関係もない']), 'zh_text' => '麻雀没有任何关系'
    }
    old = '스패로우그래스는 참새와 아무 상관이 없다.'
    assert_equal [old, true], SparrowsD21671.transform(nil, ['default', '59501', ''], old, source)
  end
end
