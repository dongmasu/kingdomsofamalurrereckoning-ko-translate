#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-source-label-residuals-D21640'

class SourceLabelResidualsD21640Test < Minitest::Test
  def fixture(spec)
    {
      'en_texts_json' => JSON.generate([spec.fetch(:english)]),
      'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
      'zh_text' => spec.fetch(:chinese),
      'work_text' => spec.fetch(:old)
    }
  end

  def test_exact_source_labels_are_paired_without_entity_registration
    inventory = SourceLabelResidualsD21640::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    rows = SourceLabelResidualsD21640.reviews(inventory)

    assert_equal 5, rows.length
    assert_equal SourceLabelResidualsD21640::TARGETS.keys.sort,
      rows.map { |row| ReviewedNameBatches.key(row) }.sort
    rows.each do |row|
      assert_equal 'accepted', row.fetch('status')
      assert_includes row.fetch('new'), "(#{row.fetch('english')})"
      assert_match(/\Asource-label:/, row.fetch('entity_key'))
      assert_equal '{}', row.fetch('entity_dispositions_json')
    end
  end

  def test_missing_or_changed_locale_evidence_fails_closed
    inventory = SourceLabelResidualsD21640::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    inventory.fetch(['default', '44734', ''])['zh_text'] = 'changed'

    assert_raises(RuntimeError) do
      SourceLabelResidualsD21640.reviews(inventory)
    end
  end

  def test_resumption_keeps_manifest_old_text_when_active_text_is_already_edited
    inventory = SourceLabelResidualsD21640::TARGETS.to_h do |key, spec|
      source = fixture(spec)
      source['work_text'] = spec.fetch(:new)
      [key, source]
    end

    rows = SourceLabelResidualsD21640.reviews(inventory)

    rows.each do |row|
      spec = SourceLabelResidualsD21640::TARGETS.fetch(ReviewedNameBatches.key(row))
      assert_equal spec.fetch(:old), row.fetch('old')
      assert_equal spec.fetch(:new), row.fetch('new')
    end
  end
end
