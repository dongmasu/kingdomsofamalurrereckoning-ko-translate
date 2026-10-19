#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'correct-title-inclusive-proper-name-labels-D21692'

class CorrectTitleInclusiveProperNameLabelsD21692Test < Minitest::Test
  M = CorrectTitleInclusiveProperNameLabelsD21692

  def test_mandolph_label_uses_established_full_title_pair
    change = M::CHANGES.fetch(['default', '39042', ''])
    assert_equal 'Ambassador Mandolph', change.fetch(:english)
    assert_equal '맨돌프 대사(Ambassador Mandolph)', change.fetch(:new)
    refute_includes change.fetch(:new), '맨돌프(Mandolph)'
  end

  def test_caledus_label_uses_established_rank_name_pair
    change = M::CHANGES.fetch(['base', '1114', '11'])
    assert_equal 'Archsage Caledus', change.fetch(:english)
    assert_equal '대현자 칼레두스(Archsage Caledus)', change.fetch(:new)
    assert_equal 'not-an-issue', change.fetch(:status)
  end

  def test_existing_dispositions_are_not_reclassified
    assert_equal 'accepted', M::CHANGES.fetch(['default', '39042', '']).fetch(:status)
    assert_equal 'not-an-issue', M::CHANGES.fetch(['base', '1114', '11']).fetch(:status)
    assert_equal 2, M::CHANGES.keys.uniq.length
  end
end
