#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-dispelling-D21735'

class ReviewDispellingD21735Test < Minitest::Test
  R = ReviewDispellingD21735
  M = ReviewedNameBatches

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def test_full_english_scope_is_exactly_48_keys
    keys = R.preflight
    assert_equal 48, keys.length
    assert_equal (R::ACCEPTED.keys + R::EXCLUDED).sort, keys
    assert_equal 48, R::SPECS.first.fetch(:count)
    assert_equal '디스펠(Dispelling)', R::SPECS.first.fetch(:korean)
  end

  def test_accepted_skill_spans_are_exact_idempotent_and_structurally_safe
    R::ACCEPTED.each do |key, span|
      source = inventory.fetch(key)
      original = source.fetch('work_text')
      changed, excluded = R.transform(R::SPECS.first, key, original, source)
      refute excluded, key.inspect
      if span
        old, replacement = span
        expected = original.include?(replacement) ? original : original.sub(old, replacement)
        assert_equal expected, changed, key.inspect
      else
        assert_equal original, changed, key.inspect
      end
      assert_equal [changed, false],
                   R.transform(R::SPECS.first, key, changed, source), key.inspect
      assert_equal original.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   changed.scan(ReviewedProperNameDiscovery::STRUCTURAL), key.inspect
      assert_equal original.scan(/\r\n|\r|\n/), changed.scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_generic_verbs_and_hall_title_are_excluded_without_edits
    R::EXCLUDED.each do |key|
      source = inventory.fetch(key)
      text = source.fetch('work_text')
      assert_equal [text, true],
                   R.transform(R::SPECS.first, key, text, source), key.inspect
    end
  end

  def test_unmapped_key_and_missing_english_evidence_fail_closed
    source = inventory.fetch(['default', '2168', ''])
    assert_raises(RuntimeError) do
      R.transform(R::SPECS.first, ['default', '99999', ''], 'text', source)
    end
    source['en_texts_json'] = '["Dispel the ward"]'
    assert_raises(RuntimeError) do
      R.transform(R::SPECS.first, ['default', '2168', ''], '마법 해제', source)
    end
  end

  def test_read_only_preflight_preserves_csvs_index_and_glossary
    before = M.hashes
    index_before = File.binread(M::INDEX)
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_before = File.binread(glossary)
    snapshot = File.join(__dir__, 'proper-name-discovery-D21735.tsv')
    snapshot_before = File.exist?(snapshot) ? File.binread(snapshot) : nil
    output, = capture_io { assert_equal 48, R.preflight.length }
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
