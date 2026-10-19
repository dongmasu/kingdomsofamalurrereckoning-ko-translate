#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-sorcery-skill-tree-D21796'

class ReviewSorcerySkillTreeD21796Test < Minitest::Test
  M = ReviewSorcerySkillTreeD21796

  def test_source_classification_is_complete_and_preserves_terminal_rows
    assert_equal 50, M::SPECS.first.fetch(:count)
    assert_equal 28, M::REPLACEMENTS.length
    assert_equal 22, M::EXCLUSIONS.length
    assert_equal(
      %w[2580 5566],
      M::EXCLUSIONS.keys.select { |id| %w[2580 5566].include?(id) }
    )
  end

  def test_official_manual_spelling_is_the_canonical_form
    assert_equal '마법(Sorcery)', M::SPECS.first.fetch(:korean)
    assert_includes M::SPECS.first.fetch(:notes), 'PDF page 5'
    assert_equal [
      ['마법술(Sorcery)의 길은 마법사의 길입니다. 마법술은',
       '마법(Sorcery)의 길은 마법사의 길입니다. 마법은']
    ], M::REPLACEMENTS.fetch('7982')
  end

  def test_tokenized_category_label_preserves_placeholder
    before, after = M::REPLACEMENTS.fetch('37072').first
    assert_equal '{1}', before.scan(/\{[^}]+\}/).first
    assert_equal before.scan(/\{[^}]+\}/), after.scan(/\{[^}]+\}/)
    assert_includes after, '마법(Sorcery)'
  end
end
