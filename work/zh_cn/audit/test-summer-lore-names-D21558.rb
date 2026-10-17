#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-summer-lore-names-D21558'

class SummerLoreNamesD21558Test < Minitest::Test
  R = SummerLoreNamesD21558
  M = ReviewedNameBatches

  def self.data
    @data ||= if File.file?(R::REVIEWS)
                [M.table(R::DEFINITIONS).map(&:to_h), M.table(R::REVIEWS).map(&:to_h)]
              else
                _headers, definitions, rows = R.prepare
                [definitions, rows]
              end
  end

  def test_complete_source_scope_and_invariants
    definitions, rows = self.class.data
    assert_equal 3, definitions.length
    assert_equal 11, rows.length
    pairs = rows.flat_map { |row| JSON.parse(row['entity_dispositions_json']).keys.map { |entity| [entity, *M.key(row)] } }
    assert_equal 13, pairs.length
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

  def test_repeated_artifact_mentions_and_titles_not_people
    definitions, rows = self.class.data
    prince = definitions.find { |row| row['entity_key'] == R::PRINCE }
    assert_equal 'title', prince['category']
    assert_equal '', prince['english_aliases']
    assert_includes prince['notes'], 'not explicitly establish'
    kingdom = definitions.find { |row| row['entity_key'] == R::KINGDOM }
    assert_equal '', kingdom['english_aliases']
    by_id = rows.to_h { |row| [row['ID_Linha'], row] }
    assert_equal 2, by_id.fetch('61425')['new'].scan('운명의 부적(Talisman of Fate)').length
    %w[18583 35083].each do |id|
      assert_equal '운명의 부적(The Talisman of Fate)', by_id.fetch(id)['new']
    end
    %w[1833 11199].each do |id|
      assert_includes by_id.fetch(id)['new'], '봄의 왕자(Prince of Spring)'
      assert_equal by_id.fetch(id)['old'][/여름 궁정\([^)]*\)/], by_id.fetch(id)['new'][/여름 궁정\([^)]*\)/]
    end
    assert_includes by_id.fetch('31067')['new'], "'여름 대왕국(Great Kingdom of Summer)'"
    assert_equal by_id.fetch('18032')['old'], by_id.fetch('18032')['new']
  end
end
