#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-fatesworn-faction-D21747'

class ReviewFateswornFactionD21747Test < Minitest::Test
  R = ReviewFateswornFactionD21747
  M = ReviewedNameBatches

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def source_keys
    inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Fatesworn(?![A-Za-z])/i)
      end
    end.map { |row| M.key(row) }.sort
  end

  def test_all_37_source_rows_have_explicit_scoped_dispositions
    keys = R.preflight
    assert_equal 37, keys.length
    assert_equal 37, keys.uniq.length
    assert_equal (R::SPANS.keys + R::COMPLETE_KEYS + R::EXCLUDED_KEYS).sort, keys
    assert_equal 37, R::SPECS.first.fetch(:count)
    assert_equal 'faction', R::SPECS.first.fetch(:category)
  end

  def test_transform_preserves_complete_and_excluded_other_referents
    source_keys.each do |key|
      source = inventory.fetch(key)
      current = source.fetch('work_text')
      updated, excluded = R.transform(R::SPECS.first, key, current, source)
      if R::EXCLUDED_KEYS.include?(key)
        assert excluded, key.inspect
        assert_equal current, updated, key.inspect
      else
        refute excluded, key.inspect
        assert_includes updated, R::CANONICAL, key.inspect
        assert_equal current, updated if current.include?(R::CANONICAL)
      end
      assert_equal current.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   updated.scan(ReviewedProperNameDiscovery::STRUCTURAL), key.inspect
      assert_equal current.scan(/\r\n|\r|\n/),
                   updated.scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_manifest_replays_only_seven_faction_edits
    path = File.join(__dir__, 'proper-name-edits-D21747.tsv')
    return unless File.file?(path)
    manifest = M.table(path).map(&:to_h)
    assert_equal 37, manifest.length
    assert_equal 37, manifest.map { |row| M.key(row) }.uniq.length
    changed = manifest.count do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      transformed, excluded = R.transform(
        R::SPECS.first, key, row.fetch('old'), source
      )
      assert_equal R::EXCLUDED_KEYS.include?(key), excluded, key.inspect
      assert_equal row.fetch('new'), transformed, key.inspect
      assert_equal row.fetch('new'), source.fetch('work_text'), key.inspect
      row.fetch('old') != row.fetch('new')
    end
    assert_equal 7, changed

    index = M.table(M::INDEX).map(&:to_h)
    hope = index.select do |row|
      row['entity_key'] == 'unique_item:hope-of-the-fatesworn'
    end
    assert hope.any? { |row| M.key(row) == ['default', '8089', ''] && row['status'] == 'uncertain' }
    assert hope.any? { |row| M.key(row) == ['default', '9966', ''] && row['status'] == 'accepted' }
  end

  def test_read_only_preflight_preserves_existing_csvs_and_index
    before = M.hashes
    index_before = File.binread(M::INDEX)
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_before = File.binread(glossary)
    output, = capture_io { assert_equal 37, R.preflight.length }
    assert_includes output, 'read-only'
    assert_equal before, M.hashes
    assert_equal index_before, File.binread(M::INDEX)
    assert_equal glossary_before, File.binread(glossary)
  end
end
