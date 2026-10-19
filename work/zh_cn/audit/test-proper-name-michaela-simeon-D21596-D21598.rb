#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-michaela-vogel-D21596'
require_relative 'review-simeon-crowe-D21597'

class MichaelaSimeonProperNamesD21596D21598Test < Minitest::Test
  M = ReviewedNameBatches
  AUDIT = __dir__

  def manifest(d)
    M.table(File.join(AUDIT, "proper-name-edits-D#{d}.tsv")).map(&:to_h)
  end

  def glossary
    M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
  end

  def test_michaela_full_name_scope_and_source_local_english_variant
    rows = manifest(21_596)
    assert_equal ReviewMichaelaVogelD21596::EXPECTED_IDS.sort,
      rows.map { |row| row['ID_Linha'] }.sort
    changed = rows.select { |row| row['old'] != row['new'] }
    assert_equal ReviewMichaelaVogelD21596::EDIT_IDS.sort,
      changed.map { |row| row['ID_Linha'] }.sort
    assert_equal '미카엘라 포겔(Michael Vogel)',
      rows.find { |row| row['ID_Linha'] == '10131' }['new'].match(/미카엘라 포겔\(Michael Vogel\)/)[0]
    %w[20080 33250 49928].each do |id|
      row = rows.find { |entry| entry['ID_Linha'] == id }
      assert_includes row['new'], '미카엘라 포겔(Michaela Vogel)'
      assert_equal 'accepted', row['status']
    end
    %w[23667 28098].each do |id|
      row = rows.find { |entry| entry['ID_Linha'] == id }
      assert_equal row['old'], row['new']
      assert_equal 'not-an-issue', row['status']
    end
    definition = glossary.find { |row| row['entity_key'] == 'person:michaela-vogel' }
    assert_equal 'Michaela Vogel', definition['english_canonical']
    assert_includes definition['english_aliases'].split('|'), 'Michael Vogel'
  end

  def test_simeon_full_name_and_short_reference_scope
    rows = manifest(21_597)
    assert_equal ReviewSimeonCroweD21597::EXPECTED_IDS.sort,
      rows.map { |row| row['ID_Linha'] }.sort
    changed = rows.select { |row| row['old'] != row['new'] }
    assert_equal ReviewSimeonCroweD21597::EDIT_IDS.sort,
      changed.map { |row| row['ID_Linha'] }.sort
    %w[8970 9804 43122].each do |id|
      assert_includes rows.find { |row| row['ID_Linha'] == id }['new'],
        '시미언 크로(Simeon Crowe)'
    end
    %w[57087 61092].each do |id|
      row = rows.find { |entry| entry['ID_Linha'] == id }
      assert_equal row['old'], row['new']
      assert_equal 'not-an-issue', row['status']
    end
    definition = glossary.find { |row| row['entity_key'] == 'person:simeon-crowe' }
    assert_equal 'Simeon', definition['english_aliases']
    has_surname_only_hit = M.table(M::INDEX).any? do |row|
      row['entity_key'] == 'person:simeon-crowe' &&
        M.key(row) == ['default', '33404', '']
    end
    refute has_surname_only_hit
  end

  def test_michaela_possessive_short_reference_is_indexed_without_csv_edit
    rows = M.table(File.join(AUDIT, 'proper-name-short-reference-D21598.tsv')).map(&:to_h)
    assert_equal 1, rows.length
    row = rows.first
    assert_equal ['default', '51941', ''], M.key(row)
    assert_equal 'not-an-issue', row['status']
    assert_equal row['old'], row['new']
    assert_includes row['evidence'], "Michaela's"
    assert_includes row['evidence'], 'later short reference'
    occurrence = M.table(M::INDEX).find do |entry|
      entry['entity_key'] == 'person:michaela-vogel' &&
        M.key(entry) == M.key(row)
    end
    refute_nil occurrence
    assert_equal row['new'], occurrence['korean_current']
    assert_equal 'not-an-issue', occurrence['status']
    definition = glossary.find { |entry| entry['entity_key'] == 'person:michaela-vogel' }
    assert_includes definition['english_aliases'].split('|'), 'Michaela'
  end

  def test_csv_backup_hashes_match_each_recorded_pre_edit_hash
    checks = {
      21_596 => 'eb0b84c5792ab811bc0b6c2ea23b656f84fd2c22f4248de361f6d0056058acad',
      21_597 => 'c3f01984d7feb903be8d639b99c5538eb2fa1b3e3fa18b0f24aabf7bbbc439df'
    }
    checks.each do |decision, expected|
      backup = "/private/tmp/ko-translate-backups/20261017/before-proper-name-D#{decision}/locatexts_zh_cn.koalocatext_default.csv"
      assert_equal expected, Digest::SHA256.file(backup).hexdigest
    end
    assert_equal 'd34f7816844a38137fb27ae318156fdb6754ebe61a21a8a68870ee50956bcb60',
      Digest::SHA256.file(M.csv_path('default')).hexdigest
  end
end
