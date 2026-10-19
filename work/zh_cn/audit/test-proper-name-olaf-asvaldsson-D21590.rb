#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-olaf-asvaldsson-D21590'

class OlafAsvaldssonD21590Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21590.tsv'))
                 .map(&:to_h)
  end

  def test_all_eleven_aligned_keys_are_reviewed_as_one_full_name
    assert_equal ReviewOlafAsvaldssonD21590::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 11, @reviews.map { |row| M.key(row) }.uniq.length
    assert @reviews.all? { |row| row['resource'] == 'default' }
    definition = M.table(ReviewOlafAsvaldssonD21590::DEFINITIONS).first
    assert_equal 'person:olaf-asvaldsson', definition['entity_key']
    assert_equal '', definition['english_aliases']
    assert_equal '올라프 아스발드손(Olaf Asvaldsson)',
      definition['korean_canonical']
  end

  def test_only_five_unpaired_name_spans_were_added
    changed = @reviews.select { |row| row['old'] != row['new'] }
    assert_equal %w[17298 19979 38671 43758 46839],
      changed.map { |row| row['ID_Linha'] }.sort
    changed.each do |row|
      assert_equal 'accepted', row['status']
      assert_equal 1, row['new'].scan('올라프 아스발드손(Olaf Asvaldsson)').length
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
  end

  def test_short_name_and_surrounding_text_are_preserved
    row = @reviews.find { |entry| entry['ID_Linha'] == '46839' }
    assert_includes row['new'], '올라프 아스발드손(Olaf Asvaldsson)이라는 이름의 용병'
    assert_includes row['new'], '올라프를 풀어 주고'
    refute_includes row['new'], '올라프(Olaf)'
    log = @reviews.find { |entry| entry['ID_Linha'] == '63688' }
    assert_equal log['old'], log['new']
    assert_includes log['new'], '감방 8: 올라프 아스발드손(Olaf Asvaldsson)'
  end
end
