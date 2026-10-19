#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'build-freemen-discovery-D21752'

class FreemenDiscoveryD21752Test < Minitest::Test
  M = FreemenDiscoveryD21752

  def test_existing_parentheses_are_replaced_in_one_pass
    assert_equal '프리맨(Freemen)들이 왔다.',
      M.canonicalize('프리맨(Freemen)들이 왔다.', 'Freemen', ['default', '1991', ''])
    assert_equal '프리맨(Freeman) 완장',
      M.canonicalize('프리맨(Freeman) 완장', 'Freeman', ['base', '1731', '11'])
  end

  def test_korean_variants_and_plural_suffix_are_normalized
    assert_equal '프리맨(Freemen)들이 왔다.',
      M.canonicalize('자유민들이 왔다.', 'Freemen', ['default', '1991', ''])
    assert_equal '프리맨(Freemen)들이 왔다.',
      M.canonicalize('프리맨들(Freemen)이 왔다.', 'Freemen', ['default', '28651', ''])
    assert_equal '프리맨(Freemen)들이 왔다.',
      M.canonicalize('프리맨(Freemen)들이 왔다.', 'Freemen', ['default', '1991', ''])
    assert_equal '프리맨(Freeman)이 왔다.',
      M.canonicalize('프리먼이 왔다.', 'Freeman', ['default', '38141', ''])
  end

  def test_collective_singular_english_uses_faction_form
    assert_equal '프리맨(Freemen) 때문에 위험해.',
      M.canonicalize('프리맨 때문에 위험해.',
                     M.source_term('those Freeman nearby', ['default', '27038', '']),
                     ['default', '27038', ''])
    assert_equal '프리맨(Freemen) 때문에 위험해.',
      M.canonicalize('자유민 때문에 위험해.',
                     M.source_term('the Freeman group', ['default', '38141', '']),
                     ['default', '38141', ''])
  end

  def test_only_the_vonn_line_remains_held
    assert_equal [['default', '41621', '']], M::UNCERTAIN.to_a
    assert_empty M::EXCLUDED
  end
end
