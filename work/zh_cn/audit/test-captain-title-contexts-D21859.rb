#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'

class CaptainTitleContextsD21859Test < Minitest::Test
  def setup
    @rows = ProperNameCellEditor.parse(
      File.binread(ReviewedNameBatches.csv_path('default'))
    ).to_h { |row| [row['ID_Linha'], row['Texto']] }
  end

  def test_drefan_military_titles_and_explicit_lieutenant_are_distinct
    %w[6800 29992 44108 53409 55141 62581].each do |id|
      assert_includes @rows.fetch(id), '드레판 대장(Captain Drefan)'
    end
    %w[25150 37299].each do |id|
      assert_includes @rows.fetch(id), '드레판(Drefan) 중위'
      refute_includes @rows.fetch(id), 'Captain Drefan'
    end
  end

  def test_trav_full_labels_reuse_existing_military_rank
    %w[33107 34981].each do |id|
      assert_equal '데시데루스 트라브 대위(Captain Desiderus Trav)', @rows.fetch(id)
    end
    %w[8153 23893 59948].each do |id|
      assert_includes @rows.fetch(id), '트라브 대위(Captain Trav)'
    end
  end

  def test_talibor_watch_command_is_not_a_ship_command
    %w[689 24504 30951 56507 59790].each do |id|
      assert_includes @rows.fetch(id), '탈리보르 대장(Captain Talibor)'
    end
    assert_includes @rows.fetch('53530'), '대장 에리아드 탈리보르(Captain Eriad Talibor)'
    assert_includes @rows.fetch('53530'), '라시르 부두(Rathir Quays)'
    assert_includes @rows.fetch('30951'), '탈리보르 대장(Captain Talibor)과 얘기해.'
    assert_includes @rows.fetch('56507'), '탈리보르 대장(Captain Talibor)이었다고 들었어.'
  end

  def test_nautical_captains_and_unresolved_mys_remain_untouched
    assert_equal '브래티건 선장(Captain Brattigan)', @rows.fetch('18642')
    assert_equal '곤토름 선장(Captain Gonthorm)', @rows.fetch('27682')
    assert_includes @rows.fetch('6815'), '도드윈 선장(Captain Dodwyn)'
    assert_equal '마이스 선장(Captain Mys)', @rows.fetch('15747')
    assert_equal '마이스 선장', @rows.fetch('20348')
  end

  def test_elswin_duplicate_component_cleanup_is_narrow
    %w[857 5543 23129 54857 55145 58388 64016].each do |id|
      assert_includes @rows.fetch(id), '엘스윈 경(Sir Elswin)'
      refute_includes @rows.fetch(id), '엘스윈(Elswin) 경(Sir Elswin)'
    end
    assert_includes @rows.fetch('5543'), '안타깝게도 엘스윈(Elswin) 경은'
    manifest = ReviewedNameBatches.table(
      File.join(__dir__, 'proper-name-edits-D21857.tsv')
    ).find { |row| row['ID_Linha'] == '55141' }
    assert_includes manifest.fetch('evidence'), 'ドレファン隊長'
    refute_includes manifest.fetch('evidence'), 'サー・エルスウィン'
  end

  def test_janya_grave_and_enright_military_context_followup
    base = ProperNameCellEditor.parse(
      File.binread(ReviewedNameBatches.csv_path('base'))
    ).find { |row| row['ID_Linha'] == '375' && row['Tipo_Variante'] == '11' }
    assert_equal @rows.fetch('23699'), base.fetch('Texto')
    assert_includes @rows.fetch('192'), '엔라이트 대위(Captain Enright)를 찾는다고'
    assert_equal '엔라이트 대위(Captain Enright)와 대화하기', @rows.fetch('61927')
    assert_includes @rows.fetch('26896'), '엔라이트(Enright) 대장에 따르면'
    assert_equal '엔라이트 대장(Captain Enright)', @rows.fetch('53971')
    assert_equal '엔라이트(Enright) 대위', @rows.fetch('58127')
  end
end
