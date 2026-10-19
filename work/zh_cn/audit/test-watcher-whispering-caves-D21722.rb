require 'minitest/autorun'
require_relative 'review-watcher-whispering-caves-D21722'

class ReviewWatcherWhisperingCavesD21722Test < Minitest::Test
  M = ReviewWatcherWhisperingCavesD21722

  def test_bounded_complete_source_scope
    assert_equal 22, M::SPECS.sum { |spec| spec.fetch(:count) }
    assert_equal 8, M::SENTRY_IDS.uniq.length
    assert_equal 6, M::CAVE_IDS.uniq.length
  end

  def test_unrelated_watcher_place_is_excluded
    source = { 'en_texts_json' => '["Ring of the Watcher"]' }
    assert_equal ['감시자의 고리', true],
                 M.transform(M::SPECS.first, ['default', '57117', ''], '감시자의 고리', source)
  end

  def test_first_sentry_mention_is_paired_without_repeating_anaphora
    source = { 'en_texts_json' => '["The Watcher sees me. The Watcher sounds an alarm."]' }
    assert_equal ['감시자(Watcher)가 보았다. 감시자가 울린다.', false],
                 M.transform(M::SPECS.first, ['default', '60618', ''],
                             '감시자가 보았다. 감시자가 울린다.', source)
  end

  def test_cave_normalizes_existing_spelling
    source = { 'en_texts_json' => '["Whispering Caves"]' }
    assert_equal ['속삭임 동굴(Whispering Caves)', false],
                 M.transform(M::SPECS.last, ['default', '16314', ''], '속삭이는 동굴', source)
  end

  def test_wrong_source_cannot_change_a_cave
    assert_raises(RuntimeError) do
      M.transform(M::SPECS.last, ['default', '16314', ''], '속삭이는 동굴',
                  { 'en_texts_json' => '["Other cave"]' })
    end
  end
end
