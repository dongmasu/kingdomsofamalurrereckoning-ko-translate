#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-cradle-of-summer-D21507'

class CradleSummerD21507Test < Minitest::Test
  def test_region_stone_and_poetic_holds
    if File.file?(CradleSummerD21507::REVIEWS)
      reviews = ReviewedNameBatches.table(CradleSummerD21507::REVIEWS).map(&:to_h)
    else
      _, _, reviews = CradleSummerD21507.prepare
    end
    assert_equal 59, reviews.length
    assert_equal 60, reviews.sum { |r| r['entity_key'].split('|').length }
    assert_equal 38, reviews.count { |r| r['old'] != r['new'] }
    assert_equal 2, reviews.count { |r| r['status'] == 'uncertain' }
    by_key = reviews.to_h { |r| [[r['resource'], r['ID_Linha']], r] }
    CradleSummerD21507::HOLDS.each do |id|
      row = by_key.fetch(['default', id])
      assert_equal 'uncertain', row.fetch('status')
      assert_equal row.fetch('old'), row.fetch('new')
    end
    stone = by_key.fetch(['base', '1967'])
    assert_equal '여름의 요람 돌(Cradle of Summer Stone)', stone.fetch('new')
    assert_equal 'excluded',
                 JSON.parse(stone.fetch('entity_dispositions_json')).fetch(CradleSummerD21507::PLACE)
    assert_equal 2, by_key.fetch(['default', '13274']).fetch('new').scan(CradleSummerD21507::CANONICAL).length
    assert_includes by_key.fetch(['default', '59513']).fetch('new'), '요람(Cradle)의 수호자'
    reviews.each do |row|
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/), row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
    end
  end
end
