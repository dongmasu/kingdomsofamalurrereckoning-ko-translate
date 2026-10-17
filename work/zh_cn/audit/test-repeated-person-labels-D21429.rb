#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-repeated-person-labels-D21429'

class RepeatedPersonLabelsD21429Test < Minitest::Test
  M = RepeatedPersonLabelsD21429

  def test_arkes_existing_full_label_is_untouched
    text = "아르케스(Arkes)는\r\n소중한 아르케스마저"
    assert_equal "아르케스(Arkes)는\r\n소중한 아르케스(Arkes)마저",
                 M.transform(text, M::RULES.fetch('3330')[:replacements])
  end

  def test_missing_or_duplicate_span_rejected
    changes = [['브레아', '브레아(Brea)']]
    assert_raises(RuntimeError) { M.transform('다른 이름', changes) }
    assert_raises(RuntimeError) { M.transform('브레아 브레아', changes) }
  end

  def test_no_duplicate_entity_key_per_row
    assert_equal 4, M::RULES.length
    assert_equal 6, M::RULES.values.sum { |rule| rule[:entities].length }
    assert M::RULES.values.all? { |rule| rule[:entities].uniq == rule[:entities] }
  end
end
