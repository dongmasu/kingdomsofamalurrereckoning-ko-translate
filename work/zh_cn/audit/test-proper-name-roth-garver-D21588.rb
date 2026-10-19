#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-roth-garver-D21588'

class RothGarverD21588Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21588.tsv'))
                 .map(&:to_h)
  end

  def test_reviews_every_exact_source_key_without_component_aliases
    assert_equal ReviewRothGarverD21588::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 6, @reviews.map { |row| M.key(row) }.uniq.length
    assert @reviews.all? { |row| row['resource'] == 'default' }
    definition = M.table(ReviewRothGarverD21588::DEFINITIONS).first
    assert_equal '', definition['english_aliases']
    assert_equal '로스 가버(Roth Garver)', definition['korean_canonical']
  end

  def test_only_three_unpaired_names_were_added
    changed = @reviews.select { |row| row['old'] != row['new'] }
    assert_equal %w[20738 25864 29530], changed.map { |row| row['ID_Linha'] }.sort
    assert_equal 'accepted', changed.map { |row| row['status'] }.uniq.fetch(0)
    @reviews.reject { |row| changed.include?(row) }.each do |row|
      assert_equal row['old'], row['new']
      assert_equal 'not-an-issue', row['status']
    end
    changed.each do |row|
      assert_equal 1, row['new'].scan('로스 가버(Roth Garver)').length
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
  end

  def test_prior_barghest_decisions_remain_separate_and_unchanged
    index = M.table(M::INDEX)
    expected = {
      ['monster:barghest', '7491'] => 'not-an-issue',
      ['monster:night-barghest', '7491'] => 'accepted',
      ['monster:barghest', '29530'] => 'accepted',
      ['monster:night-barghest', '29530'] => 'accepted'
    }
    expected.each do |(entity, id), status|
      row = index.find do |entry|
        entry['entity_key'] == entity && entry['resource'] == 'default' &&
          entry['ID_Linha'] == id
      end
      refute_nil row
      assert_equal status, row['status']
      assert_includes row['korean_current'], 'Night Barghest'
    end
  end
end
