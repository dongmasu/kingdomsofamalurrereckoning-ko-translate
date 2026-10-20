#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'

class KerrodHaritResidualsD21862Test < Minitest::Test
  def setup
    @batches = ReviewedNameBatches
    @default = ProperNameCellEditor.parse(
      File.binread(@batches.csv_path('default'))
    ).to_h { |row| [row['ID_Linha'], row['Texto']] }
    @base = ProperNameCellEditor.parse(
      File.binread(@batches.csv_path('base'))
    ).to_h { |row| [[row['ID_Linha'], row['Tipo_Variante']], row['Texto']] }
  end

  def test_kerrod_military_grave_labels_agree
    assert_equal '케로드 대장(Captain Kerrod)의 무덤', @base.fetch(['2598', '11'])
    assert_equal @base.fetch(['2598', '11']), @default.fetch('37132')
    assert_includes @default.fetch('11165'), '케로드 대장(Captain Kerrod)이 여기 잠들다.'
    assert_includes @default.fetch('11165'), '알파르 군(Alfar Army)'
  end

  def test_exact_title_registration_adds_no_bare_surname_alias
    glossary = @batches.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    entry = glossary.find { |row| row['entity_key'] == 'person:captain-kerrod' }
    refute_nil entry
    assert_equal 'Captain Kerrod', entry.fetch('english_canonical')
    assert_empty entry.fetch('english_aliases').to_s
    index = @batches.table(@batches::INDEX).select do |row|
      row['entity_key'] == 'person:captain-kerrod'
    end
    assert_equal [%w[base 2598 11], ['default', '11165', ''], ['default', '37132', '']],
                 index.map { |row| @batches.key(row) }
  end

  def test_graine_and_possessive_armor_remain_outside_the_identity_scope
    assert_includes @default.fetch('51963'), '케로드 그레인(Kerrod Graine)'
    assert_equal "케로드의 투구(Kerrod's Helm)", @base.fetch(['2854', '11'])
    assert_equal '케로드(Kerrod)의 흉갑', @base.fetch(['4092', '11'])
  end

  def test_harit_surname_matches_identical_aligned_label
    assert_equal '하리트 와일(Harit Wyle)', @default.fetch('16616')
    assert_equal @default.fetch('14318'), @default.fetch('16616')
    assert_equal '하리트(Harit)', @default.fetch('14856')
    refute_includes @default.fetch('16616'), '과일'
  end

  def test_complete_object_and_rank_labels_do_not_duplicate_the_component
    assert_equal '아이텐 법석(Ayten Lawstone)', @base.fetch(['1106', '11'])
    assert_equal '윈더미어의 돌(Windemere Stone)', @base.fetch(['4511', '11'])
    assert_equal '에드스타 이병(Private Edstar)', @default.fetch('10205')
  end

  def test_wyle_family_registration_is_exact_and_does_not_resolve_bare_wyle
    glossary = @batches.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    entry = glossary.find { |row| row['entity_key'] == 'family:wyle' }
    refute_nil entry
    assert_equal 'Wyle Family', entry.fetch('english_canonical')
    assert_empty entry.fetch('english_aliases').to_s
    assert_equal '와일 가문(Wyle Family)', entry.fetch('korean_canonical')
    occurrence = @batches.table(@batches::INDEX).find do |row|
      row['entity_key'] == 'family:wyle'
    end
    assert_equal %w[default 53243], @batches.key(occurrence)[0, 2]
    assert_equal '와일 가문(Wyle Family)', @default.fetch('53243')
    assert_equal 'Wyle', @default.fetch('24979')
    assert_equal '와일(Wyle)의 집', @base.fetch(['662', '11'])
    assert_equal '와일 가문 저택', @default.fetch('16566')
    refute_includes @default.fetch('53243'), '하리트'
    refute_includes @default.fetch('53243'), '나릿'
    refute_includes @default.fetch('53243'), '구엔페어'
  end

  def test_summer_winter_label_pairs_both_existing_group_names
    assert_equal '여름 페이(Summer Fae)와 겨울 페이(Winter Fae)',
                 @default.fetch('9538')
    rows = @batches.table(@batches::INDEX).select do |row|
      @batches.key(row) == %w[default 9538] + [''] &&
        %w[people:fae people:winter-fae].include?(row['entity_key'])
    end
    assert_equal %w[people:fae people:winter-fae], rows.map { |row| row['entity_key'] }.sort
    assert rows.all? { |row| row['status'] == 'accepted' }
    refute rows.any? { |row| row['entity_key'] == 'people:summer-fae' }
    assert_equal '여름 페이(Summer Fae)',
                 @batches.table(File.join(__dir__, 'proper-name-glossary.tsv'))
                   .find { |row| row['entity_key'] == 'people:summer-fae' }
                   .fetch('korean_canonical')
  end
end
