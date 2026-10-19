#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-crossing-keepers-aliases-D21665'

class CrossingKeepersAliasesD21665Test < Minitest::Test
  def test_whole_title_replacement_preserves_each_predicate
    CrossingKeepersAliasesD21665::TARGETS.each do |key, (old, expected)|
      text = "이전 문장. #{old}이라네.\r\n다음 문장."
      revised = CrossingKeepersAliasesD21665.replacement(key, text)
      assert_equal "이전 문장. #{expected}이라네.\r\n다음 문장.", revised
      assert_equal revised, CrossingKeepersAliasesD21665.replacement(key, revised)
    end
  end

  def test_unknown_or_changed_spans_fail_closed
    assert_raises(KeyError) { CrossingKeepersAliasesD21665.replacement(['default', '1', ''], '수호자') }
    assert_raises(RuntimeError) do
      CrossingKeepersAliasesD21665.replacement(['base', '3043', '11'], '다른 조직')
    end
  end
end
