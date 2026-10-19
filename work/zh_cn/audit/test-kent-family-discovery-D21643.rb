#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'prepare-kent-family-discovery-D21643'

class KentFamilyDiscoveryD21643Test < Minitest::Test
  def fixture(spec)
    {
      'en_texts_json' => JSON.generate([spec.fetch(:english)]),
      'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
      'zh_text' => spec.fetch(:chinese),
      'work_text' => spec.fetch(:old)
    }
  end

  def test_exact_family_labels_register_without_person_aliases
    inventory = KentFamilyDiscoveryD21643::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    rows = KentFamilyDiscoveryD21643.reviews(inventory)
    definition = KentFamilyDiscoveryD21643.definition

    assert_equal KentFamilyDiscoveryD21643::TARGETS.keys.sort,
      rows.map { |row| ReviewedNameBatches.key(row) }.sort
    assert_equal 'family:kent', definition.fetch('entity_key')
    assert_equal 'Kent Family', definition.fetch('english_canonical')
    assert_equal '켄트 가문(Kent Family)', definition.fetch('korean_canonical')
    assert_equal '', definition.fetch('english_aliases')
    assert_equal 3, rows.count { |row| row.fetch('status') == 'accepted' }
  end

  def test_source_locale_mismatch_fails_closed
    inventory = KentFamilyDiscoveryD21643::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    inventory.fetch(['default', '45188', ''])['zh_text'] = 'changed'

    assert_raises(RuntimeError) { KentFamilyDiscoveryD21643.reviews(inventory) }
  end
end
