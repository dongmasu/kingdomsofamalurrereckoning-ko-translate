#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-source-labels-D21687'

class SourceLabelsD21687Test < Minitest::Test
  M = SourceLabelsD21687

  def inventory
    M::TARGETS.to_h do |key, spec|
      [key, {
        'en_texts_json' => JSON.generate([spec.fetch(:english)]),
        'ja_texts_json' => JSON.generate([spec.fetch(:japanese)]),
        'zh_text' => spec.fetch(:chinese),
        'work_text' => spec.fetch(:old)
      }]
    end
  end

  def test_all_three_source_labels_are_already_paired
    rows = M.reviews(inventory)
    assert_equal M::TARGETS.keys.sort, rows.map { |row| ReviewedNameBatches.key(row) }.sort
    assert_equal 3, rows.count { |row| row['status'] == 'not-an-issue' }
    assert_equal '티미오스(Timios)', rows.find { |row| row['ID_Linha'] == '4354' }['new']
    assert_equal "말라킴(Mala'chim)의 부적",
      rows.find { |row| row['ID_Linha'] == '377' }['new']
    assert_equal '아스터(Aster)의 역사',
      rows.find { |row| row['ID_Linha'] == '502' }['new']
    assert rows.all? { |row| row['entity_key'].start_with?('source-label:') }
    assert rows.all? { |row| row['entity_dispositions_json'] == '{}' }
    assert rows.all? { |row| row['old'] == row['new'] }
  end

  def test_aligned_source_evidence_fails_closed
    changed = inventory
    changed.fetch(['base', '4354', '11'])['zh_text'] = 'changed'
    assert_raises(RuntimeError) { M.reviews(changed) }
  end

  def test_unknown_source_text_is_not_accepted
    changed = inventory
    changed.fetch(['base', '4354', '11'])['work_text'] = '티미오스'
    changed.fetch(['base', '4354', '11'])['en_texts_json'] = JSON.generate(['Timos'])
    assert_raises(RuntimeError) { M.reviews(changed) }
  end
end
