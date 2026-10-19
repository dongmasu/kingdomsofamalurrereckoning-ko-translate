#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-detect-hidden-D21732'

class ReviewDetectHiddenD21732Test < Minitest::Test
  R = ReviewDetectHiddenD21732
  M = ReviewedNameBatches

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def test_full_english_scope_is_exactly_22_keys
    keys = R.preflight
    assert_equal 22, keys.length
    assert_equal (R::SPANS.keys + R::COMPLETE_KEYS).sort, keys
    assert_equal 22, R::SPECS.first.fetch(:count)
    assert_equal 'skill:detect-hidden', R::SPECS.first.fetch(:key)
    assert_equal '숨겨진 물건 찾기(Detect Hidden)', R::SPECS.first.fetch(:korean)
  end

  def test_all_replacements_are_exact_and_idempotent
    R::SPANS.each do |key, (old, replacement)|
      source = inventory.fetch(key)
      original = source.fetch('work_text')
      changed, excluded = R.transform(R::SPECS.first, key, original, source)
      refute excluded
      expected = original.include?(replacement) ? original : original.sub(old, replacement)
      assert_equal expected, changed, key.inspect
      assert_equal [changed, false],
                   R.transform(R::SPECS.first, key, changed, source), key.inspect
      assert_equal original.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   changed.scan(ReviewedProperNameDiscovery::STRUCTURAL), key.inspect
      assert_equal original.scan(/\r\n|\r|\n/), changed.scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_existing_canonical_reference_is_preserved
    key = R::COMPLETE_KEYS.first
    source = inventory.fetch(key)
    text = source.fetch('work_text')
    assert_equal [text, false], R.transform(R::SPECS.first, key, text, source)
  end

  def test_unmapped_key_and_missing_english_evidence_fail_closed
    source = inventory.fetch(['default', '23679', ''])
    assert_raises(RuntimeError) do
      R.transform(R::SPECS.first, ['default', '99999', ''], 'text', source)
    end
    source['en_texts_json'] = '["An unrelated line"]'
    assert_raises(RuntimeError) do
      R.transform(R::SPECS.first, ['default', '23679', ''], '숨겨진 물건 찾기', source)
    end
  end

  def test_read_only_preflight_does_not_change_active_csvs_or_index
    before = M.hashes
    index_before = File.binread(M::INDEX)
    snapshot_path = File.join(__dir__, 'proper-name-discovery-D21732.tsv')
    snapshot_before = File.exist?(snapshot_path) ? File.binread(snapshot_path) : nil
    output, = capture_io { assert_equal 22, R.preflight.length }
    assert_includes output, 'read-only'
    assert_equal before, M.hashes
    assert_equal index_before, File.binread(M::INDEX)
    snapshot_after = File.exist?(snapshot_path) ? File.binread(snapshot_path) : nil
    assert_equal snapshot_before, snapshot_after
  end
end
