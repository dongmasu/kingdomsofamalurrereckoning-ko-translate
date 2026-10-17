#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-silent-choir-D21497'

class SilentChoirD21497Test < Minitest::Test
  R = SilentChoirD21497

  def test_normalizes_known_forms_and_adds_missing_bilingual_labels
    assert_equal '침묵의 합창단(Silent Choir)이 왔다.',
      R.normalize(R::FACTION, '침묵의 성가대가 왔다.', '12361')
    assert_equal '침묵의 합창단(Silent Choir)이 왔다.',
      R.normalize(R::FACTION, '무언의 성가대가 왔다.', '12361')
    assert_equal '침묵의 합창단(Silent Choir)이 왔다.',
      R.normalize(R::FACTION, '성가대(The Silent Choir)가 왔다.', '12361')
    assert_equal '침묵의 합창단(Silent Choir)이 왔다.',
      R.normalize(R::FACTION, '침묵의 합창단이 왔다.', '12361')
    assert_equal '침묵의 합창단(Silent Choir)은 엄격하다.',
      R.normalize(R::FACTION, '침묵의 성가대는 엄격하다.', '12361')
    assert_equal '침묵의 합창단(Silent Choir)을 방해하지 마.',
      R.normalize(R::FACTION, '침묵의 성가대를 방해하지 마.', '12361')
    assert_equal '침묵의 합창단(Silent Choir)과 싸웠다.',
      R.normalize(R::FACTION, '무언의 성가대와 싸웠다.', '12361')
  end

  def test_preserves_canonical_label_and_repeated_multiline_mentions
    canonical = R::FACTION_KOREAN
    assert_equal canonical, R.normalize(R::FACTION, canonical, '12361')
    source = "침묵의 성가대와 싸웠다.\r\n그 뒤 침묵의 성가대를 만났다."
    expected = "#{canonical}과 싸웠다.\r\n그 뒤 #{canonical}을 만났다."
    assert_equal expected, R.normalize(R::FACTION, source, '12361')
  end

  def test_creature_compound_remains_atomic
    assert_equal R::MONSTER_KOREAN,
      R.normalize(R::MONSTER, '침묵의 합창단 사냥개', '7319')
  end

  def test_exact_scope_is_unique_and_contains_all_source_keys
    assert_equal 27, R.expected_pairs.length
    assert_equal 27, R.expected_pairs.uniq.length
    assert_includes R.expected_pairs, [R::FACTION, 'default', '12361', '']
    assert_includes R.expected_pairs, [R::FACTION, 'default', '13120', '']
    assert_includes R.expected_pairs, [R::FACTION, 'default', '44647', '']
    assert_includes R.expected_pairs, [R::MONSTER, 'default', '7319', '']
  end
end
