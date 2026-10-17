#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-proper-name-monsters-other-continuation'

class OtherMonsterReviewTest < Minitest::Test
  def review(entity, english, korean, japanese = '対照', chinese = '对照')
    source = { 'en_texts_json' => JSON.generate([english]),
               'ja_texts_json' => JSON.generate([japanese]),
               'zh_text' => chinese }
    spec = SPECS.find { |row| row[:entity_key] == entity }
    review_species(spec, source, ['default', '1', ''], korean)
  end

  def test_meat_qualifier_is_not_deleted
    status, text, = review('monster:barghest', 'Barghest (5 Meat)',
                          '바게스트(고기 5개)', 'バーゲスト(肉5)', '魔狼（5 块肉）')
    assert_equal 'uncertain', status
    assert_equal '바게스트(고기 5개)', text
  end

  def test_supported_full_bilingual_qualifier_is_preserved
    status, text, = review('monster:barghest', 'Barghest (5 Meat)',
                          '바게스트 고기 5개(Barghest (5 Meat))')
    assert_equal 'not-an-issue', status
    assert_equal '바게스트 고기 5개(Barghest (5 Meat))', text
  end

  def test_ballad_is_excluded_from_species_scope
    status, text, = review('monster:troll', 'Two Knights and a Troll, Part I',
                          '두 기사와 트롤, 제1부')
    assert_equal 'excluded', status
    assert_equal '두 기사와 트롤, 제1부', text
  end

  def test_plural_and_copula_keep_their_meaning
    status, text, = review('monster:troll', 'Trolls. No match at all.',
                          '트롤들이야. 상대도 안 됐지.')
    assert_equal 'accepted', status
    assert_equal '트롤(Troll)들이야. 상대도 안 됐지.', text
  end

  def test_existing_bilingual_name_with_copula_is_not_a_hold
    status, text, = review('monster:crudok', 'Probably a crudok.',
                          '아마 크루독(Crudok)일지도.')
    assert_equal 'not-an-issue', status
    assert_equal '아마 크루독(Crudok)일지도.', text
  end

  def test_exhibition_score_alias_is_excluded
    spec = SPECS.find { |row| row[:entity_key] == 'monster:troll' }
    source = {
      'en_texts_json' => JSON.generate(["The Crows vs. Trolls (Exhibition)\nTyr Magnus: 500,000 - Trolls"]),
      'ja_texts_json' => JSON.generate(['クロウズ対トロール(公開試合)']),
      'zh_text' => '鸦群对抗巨魔（展示）'
    }
    old = "크로우즈 대 트롤(시범 경기)\n티르 매그너스: 500,000 - 트롤"
    status, text, = review_species(spec, source, ['default', '18198', ''], old)
    assert_equal 'excluded', status
    assert_equal old, text
  end

  def test_unrelated_nearby_place_label_does_not_cover_species
    status, text, = review('monster:bolgan',
                          'The bolgan have infested Castle Gastyr.',
                          '볼간이 개스티르 성(Castle Gastyr)을 점령했어.')
    assert_equal 'accepted', status
    assert_equal '볼간(Bolgan)이 개스티르 성(Castle Gastyr)을 점령했어.', text
  end
end
