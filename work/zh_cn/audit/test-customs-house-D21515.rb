#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-customs-house-D21515'

class CustomsHouseD21515Test < Minitest::Test
  def test_named_building_and_lexical_exceptions
    m = CustomsHouseD21515
    reviews = if File.file?(m::REVIEWS)
                ReviewedNameBatches.table(m::REVIEWS).map(&:to_h)
              else
                m.prepare.last
              end
    assert_equal 20, reviews.length
    assert_equal m.expected_pairs.sort,
                 reviews.map { |r| [r.fetch('entity_key'), *ReviewedNameBatches.key(r)] }.sort
    assert_equal 17, reviews.count { |r| r['old'] != r['new'] }
    by_id = reviews.to_h { |r| [r.fetch('ID_Linha'), r] }
    assert_equal 'excluded', by_id.fetch('51377').fetch('status')
    assert_equal 'uncertain', by_id.fetch('41569').fetch('status')
    %w[51377 41569 18374].each do |id|
      assert_equal by_id.fetch(id).fetch('old'), by_id.fetch(id).fetch('new')
    end
    m::COMPOUNDS.each do |id|
      row = by_id.fetch(id)
      assert_equal row.fetch('old').sub('라시르(Rathir) 세관', '라시르 세관(Rathir Customs House)'),
                   row.fetch('new')
      assert_includes row.fetch('new'), '라시르 세관(Rathir Customs House)'
      refute_includes row.fetch('new'), '(Rathir) 세관'
    end
    reviews.each do |row|
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/), row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      refute_match(/\([^)]*\(/, row.fetch('new'))
    end
  end
end
