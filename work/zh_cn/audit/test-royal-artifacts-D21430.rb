#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-royal-artifacts-D21430'

class RoyalArtifactsD21430Test < Minitest::Test
  M = RoyalArtifactsD21430
  GLOSSARY_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def fixture_inventory
    M::ITEMS.flat_map do |item|
      item.fetch(:rows).map do |resource, id, variant, old|
        english = item.fetch(:whole_cell) ? item.fetch(:english) : "The source mentions #{item.fetch(:english)} here."
        japanese = item.fetch(:whole_cell) ? item.fetch(:japanese) : "ここに#{item.fetch(:japanese)}とある。"
        chinese = item.fetch(:whole_cell) ? item.fetch(:chinese) : "原文提到#{item.fetch(:chinese)}。"
        korean = if item.fetch(:whole_cell)
                   old
                 elsif id == '31207'
                   "앞 문장\r\n#{old}\r\n뒤 문장"
                 else
                   "앞 문장 #{old} 뒤 문장"
                 end
        row = {
          'resource' => resource, 'ID_Linha' => id, 'Tipo_Variante' => variant,
          'en_texts_json' => JSON.generate([english]),
          'ja_texts_json' => JSON.generate([japanese]),
          'zh_text' => chinese, 'work_text' => korean
        }
        [M::M.key(row), row]
      end
    end.to_h
  end

  def fixture_exclusions
    M::PRESERVED_EXCLUSIONS.flat_map do |entity, keys|
      keys.map do |resource, id, variant|
        {
          'entity_key' => entity, 'resource' => resource, 'ID_Linha' => id,
          'Tipo_Variante' => variant, 'status' => 'excluded',
          'evidence' => "prior scoped exclusion for #{entity}"
        }
      end
    end
  end

  def test_only_three_atomic_items_and_six_exact_keys_are_defined
    assert_equal 3, M::ITEMS.length
    assert_equal 6, M.expected_pairs.length
    assert_equal 6, M.expected_pairs.uniq.length
    assert_equal %w[
      unique_item:armor-of-ohn
      unique_item:king-ysas-muffin
      unique_item:statue-of-king-ysa
    ], M::ITEMS.map { |item| item.fetch(:entity) }.sort

    definitions = M.definitions_for(GLOSSARY_HEADERS)
    assert definitions.all? { |row| row.fetch('english_aliases').empty? }
    assert definitions.all? { |row| row.fetch('category') == 'unique item' }
  end

  def test_fixture_builds_exact_aligned_reviews_without_refreshing_inventory
    inventory = fixture_inventory
    definitions = M.definitions_for(GLOSSARY_HEADERS)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = M.reviews_for(inventory, generated)

    assert_equal 6, reviews.length
    assert reviews.all? { |row| row.fetch('status') == 'accepted' }
    assert reviews.all? do |row|
      row.fetch('new').include?("(#{row.fetch('english')})")
    end
    assert_equal 3, reviews.map { |row| row.fetch('entity_key') }.uniq.length

    armor = reviews.find { |row| row.fetch('ID_Linha') == '31207' }
    assert_equal "앞 문장\r\n오운의 갑옷\r\n뒤 문장", armor.fetch('old')
    assert_equal "앞 문장\r\n오운의 갑옷(Armor of Ohn)\r\n뒤 문장", armor.fetch('new')
  end

  def test_old_korean_span_mismatch_is_rejected
    inventory = fixture_inventory
    definitions = M.definitions_for(GLOSSARY_HEADERS)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    inventory.fetch(['base', '1823', '11'])['work_text'] = 'changed statue label'

    assert_raises(RuntimeError) { M.reviews_for(inventory, generated) }
  end

  def test_unexpected_source_key_is_rejected
    inventory = fixture_inventory
    extra = {
      'resource' => 'affix', 'ID_Linha' => '999', 'Tipo_Variante' => '11',
      'en_texts_json' => JSON.generate(['Armor of Ohn']),
      'ja_texts_json' => JSON.generate(['オーンの鎧']),
      'zh_text' => '欧恩的护甲', 'work_text' => '오운의 갑옷'
    }
    inventory[M::M.key(extra)] = extra
    definitions = M.definitions_for(GLOSSARY_HEADERS)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end

    assert_raises(RuntimeError) { M.reviews_for(inventory, generated) }
  end

  def test_prior_king_ysa_and_ohn_exclusions_must_remain_excluded
    snapshot = M.preserved_exclusions(fixture_exclusions)
    assert_equal 9, snapshot.length

    changed = fixture_exclusions
    changed.first['status'] = 'accepted'
    assert_raises(RuntimeError) { M.preserved_exclusions(changed) }
  end
end
