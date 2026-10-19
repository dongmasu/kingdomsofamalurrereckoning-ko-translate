#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'

class ProperNameMiningItemsSitesD21618D21620Test < Minitest::Test
  M = ReviewedNameBatches

  def manifest(d)
    M.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv"))
  end

  def test_exact_source_evidence_and_byte_safe_manifests
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    [[21_618, 14], [21_619, 10]].each do |d, edit_count|
      rows = manifest(d)
      assert_equal 14, rows.length
      assert_equal 14, rows.map { |row| M.key(row) }.uniq.length
      assert_equal edit_count, rows.count { |row| row['old'] != row['new'] }
      rows.each do |row|
        source = inventory.fetch(M.key(row))
        assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
        assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
        assert_equal source['zh_text'], row['chinese']
        assert_equal source['work_text'], M.rebase_review(row['old'], row['new'], source['work_text'])
        assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                     row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
        assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
        assert_equal ['needs-context'], JSON.parse(row['previous_status']).values.uniq
      end
    end
  end

  def test_item_titles_and_mine_names_have_separate_owners
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).to_h { |row| [row['entity_key'], row] }
    assert_equal '스코리아 광산 소유권 증서(Deed to Skoria Mine)',
                 glossary.fetch('item:deed-to-skoria-mine')['korean_canonical']
    assert_equal '스코리아 광산(Skoria Mine)', glossary.fetch('place:skoria-mine')['korean_canonical']
    assert_equal '다크바리 탄광(Darkvari Colliery)',
                 glossary.fetch('place:darkvari-colliery')['korean_canonical']
    refute_includes glossary.fetch('place:darkvari-mine')['english_aliases'].to_s, 'Darkvari Colliery'
    assert_equal '신릭 광산(Cynric Mine)', glossary.fetch('place:cynric-mine')['korean_canonical']
    assert_includes glossary.fetch('place:cynric-mine')['english_aliases'].to_s.split('|'), 'Cynric Quarry'
    refute glossary.key?('place:cynric-quarry')
    refute_includes glossary.fetch('place:cynric-mine')['english_aliases'].to_s, 'Cynric Pit'
    assert_includes glossary.fetch('item:darkvari-treasure-map')['english_aliases'].to_s.split('|'), 'Darkvari map'
    refute_includes glossary.fetch('place:skoria-mine')['english_aliases'].to_s.split('|'), 'Skoria'
  end

  def test_source_short_forms_and_prior_terminal_keys
    rows = manifest(21_619).to_h { |row| [row['ID_Linha'], row] }
    assert_includes rows.fetch('12142')['new'], '다크바리 지도(Darkvari map)'
    assert_equal '다크바리 지도(Darkvari Map)?', rows.fetch('22843')['new']
    assert_includes rows.fetch('9555')['new'], '스코리아 광산(Skoria)으로'
    assert_includes rows.fetch('59457')['new'], '다크바리(Darkvari)라는 성'
    assert_includes rows.fetch('38373')['new'], '중가르(Zungar)라는 이름'
    assert_equal rows.fetch('61305')['old'], rows.fetch('61305')['new']
    index = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    %w[59457 61305].each do |id|
      row = index.fetch(['person:darkvari', 'default', id, ''])
      assert_equal 'excluded', row['status']
      assert row['evidence'].start_with?('D-20433:')
    end
    row = index.fetch(['person:zungar', 'default', '38373', ''])
    assert_equal 'excluded', row['status']
    assert row['evidence'].start_with?('D-20568:')
    %w[2077 7293 40979 42481 50221 54958].each do |id|
      assert index.key?(['place:cynric-mine', 'default', id, ''])
    end
  end

  def test_article_variant_deed_scope_preserves_other_name_edits
    rows = manifest(21_620)
    assert_equal %w[38817 50221], rows.map { |row| row['ID_Linha'] }
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    rows.each do |row|
      source = inventory.fetch(M.key(row))
      assert_equal 'item:deed-to-skoria-mine', row['entity_key']
      assert_equal 'accepted', row['status']
      assert_equal source['work_text'], row['new']
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
      assert_equal source['zh_text'], row['chinese']
      assert_includes row['new'], '스코리아 광산 소유권 증서(deed to the Skoria Mine)'
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_equal ['needs-context'], JSON.parse(row['previous_status']).values.uniq
    end
    assert_includes rows[-1]['new'], '신릭 채석장(Cynric Quarry)'
    index = M.table(M::INDEX)
    deed = index.select { |row| row['entity_key'] == 'item:deed-to-skoria-mine' }
    assert_equal 9, deed.length
    assert_equal ['accepted'], deed.map { |row| row['status'] }.uniq
    quarry = index.find do |row|
      row['entity_key'] == 'place:cynric-mine' && row['ID_Linha'] == '50221'
    end
    assert quarry['evidence'].start_with?('D-21619:')
  end
end
