#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-ingress-shroud-everglen-D21433'

class IngressShroudEverGlenD21433Test < Minitest::Test
  M = IngressShroudEverGlenD21433

  def fixture_inventory
    M::TARGETS.flat_map do |entity, targets|
      targets.map do |key, target|
        item = M::ENTITIES.find { |definition| definition.fetch(:key) == entity }
        english_name = if entity == 'unique_item:shroud-of-omission' && key[1] == '13824'
                         'Shroud of Omnission'
                       else
                         item.fetch(:english)
                       end
        english = case entity
                  when 'place:caverns-of-ingress'
                    "Travel to the #{english_name} and find the waterfall."
                  when 'unique_item:shroud-of-omission'
                    "The #{english_name} is a magical cloth."
                  else
                    "The Ever Glen is a beautiful magic wood."
                  end
        japanese = "#{item.fetch(:japanese)}"
        chinese = "#{item.fetch(:chinese)}"
        old_span = target.length == 1 ? target.first : target.first
        korean = old_span ? "앞 #{old_span} 뒤" : "앞 #{item.fetch(:korean)}(#{item.fetch(:english)}) 뒤"
        row = {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'en_texts_json' => JSON.generate([english]),
          'ja_texts_json' => JSON.generate([japanese]),
          'zh_text' => chinese,
          'work_text' => korean
        }
        [key, row]
      end
    end.to_h
  end

  def test_definitions_and_exact_scope
    assert_equal 3, M::ENTITIES.length
    assert_equal 29, M.expected_pairs.length
    assert_equal 29, M.expected_pairs.uniq.length
    assert_equal(
      %w[place:caverns-of-ingress place:ever-glen unique_item:shroud-of-omission],
      M::ENTITIES.map { |item| item.fetch(:key) }.sort
    )
    assert_equal 'Shroud of Omnission',
                 M::ENTITIES.find { |item| item.fetch(:key) == 'unique_item:shroud-of-omission' }.fetch(:aliases)
  end

  def test_source_matches_and_canonicalization_are_exact
    inventory = fixture_inventory
    definitions = M.definitions_for(%w[
      entity_key english_canonical category korean_canonical english_aliases
      korean_variants evidence_ids status notes
    ])
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = M.reviews_for(inventory, generated)

    assert_equal 29, reviews.length
    assert_equal 22, reviews.count { |row| row.fetch('status') == 'accepted' }
    assert_equal 7, reviews.count { |row| row.fetch('status') == 'not-an-issue' }
    targets = M.edit_targets(reviews)
    assert_equal 22, targets.length
    assert targets.all? { |row| row.fetch('old') != row.fetch('new') }
    refute targets.any? { |row| row.fetch('ID_Linha') == '11821' }
    assert reviews.all? { |row| row.fetch('new').include?('잉그레스 동굴') || row.fetch('new').include?('망각의 장막') || row.fetch('new').include?('영원한 숲') }

    typo = reviews.find { |row| row.fetch('ID_Linha') == '13824' }
    assert_includes typo.fetch('new'), 'Shroud of Omission'
    assert_equal 'accepted', typo.fetch('status')
    unchanged = reviews.find { |row| row.fetch('ID_Linha') == '11821' }
    assert_equal 'not-an-issue', unchanged.fetch('status')
    assert_includes reviews.find { |row| row['ID_Linha'] == '18433' }.fetch('new'),
                    '망각의 장막(Shroud of Omission)이'
    %w[54687 59473].each do |id|
      assert_includes reviews.find { |row| row['ID_Linha'] == id }.fetch('new'),
                      '망각의 장막(Shroud of Omission)으로'
    end
  end

  def test_missing_locale_corroboration_is_rejected
    inventory = fixture_inventory
    key = ['default', '11821', '']
    inventory.fetch(key)['zh_text'] = 'unrelated'
    definitions = M.definitions_for(%w[
      entity_key english_canonical category korean_canonical english_aliases
      korean_variants evidence_ids status notes
    ])
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end

    assert_raises(RuntimeError) { M.reviews_for(inventory, generated) }
  end
end
