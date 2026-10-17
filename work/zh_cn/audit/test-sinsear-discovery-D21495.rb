#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-sinsear-discovery-D21495'

class SinsearDiscoveryD21495Test < Minitest::Test
  R = SinsearDiscoveryD21495

  def test_adds_the_english_pair_without_changing_surrounding_text
    assert_equal '신시어(Sinsear)의 문을 열어.',
      R.normalize('신시어의 문을 열어.')
    assert_equal '신시어(Sinsear) 공허에 있는 토템.',
      R.normalize('신시어 공허에 있는 토템.')
  end

  def test_corrects_the_known_korean_spelling_and_remains_idempotent
    corrected = '신시어(Sinsear)의 장벽'
    assert_equal corrected, R.normalize('신세어(Sinsear)의 장벽')
    assert_equal corrected, R.normalize(corrected)
  end

  def test_preserves_existing_bilingual_names_and_repeats
    source = '신시어(Sinsear)에서 신시어로 가야 해.'
    expected = '신시어(Sinsear)에서 신시어(Sinsear)로 가야 해.'
    assert_equal expected, R.normalize(source)
  end

  def test_never_nests_or_relabels_other_names
    source = '통곡하는 왕(Weeping King)의 동굴, 신시어(Sinsear).'
    assert_equal source, R.normalize(source)
  end

  def test_scope_is_the_complete_reviewed_source_inventory
    assert_equal 37, R.expected_pairs.length
    assert_equal 37, R.expected_pairs.uniq.length
    assert_includes R.expected_pairs, ['base', '3822', '11']
    assert_includes R.expected_pairs, ['default', '63068', '']
  end
end
