#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-fateweaver-source-labels-D21644'

class FateweaverSourceLabelsD21644Test < Minitest::Test
  def fixture(spec)
    {
      'en_texts_json' => JSON.generate([spec.fetch(:english)]),
      'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
      'zh_text' => spec.fetch(:chinese),
      'work_text' => spec.fetch(:old)
    }
  end

  def test_exact_unpaired_labels_get_manual_form_and_bilingual_source_spelling
    inventory = FateweaverSourceLabelsD21644::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    rows = FateweaverSourceLabelsD21644.reviews(inventory)

    assert_equal 8, rows.length
    assert_equal FateweaverSourceLabelsD21644::TARGETS.keys.sort,
      rows.map { |row| ReviewedNameBatches.key(row) }.sort
    rows.each do |row|
      assert_equal 'accepted', row.fetch('status')
      assert_equal 'source-label:fateweaver', row.fetch('entity_key')
      assert_includes row.fetch('new'), '(Fateweaver'
      assert_equal '{}', row.fetch('entity_dispositions_json')
    end
    assert_equal '페이트위버(Fateweaver)',
      rows.find { |row| row['ID_Linha'] == '28832' }.fetch('new')
    assert_equal '페이트위버들(Fateweavers)',
      rows.find { |row| row['ID_Linha'] == '25724' }.fetch('new')
  end

  def test_changed_locale_evidence_fails_closed
    inventory = FateweaverSourceLabelsD21644::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    inventory.fetch(['default', '28832', ''])['ja_texts_json'] = JSON.generate(['changed'])

    assert_raises(RuntimeError) do
      FateweaverSourceLabelsD21644.reviews(inventory)
    end
  end

  def test_all_exact_source_labels_and_existing_pairs_are_scoped
    inventory = FateweaverSourceLabelsD21644::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    FateweaverSourceLabelsD21644::ALREADY_PAIRED.each do |key, korean|
      inventory[key] = {
        'en_texts_json' => JSON.generate(['Fateweaver']),
        'ja_texts_json' => JSON.generate(['フェイトウィーバー']),
        'zh_text' => '织命者', 'work_text' => korean
      }
    end

    assert FateweaverSourceLabelsD21644.validate_scope!(inventory)
    assert_equal 8, FateweaverSourceLabelsD21644.reviews(inventory).length
  end
end
