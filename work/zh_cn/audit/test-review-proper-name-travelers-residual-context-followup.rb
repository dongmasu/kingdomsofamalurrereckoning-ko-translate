#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-travelers-residual-context-followup'

class TravelersResidualContextFollowupTest < Minitest::Test
  def test_coalesces_disjoint_entity_edits_and_keeps_each_disposition
    original = '여행자 / 학술원'
    reviews = [
      {
        'resource' => 'default', 'ID_Linha' => '43038', 'Tipo_Variante' => '',
        'entity_key' => 'faction:travelers', 'status' => 'uncertain',
        'old' => original, 'new' => original, 'evidence' => 'Traveler remains ambiguous.'
      },
      {
        'resource' => 'default', 'ID_Linha' => '43038', 'Tipo_Variante' => '',
        'entity_key' => 'faction:scholia-arcana', 'status' => 'accepted',
        'old' => original, 'new' => '여행자 / 스콜리아 아르카나(Scholia Arcana)',
        'evidence' => 'The source names Scholia Arcana.'
      }
    ]

    merged = TravelersResidualContextFollowup.coalesce_reviews(reviews).fetch(0)

    assert_equal '여행자 / 스콜리아 아르카나(Scholia Arcana)', merged['new']
    assert_equal 'accepted', merged['status']
    assert_equal(
      { 'faction:travelers' => 'uncertain', 'faction:scholia-arcana' => 'accepted' },
      JSON.parse(merged['entity_dispositions_json'])
    )
  end

  def test_rejects_overlapping_entity_edits
    original = '여행자'
    reviews = %w[one two].each_with_index.map do |entity, index|
      {
        'resource' => 'default', 'ID_Linha' => '1', 'Tipo_Variante' => '',
        'entity_key' => "faction:#{entity}", 'status' => 'accepted',
        'old' => original, 'new' => index.zero? ? '트래블러(Travelers)' : '나그네',
        'evidence' => entity
      }
    end

    assert_raises(RuntimeError) do
      TravelersResidualContextFollowup.coalesce_reviews(reviews)
    end
  end
end
