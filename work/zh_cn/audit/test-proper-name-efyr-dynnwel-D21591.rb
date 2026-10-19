#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-efyr-dynnwel-D21591'

class EfyrDynnwelD21591Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21591.tsv'))
                 .map(&:to_h)
  end

  def test_all_seven_aligned_name_keys_are_reviewed
    assert_equal ReviewEfyrDynnwelD21591::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 7, @reviews.map { |row| M.key(row) }.uniq.length
    assert @reviews.all? { |row| row['resource'] == 'default' }
    definition = M.table(ReviewEfyrDynnwelD21591::DEFINITIONS).first
    assert_equal 'person:efyr-dynnwel', definition['entity_key']
    assert_equal '', definition['english_aliases']
    assert_equal '에피르 딘웰(Efyr Dynnwel)',
      definition['korean_canonical']
  end

  def test_only_five_unpaired_occurrences_were_changed
    changed = @reviews.select { |row| row['old'] != row['new'] }
    assert_equal %w[10022 30720 34109 46969 59474],
      changed.map { |row| row['ID_Linha'] }.sort
    changed.each do |row|
      assert_equal 'accepted', row['status']
      assert_equal 1, row['new'].scan('에피르 딘웰(Efyr Dynnwel)').length
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
    unchanged = @reviews.reject { |row| changed.include?(row) }
    assert_equal %w[13362 38870], unchanged.map { |row| row['ID_Linha'] }.sort
    assert unchanged.all? { |row| row['old'] == row['new'] && row['status'] == 'not-an-issue' }
  end

  def test_other_named_people_and_items_remain_intact
    row = @reviews.find { |entry| entry['ID_Linha'] == '13362' }
    assert_includes row['new'], '가브로슈 발레(Gavroche Valle)'
    row = @reviews.find { |entry| entry['ID_Linha'] == '10022' }
    assert_includes row['new'], "할데비어의 칼날(Haldebier's Blade)"
    row = @reviews.find { |entry| entry['ID_Linha'] == '46969' }
    assert_includes row['new'], '가브로슈 발레(Gavroche Valle)'
    assert_includes row['new'], '아이언패스트 요새(Ironfast Keep)'
  end
end
