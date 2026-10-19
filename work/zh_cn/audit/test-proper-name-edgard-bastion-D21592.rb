#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-edgard-bastion-D21592'

class EdgardBastionD21592Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21592.tsv'))
                 .map(&:to_h)
  end

  def test_all_seven_aligned_keys_use_one_full_name_entity
    assert_equal ReviewEdgardBastionD21592::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 7, @reviews.map { |row| M.key(row) }.uniq.length
    assert @reviews.all? { |row| row['resource'] == 'default' }
    definition = M.table(ReviewEdgardBastionD21592::DEFINITIONS).first
    assert_equal 'person:edgard-bastion', definition['entity_key']
    assert_equal '', definition['english_aliases']
    assert_equal '에드가드 배스천(Edgard Bastion)',
      definition['korean_canonical']
  end

  def test_only_unpaired_or_inconsistent_names_were_changed
    changed = @reviews.select { |row| row['old'] != row['new'] }
    assert_equal %w[21312 25567 35232 42803],
      changed.map { |row| row['ID_Linha'] }.sort
    changed.each do |row|
      assert_equal 'accepted', row['status']
      assert_equal 1, row['new'].scan('에드가드 배스천(Edgard Bastion)').length
      refute_includes row['new'], '에드가드 바스티온'
    end
    unchanged = @reviews.reject { |row| changed.include?(row) }
    assert_equal %w[17222 39449 4820].sort,
      unchanged.map { |row| row['ID_Linha'] }.sort
    assert unchanged.all? { |row| row['old'] == row['new'] && row['status'] == 'not-an-issue' }
  end
end
