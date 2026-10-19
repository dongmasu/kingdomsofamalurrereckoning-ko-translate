#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-fellfire-pit-D21748'

class ReviewFellfirePitD21748Test < Minitest::Test
  R = ReviewFellfirePitD21748
  M = ReviewedNameBatches

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def source_keys
    inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Fellfire Pit(?![A-Za-z])/i)
      end
    end.map { |row| M.key(row) }.sort
  end

  def test_exact_13_key_place_scope
    keys = R.preflight
    assert_equal 13, keys.length
    assert_equal 13, keys.uniq.length
    assert_equal (R::SPANS.keys + R::COMPLETE_KEYS).sort, keys
    assert_equal 13, R::SPECS.first.fetch(:count)
    assert_equal 'place', R::SPECS.first.fetch(:category)
  end

  def test_scope_transforms_are_exact_and_idempotent
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
    assert_includes [0, 10], changed
  end

  def test_manifest_replays_ten_place_only_edits_and_preserves_flower_identity
    path = File.join(__dir__, 'proper-name-edits-D21748.tsv')
    return unless File.file?(path)
    manifest = M.table(path).map(&:to_h)
    assert_equal 13, manifest.length
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
    assert_equal 10, changed

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    flower = glossary.find { |row| row['entity_key'] == 'item:fellfire-bloom' }
    place = glossary.find { |row| row['entity_key'] == 'place:fellfire-pit' }
    assert_equal '펠파이어 꽃(Fellfire Bloom)', flower.fetch('korean_canonical')
    assert_equal R::CANONICAL, place.fetch('korean_canonical')
    refute_equal flower.fetch('entity_key'), place.fetch('entity_key')
  end

  def test_read_only_preflight_preserves_csvs_index_and_glossary
    before = M.hashes
    index_before = File.binread(M::INDEX)
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_before = File.binread(glossary)
    output, = capture_io { assert_equal 13, R.preflight.length }
    assert_includes output, 'read-only'
    assert_match(/(?:0|10) cell edits/, output)
    assert_equal before, M.hashes
    assert_equal index_before, File.binread(M::INDEX)
    assert_equal glossary_before, File.binread(glossary)
  end
end
