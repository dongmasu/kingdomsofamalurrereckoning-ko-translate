#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'prepare-king-fang-discovery-D21642'

class KingFangDiscoveryD21642Test < Minitest::Test
  def fixture(spec)
    {
      'en_texts_json' => JSON.generate([spec.fetch(:english)]),
      'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
      'zh_text' => spec.fetch(:chinese),
      'work_text' => spec.fetch(:old)
    }
  end

  def test_complete_five_row_scope_and_normalized_entity
    inventory = KingFangDiscoveryD21642::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    rows = KingFangDiscoveryD21642.reviews(inventory)
    definition = KingFangDiscoveryD21642.definition

    assert_equal KingFangDiscoveryD21642::TARGETS.keys.sort,
      rows.map { |row| ReviewedNameBatches.key(row) }.sort
    assert_equal 'creature:king-fang', definition.fetch('entity_key')
    assert_equal '킹 팽(King Fang)', definition.fetch('korean_canonical')
    assert_equal '킹 팽|송곳니 왕', definition.fetch('korean_variants')
    assert_equal 3, rows.count { |row| row.fetch('status') == 'accepted' }
    assert_equal 2, rows.count { |row| row.fetch('status') == 'not-an-issue' }
  end

  def test_only_the_two_unpaired_labels_and_one_sentence_change
    rows = KingFangDiscoveryD21642.reviews(
      KingFangDiscoveryD21642::TARGETS.to_h { |key, spec| [key, fixture(spec)] }
    )
    changed = rows.select { |row| row.fetch('old') != row.fetch('new') }

    assert_equal %w[38884 48826 63022], changed.map { |row| row.fetch('ID_Linha') }.sort
    assert_equal '킹 팽(King Fang)', changed.find { |row| row['ID_Linha'] == '48826' }.fetch('new')
    assert_includes changed.find { |row| row['ID_Linha'] == '63022' }.fetch('new'), '킹 팽(King Fang)'
  end

  def test_cross_locale_evidence_is_required
    inventory = KingFangDiscoveryD21642::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    inventory.fetch(['default', '50987', ''])['ja_texts_json'] = JSON.generate(['changed'])

    assert_raises(RuntimeError) { KingFangDiscoveryD21642.reviews(inventory) }
  end
end
