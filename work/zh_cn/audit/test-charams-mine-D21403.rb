require 'minitest/autorun'
require_relative 'review-charams-mine-D21403'

class CharamsMineD21403Test < Minitest::Test
  def test_pairs_the_complete_label_atomically
    assert_equal "차람 광산(Charam's Mine)",
      CharamsMineD21403.transform('차람(Charam) 광산')
  end

  def test_preserves_an_already_canonical_label
    label = "차람 광산(Charam's Mine)"
    assert_equal label, CharamsMineD21403.transform(label)
  end

  def test_does_not_generalize_to_a_different_site
    assert_raises(RuntimeError) do
      CharamsMineD21403.transform("차람(Charam)의 동굴(Charam's Grotto)")
    end
  end

  def test_source_scope_is_exactly_base_1618_variant_11
    rows = CharamsMineD21403.plan
    assert_equal 1, rows.length
    assert_equal ['base', '1618', '11'], ReviewedNameBatches.key(rows.first)
  end
end
