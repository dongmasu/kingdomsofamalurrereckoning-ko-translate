#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-khleran-aergase-D21496'

class KhleranAergaseD21496Test < Minitest::Test
  R = KhleranAergaseD21496

  def test_pairs_khleran_but_protects_complete_role_title
    assert_equal '클레란(Khleran)이 나타났다.',
      R.normalize('person:khleran', '클레란이 나타났다.')
    complete = '마녀 기사 클레란(Witch Knight Khleran)을 찾아.'
    assert_equal complete, R.normalize('person:khleran', complete)
  end

  def test_standardizes_aergase_variants_and_protects_complete_title
    assert_equal '에어가스(Aergase)에게 말해.',
      R.normalize('person:aergase', '아에르가세에게 말해.')
    assert_equal '에어가스(Aergase)에게 말해.',
      R.normalize('person:aergase', '에르가세에게 말해.')
    assert_equal '에어가스(Aergase)에게 말해.',
      R.normalize('person:aergase', '에르가스에게 말해.')
    assert_equal '사냥의 전령 에어가스(Aergase, Hunting Herald)',
      R.normalize('person:aergase', '사냥의 전령 에어가스(Aergase, Hunting Herald)')
  end

  def test_normalizers_are_idempotent_and_do_not_nest
    {
      'person:khleran' => '클레란(Khleran)',
      'person:aergase' => '에어가스(Aergase)'
    }.each do |entity, text|
      assert_equal text, R.normalize(entity, text)
      refute_match(/\([^)]*\([^)]*\)/, R.normalize(entity, text))
    end
  end

  def test_corroboration_accepts_preserved_english_labels_and_chinese_short_form
    refute R.locale_name_match?('Aergase', /エアガス/, 'Khleran')
    assert R.locale_name_match?('Aergase', /エアガス/, 'Aergase')
    assert R.locale_name_match?('勒兰', /(?:克)?勒兰/, 'Khleran')
  end

  def test_expected_scopes_cover_both_complete_source_sets
    assert_equal 40, R.expected_pairs.length
    assert_equal 40, R.expected_pairs.uniq.length
    assert_equal 26, R.source_keys(R::ENTITIES.fetch('person:khleran')).length
    assert_equal 14, R.source_keys(R::ENTITIES.fetch('person:aergase')).length
    assert_includes R.expected_pairs,
      ['person:khleran', 'base', '767', '11']
    assert_includes R.expected_pairs,
      ['person:khleran', 'base', '4447', '11']
    assert_includes R.expected_pairs,
      ['person:khleran', 'default', '46078', '']
    assert_includes R.expected_pairs,
      ['person:aergase', 'default', '26883', '']
  end
end
