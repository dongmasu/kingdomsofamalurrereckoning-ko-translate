#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21718'

class ReviewShortLabelCandidatesD21718Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21718

  def test_batch_is_within_the_reviewed_key_limit
    assert_equal 9, M::GROUPS.length
    assert_equal 49, M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }
    assert_operator M::GROUPS.values.sum { |group| group.fetch(:expected_keys) }, :<=, 50
  end

  def test_only_supported_named_place_and_item_are_registered
    assert_equal %w[
      place:cathedral-of-the-world
      item:chalice-of-forced-vintage
    ], M::SPECS.map { |spec| spec.fetch(:key) }
    assert_equal 'uncertain', M::GROUPS.fetch('Bolgan Bane').fetch(:disposition)
    assert_equal 'not-an-issue', M::GROUPS.fetch('Captain at Arms').fetch(:disposition)
  end

  def test_chalice_edits_are_exact_key_scoped
    assert_equal 6, M::TRANSFORMS.keys.count { |key| key.first == 'default' }
    assert_equal 1, M::TRANSFORMS.keys.count { |key| key.first == 'base' }
    assert_equal '세계의 대성당(Cathedral of the World)',
                 M::TRANSFORMS.fetch(['default', '51135', '']).last
    assert_equal 7, M::TRANSFORMS.length
  end

  def test_chalice_transform_requires_aligned_english_name
    source = {
      'en_texts_json' => JSON.generate(['Unrelated vessel']),
      'ja_texts_json' => JSON.generate(['ワイン作りの聖杯']),
      'zh_text' => '强制酿造酒杯'
    }
    spec = M::SPECS.find { |item| item.fetch(:key) == 'item:chalice-of-forced-vintage' }
    assert_raises(RuntimeError) do
      M.transform(spec, ['default', '59271', ''], '강제 숙성의 성배', source)
    end
  end
end
