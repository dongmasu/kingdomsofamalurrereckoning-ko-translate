#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-named-armor-labels-D21536'

class NamedArmorLabelsD21536Test < Minitest::Test
  R = NamedArmorLabelsD21536
  M = ReviewedNameBatches

  def reviews
    @reviews ||= R.reviews(M.refresh_inventory)
  end

  def test_twenty_complete_labels_without_extra_source_matches
    assert_equal 20, R.entities.length
    assert_equal 20, reviews.length
    assert_equal 15, reviews.count { |row| row['status'] == 'accepted' }
    assert_equal 5, reviews.count { |row| row['status'] == 'not-an-issue' }
    reviews.each do |row|
      refute_empty row['japanese']
      refute_empty row['chinese']
      assert_equal 'base', row['resource']
      assert_equal '11', row['Tipo_Variante']
      assert row['new'].end_with?("(#{row['english']})")
      assert_equal 1, row['new'].count('(')
    end
  end

  def test_existing_guardian_and_valley_annotations_unchanged
    %w[2770 2884 3610 4594 3447].each do |id|
      row = reviews.find { |review| review['ID_Linha'] == id }
      assert_equal row['old'], row['new']
    end
    refute reviews.any? { |row| row['ID_Linha'] == '1860' }
    assert_equal '지디의 두건(Zyddie’s Cowl)',
                 reviews.find { |row| row['ID_Linha'] == '3874' }['new']
    assert_equal '바로넷의 칼날(Baronett\'s Blades)',
                 reviews.find { |row| row['ID_Linha'] == '174' }['new']
  end

  def test_existing_deity_decisions_remain_separate_and_no_global_aliases
    entities = R.entities.map { |entity| entity['entity_key'] }
    index = M.table(M::INDEX)
    refute index.any? { |row| entities.include?(row['entity_key']) }
    assert_equal 'not-an-issue',
                 index.find { |row| row['entity_key'] == 'deity:lunala' && M.key(row) == ['base', '1803', '11'] }['status']
    assert_equal 'accepted',
                 index.find { |row| row['entity_key'] == 'deity:vraekor' && M.key(row) == ['base', '3986', '11'] }['status']
    assert R.entities.all? { |entity| entity['english_aliases'].empty? && entity['category'] == 'item' }
  end
end
