#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-valor-rite-objects-D21439'

class ValorRiteObjectsD21439Test < Minitest::Test
  M = ValorRiteObjectsD21439

  def test_scopes_count_entity_occurrences_separately_from_rows
    keys = M::ITEMS.flat_map { |item| M.keys(item) }
    assert_equal 32, keys.length
    assert_equal 29, keys.uniq.length
    assert_equal 6, M::ITEMS.length
  end

  def test_component_only_petal_annotation_is_atomic
    item = M::ITEMS.find { |config| config[:english] == 'Kora Petal' }
    assert_equal '코라 꽃잎(Kora Petal)', M.transform(item, '코라(Kora)의 꽃잎')
    assert_equal '코라 꽃잎(Kora Petal)으로', M.transform(item, '코라 꽃잎(Kora Petal)으로')
  end

  def test_rite_spelling_and_multiple_entity_spans
    rite = M::ITEMS.find { |config| config[:english] == 'Rite of Valor' }
    petal = M::ITEMS.find { |config| config[:english] == 'Kora Petal' }
    text = M.transform(rite, '코라 꽃잎을 찾아 용맹의 의식을 마쳐.')
    assert_equal '코라 꽃잎(Kora Petal)을 찾아 용맹의 의식(Rite of Valor)을 마쳐.',
      M.transform(petal, text)
    assert_equal '용맹의 의식(Rite of Valor)을', M.transform(rite, '무훈의 의식(Rite of Valor)을')
  end

  def test_possessive_prefix_is_not_the_item
    assert M.excluded_key?('unique_item:essence-of-valor', ['default', '16432', ''])
    refute M.excluded_key?('unique_item:essence-of-valor', ['default', '58575', ''])
  end
end
