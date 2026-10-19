#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'review-full-name-label-residuals-D21600'

class ProperNameResidualsD21599D21604Test < Minitest::Test
  M = ReviewedNameBatches

  def manifest(batch)
    M.table(File.join(__dir__, "proper-name-edits-D#{batch}.tsv"))
  end

  def test_exact_review_coverage_and_edit_counts
    [
      [21_599, 37, 16, 7], [21_600, 35, 29, 21],
      [21_601, 39, 32, 20], [21_602, 50, 39, 23],
      [21_603, 50, 33, 28], [21_604, 5, 4, 4]
    ].each do |batch, rows, edits, entities|
      reviewed = manifest(batch)
      assert_equal rows, reviewed.length
      assert_equal rows, reviewed.map { |row| M.key(row) }.uniq.length
      assert_equal edits, reviewed.count { |row| row['old'] != row['new'] }
      assert_equal entities, reviewed.map { |row| row['entity_key'] }.uniq.length
      reviewed.each do |row|
        assert row.values_at('english', 'japanese', 'chinese', 'evidence').all? { |text| !text.to_s.empty? }
        assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      end
    end
  end

  def test_epithet_and_name_variants_preserve_other_scopes
    reviewed = manifest(21_599).to_h { |row| [M.key(row), row] }
    %w[4456 20185 28233 59764].each do |id|
      assert_includes reviewed.fetch(['default', id, ''])['new'],
                      '전지자 세터 자작(Viscount Setter the Allseer)'
    end
    enright = reviewed.fetch(['default', '26896', ''])['new']
    assert_includes enright, '엔라이트(Enright) 대장'
    assert_includes enright, '엔라이트는'
    refute_includes enright, '에인라이트'
    assert_includes enright, '메이스 다켄(Mace Darkken)'
    assert_includes enright, '울프 팩(Wolf Pack)'
    assert_includes reviewed.fetch(['base', '375', '11'])['new'], '잔야(Janya)'
    assert_equal reviewed.fetch(['default', '3475', ''])['old'],
                 reviewed.fetch(['default', '3475', ''])['new']
  end

  def test_no_inferred_component_aliases_or_redundant_pairs
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    ReviewFullNameLabelResidualsD21600::SPECS.each do |english, korean, _variants, _ids, _ja, _zh|
      definitions = glossary.select do |row|
        row['entity_key'] == ReviewFullNameLabelResidualsD21600.entity_key(english)
      end
      assert_equal 1, definitions.length
      assert_equal '', definitions.first['english_aliases'].to_s
      assert_equal "#{korean}(#{english})", definitions.first['korean_canonical']
    end
    reviewed = manifest(21_600).to_h { |row| [row['ID_Linha'], row] }
    wilma = reviewed.fetch('33984')['new']
    assert_equal 1, wilma.scan('(Wilma Scrivens)').length
    assert_equal 2, wilma.scan('윌마 스크리븐스').length
    betheli = reviewed.fetch('39934')['new']
    assert_includes betheli, '베셀리 존스(Betheli Jons)'
    assert_includes betheli, '베셀리와'
  end

  def test_source_local_case_and_complete_title_pairs
    reviewed = manifest(21_601).to_h { |row| [row['ID_Linha'], row] }
    assert_equal '루에타르 드 그루트(Luethar de Groot)의 시신',
                 reviewed.fetch('63922')['new']
    %w[26896 57868].each do |id|
      assert_includes reviewed.fetch(id)['new'], '엔라이트(Enright)'
    end
    reviewed = manifest(21_602).to_h { |row| [row['ID_Linha'], row] }
    assert_equal '숙련자 모티크룸 애들러(Adept Morticrum Addler)',
                 reviewed.fetch('12865')['new']
    assert_equal reviewed.fetch('12865')['old'], reviewed.fetch('12865')['new']
    assert_includes reviewed.fetch('20595')['new'], '얀센이야. 로타 얀센(Rota Jansen)'
    reviewed = manifest(21_603).to_h { |row| [M.key(row), row] }
    assert_equal '학자 비안 세브루스(Scholar Vian Cevrus)',
                 reviewed.fetch(['default', '51882', ''])['new']
    assert_equal reviewed.fetch(['base', '1787', '11'])['old'],
                 reviewed.fetch(['base', '1787', '11'])['new']
    assert_includes reviewed.fetch(['default', '58318', ''])['new'],
                    '알라드 에이딕(Alard Aedic)'
    assert_includes reviewed.fetch(['default', '59714', ''])['new'],
                    '번 도드윈(Byrn Dodwin)'
  end
end
