#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'

class FourUnregisteredNamesD21100Test < Minitest::Test
  M = ReviewedNameBatches

  def test_review_manifest_has_exact_discovery_scope_and_approved_edits
    definitions = M.table(File.join(__dir__, 'proper-name-discovery-definitions-D21100.tsv')).map(&:to_h)
    reviews = M.table(File.join(__dir__, 'proper-name-discovery-D21100.tsv')).map(&:to_h)
    expected = {
      'person:elund-carth' => 12,
      'person:lina-ardeen' => 8,
      'person:eloren-criet' => 12,
      'unique_item:rivener-tarsus' => 12
    }

    assert_equal expected.keys.sort, definitions.map { |row| row['entity_key'] }.sort
    assert_equal expected.values.sum, reviews.length
    assert_equal expected, reviews.group_by { |row| row['entity_key'] }
                                  .transform_values(&:length)
    assert_equal 18, reviews.count { |row| row['old'] != row['new'] }
    assert_equal(
      %w[
        base:2695:11 base:2811:11 base:4023:11
        default:17230: default:18969: default:33792: default:36541: default:38994:
        default:39451: default:44753: default:44791: default:49504:
        default:52388: default:59235: default:59439: default:59973:
        default:9019: default:9043:
      ].sort,
      reviews.select { |row| row['old'] != row['new'] }
             .map { |row| M.key(row).join(':') }.sort
    )
    assert_equal reviews.length, reviews.map { |row| M.key(row) }.uniq.length
  end

  def test_registered_occurrences_match_review_and_active_source
    definitions = M.table(File.join(__dir__, 'proper-name-discovery-definitions-D21100.tsv')).map(&:to_h)
    reviews = M.table(File.join(__dir__, 'proper-name-discovery-D21100.tsv')).map(&:to_h)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    indexed = index.select do |row|
      definitions.any? { |definition| definition['entity_key'] == row['entity_key'] }
    end
    expected_keys = generated.map { |row| [row['entity_key'], *M.key(row)] }.sort
    actual_keys = indexed.map { |row| [row['entity_key'], *M.key(row)] }.sort
    review_by_key = reviews.to_h do |row|
      [[row['entity_key'], *M.key(row)], row]
    end

    assert_equal expected_keys, actual_keys
    definitions.each do |definition|
      registered = glossary.find { |row| row['entity_key'] == definition['entity_key'] }
      refute_nil registered
      assert_equal definition['korean_canonical'], registered['korean_canonical']
    end
    reviews.each do |review|
      key = M.key(review)
      source = inventory.fetch(key)
      assert_equal review['new'], source['work_text']
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), review['english']
      indexed_row = index.find do |row|
        row['entity_key'] == review['entity_key'] && M.key(row) == key
      end
      refute_nil indexed_row
      assert_equal review['status'], indexed_row['status']
      assert_equal "D-21100: #{review['evidence']}", indexed_row['evidence']
    end
  end
end
