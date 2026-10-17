#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-adessa-venues-D20933'

class AdessaVenuesD20933Test < Minitest::Test
  M = AdessaVenuesD20933

  def test_arcadium_spelling_and_idempotence
    text = M.transform('아카디움에서 만나.', 'place:arcadium', '아르카디움(Arcadium)', ['default', '8468', ''])
    assert_equal '아르카디움(Arcadium)에서 만나.', text
    assert_equal text, M.transform(text, 'place:arcadium', '아르카디움(Arcadium)', ['default', '8468', ''])
  end

  def test_livrarium_semantic_variant_is_context_restricted
    assert_equal '리브라리움(Livrarium)과 성당', M.transform('도서원과 성당', 'place:livrarium', '리브라리움(Livrarium)', ['default', '34342', ''])
    assert_equal '다른 도서원', M.transform('다른 도서원', 'place:livrarium', '리브라리움(Livrarium)', ['default', '0', ''])
  end

  def test_complete_compounds_are_explicit_exclusions
    assert M::EXCLUDED_KEYS.key?(['base', '3154', '11'])
    %w[28432 42535 50551 53552].each do |id|
      assert M::EXCLUDED_KEYS.key?(['default', id, ''])
    end
  end

  def test_source_attested_gemstone_variants_share_one_venue
    entity = M::GEMSTONE_ENTITY
    canonical = M::GEMSTONE_CANONICAL
    assert_equal canonical, M.transform('보석 여관', entity, canonical, ['default', '40402', ''])
    inn = '젬스톤 여관(Gemstone Inn)'
    assert_equal inn, M.transform(inn, entity, canonical, ['default', '61956', ''])
    assert_equal '젬스톤(Gemstone)에 가 봐.', M.transform('젬스톤에 가 봐.', entity, canonical, ['default', '59371', ''])
  end

  def test_ordinary_gemstones_are_explicitly_excluded
    assert_equal 7, M::GEMSTONE_ORDINARY_KEYS.length
    M::GEMSTONE_ORDINARY_KEYS.each { |key| assert M::EXCLUDED_KEYS.key?(key) }
    assert_raises(RuntimeError) do
      M.transform('루비 원석', M::GEMSTONE_ENTITY, M::GEMSTONE_CANONICAL, ['base', '2998', '11'])
    end
  end
end
