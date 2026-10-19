#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-julia-tam-D21589'

class JuliaTamD21589Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21589.tsv'))
                 .map(&:to_h)
  end

  def test_five_full_name_hits_are_separate_from_bardan_tam
    assert_equal ReviewJuliaTamD21589::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 5, @reviews.map { |row| M.key(row) }.uniq.length
    definition = M.table(ReviewJuliaTamD21589::DEFINITIONS).first
    assert_equal 'person:julia-tam', definition['entity_key']
    assert_equal '', definition['english_aliases']
    refute_equal 'person:bardan-tam', definition['entity_key']
    bardan = M.table(ReviewedProperNameDiscovery::GLOSSARY).find do |row|
      row['entity_key'] == 'person:bardan-tam'
    end
    refute_nil bardan
    assert_equal 'Bardan Tam', bardan['english_canonical']
    assert_equal '', bardan['english_aliases']
  end

  def test_only_unpaired_label_and_objective_were_changed
    changed = @reviews.select { |row| row['old'] != row['new'] }
    assert_equal %w[20257 34720], changed.map { |row| row['ID_Linha'] }.sort
    changed.each do |row|
      assert_equal 'accepted', row['status']
      assert_equal 1, row['new'].scan('줄리아 탐(Julia Tam)').length
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
    @reviews.reject { |row| changed.include?(row) }.each do |row|
      assert_equal row['old'], row['new']
      assert_equal 'not-an-issue', row['status']
    end
  end

  def test_bardan_occurrence_decisions_are_not_reopened
    index = M.table(M::INDEX)
    rows = index.select { |row| row['entity_key'] == 'person:bardan-tam' }
    assert_equal 12, rows.length
    assert_equal 3, rows.count { |row| row['status'] == 'accepted' }
    assert_equal 9, rows.count { |row| row['status'] == 'not-an-issue' }
    refute rows.any? { |row| @reviews.any? { |review| M.key(review) == M.key(row) } }
  end
end
