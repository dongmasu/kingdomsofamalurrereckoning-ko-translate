#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-luminitsa-masterin-D21524'

class LuminitsaMasterinD21524Test < Minitest::Test
  def test_people_complete_labels_and_scoped_sender_particle
    m = LuminitsaMasterinD21524
    reviews = if File.file?(m::REVIEWS)
                ReviewedNameBatches.table(m::REVIEWS).map(&:to_h)
              else
                m.prepare.last
              end
    assert_equal 26, reviews.length
    assert_equal 31, reviews.sum { |r| r.fetch('entity_key').split('|').length }
    assert_equal 12, reviews.count { |r| r['old'] != r['new'] }
    by_key = reviews.to_h { |r| [ReviewedNameBatches.key(r), r] }
    m::COMPOUNDS.each do |key, spec|
      row = by_key.fetch(key)
      assert_equal 'excluded', JSON.parse(row.fetch('entity_dispositions_json')).fetch(m::PERSON)
      assert_includes row.fetch('new'), spec[2]
      refute_includes row.fetch('new'), '루미니차(Luminitsa)의'
    end
    sender = by_key.fetch(['default', '56239', ''])
    assert_equal sender.fetch('old').sub('루미니차(Luminitsa)에서', '루미니차(Luminitsa)가'),
                 sender.fetch('new')
    thinker = by_key.fetch(['default', '33025', ''])
    assert_equal 2, thinker.fetch('new').scan('맥심 마스터린(Maxim Masterin)').length
    assert_equal 1, thinker.fetch('new').scan('맥심(Maxim)은').length
    assert_includes thinker.fetch('new'), '서가 네 개, 자물쇠 네 개. 우연일 리 없다!'
    reviews.each do |row|
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/), row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      refute_match(/\([^)]*\(/, row.fetch('new'))
    end
  end
end
