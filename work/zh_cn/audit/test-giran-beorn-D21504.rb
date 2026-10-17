#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-giran-beorn-D21504'

class GiranBeornD21504Test < Minitest::Test
  def test_reviewed_people_and_atomic_journal
    if File.file?(GiranBeornD21504::REVIEWS)
      reviews = ReviewedNameBatches.table(GiranBeornD21504::REVIEWS).map(&:to_h)
    else
      _, _, reviews = GiranBeornD21504.prepare
    end
    assert_equal 38, reviews.length
    assert_equal 39, reviews.sum { |r| r['entity_key'].split('|').length }
    journal = reviews.find { |r| r['resource'] == 'base' }
    assert_equal "기란의 일지(Giran's Journal)", journal.fetch('new')
    assert_equal 'excluded',
                 JSON.parse(journal.fetch('entity_dispositions_json')).fetch(GiranBeornD21504::GIRAN)
    beorn_rows = reviews.select { |r| r['entity_key'] == GiranBeornD21504::BEORN }
    assert_equal 9, beorn_rows.length
    beorn_rows.each do |r|
      assert_includes r.fetch('new'), '베오른(Beorn)'
      refute_match(/비온|비오른|베른|베오른(?!\(Beorn\))/, r.fetch('new'))
    end
    reviews.each do |r|
      refute_match(/\(Giran\)\(Giran\)|\(Beorn\)\(Beorn\)/, r.fetch('new'))
      assert_equal r.fetch('old').scan(/\r\n|\r|\n/), r.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal r.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   r.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
    end
    %w[26485 40886].each do |id|
      assert_equal '기란 알바(Giran Alba)', reviews.find { |r| r['ID_Linha'] == id }.fetch('new')
    end
  end
end
