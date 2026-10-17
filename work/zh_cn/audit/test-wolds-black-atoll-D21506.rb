#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-wolds-black-atoll-D21506'

class WoldsAtollD21506Test < Minitest::Test
  def test_exact_region_and_artwork_scope
    if File.file?(WoldsAtollD21506::REVIEWS)
      reviews = ReviewedNameBatches.table(WoldsAtollD21506::REVIEWS).map(&:to_h)
    else
      _, _, reviews = WoldsAtollD21506.prepare
    end
    assert_equal 45, reviews.length
    assert_equal 46, reviews.sum { |r| r['entity_key'].split('|').length }
    by_key = reviews.to_h { |r| [[r['resource'], r['ID_Linha']], r] }
    assert_equal '월즈의 돌(Stone of the Wolds)', by_key.fetch(['base', '272']).fetch('new')
    assert_equal 'excluded',
                 JSON.parse(by_key.fetch(['base', '272']).fetch('entity_dispositions_json')).fetch(WoldsAtollD21506::WOLDS)
    assert_equal '월즈(The Wolds)', by_key.fetch(['default', '18586']).fetch('new')
    %w[16241 50599].each do |id|
      assert_includes by_key.fetch(['default', id]).fetch('new'), '월즈(Wolds)'
    end
    %w[16241 44807 44835 56977].each do |id|
      refute_includes by_key.fetch(['default', id]).fetch('new'), '월즈(The Wolds)'
    end
    %w[2499 3690].each do |id|
      row = by_key.fetch(['base', id])
      assert_equal row.fetch('old'), row.fetch('new')
    end
    %w[45087 52446].each do |id|
      assert_includes by_key.fetch(['default', id]).fetch('new'), '검은 환초(The Black Atoll)'
    end
    reviews.each do |r|
      assert_equal r.fetch('old').scan(/\r\n|\r|\n/), r.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal r.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   r.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      refute_match(/\(Wolds\)\(Wolds\)|볼즈|울즈/, r.fetch('new'))
    end
  end
end
