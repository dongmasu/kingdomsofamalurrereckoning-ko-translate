#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-eastern-strand-erathi-nexus-D21739'

class ReviewEasternStrandErathiNexusD21739Test < Minitest::Test
  R = ReviewEasternStrandErathiNexusD21739
  M = ReviewedNameBatches
  CANONICAL = {
    'Eastern Strand' => '동쪽 해안(Eastern Strand)',
    'Erathi Nexus' => '에라시 넥서스(Erathi Nexus)'
  }.freeze

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def test_full_english_scopes_are_exact
    generated = R.preflight
    assert_equal 6, generated.map { |row| [row[1], row[2], row[3]] }.uniq.length
    counts = generated.group_by(&:first).transform_values(&:length)
    assert_equal({ 'place:eastern-strand' => 2, 'place:erathi-nexus' => 4 }, counts)
    assert_equal 2, R::SPECS.first.fetch(:count)
    assert_equal 4, R::SPECS.last.fetch(:count)
  end

  def test_replacements_are_exact_idempotent_and_structurally_safe
    R::SPANS.each do |key, (old, replacement)|
      source = inventory.fetch(key)
      term = key[1] == '59672' ? 'Eastern Strand' : 'Erathi Nexus'
      spec = R::SPECS.find { |row| row.fetch(:english) == term }
      original = source.fetch('work_text')
      changed, excluded = R.transform(spec, key, original, source)
      refute excluded, key.inspect
      expected = original.include?(replacement) ? original : original.sub(old, replacement)
      assert_equal expected, changed, key.inspect
      assert_equal [changed, false], R.transform(spec, key, changed, source), key.inspect
      assert_equal original.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   changed.scan(ReviewedProperNameDiscovery::STRUCTURAL), key.inspect
      assert_equal original.scan(/\r\n|\r|\n/), changed.scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_existing_place_references_are_preserved
    R::COMPLETE_KEYS.each do |key|
      source = inventory.fetch(key)
      term = key[1] == '24089' ? 'Eastern Strand' : 'Erathi Nexus'
      spec = R::SPECS.find { |row| row.fetch(:english) == term }
      text = source.fetch('work_text')
      assert_equal [text, false], R.transform(spec, key, text, source), key.inspect
    end
  end

  def test_unmapped_key_and_missing_english_evidence_fail_closed
    spec = R::SPECS.first
    source = inventory.fetch(['default', '59672', ''])
    assert_raises(RuntimeError) do
      R.transform(spec, ['default', '99999', ''], 'text', source)
    end
    source['en_texts_json'] = '["Southern Strand"]'
    assert_raises(RuntimeError) do
      R.transform(spec, ['default', '59672', ''], '동쪽 해안', source)
    end
  end

  def test_read_only_preflight_preserves_csvs_index_and_glossary
    before = M.hashes
    index_before = File.binread(M::INDEX)
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_before = File.binread(glossary)
    output, = capture_io { assert_equal 6, R.preflight.map { |row| [row[1], row[2], row[3]] }.uniq.length }
    assert_includes output, 'read-only'
    assert_equal before, M.hashes
    assert_equal index_before, File.binread(M::INDEX)
    assert_equal glossary_before, File.binread(glossary)
  end
end
