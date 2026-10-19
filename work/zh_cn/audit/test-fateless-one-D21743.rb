#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-fateless-one-D21743'

class ReviewFatelessOneD21743Test < Minitest::Test
  R = ReviewFatelessOneD21743
  M = ReviewedNameBatches

  def inventory
    @inventory ||= M.table(M::INVENTORY).to_h do |row|
      [M.key(row), row.to_h]
    end
  end

  def source_keys
    inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Fateless One(?![A-Za-z])/i)
      end
    end.map { |row| M.key(row) }.sort
  end

  def test_full_english_scope_is_exactly_125_default_keys
    keys = R.preflight
    assert_equal 125, keys.length
    assert_equal 125, keys.uniq.length
    assert keys.all? { |resource, _, _| resource == 'default' }
    assert_equal 125, R::SPECS.first.fetch(:count)
    assert_equal 'title', R::SPECS.first.fetch(:category)
  end

  def test_applied_scope_is_canonical_and_idempotent
    source_keys.each do |key|
      source = inventory.fetch(key)
      current = source.fetch('work_text')
      updated, excluded = R.transform(R::SPECS.first, key, current, source)
      refute excluded, key.inspect
      assert_includes updated, R::CANONICAL, key.inspect
      assert_equal current, updated, key.inspect
      assert_equal [updated, false],
                   R.transform(R::SPECS.first, key, current, source), key.inspect
      assert_equal current.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   updated.scan(ReviewedProperNameDiscovery::STRUCTURAL), key.inspect
      assert_equal current.scan(/\r\n|\r|\n/),
                   updated.scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_three_review_manifests_replay_exactly_103_edits
    manifests = (21_743..21_745).flat_map do |d|
      M.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv")).map(&:to_h)
    end
    assert_equal 125, manifests.length
    assert_equal 125, manifests.map { |row| M.key(row) }.uniq.length

    changed = manifests.count do |row|
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
    assert_equal 103, changed
  end

  def test_historical_fateless_one_verdict_is_preserved
    register = File.read(File.join(__dir__, 'decision-register-20261009.md'))
    assert_match(
      /^\| D-19397 \| `default` 27705,.*\| not an issue \| Reuse established `Fateless One`/,
      register
    )
    assert_match(
      /D-19395 \| `default` 27705 \| uncertain, superseded by D-19397/,
      register
    )
  end

  def test_read_only_preflight_preserves_csvs_index_and_glossary
    before = M.hashes
    index_before = File.binread(M::INDEX)
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_before = File.binread(glossary)
    output, = capture_io { assert_equal 125, R.preflight.length }
    assert_includes output, 'read-only'
    assert_equal before, M.hashes
    assert_equal index_before, File.binread(M::INDEX)
    assert_equal glossary_before, File.binread(glossary)
  end
end
