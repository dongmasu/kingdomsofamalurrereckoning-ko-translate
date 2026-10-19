#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'review-source-labels-D21621'
require_relative 'review-special-attacks-D21623'

class ProperNameCloseoutD21621D21624Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @inventory = M.table(M::INVENTORY).to_h { |r| [M.key(r), r.to_h] }
    @index = M.table(M::INDEX)
    @glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
  end

  def manifest(d)
    M.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv"))
  end

  def test_source_label_annotations_do_not_invent_entity_owners
    rows = manifest(21_621)
    assert_equal 27, rows.length
    assert_equal 22, rows.count { |r| r['old'] != r['new'] }
    assert_equal SourceLabelsD21621::EXPECTED_KEYS.sort, rows.map { |r| M.key(r) }.sort
    rows.each do |row|
      assert_equal row['new'], @inventory.fetch(M.key(row))['work_text']
      assert_empty @index.select { |r| M.key(r) == M.key(row) }
      assert_empty @glossary.select { |r| r['entity_key'] == row['entity_key'] }
    end
    assert_equal '이즈즈고이(Yzzzzhgoi)', @inventory.fetch(['default', '63091', ''])['work_text']
    assert_equal '이즈고이(Yzzzzhgoi)', @inventory.fetch(['default', '64752', ''])['work_text']
  end

  def test_warding_vortex_names_and_marker_bytes
    rows = manifest(21_622)
    assert_equal 5, rows.length
    rows.each do |row|
      assert_equal row['new'], @inventory.fetch(M.key(row))['work_text']
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
    end
    %w[skill:warding-blast skill:mages-vortex].each do |entity|
      matches = @index.select { |r| r['entity_key'] == entity }
      assert_equal 4, matches.length
      assert matches.all? { |r| r['status'] == 'accepted' }
    end
  end

  def test_special_attack_scopes_exclude_homonyms
    rows = [*manifest(21_623).map(&:to_h), *manifest(21_624).map(&:to_h)]
    assert_equal 75, rows.length
    assert_equal 75, rows.map { |r| M.key(r) }.uniq.length
    assert_equal 45, rows.count { |r| r['old'] != r['new'] }
    entities = ReviewSpecialAttacksD21623::SPECS.keys.map { |name| ReviewSpecialAttacksD21623.entity(name) }
    matches = @index.select { |r| entities.include?(r['entity_key']) }
    assert_equal 99, matches.length
    rows.each do |row|
      assert_equal row['new'], @inventory.fetch(M.key(row))['work_text']
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::STRUCTURAL),
                   row['new'].scan(ReviewedProperNameDiscovery::STRUCTURAL)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_equal row['old'], row['new'] if %w[excluded uncertain].include?(row['status'])
    end
    hold = matches.find { |r| M.key(r) == ['base', '2306', '11'] }
    assert_equal 'uncertain', hold['status']
    %w[24902 52067 61514].each do |id|
      assert_equal 'excluded', matches.find { |r| r['entity_key'] == 'skill:gravedigger' && r['ID_Linha'] == id }['status']
    end
    assert_includes @inventory.fetch(['default', '9430', ''])['work_text'], '}(Horizon Edge)과'
    refute_includes @inventory.fetch(['default', '9430', ''])['work_text'], '}(Horizon Edge)와'
  end
end
