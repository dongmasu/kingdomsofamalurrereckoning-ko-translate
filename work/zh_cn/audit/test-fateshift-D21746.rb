#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-fateshift-D21746'

class ReviewFateshiftD21746Test < Minitest::Test
  R = ReviewFateshiftD21746
  M = ReviewedNameBatches

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def source_keys
    inventory.values.select { |row| R.source_has_term?(row) }
             .map { |row| M.key(row) }.sort
  end

  def test_full_scope_is_exactly_16_rows_and_excludes_fateshifter
    keys = R.preflight
    assert_equal 16, keys.length
    assert_equal 16, keys.uniq.length
    assert_equal (R::SPANS.keys + R::COMPLETE_KEYS).sort, keys
    refute_includes keys, ['affix', '470', '11']
    assert_equal 16, R::SPECS.first.fetch(:count)
    assert_equal 'lore term', R::SPECS.first.fetch(:category)
  end

  def test_scope_transform_is_exact_and_idempotent
    changed = 0
    source_keys.each do |key|
      source = inventory.fetch(key)
      current = source.fetch('work_text')
      updated, excluded = R.transform(R::SPECS.first, key, current, source)
      refute excluded, key.inspect
      assert_includes updated, R::CANONICAL, key.inspect
      assert_equal [updated, false],
                   R.transform(R::SPECS.first, key, updated, source), key.inspect
      assert_equal current.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   updated.scan(ReviewedProperNameDiscovery::STRUCTURAL), key.inspect
      assert_equal current.scan(/\r\n|\r|\n/),
                   updated.scan(/\r\n|\r|\n/), key.inspect
      changed += 1 if current != updated
    end
    assert_includes [0, 14], changed
  end

  def test_manifest_replays_exactly_14_changes_and_preserves_prior_findings
    path = File.join(__dir__, 'proper-name-edits-D21746.tsv')
    return unless File.file?(path)
    manifest = M.table(path).map(&:to_h)
    assert_equal 16, manifest.length
    changed = manifest.count do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      transformed, excluded = R.transform(
        R::SPECS.first, key, row.fetch('old'), source
      )
      refute excluded, key.inspect
      assert_equal row.fetch('new'), transformed, key.inspect
      assert_equal row.fetch('new'), source.fetch('work_text'), key.inspect
      row.fetch('old') != row.fetch('new')
    end
    assert_equal 14, changed

    register = File.read(File.join(__dir__, 'decision-register-20261009.md'))
    assert_match(/D-5455 \| `default` 17275 .* \| unchanged \| uncertain \|/, register)
    assert_match(/D-18393 \| `default` 22183 .* \| not an issue \|/, register)
    assert_match(/D-11378 \| `default` 35098 .* \| unchanged \| uncertain \|/, register)
    assert_match(/D-11769 \| `default` 36553 .* \| unchanged \| uncertain \|/, register)
  end

  def test_read_only_preflight_preserves_csvs_index_and_glossary
    before = M.hashes
    index_before = File.binread(M::INDEX)
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_before = File.binread(glossary)
    output, = capture_io do
      assert_equal 16, R.preflight.length
    end
    assert_includes output, 'read-only'
    assert_match(/(?:0|14) cell edits/, output)
    assert_equal before, M.hashes
    assert_equal index_before, File.binread(M::INDEX)
    assert_equal glossary_before, File.binread(glossary)
  end
end
