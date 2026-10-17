#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-unique-items-D20932'

class UniqueItemsD20932Test < Minitest::Test
  M = UniqueItemsD20932

  def transform(text, key)
    spec = M::ITEM_SPECS.find { |row| row['entity_key'] == key }
    text.gsub(M.matcher_for(spec)) { spec.fetch('korean_canonical') }
  end

  def test_boots_are_paired_as_a_complete_item
    expected = "부루의 장화(Buru's Boots)를 가져와."
    assert_equal expected, transform('부루(Buru)의 장화를 가져와.', 'unique_item:buru-boots')
    assert_equal expected, transform(expected, 'unique_item:buru-boots')
  end

  def test_belne_items_are_not_component_pairings
    assert_equal "벨른의 분노 단검(Belne's Daggers of Ire)",
                 transform('벨네(Belne)의 분노의 단검', 'unique_item:belnes-daggers-of-ire')
    assert_equal "벨른의 분노 검(Belne's Sword of Ire)",
                 transform('벨네의 분노의 검', 'unique_item:belnes-sword-of-ire')
  end

  def test_person_alone_is_not_a_named_item
    text = '벨네(Belne)는 돌아왔다.'
    assert_equal text, transform(text, 'unique_item:belnes-sword-of-ire')
  end

  def test_alternate_boots_source_is_in_the_exact_scope
    boots = M::ITEM_SPECS.find { |row| row['entity_key'] == 'unique_item:buru-boots' }
    assert_includes boots['english_aliases'].split('|'), 'boots of Buru'
    assert_includes boots['expected_keys'], ['default', '12375', '']
    assert_equal 28, M.expected_source_keys.length
  end
end
