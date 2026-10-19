#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-brownie-species-D21709'

class ReviewBrownieSpeciesD21709Test < Minitest::Test
  M = ReviewBrownieSpeciesD21709

  def test_bounded_corpus_and_explicit_exclusions
    assert_equal 73, M::ALL_KEYS
    assert_equal 67, M::DIRECT_SPECIES_KEYS
    assert_equal 6, M::EXCLUDED.length
    assert_operator M::DIRECT_SPECIES_KEYS, :<=, 2 * 50
    assert_equal [50, 23], (1..M::ALL_KEYS).each_slice(50).map(&:length)
    assert_includes M::EXCLUDED, ['base', '1489', '11']
    assert_includes M::EXCLUDED, ['default', '8480', '']
    assert_includes M::EXCLUDED, ['default', '25694', '']
    assert_includes M::EXCLUDED, ['default', '36203', '']
  end

  def test_singular_and_plural_follow_english_number
    singular = source('Brownie', 'ブラウニー', '棕矮妖')
    plural = source('Brownies', 'ブラウニーたち', '棕矮妖')
    already_paired = source('Brownies', 'ブラウニーたち', '棕矮妖')

    assert_equal ['브라우니(Brownie)가 나타났다.', false],
      M.transform(nil, ['default', '1', ''], '브라우니가 나타났다.', singular)
    assert_equal ['브라우니(Brownies) 무리가 왔다.', false],
      M.transform(nil, ['default', '2', ''], '브라우니 무리가 왔다.', plural)
    assert_equal ['브라우니(Brownies) 무리가 왔다.', false],
      M.transform(nil, ['default', '3', ''], '브라우니(Brownie) 무리가 왔다.',
                  already_paired)
  end

  def test_compound_and_uncertain_rows_remain_unchanged
    [
      [['default', '8480', ''], '브라우니(Brownie) 소스'],
      [['default', '25694', ''], '브라우니의 이빨'],
      [['default', '36203', ''], '역병 브라우니(Pestilent Brownie)'],
      [['default', '37398', ''], '브라우니 소굴(The Brownie Den)']
    ].each do |key, text|
      assert_equal [text, true], M.transform(nil, key, text,
                                              source('Brownie', 'ブラウニー', '棕矮妖'))
    end
  end

  private

  def source(english, japanese, chinese)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end
end
