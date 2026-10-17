require 'minitest/autorun'
require_relative 'review-prismere-D21387'

class PrismereD21387Test < Minitest::Test
  def test_pairs_bare_and_repeated_resource_mentions
    assert_equal(
      ['프리즘미어(Prismere)와 프리즘미어(Prismere)는', false],
      PrismereD21387.transform('프리즈미어와 프리스미어는', 'Prismere and Prismere')
    )
  end

  def test_normalizes_existing_exact_pair
    assert_equal(
      ['프리즘미어(Prismere) 수정', false],
      PrismereD21387.transform('프리즈미어(Prismere) 수정', 'Prismere crystal')
    )
  end

  def test_keeps_a_complete_bilingual_compound_without_nesting
    assert_equal(
      ['프리즘미어 가루(Prismere Dust)', false],
      PrismereD21387.transform('프리즈미어 가루(Prismere Dust)', 'Prismere Dust')
    )
  end

  def test_pairs_resource_component_inside_an_unpaired_compound
    assert_equal(
      ['미타란(Mitharan) 프리즘미어(Prismere) 흉갑', false],
      PrismereD21387.transform(
        '미타란(Mitharan) 프리즈미어 흉갑',
        'Mitharan Prismere Chestpiece'
      )
    )
  end

  def test_source_aligned_candidate_scope_is_199_distinct_keys
    inventory = ReviewedNameBatches.refresh_inventory
    generated = build_occurrences(inventory.values, PrismereD21387::SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => ''
      }
    end)
    keys = generated.map { |row| row.values_at(1, 2, 3) }

    assert_equal 199, generated.length
    assert_equal 199, keys.uniq.length
    assert generated.all? { |row| row[6].match?(PrismereD21387::ROOT_PATTERN) }
  end
end
