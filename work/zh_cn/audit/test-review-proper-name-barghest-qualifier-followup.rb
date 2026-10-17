#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-barghest-qualifier-followup'

class BarghestQualifierFollowupTest < Minitest::Test
  def test_labels_the_species_without_consuming_the_meat_quantity
    assert_equal '바게스트(Barghest)(고기 5개)',
                 BarghestQualifierFollowup.rewrite('바게스트(고기 5개)')
  end

  def test_rejects_unexpected_or_ambiguous_target
    assert_raises(RuntimeError) do
      BarghestQualifierFollowup.rewrite('바게스트')
    end
    assert_raises(RuntimeError) do
      BarghestQualifierFollowup.rewrite('바게스트(고기 5개) / 바게스트(고기 5개)')
    end
  end
end
