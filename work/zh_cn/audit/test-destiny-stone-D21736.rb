#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-destiny-stone-D21736'

class ReviewDestinyStoneD21736Test < Minitest::Test
  R = ReviewDestinyStoneD21736
  M = ReviewedNameBatches

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def test_full_english_scope_is_exactly_13_keys
    keys = R.preflight
    assert_equal 13, keys.length
    assert_equal (R::SPANS.keys + R::COMPLETE_KEYS).sort, keys
    assert_equal 13, R::SPECS.first.fetch(:count)
    assert_equal '운명의 돌(Destiny Stone)', R::SPECS.first.fetch(:korean)
  end

  def test_replacements_are_exact_idempotent_and_structurally_safe
    R::SPANS.each do |key, (old, replacement)|
      source = inventory.fetch(key)
      original = source.fetch('work_text')
      changed, excluded = R.transform(R::SPECS.first, key, original, source)
      refute excluded, key.inspect
      expected = original.include?(replacement) ? original : original.sub(old, replacement)
      assert_equal expected, changed, key.inspect
      assert_equal [changed, false],
                   R.transform(R::SPECS.first, key, changed, source), key.inspect
      assert_equal original.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   changed.scan(ReviewedProperNameDiscovery::STRUCTURAL), key.inspect
      assert_equal original.scan(/\r\n|\r|\n/), changed.scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_existing_canonical_references_are_preserved
    R::COMPLETE_KEYS.each do |key|
      source = inventory.fetch(key)
      text = source.fetch('work_text')
      assert_equal [text, false],
                   R.transform(R::SPECS.first, key, text, source), key.inspect
    end
  end

  def test_unmapped_key_and_missing_english_evidence_fail_closed
    source = inventory.fetch(['default', '2005', ''])
    assert_raises(RuntimeError) do
      R.transform(R::SPECS.first, ['default', '99999', ''], 'text', source)
    end
    source['en_texts_json'] = '["The Codex of Destiny"]'
    assert_raises(RuntimeError) do
      R.transform(R::SPECS.first, ['default', '2005', ''], '운명의 돌에', source)
    end
  end

  def test_read_only_preflight_preserves_csvs_index_and_glossary
    before = M.hashes
    index_before = File.binread(M::INDEX)
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_before = File.binread(glossary)
    snapshot = File.join(__dir__, 'proper-name-discovery-D21736.tsv')
    snapshot_before = File.exist?(snapshot) ? File.binread(snapshot) : nil
    output, = capture_io { assert_equal 13, R.preflight.length }
    assert_includes output, 'read-only'
    assert_equal before, M.hashes
    assert_equal index_before, File.binread(M::INDEX)
    assert_equal glossary_before, File.binread(glossary)
    snapshot_after = File.exist?(snapshot) ? File.binread(snapshot) : nil
    if snapshot_before.nil?
      assert_nil snapshot_after
    else
      assert_equal snapshot_before, snapshot_after
    end
  end
end
