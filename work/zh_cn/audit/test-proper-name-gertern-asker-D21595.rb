#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-gertern-asker-D21595'

class GerternAskerD21595Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21595.tsv'))
                 .map(&:to_h)
  end

  def test_all_six_full_name_hits_are_reviewed
    assert_equal ReviewGerternAskerD21595::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 6, @reviews.map { |row| M.key(row) }.uniq.length
    definition = M.table(ReviewGerternAskerD21595::DEFINITIONS).first
    assert_equal 'person:gertern-asker', definition['entity_key']
    assert_equal '', definition['english_aliases']
    assert_equal '게르턴 애스커(Gertern Asker)',
      definition['korean_canonical']
  end

  def test_all_local_variants_are_standardized_without_touching_short_name
    assert @reviews.all? { |row| row['status'] == 'accepted' }
    assert @reviews.all? do |row|
      row['new'].include?('게르턴 애스커(Gertern Asker)') &&
        !row['new'].include?('게르턴 아스커') &&
        !row['new'].include?('거턴 애스커')
    end
    row = @reviews.find { |entry| entry['ID_Linha'] == '59318' }
    assert_includes row['new'], '게르턴 애스커(Gertern Asker)와 형제'
    assert_includes row['new'], '게르턴은 도시'
    refute_includes row['new'], '게르턴(Gertern)'
    @reviews.each do |row|
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
  end

  def test_adjacent_place_and_resource_names_are_preserved
    row = @reviews.find { |entry| entry['ID_Linha'] == '24693' }
    assert_includes row['new'], '브리슬텅 씨앗(Bristletongue Seeds)'
    assert_includes row['new'], '펠타운(Felltown)'
    row = @reviews.find { |entry| entry['ID_Linha'] == '59318' }
    assert_includes row['new'], '언더스타일(The Understyle)'
    assert_includes row['new'], '자카센'
  end
end
