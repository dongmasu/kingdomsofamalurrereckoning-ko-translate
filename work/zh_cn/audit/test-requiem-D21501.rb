#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-requiem-D21501'

class RequiemD21501Test < Minitest::Test
  def test_reviewed_ship_spans_and_exclusions
    if File.file?(RequiemD21501::REVIEWS)
      definition = ReviewedNameBatches.table(RequiemD21501::DEFINITIONS).first
      reviews = ReviewedNameBatches.table(RequiemD21501::REVIEWS).map(&:to_h)
    else
      _, definition, reviews = RequiemD21501.prepare
    end
    assert_equal '레퀴엠호(The Requiem)', definition.fetch('korean_canonical')
    assert_equal 27, reviews.length
    assert_equal 21, reviews.count { |r| r['old'] != r['new'] }
    assert_equal 3, reviews.count { |r| r['status'] == 'excluded' }
    by_id = reviews.to_h { |r| [[r['resource'], r['ID_Linha']], r] }
    %w[9763 59459 62559].each do |id|
      row = by_id.fetch(['default', id])
      assert_equal 'excluded', row.fetch('status')
      assert_equal row.fetch('old'), row.fetch('new')
    end
    {
      '2689' => '레퀴엠호(The Requiem)를',
      '5129' => '레퀴엠호(The Requiem)는',
      '22725' => '레퀴엠호(The Requiem)를',
      '38723' => '레퀴엠호(The Requiem)는',
      '63840' => '레퀴엠호(Requiem)가',
      '63909' => '레퀴엠호(The Requiem)가'
    }.each { |id, span| assert_includes by_id.fetch(['default', id]).fetch('new'), span }
    reviews.reject { |r| r['status'] == 'excluded' }.each do |r|
      assert_equal 1, r.fetch('new').scan(/레퀴엠호\((?:The )?Requiem\)/).length
      assert_equal r.fetch('old').scan(/\r\n|\r|\n/), r.fetch('new').scan(/\r\n|\r|\n/)
    end
  end
end
