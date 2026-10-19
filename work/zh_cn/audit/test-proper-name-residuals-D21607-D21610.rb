#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'

class ProperNameResidualsD21607D21610Test < Minitest::Test
  M = ReviewedNameBatches

  def manifest(batch)
    M.table(File.join(__dir__, "proper-name-edits-D#{batch}.tsv"))
  end

  def indexed
    M.table(M::INDEX)
  end

  def test_bounded_coverage_exact_sources_and_structure
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    [[21_607, 35, 27], [21_608, 1, 1], [21_609, 21, 12], [21_610, 5, 5]].each do |batch, count, edits|
      rows = manifest(batch)
      assert_equal count, rows.length
      assert_equal count, rows.map { |row| M.key(row) }.uniq.length
      assert_operator count, :<=, 50
      assert_equal edits, rows.count { |row| row['old'] != row['new'] }
      rows.each do |row|
        source = inventory.fetch(M.key(row))
        assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
        assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
        assert_equal source['zh_text'], row['chinese']
        assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
        opaque = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/
        assert_equal row['old'].scan(opaque), row['new'].scan(opaque)
        assert_equal row['old'].scan(/[0-9]+(?:\.[0-9]+)?%?/),
                     row['new'].scan(/[0-9]+(?:\.[0-9]+)?%?/)
      end
    end
  end

  def test_person_monster_and_skill_identity_boundaries
    reviewed = manifest(21_607).to_h { |row| [M.key(row), row] }
    assert_equal '페이서터(Pacetor)', reviewed.fetch(['default', '22201', ''])['new']
    assert_equal '페이서터(Pacetor)', reviewed.fetch(['default', '36007', ''])['new']
    assert_equal '컨(Kurn)', reviewed.fetch(['default', '22727', ''])['new']
    assert_equal '운명의 메아리(Echoes Of Fate) - 투사체',
                 reviewed.fetch(['default', '3765', ''])['new']
    assert_equal '메아리의 전당(Hall of Echoes)',
                 reviewed.fetch(['base', '4567', '11'])['new']
    assert_equal 1, reviewed.fetch(['default', '53019', ''])['new'].scan('(Echoes of Fate)').length
    assert_equal 2, reviewed.fetch(['default', '53019', ''])['new'].scan('운명의 메아리').length
    %w[2738 52145].each do |id|
      text = reviewed.fetch(['default', id, ''])['new']
      assert_equal 1, text.scan('(Pacetor)').length
      assert_equal 1, text.scan('(Kurn)').length
      refute_match(/페이세터|파세토르|파세터|커른|카른/, text)
    end
    unchanged = reviewed.fetch(['default', '3122', ''])
    assert_equal unchanged['old'], unchanged['new']
    assert_equal 'not-an-issue', unchanged['status']
    letter = reviewed.fetch(['default', '9264', ''])
    assert_equal letter['old'].sub('황혼의 정원', '황혼의 정원(Twilight Garden)'), letter['new']
  end

  def test_alias_reuses_owner_and_preserves_seventeen_terminal_keys
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    owner = glossary.select { |row| row['entity_key'] == 'person:galataea' }
    assert_equal 1, owner.length
    assert_equal '갈라테이아(Galataea)', owner.first['korean_canonical']
    assert_includes owner.first['english_aliases'].split('|'), 'Galatea'
    refute glossary.any? { |row| row['entity_key'] == 'person:galatea' }
    prior = manifest(20_436).select do |row|
      row['entity_key'].to_s.split('|').include?('person:galataea')
    end
    assert_equal 17, prior.length
    actual = indexed.select { |row| row['entity_key'] == 'person:galataea' }
      .to_h { |row| [M.key(row), row] }
    assert_equal 18, actual.length
    prior.each do |row|
      assert_equal 'person:galataea', row['entity_key']
      original_status = row['status']
      assert_equal original_status, actual.fetch(M.key(row))['status']
      assert actual.fetch(M.key(row))['evidence'].start_with?('D-20436:')
    end
    fresh = manifest(21_608).first
    assert_equal fresh['old'].sub('갈라테아', '갈라테이아(Galatea)'), fresh['new']
    assert_includes fresh['new'], '페이서터(Pacetor)'
  end

  def test_two_places_keep_other_names_and_item_structure
    rows = manifest(21_609).to_h { |row| [M.key(row), row] }
    assert_equal '아모라(Amaura)의 돌', rows.fetch(['base', '3380', '11'])['new']
    assert_equal '아모라(Amaura)', rows.fetch(['base', '4587', '11'])['new']
    assert_equal '웨코나이(Weconai)', rows.fetch(['default', '55538', ''])['new']
    text = rows.fetch(['default', '55293', ''])['new']
    ['Maura Chalin', 'Fateweaver', 'Ordo'].each { |name| assert_includes text, "(#{name})" }
    assert_includes rows.fetch(['default', '53819', ''])['new'], '칸레인(Cann-Rane)'
  end

  def test_arrow_storm_pairs_do_not_change_localized_runtime_tokens
    manifest(21_610).each do |row|
      assert_equal 1, row['new'].scan('(Arrow Storm)').length
      if row['ID_Linha'] == '23594'
        assert_equal '화살 폭풍(Arrow Storm)', row['new']
      else
        assert_equal row['old'].sub('{*1화살 폭풍}', '{*1화살 폭풍}(Arrow Storm)'), row['new']
        assert row['new'].start_with?('{*1화살 폭풍}(Arrow Storm) - ')
      end
    end
  end
end
