#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'correct-bloodstone-pair-D21688'

class CorrectBloodstonePairD21688Test < Minitest::Test
  M = CorrectBloodstonePairD21688

  def source(text = M::OLD)
    {
      'en_texts_json' => JSON.generate([M::ENGLISH]),
      'ja_texts_json' => JSON.generate([M::JAPANESE]),
      'zh_text' => M::CHINESE,
      'work_text' => text
    }
  end

  def indexed
    {
      'entity_key' => M::ENTITY,
      'resource' => M::KEY[0], 'ID_Linha' => M::KEY[1],
      'Tipo_Variante' => M::KEY[2], 'status' => 'not-an-issue',
      'evidence' => 'D-21680: prior terminal decision'
    }
  end

  def test_corrects_only_the_unpaired_bloodstone_span
    row = M.review(source, indexed)
    assert_equal M::OLD, row.fetch('old')
    assert_equal M::NEW, row.fetch('new')
    assert_equal 'accepted', row.fetch('status')
    assert_equal '{"unique_item:bloodstone":"not-an-issue"}', row.fetch('previous_status')
    assert_includes row.fetch('new'), '서클릿과 블러드스톤(Bloodstone), 칸드리안의 장미'
  end

  def test_already_corrected_cell_does_not_create_a_second_edit
    row = M.review(source(M::NEW), indexed)
    assert_equal M::OLD, row.fetch('old')
    assert_equal M::NEW, row.fetch('new')
    assert_equal 'accepted', row.fetch('status')
  end

  def test_sibling_occurrence_snapshots_update_without_changing_dispositions
    siblings = %w[person:derfel place:kandrian unique_item:bloodstone].map do |entity|
      {'resource' => 'default', 'ID_Linha' => '20046', 'Tipo_Variante' => '',
       'entity_key' => entity, 'status' => entity == 'place:kandrian' ? 'excluded' : 'not-an-issue',
       'evidence' => "keep #{entity}", 'korean_current' => M::OLD}
    end
    before = siblings.map { |row| [row['entity_key'], row['status'], row['evidence']] }
    assert_equal 3, M.sync_occurrence_snapshots(siblings).length
    assert siblings.all? { |row| row['korean_current'] == M::NEW }
    assert_equal before, siblings.map { |row| [row['entity_key'], row['status'], row['evidence']] }
  end

  def test_source_and_terminal_history_are_required
    changed_source = source
    changed_source['zh_text'] = 'changed'
    assert_raises(RuntimeError) { M.review(changed_source, indexed) }
    changed_index = indexed.merge('status' => 'accepted')
    assert_raises(RuntimeError) { M.review(source, changed_index) }
  end
end
