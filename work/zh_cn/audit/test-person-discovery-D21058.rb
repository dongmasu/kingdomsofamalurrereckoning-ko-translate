#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-person-discovery-D21058'

class PersonDiscoveryD21058Test < Minitest::Test
  def edit(text, entity, id = '1')
    PersonDiscoveryD21058.edit_name(
      text, "person:#{entity}",
      'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => ''
    )
  end

  def test_existing_full_labels_are_not_duplicated
    assert_equal '거너 프로드(Gunnar Frode)의 지도',
                 edit('가너 프로드(Gunnar Frode)의 지도', 'gunnar-frode')
    assert_equal '케우리그 샤스터(Keurig Shaster)는 누구야?',
                 edit('케우리그 샤스터(Keurig Shaster)는 누구야?', 'keurig-shaster')
    assert_equal '오드월드 바이노타스(Odwald Bynothas)의 저서',
                 edit('오드왈드 바이노타스(Odwald Bynothas)의 저서', 'odwald-bynothas')
  end

  def test_keurig_short_form_particle_tracks_new_korean_spelling
    assert_equal '케우리그(Keurig)는 오래전부터 내 목숨을 노렸어.',
                 edit('큐릭은 오래전부터 내 목숨을 노렸어.', 'keurig-shaster')
  end

  def test_surname_only_eldric_reference_is_row_scoped
    text = '엘드릭 오헬름(Eldric Orhelm)은 떠났다. 오헬름의 시신이다.'
    assert_equal '엘드릭 오헬름(Eldric Orhelm)은 떠났다. 오헬름(Orhelm)의 시신이다.',
                 edit(text, 'eldric-orhelm', '63884')
    assert_equal text, edit(text, 'eldric-orhelm')
  end

  def test_gunnar_surname_homonyms_are_not_changed_by_frode_rule
    assert_equal '그레이 거너(Gray Gunnar)는 몸져누웠다.',
                 edit('그레이 거너(Gray Gunnar)는 몸져누웠다.', 'gunnar-frode')
    assert_equal '프로드(Frode)', edit('프로데(Frode)', 'gunnar-frode', '54680')
  end
end
