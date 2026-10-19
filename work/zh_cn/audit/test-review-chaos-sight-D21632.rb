#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-chaos-sight-D21632'

class ReviewChaosSightD21632Test < Minitest::Test
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  S = ReviewChaosSightD21632

  def setup
    @inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
    @glossary = M.table(R::GLOSSARY)
    @index = M.table(M::INDEX)
    @glossary_bytes = File.binread(R::GLOSSARY)
    @index_bytes = File.binread(M::INDEX)
  end

  def prepare
    definition_path = File.join(__dir__, 'proper-name-discovery-definitions-D21632.tsv')
    review_path = File.join(__dir__, 'proper-name-discovery-D21632.tsv')
    if File.file?(definition_path) && File.file?(review_path)
      return [
        @glossary.headers,
        M.table(definition_path).first.to_h,
        M.table(review_path).map(&:to_h)
      ]
    end
    S.prepare(inventory: @inventory, glossary: @glossary, index: @index)
  end

  def test_scope_covers_all_english_hits_and_only_skill_rows_change
    headers, definition, reviews = prepare
    assert_equal 'skill:chaos-sight', definition['entity_key']
    assert_equal '혼돈의 시야(Chaos Sight)', definition['korean_canonical']
    assert_empty definition['english_aliases']
    assert_equal 13, reviews.length
    assert_equal S::EXPECTED_KEYS.sort, reviews.map { |row| M.key(row) }.sort
    assert_equal 11, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 2, reviews.count { |row| row['status'] == 'excluded' }
    assert_operator reviews.length, :<=, 50
    assert_equal %w[37000 63367], reviews.select { |row| row['status'] == 'excluded' }.map { |row| row['ID_Linha'] }.sort
    assert reviews.all? { |row| row['resource'] == 'default' }
    reviews.each do |row|
      source = @inventory.fetch(M.key(row))
      assert_includes row['english'], 'Chaos Sight'
      assert_equal source['zh_text'], row['chinese']
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
      assert_equal row['old'].scan(R::STRUCTURAL), row['new'].scan(R::STRUCTURAL)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_equal row['old'], row['new'] if row['status'] == 'excluded'
    end
    assert_equal '혼돈의 시야(Chaos Sight)', reviews.find { |row| row['ID_Linha'] == '44531' }['new']
    assert_includes reviews.find { |row| row['ID_Linha'] == '15410' }['new'], '혼돈의 시야(Chaos Sight) 효과'
    assert_includes reviews.find { |row| row['ID_Linha'] == '16239' }['new'], '혼돈의 시야(Chaos Sight)'
  end

  def test_markers_are_unchanged_and_annotation_is_outside
    _headers, _definition, reviews = prepare
    {
      '57380' => '{*1혼돈 감지}(Chaos Sight)',
      '63316' => '{*1혼돈 감지}(Chaos Sight)',
      '64450' => '{*1혼돈의 시야}(Chaos Sight)'
    }.each do |id, expected|
      row = reviews.find { |review| review['ID_Linha'] == id }
      assert_includes row['new'], expected
      assert_equal row['old'].scan(/\{\*1[^{}]*\}/), row['new'].scan(/\{\*1[^{}]*\}/)
    end
    guide = reviews.find { |row| row['ID_Linha'] == '64450' }
    assert_equal 2, guide['new'].scan('혼돈의 시야(Chaos Sight)').length
  end

  def test_jock_is_held_for_existing_owner_workflow_without_duplicate_entity
    _headers, definition, _reviews = prepare
    owner = @glossary.find { |row| row['entity_key'] == 'person:jock-macnelly' }
    refute_nil owner
    assert_equal 'Jock MacNelly', owner['english_canonical']
    assert_equal '조크 맥넬리(Jock MacNelly)', owner['korean_canonical']
    assert_empty owner['english_aliases']
    assert_equal %w[10371 17669 37175 38304 58470 63443 63949 64870],
                 S::JOCK_HELD_KEYS.map { |key| key[1] }.sort
    assert_equal %w[10371 37175 38304 58470 63443 64870],
                 S::JOCK_UNPAIRED_KEYS.sort
    assert_equal %w[17669 63949], S::JOCK_ALREADY_BILINGUAL_KEYS.sort
    assert_includes S::JOCK_HOLD_NOTE, 'dedicated existing-owner alias workflow'
    assert_includes S::JOCK_HOLD_NOTE, 'marker-only 63443'
    refute_equal 'person:jock-macnelly', definition['entity_key']
    refute @index.any? { |row| row['entity_key'] == 'person:jock-macnelly' && S::JOCK_HELD_KEYS.include?(M.key(row)) }
  end

  def test_prepare_does_not_write_shared_registry_or_csv
    prepare
    assert_equal @glossary_bytes, File.binread(R::GLOSSARY)
    assert_equal @index_bytes, File.binread(M::INDEX)
  end
end
