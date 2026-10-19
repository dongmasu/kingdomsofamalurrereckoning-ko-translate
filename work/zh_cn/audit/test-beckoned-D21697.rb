#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-beckoned-D21697'

class ReviewBeckonedD21697Test < Minitest::Test
  M = ReviewBeckonedD21697

  def test_scope_has_448_title_keys_and_fifteen_ordinary_verb_keys
    assert_equal 463, M::ALL_KEYS
    assert_equal 448, M::TITLE_KEYS
    assert_equal 15, M::VERB_KEYS
    assert_equal 43, M.candidate_keys(M::PRIOR_SNAPSHOT).length
  end

  def test_canonicalizes_title_and_moves_annotation_before_particles
    assert_equal '부름받은 자(Beckoned)여, 이리 오게.',
      M.canonicalize('선택받은 자여(Beckoned), 이리 오게.',
        ['default', '1', ''], source('Beckoned', '招かれし者', '天选者'))
    assert_equal '부름받은 자(The Beckoned)는 그대와 함께한다.',
      M.canonicalize('불려온 자(The Beckoned)는 그대와 함께한다.',
        ['default', '2', ''], source('The Beckoned', '招かれし者', '天选者'))
  end

  def test_preserves_ethene_qualifier_and_normalizes_spaced_form
    assert_equal '에테네(Ethene)의 부름받은 자(Beckoned)가 되었다.',
      M.canonicalize('에테네(Ethene)의 부름을 받은 자가 되었다.',
        M::ETHENE_TITLE_KEY, source('Beckoned of Ethene', 'エセンの招かれし者', '受到伊希恩召唤'))
    assert_equal '부름받은 자(Beckoned)여... 시간이 없다.',
      M.canonicalize('불려 온 자여... 시간이 없다.',
        M::SPACED_TITLE_KEY, source('Beckoned... not... time.', '招かれし者', '天选者'))
  end

  def test_lowercase_ordinary_verb_is_excluded
    assert_includes M::EXCLUDED_KEYS, ['default', '169', '']
    refute_includes M::EXCLUDED_KEYS, ['default', '9273', '']
    assert_equal ['excluded', '길이 나를 불렀다.', 'English lowercase beckoned is an ordinary verb here, not the player title.'],
      M.disposition(['default', '6706', ''],
        source('the open road beckoned.', '道が呼んでいた', '道路在召唤'),
        '길이 나를 불렀다.', '길이 나를 불렀다.')
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
