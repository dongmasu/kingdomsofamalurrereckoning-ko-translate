#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-court-enchantments-D21502'

class CourtEnchantmentsD21502Test < Minitest::Test
  def test_complete_source_scope_and_atomic_labels
    if File.file?(CourtEnchantmentsD21502::REVIEWS)
      reviews = ReviewedNameBatches.table(CourtEnchantmentsD21502::REVIEWS).map(&:to_h)
    else
      _, _, reviews = CourtEnchantmentsD21502.prepare
    end
    assert_equal 66, reviews.length
    assert_equal 47, reviews.count { |r| r['old'] != r['new'] }
    assert_equal 1, reviews.count { |r| r['resource'] == 'base' }
    singular = reviews.find { |r| r['ID_Linha'] == '22031' }
    assert_equal singular.fetch('old'), singular.fetch('new')
    assert_includes singular.fetch('new'), '(Court of Enchantment)'
    plural = reviews.find { |r| r['ID_Linha'] == '22165' }
    assert_includes plural.fetch('new'), '(Court of Enchantments)'
    reviews.each do |r|
      label = r['ID_Linha'] == '22031' ?
        '마법의 궁정(Court of Enchantment)' : CourtEnchantmentsD21502::CANONICAL
      assert_equal 1, r.fetch('new').scan(Regexp.new(Regexp.escape(label))).length
      assert_equal r.fetch('old').scan(/\r\n|\r|\n/), r.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal r.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   r.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
    end
  end
end
