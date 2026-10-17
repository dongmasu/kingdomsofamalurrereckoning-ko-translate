#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-peace-edict-D21513'

class PeaceEdictD21513Test < Minitest::Test
  def test_exact_named_decree_and_preserved_rule_descriptions
    m = PeaceEdictD21513
    reviews = if File.file?(m::REVIEWS)
                ReviewedNameBatches.table(m::REVIEWS).map(&:to_h)
              else
                m.prepare.last
              end
    assert_equal 15, reviews.length
    assert_equal m.expected_pairs.sort,
                 reviews.map { |r| [r.fetch('entity_key'), *ReviewedNameBatches.key(r)] }.sort
    assert_equal 12, reviews.count { |r| r['old'] != r['new'] }
    assert_equal 3, reviews.count { |r| r['status'] == 'not-an-issue' }
    reviews.each do |row|
      assert_equal row.fetch('old').sub(/평화 칙령(?:\(Peace Edict\))?/, m::CANONICAL),
                   row.fetch('new')
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/), row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal 1, row.fetch('new').scan(m::CANONICAL).length
      assert_includes row.fetch('japanese'), '平和の布告'
      assert_includes row.fetch('chinese'), '和平法令'
    end
    row = reviews.find { |r| r.fetch('ID_Linha') == '63202' }
    assert_includes row.fetch('new'), '모든 필멸자는 무기를 함부로 휘둘러선 안 된다.'
  end
end
