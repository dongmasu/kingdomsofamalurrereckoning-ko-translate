#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-jock-alias-D21634'

class ReviewJockAliasD21634Test < Minitest::Test
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  S = ReviewJockAliasD21634

  def setup
    @inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
    @glossary = M.table(R::GLOSSARY)
    @index = M.table(M::INDEX)
    @glossary_bytes = File.binread(R::GLOSSARY)
    @index_bytes = File.binread(M::INDEX)
    @csv_hashes = M.hashes
    @docs = M::DOCS.to_h { |path| [path, File.binread(path)] }
  end

  def prepare
    S.prepare(inventory: @inventory, glossary: @glossary, index: @index)
  end

  def test_short_alias_scope_and_row_edits_are_exact
    prepared = prepare
    reviews = prepared.fetch(:reviews)
    assert_equal S::SHORT_KEYS.sort, reviews.map { |row| M.key(row) }.sort
    assert_equal 8, reviews.length
    assert_equal 6, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 2, reviews.count { |row| row['status'] == 'not-an-issue' }
    assert_equal S::FULL_KEYS.sort,
                 prepared.fetch(:generated).map { |row| M.key(row) }
                   .select { |key| S::FULL_KEYS.include?(key) }.sort
    assert_equal (S::SHORT_KEYS + S::FULL_KEYS).sort,
                 prepared.fetch(:generated).map { |row| M.key(row) }.sort

    expected = {
      '10371' => '조크(Jock)에게 부탁해',
      '17669' => '조크(Jock)에게 혼돈 무기(Chaos Weapon)',
      '37175' => '난 조크(Jock)야',
      '38304' => '조크(Jock)는 좋은 녀석',
      '58470' => '조크(Jock)와 나는',
      '63949' => '조크(Jock)가 도와줄지도',
      '64870' => '제자 조크(Jock)에게',
      '63443' => '{*1조크}(Jock)에게 맡겨도 돼.'
    }
    reviews.each do |row|
      source = @inventory.fetch(M.key(row))
      assert_includes row['english'], 'Jock'
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
                   row['japanese']
      assert_equal source.fetch('zh_text'), row['chinese']
      assert_equal row['old'].scan(R::STRUCTURAL), row['new'].scan(R::STRUCTURAL)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_includes row['new'], expected.fetch(row['ID_Linha'])
    end
    assert_equal reviews.find { |row| row['ID_Linha'] == '17669' }['old'],
                 reviews.find { |row| row['ID_Linha'] == '17669' }['new']
    assert_equal reviews.find { |row| row['ID_Linha'] == '63949' }['old'],
                 reviews.find { |row| row['ID_Linha'] == '63949' }['new']
  end

  def test_existing_owner_alias_addendum_preserves_historical_caution
    prepared = prepare
    original = @glossary.find { |row| row['entity_key'] == S::ENTITY }
    updated = prepared.fetch(:owner)
    assert_equal S::ENTITY, updated['entity_key']
    assert_equal 'Jock MacNelly', updated['english_canonical']
    assert_equal '조크 맥넬리(Jock MacNelly)', updated['korean_canonical']
    assert_equal 'Jock', updated['english_aliases']
    assert_includes original['notes'], 'do not invent a bare Jock alias'
    assert_includes updated['notes'], original['notes']
    assert_includes updated['notes'], 'scoped supersession/addendum'
    assert_includes updated['notes'], 'default:37175'
    assert_includes updated['notes'], 'default:64870'
    assert_includes updated['notes'], 'default:63443'
    assert_equal 1, prepared.fetch(:original_glossary).count { |row| row['entity_key'] == S::ENTITY }
  end

  def test_prior_full_name_decisions_and_mixed_row_decisions_are_preserved
    prepared = prepare
    before = prepared.fetch(:original_index)
    after = prepared.fetch(:updated_index)
    before_by_key = before.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    after_by_key = after.to_h { |row| [[row['entity_key'], *M.key(row)], row] }

    S::FULL_KEYS.each do |key|
      old = before_by_key.fetch([S::ENTITY, *key])
      updated = after_by_key.fetch([S::ENTITY, *key])
      assert_equal old['status'], updated['status']
      assert_equal old['evidence'], updated['evidence']
      assert_equal 'Jock|Jock MacNelly', updated['matched_english']
    end
    mixed_entities = %w[
      person:skald-atlas faction:house-of-valor lore_term:chaos-node
      resource:chaos-matter resource:chaos-weapon-core item:chaos-weapon
    ]
    mixed_entities.each do |entity|
      before_rows = before.select { |row| mixed_entities.include?(row['entity_key']) }
      before_rows.each do |old|
        next unless [S::SHORT_KEYS.map { |key| key[1] }].flatten.include?(old['ID_Linha']) &&
                    entity == old['entity_key']
        current = after_by_key.fetch([entity, *M.key(old)])
        assert_equal old['status'], current['status']
        assert_equal old['evidence'], current['evidence']
        assert_equal old['matched_english'], current['matched_english']
      end
    end
    assert_equal 6, before.select { |row| row['entity_key'] == S::ENTITY }.length
    assert_equal 14, after.count { |row| row['entity_key'] == S::ENTITY }
  end

  def test_prepare_does_not_write_shared_files
    prepare
    assert_equal @glossary_bytes, File.binread(R::GLOSSARY)
    assert_equal @index_bytes, File.binread(M::INDEX)
    assert_equal @csv_hashes, M.hashes
    @docs.each { |path, bytes| assert_equal bytes, File.binread(path) }
  end

  def test_alias_collision_is_rejected
    glossary = @glossary.map(&:to_h)
    glossary.find { |row| row['entity_key'] != S::ENTITY }['english_aliases'] = 'Jock'
    error = assert_raises(RuntimeError) { S.updated_owner(glossary) }
    assert_includes error.message, 'already assigned'
  end
end
