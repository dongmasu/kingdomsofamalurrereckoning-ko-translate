#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-shadowskin-D21666'

class ShadowskinD21666Test < Minitest::Test
  M = ShadowskinD21666::M

  def fixture_inventory
    ShadowskinD21666::SOURCE_ROWS.to_h do |key, row|
      [
        key,
        {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'work_text' => row.fetch(:korean),
          'en_texts_json' => JSON.generate([row.fetch(:english)]),
          'ja_texts_json' => JSON.generate([row.fetch(:japanese)]),
          'zh_text' => row.fetch(:chinese)
        }
      ]
    end
  end

  def test_reviewed_source_fixture_proposes_only_six_cells
    reviews = ShadowskinD21666.plan(fixture_inventory)

    assert_equal 7, reviews.length
    assert_equal 6, reviews.count { |row| row[:old] != row[:new] }
    edits = reviews.select { |row| row[:old] != row[:new] }.to_h do |row|
      [row.fetch(:key), row.fetch(:new)]
    end
    expected = ShadowskinD21666::CHANGES.transform_values(&:last)
    assert_equal expected, edits
    pieces = reviews.select { |row| ShadowskinD21666::PIECE_KEYS.include?(row[:key]) }
    assert_equal 5, pieces.length
    pieces.each do |row|
      assert_equal 'accepted', row[:status]
      refute_match(/섀도스킨\(Shadowskin\).+\(Shadowskin /, row[:new])
      assert_equal 'excluded', row[:dispositions].fetch(ShadowskinD21666::SET_ENTITY)
    end
    lore = reviews.find { |row| row[:key] == ['default', '54687', ''] }
    assert_equal lore[:old], lore[:new]
    assert_equal 'not-an-issue', lore[:status]
    assert_equal 'not-an-issue', lore[:dispositions].fetch(ShadowskinD21666::SET_ENTITY)
  end

  def test_unknown_key_and_changed_translation_fail_closed
    source = {
      'en_texts_json' => JSON.generate(['Shadowskin Boots']),
      'ja_texts_json' => JSON.generate(['シャドウスキン・ブーツ']),
      'zh_text' => '暗影之皮靴子'
    }
    spec = ShadowskinD21666::SPECS.find { |row| row[:english] == 'Shadowskin Boots' }
    assert_raises(KeyError) do
      ShadowskinD21666.transform(spec, ['base', '9999', '11'], '그림자가죽 장화', source)
    end
    assert_raises(RuntimeError) do
      ShadowskinD21666.transform(spec, ['base', '962', '11'], '다른 장화', source)
    end
  end

  def test_missing_or_extra_inventory_rows_fail_closed
    assert_raises(RuntimeError) { ShadowskinD21666.plan({}) }
    extra = fixture_inventory
    extra[['default', '43729', '']] = extra.values.first
    assert_raises(RuntimeError) { ShadowskinD21666.plan(extra) }
  end

  def test_source_text_drift_fails_closed
    inventory = fixture_inventory
    inventory[['base', '962', '11']]['zh_text'] = 'changed'
    assert_raises(RuntimeError) { ShadowskinD21666.plan(inventory) }
  end
end
