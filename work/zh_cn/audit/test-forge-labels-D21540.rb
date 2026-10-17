#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-forge-labels-D21540'

class ForgeLabelsD21540Test < Minitest::Test
  R = ForgeLabelsD21540
  M = ReviewedNameBatches

  def reviews
    @reviews ||= R.reviews(M.refresh_inventory)
  end

  def test_exact_full_source_scope_and_decisions
    assert_equal 3, R.entities.length
    assert_equal 49, reviews.length
    assert_equal 49, reviews.map { |row| M.key(row) }.uniq.length
    assert_equal({ 'excluded' => 41, 'uncertain' => 3, 'accepted' => 4, 'not-an-issue' => 1 },
                 reviews.group_by { |row| row['status'] }.transform_values(&:length))
    assert_equal 4, reviews.count { |row| row['old'] != row['new'] }
  end

  def test_only_second_fate_card_mention_is_added
    row = reviews.find { |review| M.key(review) == ['default', '29104', ''] }
    assert_equal 2, row['new'].scan('단조(The Forge)').length
    assert_equal row['old'].sub('단조의 운명을', '단조(The Forge)의 운명을'), row['new']
    R::HOLDS.each do |key|
      hold = reviews.find { |review| M.key(review) == key }
      assert_equal 'uncertain', hold['status']
      assert_equal hold['old'], hold['new']
    end
    reviews.select { |review| review['status'] == 'excluded' }.each do |excluded|
      assert_equal excluded['old'], excluded['new']
    end
  end

  def test_source_local_forge_spellings_do_not_create_person_aliases
    assert R.entities.all? { |entity| entity['english_aliases'].empty? && entity['category'] == 'title' }
    %w[26736 60990].each do |id|
      row = reviews.find { |review| M.key(review) == ['default', id, ''] }
      expected = id == '26736' ? "블라스커의 대장간(Vlasker's Forge)" : "블라스카르의 대장간(Vlaskar's Forge)"
      assert_equal expected, row['new']
    end
    refute reviews.any? { |row| M.key(row) == ['base', '2645', '11'] }
    refute R.entities.any? { |entity| entity['entity_key'] == 'person:vlaskar' }
    reviews.each do |row|
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
  end
end
