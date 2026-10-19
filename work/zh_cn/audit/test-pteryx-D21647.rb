#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-pteryx-D21647'

class ReviewPteryxD21647Test < Minitest::Test
  def test_species_and_alpha_variant_are_paired_atomically
    actual = ReviewPteryxD21647.normalize_species(
      '익룡(Pteryx)과 프테릭스 알파(Pteryx Alpha), 알파 프테릭스'
    )
    assert_equal(
      '프테릭스(Pteryx)와 알파 프테릭스(Alpha Pteryx), 알파 프테릭스(Alpha Pteryx)',
      actual
    )
  end

  def test_existing_canonical_annotations_are_idempotent
    text = '프테릭스(Pteryx), 알파 프테릭스(Alpha Pteryx), 프테릭스(The Pteryx)'
    assert_equal text, ReviewPteryxD21647.normalize_species(text)
  end

  def test_alpha_only_source_match_excludes_nested_parent_match
    assert ReviewPteryxD21647.pteryx_only_nested?('The Alpha Pteryx')
    assert ReviewPteryxD21647.pteryx_only_nested?('Alpha Pteryx')
    refute ReviewPteryxD21647.pteryx_only_nested?('Alpha Pteryx and one Pteryx')
  end
end
