#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-person-c-family-D20395'

class PersonCReviewTest < Minitest::Test
  def setup
    @entities = CSV.read(File.join(__dir__, 'proper-name-glossary.tsv'),
                         headers: true, col_sep: "\t").map(&:to_h)
    @by_key = @entities.to_h { |entity| [entity['entity_key'], entity] }
  end

  def review(english, korean, resource: 'default', id: '1')
    source = {
      'resource' => resource, 'ID_Linha' => id, 'Tipo_Variante' => '',
      'en_texts_json' => JSON.generate([english]), 'ja_texts_json' => '[]',
      'zh_text' => '', 'work_text' => korean
    }
    PersonCReview.build([source], @entities).first
  end

  def test_title_is_not_consumed
    row = review('Archsage Jubal Caledus.', '대현자 주발 칼레두스(Archsage Jubal Caledus).')
    assert_equal 'not-an-issue', row[4]
    assert_equal row[5], row[6]
  end

  def test_longer_surname_wins
    row = review('Courdan Passant arrived.', '코르단 파상트가 왔다.')
    assert_equal '코던 파상트(Courdan Passant)가 왔다.', row[6]
  end

  def test_given_name_and_scholar_title_are_distinct
    row = review('scholar Cleas Nerenne and Scholar Nerenne',
                 '학자 클리스 네렌과 네렌 학자')
    assert_equal '학자 클레아스 네렌(Cleas Nerenne)과 학자 네렌(Scholar Nerenne)', row[6]
  end

  def test_ensemble_does_not_hide_individual_mention
    row = review('Colet formed Colet and the Echoes.',
                 "콜렛이 '콜렛과 메아리들'이라는 악단을 만들었다.")
    assert_equal "콜렛(Colet)이 '콜렛과 에코즈(Colet and the Echoes)'라는 악단을 만들었다.", row[6]
  end

  def test_unrelated_annotation_is_not_discarded
    entity = @by_key.fetch('person:cadoroc')
    result = PersonCReview.replace_forms('카도록(설명)', ['카도록'], entity)
    assert_equal '카도로크(Cadoroc)(설명)', result
  end

  def test_plural_sirs_preserves_korean_title
    row = review('Sirs Creth and Airmer', '크레스 경과 에어머 경')
    assert_equal '크레스(Creth) 경과 에어머 경', row[6]
  end

  def test_sword_is_not_person
    row = review('his pet sword Cryamor', '그의 애검 크리야모르(Cryamor)')
    assert_includes row[3], 'unique_item:cryamor'
    refute_includes row[3], 'person:cryamor'
  end

  def test_vowel_final_name_particles_do_not_corrupt_copula
    row = review('Cadoroc', '카도록이라는 페이가 카도록을 찾는다.')
    assert_equal '카도로크(Cadoroc)라는 페이가 카도로크(Cadoroc)를 찾는다.', row[6]
  end

  def test_title_final_consonant_particle
    row = review('Sir Creth', '서 크레스와 싸웠다.')
    assert_equal '크레스 경(Sir Creth)과 싸웠다.', row[6]
  end

  def test_full_name_does_not_hide_another_single_name_mention
    row = review('Astor Colliane, Astor', '아스토르 콜리안(Astor Colliane), 아스토르')
    assert_equal '애스터 콜리앤(Astor Colliane), 애스터(Astor)', row[6]
  end

  def test_full_name_component_is_not_double_annotated
    row = review('Astor Colliane', '애스터 콜리안(Astor Colliane)')
    assert_equal '애스터 콜리앤(Astor Colliane)', row[6]
  end

  def test_house_and_named_item_verdicts_use_full_title
    house = review('House Anwon', '안원(Anwon) 가문', resource: 'base', id: '1930')
    assert_equal 'accepted', house[4]
    assert_equal '안원 가문(House Anwon)', house[6]
    item = review("Caerwyn's Tome", '케어윈(Caerwyn)의 고서', resource: 'base', id: '2488')
    assert_equal "케어윈의 서(Caerwyn's Tome)", item[6]
  end

  def test_existing_anwon_blood_wordplay_is_retained
    row = review('Anwon blood has bent beneath no malady.', '안원(Anwon) 가문 혈통은 병이 없다.',
                 id: '61213')
    assert_equal 'not-an-issue', row[4]
    assert_equal row[5], row[6]
  end
end
