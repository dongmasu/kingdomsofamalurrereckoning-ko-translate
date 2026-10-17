#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'apply-reviewed-proper-name-discovery'

class FourPersonNamesD21101Test < Minitest::Test
  M = ReviewedNameBatches

  def test_review_manifest_covers_all_entity_hits_without_duplicate_row_keys
    definitions = M.table(File.join(__dir__, 'proper-name-discovery-definitions-D21101.tsv')).map(&:to_h)
    reviews = M.table(File.join(__dir__, 'proper-name-discovery-D21101.tsv')).map(&:to_h)
    expected = %w[
      person:eleanor-brea person:elodan-bloodgood
      person:astrid-frisk person:aubrey-gilcrest person:othe-theswin
    ].sort

    assert_equal expected, definitions.map { |row| row['entity_key'] }.sort
    assert_equal 50, reviews.length
    assert_equal 56, reviews.sum { |row| row['entity_key'].split('|').length }
    assert_equal 25, reviews.count { |row| row['old'] != row['new'] }
    assert_equal reviews.length, reviews.map { |row| M.key(row) }.uniq.length
    assert_equal 6, reviews.count { |row| row['entity_key'].include?('|') }
  end

  def test_registered_occurrences_match_review_and_active_source
    definitions = M.table(File.join(__dir__, 'proper-name-discovery-definitions-D21101.tsv')).map(&:to_h)
    reviews = M.table(File.join(__dir__, 'proper-name-discovery-D21101.tsv')).map(&:to_h)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    registered_keys = glossary.map { |row| row['entity_key'] }
    definition_keys = definitions.map { |row| row['entity_key'] }
    if (registered_keys & definition_keys).empty?
      ReviewedProperNameDiscovery.validate!(
        definitions, reviews, generated, glossary, index
      )
      ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
      assert_equal 56, generated.length
      return
    end

    reviewed = reviews.flat_map do |row|
      JSON.parse(row.fetch('entity_dispositions_json')).keys.map do |entity|
        [entity, *M.key(row)]
      end
    end.sort
    generated_keys = generated.map { |row| [row['entity_key'], *M.key(row)] }.sort
    indexed = index.select do |row|
      definitions.any? { |definition| definition['entity_key'] == row['entity_key'] }
    end
    indexed_keys = indexed.map { |row| [row['entity_key'], *M.key(row)] }.sort

    assert_equal generated_keys, reviewed
    assert_equal generated_keys, indexed_keys
    definitions.each do |definition|
      registered = glossary.find { |row| row['entity_key'] == definition['entity_key'] }
      refute_nil registered
      assert_equal definition['korean_canonical'], registered['korean_canonical']
    end
    reviews.each do |review|
      source = inventory.fetch(M.key(review))
      assert_equal review['new'], source['work_text']
      JSON.parse(review.fetch('entity_dispositions_json')).each do |entity, disposition|
        indexed_row = index.find do |row|
          row['entity_key'] == entity && M.key(row) == M.key(review)
        end
        refute_nil indexed_row
        assert_equal disposition, indexed_row['status']
      end
    end
  end
end
