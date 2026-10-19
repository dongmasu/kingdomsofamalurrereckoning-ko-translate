#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21695'

class ReviewShortLabelCandidatesD21695Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21695

  def test_scope_stays_within_fifty_distinct_keys
    assert_equal 8, M::REVIEWED.length
    assert_equal 39, M::REVIEWED.values.sum { |row| row.fetch(:count) }
    assert_equal 4, M::REVIEWED.values.count { |row| row.fetch(:disposition) == 'uncertain' }
    assert_operator M::REVIEWED.values.sum { |row| row.fetch(:count) }, :<=, 50
  end

  def test_only_the_two_approved_event_labels_change
    assert_equal ['승천(Ascension)', false],
      M.transform(M::DEFINITIONS[0], ['default', '7802', ''],
        '즉위', source('Ascension', '即位', '升天'))
    assert_equal ['갈라포르 평원 전투(Battle for Galafor Plain)', false],
      M.transform(M::DEFINITIONS[1], ['default', '24307', ''],
        '갈라포르 평원의 전투',
        source('Battle for Galafor Plain', 'ガラフォー平原の戦い', '加拉弗平原之战'))
    assert_equal ['갈라포르 평원 전투(Battle for Galafor Plain)', false],
      M.transform(M::DEFINITIONS[1], ['default', '10739', ''],
        '갈라포르 평원 전투',
        source('The Battle for Galafor Plain was decisive.',
          'ガラフォー平原の戦い', '加拉弗尔平原战役'))
  end

  def test_existing_bilingual_event_mentions_remain_unchanged
    assert_equal ['승천(Ascension)', false],
      M.transform(M::DEFINITIONS[0], ['default', '13305', ''],
        '승천(Ascension)', source('Ascension', '昇天', '浮空'))
    assert_equal ['갈라포르 평원 전투(Battle for Galafor Plain)', false],
      M.transform(M::DEFINITIONS[1], ['default', '52524', ''],
        '갈라포르 평원 전투(Battle for Galafor Plain)',
        source('Battle for Galafor Plain', 'ガラフォー平原の戦い', '加拉弗平原之战'))
  end

  def test_ambiguous_candidates_remain_holds
    %w[Antechamber Aurochs Awesome\ House Basilica].each do |term|
      assert_equal 'uncertain', M::REVIEWED.fetch(term).fetch(:disposition)
    end
  end

  def test_generic_ascension_uses_are_excluded_from_the_named_event
    assert_equal ['A magical ascension.', true],
      M.transform(M::DEFINITIONS[0], ['default', '10908', ''],
        'A magical ascension.', source('A magical ascension.', '復活', '提升'))
  end

  private

  def source(english, japanese, chinese)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end
end
