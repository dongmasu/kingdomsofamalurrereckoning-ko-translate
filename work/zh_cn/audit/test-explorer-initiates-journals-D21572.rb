#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-explorer-initiates-journals-D21572'

class ExplorerInitiatesJournalsD21572Test < Minitest::Test
  R = ReviewExplorerInitiatesJournalsD21572

  def test_volumes_remain_separate_and_repeated_keys_remain_present
    assert_equal 9, R::VOLUMES.length
    assert_equal 14, R::VOLUMES.values.sum(&:length)
    assert_equal 12, R.specs.length
    assert_equal 17, R.specs.sum { |spec| spec[:count] }
    assert_equal 12, R.specs.map { |spec| spec[:key] }.uniq.length
  end

  def test_numbered_title_keeps_english_comma_and_numeral
    spec = R.specs.find { |row| row[:english] == "Explorer's Journal, VII" }
    assert_equal "탐험가의 일지 VII(Explorer's Journal, VII)",
                 R.replacement(spec, %w[base 1773 11], '탐험가의 일지 VII')
    assert_raises(RuntimeError) { R.replacement(spec, %w[base 972 11], '탐험가의 일지 I') }
  end

  def test_owned_title_does_not_nest_person_annotations
    spec = R.specs.find { |row| row[:english] == "Bertran's Journal" }
    assert_equal "버트런의 일지(Bertran's Journal)",
                 R.replacement(spec, %w[base 654 11], '버트런(Bertran)의 일지')
    assert_raises(RuntimeError) { R.replacement(spec, %w[default 29200], '버트런 네스트의 일지') }
  end
end
