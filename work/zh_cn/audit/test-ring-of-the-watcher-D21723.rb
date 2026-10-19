require 'minitest/autorun'
require_relative 'review-ring-of-the-watcher-D21723'

class ReviewRingOfTheWatcherD21723Test < Minitest::Test
  M = ReviewRingOfTheWatcherD21723

  def test_only_four_named_ruin_keys_are_in_scope
    assert_equal 4, M::SPEC.fetch(:count)
    assert_equal %w[45621 57117 62099 63025], M::IDS
    assert_equal 'place', M::SPEC.fetch(:category)
  end

  def test_complete_name_gets_one_non_nested_pair
    source = {
      'en_texts_json' => '["Ring of the Watcher"]',
      'ja_texts_json' => '["監視者の遺跡"]'
    }
    assert_equal ["'감시자의 고리(Ring of the Watcher)'", false],
                 M.transform(M::SPEC, ['default', '63025', ''], "'감시자의 고리'", source)
    assert_equal [M::SPEC.fetch(:korean), false],
                 M.transform(M::SPEC, ['default', '62099', ''], M::SPEC.fetch(:korean), source)
  end
end
