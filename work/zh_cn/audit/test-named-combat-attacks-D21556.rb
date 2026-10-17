#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-named-combat-attacks-D21556'

class NamedCombatAttacksD21556Test < Minitest::Test
  R = NamedCombatAttacksD21556
  M = ReviewedNameBatches

  def self.data
    @data ||= if File.file?(R::REVIEWS)
                [M.table(R::DEFINITIONS).map(&:to_h), M.table(R::REVIEWS).map(&:to_h)]
              else
                glossary, definitions, rows, = R.prepare
                [definitions, rows]
              end
  end

  def rows
    self.class.data.last
  end

  def test_exact_scope_sources_and_controls
    definitions = self.class.data.first
    assert_equal 8, definitions.length
    assert_equal 20, rows.length
    pairs = rows.flat_map { |row| JSON.parse(row['entity_dispositions_json']).keys.map { |entity| [entity, *M.key(row)] } }
    assert_equal 33, pairs.length
    assert_equal R.expected_pairs.sort, pairs.sort
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    rows.each do |row|
      source = inventory.fetch(M.key(row))
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
      assert_equal source['zh_text'], row['chinese']
      assert_equal ProperNameCellEditor.tokens(row['old']), ProperNameCellEditor.tokens(row['new'])
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      R.validate_marker_changes!(row)
    end
  end

  def test_approved_localized_name_spellings_and_external_annotations
    by_id = rows.to_h { |row| [row['ID_Linha'], row] }
    assert_includes by_id.fetch('32084')['new'], '{*1[복부 찌르기]}(Gut Thrust)'
    assert_includes by_id.fetch('32084')['new'], '{*1[분쇄 일격]}(Crushing Blow)'
    assert_includes by_id.fetch('32084')['new'], '{*1[받아치기]}(Riposte)'
    %w[41817 41840].each do |id|
      text = by_id.fetch(id)['new']
      assert_includes text, '{*1복부 찌르기}(Gut Thrust)'
      assert_includes text, '{*1분쇄 일격}(Crushing Blow)'
      assert_includes text, '{*1받아치기}'
    end
    %w[56292 59670].each do |id|
      text = by_id.fetch(id)['new']
      assert_includes text, '{*1혜성 강타}(Comet Strike)'
      assert_includes text, '{*1미노타우로스 돌진}(Minotaur Rush)'
      assert_includes text, '{*1회오리바람}'
    end
    %w[12187 22754].each { |id| assert_equal by_id.fetch(id)['old'], by_id.fetch(id)['new'] }
    assert_equal 13, rows.count { |row| row['old'] != row['new'] }
    %w[1672 8450 10090 49656].each do |id|
      assert_equal 'excluded', by_id.fetch(id)['status']
      assert_equal by_id.fetch(id)['old'], by_id.fetch(id)['new']
    end
    assert_equal 'uncertain', by_id.fetch('62311')['status']
    assert_equal by_id.fetch('62311')['old'], by_id.fetch('62311')['new']
    assert_equal '회오리바람 흉갑(Whirlwind Breastplate)', by_id.fetch('931')['new']
  end

  def test_marker_gate_rejects_unapproved_payload_and_control_changes
    row = rows.find { |value| value['ID_Linha'] == '41817' }
    assert_raises(RuntimeError) { R.validate_marker_changes!(row.merge('new' => row['new'].sub('{*1받아치기}', '{*1변경}'))) }
    assert_raises(RuntimeError) { R.validate_marker_changes!(row.merge('new' => row['new'].sub('{*1분쇄 일격}', '{*2분쇄 일격}'))) }
    assert_raises(RuntimeError) { R.validate_marker_changes!(row.merge('ID_Linha' => '1')) }
    assert_equal row['old'].scan(/\d+%?/), row['new'].scan(/\d+%?/)
  end
end
