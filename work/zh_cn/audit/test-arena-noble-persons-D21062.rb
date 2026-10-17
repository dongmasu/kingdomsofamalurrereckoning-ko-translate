#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-arena-noble-persons-D21062'

class ArenaNoblePersonsD21062Test < Minitest::Test
  def edit(text, entity, english)
    ArenaNoblePersonsD21062.edit_name(text, "person:#{entity}", english)
  end

  def test_labeled_short_variants_are_normalized_without_duplicate_labels
    assert_equal '비거(Vigor)에게서', edit('바이거(Vigor)에게서', 'vigor-broadshield', 'Vigor')
    assert_equal '비거(Vigor)는', edit('비고르(Vigor)는', 'vigor-broadshield', 'Vigor')
    assert_equal '이얼프위그(Ealfwig)', edit('엘프윅(Ealfwig)', 'ealfwig-grilricas', 'Ealfwig')
  end

  def test_full_labels_are_not_duplicated
    assert_equal '비거 브로드실드(Vigor Broadshield)와 대화',
                 edit('비고르 브로드실드(Vigor Broadshield)와 대화',
                      'vigor-broadshield', 'Vigor Broadshield')
    assert_equal '이얼프위그 그릴리카스(Ealfwig Grilricas)는',
                 edit('엘프윅 그릴리카스(Ealfwig Grilricas)는',
                      'ealfwig-grilricas', 'Ealfwig Grilricas')
  end

  def test_bodine_preserves_source_alternate_full_name_and_short_surname
    assert_equal '보딘 보르그(Bodine Borgues)를',
                 edit('보딘 보르그스(Bodine Borgues)를',
                      'bodine-borgue', 'Bodine Borgues')
    assert_equal '보딘 보르그(Bodine Borgue)를 찾았다. 보르그(Borgue)는 없었다.',
                 edit('보다인 보르그를 찾았다. 보르그는 없었다.',
                      'bodine-borgue', 'Bodine Borgue. Borgue')
  end

  def test_person_and_common_word_exclusions
    row = { 'resource' => 'default', 'ID_Linha' => '1377' }
    assert ArenaNoblePersonsD21062.excluded?('person:vigor-broadshield', row)
    row['ID_Linha'] = '49084'
    assert ArenaNoblePersonsD21062.excluded?('person:helga-swanwhite', row)
    row['ID_Linha'] = '1363'
    refute ArenaNoblePersonsD21062.excluded?('person:vigor-broadshield', row)
  end
end
