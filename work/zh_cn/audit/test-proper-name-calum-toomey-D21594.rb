#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-calum-toomey-D21594'

class CalumToomeyD21594Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21594.tsv'))
                 .map(&:to_h)
  end

  def test_all_four_hits_share_the_full_person_entity
    assert_equal ReviewCalumToomeyD21594::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 4, @reviews.map { |row| M.key(row) }.uniq.length
    definition = M.table(ReviewCalumToomeyD21594::DEFINITIONS).first
    assert_equal 'person:calum-toomey', definition['entity_key']
    assert_equal '', definition['english_aliases']
    assert_equal '칼럼 투미(Calum Toomey)', definition['korean_canonical']
  end

  def test_three_unpaired_or_variant_names_are_corrected
    changed = @reviews.select { |row| row['old'] != row['new'] }
    assert_equal %w[33910 38218 45135], changed.map { |row| row['ID_Linha'] }.sort
    changed.each do |row|
      assert_equal 'accepted', row['status']
      assert_equal 1, row['new'].scan('칼럼 투미(Calum Toomey)').length
      refute_includes row['new'], '캘럼 투미'
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
    unchanged = @reviews.find { |row| row['ID_Linha'] == '20881' }
    assert_equal unchanged['old'], unchanged['new']
    assert_equal 'not-an-issue', unchanged['status']
  end

  def test_other_names_in_money_dispute_text_are_unchanged
    row = @reviews.find { |entry| entry['ID_Linha'] == '33910' }
    assert_includes row['new'], '엘와 브론드(Elwa Brond)'
    assert_includes row['new'], '케이프 솔라스(Cape Solace)'
  end
end
