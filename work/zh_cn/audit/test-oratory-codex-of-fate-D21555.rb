#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-oratory-codex-of-fate-D21555'

class OratoryCodexOfFateD21555Test < Minitest::Test
  R = OratoryCodexOfFateD21555
  M = ReviewedNameBatches

  def self.data
    @data ||= if File.file?(R::REVIEWS)
                [M.table(R::DEFINITIONS).map(&:to_h), M.table(R::REVIEWS).map(&:to_h)]
              else
                _headers, definitions, rows = R.prepare
                [definitions, rows]
              end
  end

  def test_exact_source_scope_and_invariants
    definitions, rows = self.class.data
    assert_equal 4, definitions.length
    assert_equal 21, rows.length
    pairs = rows.flat_map { |row| JSON.parse(row['entity_dispositions_json']).keys.map { |entity| [entity, *M.key(row)] } }
    assert_equal 24, pairs.length
    assert_equal R.expected_pairs.sort, pairs.sort
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    rows.each do |row|
      source = inventory.fetch(M.key(row))
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
      assert_equal source['zh_text'], row['chinese']
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE), row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
  end

  def test_atomic_labels_and_preserved_court_names
    rows = self.class.data.last.to_h { |row| [M.key(row), row] }
    [%w[base 32 11], ['default', '27115', '']].each do |key|
      row = rows.fetch(key)
      assert_equal '발라드의 집 오라토리움(Ballads Oratory)', row['new']
      assert_equal 'excluded', JSON.parse(row['entity_dispositions_json']).fetch(R::ORATORY)
    end
    assert_includes rows.fetch(['default', '5668', ''])['new'], '하우스 오라토리움(House Oratory)'
    %w[271 4627 7060 59225].each do |id|
      assert_equal '오라토리움(The Oratory)', rows.fetch(['default', id, ''])['new']
    end
    assert_equal 2, rows.fetch(['default', '17684', ''])['new'].scan('오라토리움(Oratory)').length
    %w[46875 54202].each do |id|
      row = rows.fetch(['default', id, ''])
      assert_equal row['old'][/여름 궁정\([^)]*\)/], row['new'][/여름 궁정\([^)]*\)/]
    end
  end

  def test_codex_source_name_not_merged_with_destiny
    definitions, rows = self.class.data
    codex = definitions.find { |row| row['entity_key'] == R::CODEX }
    assert_equal '', codex['english_aliases']
    assert_equal '운명의 서(Codex of Fate)', codex['korean_canonical']
    assert_includes codex['notes'], 'no evidence here proves'
    source_rows = rows.select { |row| row['entity_key'] == R::CODEX }
    assert_equal R::CODEX_IDS.sort, source_rows.map { |row| row['ID_Linha'] }.sort
    source_rows.each { |row| assert_includes row['new'], '운명의 서(Codex of Fate)' }
  end
end
