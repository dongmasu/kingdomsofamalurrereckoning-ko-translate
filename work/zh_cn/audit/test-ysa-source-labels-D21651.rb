#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-ysa-source-labels-D21651'

class YsaSourceLabelsD21651Test < Minitest::Test
  def test_annotations_are_source_local_and_keep_entity_disposition_out_of_scope
    inventory = YsaSourceLabelsD21651::TARGETS.to_h do |key, spec|
      source = {
        'en_texts_json' => JSON.generate([spec.fetch(:english)]),
        'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
        'zh_text' => spec.fetch(:chinese),
        'work_text' => spec.fetch(:old)
      }
      [key, source]
    end
    rows = YsaSourceLabelsD21651.reviews(inventory)

    assert_equal 2, rows.length
    assert_equal YsaSourceLabelsD21651::TARGETS.keys.sort,
      rows.map { |row| ReviewedNameBatches.key(row) }.sort
    rows.each do |row|
      assert_equal 'accepted', row.fetch('status')
      assert_includes row.fetch('new'), '(Ysa)'
      assert_equal '{}', row.fetch('entity_dispositions_json')
      assert_includes row.fetch('evidence'), 'does not decide'
    end
  end

  def test_changed_source_evidence_fails_closed
    inventory = YsaSourceLabelsD21651::TARGETS.to_h do |key, spec|
      [key, {
        'en_texts_json' => JSON.generate([spec.fetch(:english)]),
        'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
        'zh_text' => spec.fetch(:chinese),
        'work_text' => spec.fetch(:old)
      }]
    end
    inventory.fetch(['default', '5300', ''])['zh_text'] = 'changed'

    assert_raises(RuntimeError) { YsaSourceLabelsD21651.reviews(inventory) }
  end
end
