#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'review-scout-continuation-D21469'

class ScoutContinuationD21469Test < Minitest::Test
  R = ScoutContinuationD21469
  M = ReviewedNameBatches

  def test_saved_reviews_reproduce_only_the_reviewed_name_changes
    R::CONFIG.each_key do |d|
      path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
      next unless File.file?(path)
      rows = M.table(path).map(&:to_h)
      config = R::CONFIG.fetch(d)
      expected_keys = config.fetch(:ids).map { |id| ['default', id, ''] } +
        config.fetch(:base_ids, []).map { |id| ['base', id, '11'] }
      assert_equal expected_keys.sort, rows.map { |row| M.key(row) }.sort
      rows.each do |row|
        assert_equal row['new'], R.normalize(d, row.merge('work_text' => row['old']))
        assert_equal row['new'], R.normalize(d, row.merge('work_text' => row['new']))
        if %w[uncertain excluded].include?(row['status'])
          assert_equal row['old'], row['new']
        end
      end
    end
  end

  def test_complete_pairs_and_unrelated_people_are_protected
    full = '카라스타 아라윈(Carasta Arawyn)을 도왔다. 카라스타가 말했다.'
    assert_equal '카라스타 아라윈(Carasta Arawyn)을 도왔다. 카라스타(Carasta)가 말했다.',
      R.normalize(21_472, 'ID_Linha' => '19076', 'work_text' => full)
    sconn = '이트란 스콘(Itran Sconn)은 학자다.'
    assert_equal sconn, R.normalize(21_475, 'ID_Linha' => '7378', 'work_text' => sconn)
    tinker = '해리셋 도넬이 죽었다.'
    assert_equal tinker, R.normalize(21_470, 'ID_Linha' => '32151', 'work_text' => tinker)
    unknown = '아리부스'
    assert_equal unknown, R.normalize(21_473, 'ID_Linha' => '14878', 'work_text' => unknown)
  end

  def test_device_titles_are_atomic_and_idempotent
    source = { 'ID_Linha' => '301', 'work_text' => '부서진 아리버스(Arrivus) 엔진' }
    expected = '부서진 아리부스 엔진(Broken Arrivus Engine)'
    assert_equal expected, R.normalize(21_473, source)
    assert_equal expected, R.normalize(21_473, source.merge('work_text' => expected))
  end

  def test_ragnarr_preserves_individual_name_and_pairs_collective_atomically
    source = { 'ID_Linha' => '50993',
               'work_text' => '라그나르 보크베크(Ragnarr Vokvekk). 라그나르 두 명. 두 라그나르 사이.' }
    expected = '라그나르 보크베크(Ragnarr Vokvekk). 라그나르(Ragnarr) 두 명. 두 라그나르(Ragnarrs) 사이.'
    assert_equal expected, R.normalize(21_477, source)
    collective = { 'ID_Linha' => '35183', 'work_text' => '라그나르의 선택받은 자들을 처리하기' }
    paired = "라그나르의 선택받은 자들(Ragnarr's Chosen)을 처리하기"
    assert_equal paired, R.normalize(21_477, collective)
    assert_equal paired, R.normalize(21_477, collective.merge('work_text' => paired))
  end

  def test_wine_and_vintner_are_separate_and_source_short_form_is_retained
    person = { 'ID_Linha' => '47988', 'work_text' => '메이브린이 술을 빚었어.' }
    assert_equal '메이브린(Maybryn)이 술을 빚었어.', R.normalize(21_480, person)
    assert_equal person['work_text'], R.normalize(21_481, person)
    wine = { 'ID_Linha' => '30031', 'work_text' => '메이브린 와인이 또 있어?' }
    assert_equal '메이브린(Maybryn) 와인이 또 있어?', R.normalize(21_481, wine)
  end

  def test_textile_name_does_not_change_unrelated_place_name
    source = { 'ID_Linha' => '62222',
               'work_text' => '캐너록(Canneroc) 마을에서 캐너록(Canneroc)의 거미줄 비단 값이 오른다.' }
    expected = '캐너록(Canneroc) 마을에서 캐너록 거미줄 비단(Canneroc Gossamer) 값이 오른다.'
    assert_equal expected, R.normalize(21_482, source)
    assert_equal expected, R.normalize(21_482, source.merge('work_text' => expected))
  end

  def test_luca_followup_preserves_full_name_and_pronoun_expansion_is_not_targeted
    source = { 'ID_Linha' => '10212', 'work_text' => '루카 소렌(Luca Soren)이 말했다. 루카는 알고 있었다.' }
    expected = '루카 소렌(Luca Soren)이 말했다. 루카(Luca)는 알고 있었다.'
    assert_equal expected, R.normalize(21_484, source)
    refute_includes R::CONFIG.fetch(21_484).fetch(:ids), '25890'
    assert_equal ['10212'], R::CONFIG.fetch(21_484).fetch(:revisit)
    refute R::CONFIG.values.any? { |config| config.fetch(:revisit, []).include?('46892') }
  end

  def test_ivar_title_and_short_name_use_the_same_stem_without_nested_pairs
    source = { 'ID_Linha' => '50845', 'english' => 'Return to Corporal Ivar.',
               'work_text' => '이바르(Ivar) 상병에게 돌아가야겠다.' }
    paired = '아이바르 상병(Corporal Ivar)에게 돌아가야겠다.'
    assert_equal paired, R.normalize(21_492, source)
    assert_equal paired, R.normalize(21_492, source.merge('work_text' => paired))
    source = { 'ID_Linha' => '50963', 'english' => 'So you found Ivar?',
               'work_text' => '이바르(Ivar)는 찾았어?' }
    paired = '아이바르(Ivar)는 찾았어?'
    assert_equal paired, R.normalize(21_492, source)
    assert_equal paired, R.normalize(21_492, source.merge('work_text' => paired))
  end
end
