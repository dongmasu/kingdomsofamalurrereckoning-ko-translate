#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-cloudcrest-source-labels-D21641'

class CloudcrestSourceLabelsD21641Test < Minitest::Test
  def fixture(spec)
    {
      'en_texts_json' => JSON.generate([spec.fetch(:english)]),
      'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
      'zh_text' => spec.fetch(:chinese),
      'work_text' => spec.fetch(:old)
    }
  end

  def test_only_unpaired_exact_standalone_labels_are_changed
    inventory = CloudcrestSourceLabelsD21641::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    rows = CloudcrestSourceLabelsD21641.reviews(inventory)

    assert_equal 5, rows.length
    assert_equal CloudcrestSourceLabelsD21641::TARGETS.keys.sort,
      rows.map { |row| ReviewedNameBatches.key(row) }.sort
    rows.each do |row|
      assert_equal 'accepted', row.fetch('status')
      assert_equal 'source-label:cloudcrest', row.fetch('entity_key')
      assert_equal '클라우드크레스트(Cloudcrest)', row.fetch('new')
      assert_equal '{}', row.fetch('entity_dispositions_json')
    end
  end

  def test_changed_cross_locale_evidence_fails_closed
    inventory = CloudcrestSourceLabelsD21641::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    inventory.fetch(['default', '37607', ''])['zh_text'] = 'changed'

    assert_raises(RuntimeError) do
      CloudcrestSourceLabelsD21641.reviews(inventory)
    end
  end

  def test_exact_scope_includes_but_does_not_edit_already_paired_labels
    inventory = CloudcrestSourceLabelsD21641::TARGETS.to_h do |key, spec|
      [key, fixture(spec)]
    end
    CloudcrestSourceLabelsD21641::ALREADY_PAIRED.each do |key, expected|
      inventory[key] = {
        'en_texts_json' => JSON.generate(['Cloudcrest']),
        'ja_texts_json' => JSON.generate([expected.fetch(:japanese)]),
        'zh_text' => expected.fetch(:chinese), 'work_text' => expected.fetch(:korean)
      }
    end

    assert CloudcrestSourceLabelsD21641.validate_scope!(inventory)
    assert_equal 5, CloudcrestSourceLabelsD21641.reviews(inventory).length
  end
end
