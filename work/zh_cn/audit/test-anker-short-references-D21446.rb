#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-anker-short-references-D21446'

class AnkerShortReferencesD21446Test < Minitest::Test
  M = AnkerShortReferencesD21446

  def test_isolated_identity_hold_preserves_existing_translation
    text = '앵커(Anker)'
    assert_equal text, text.gsub(M::PATTERN, "#{M::KOREAN}(#{M::SHORT})")
    assert_equal ['17204'], M::UNCERTAIN_IDS
  end

  def test_contextual_name_is_already_bilingual
    assert M::NOTE.include?('town-scholar context')
    assert_equal '앵커(Anker)', '앵커(Anker)'.gsub(M::PATTERN, "#{M::KOREAN}(#{M::SHORT})")
  end
end
