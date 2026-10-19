#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-batch-D21689'

class ShortLabelBatchD21689Test < Minitest::Test
  M = ShortLabelBatchD21689

  def test_keen_name_pair_keeps_trailing_particle
    assert_equal '킨 대사(Ambassador Keen)를 처치했다.',
      M.transform(['default', '48033', ''], '킨 대사를 처치했다.')
  end

  def test_kulder_sentence_keeps_title_and_particle
    assert_equal '알마인의 대사 쿨더(Ambassador Kulder)입니다.',
      M.transform(['default', '17', ''],
        '알마인의 대사 컬더(Kulder)입니다.')
  end

  def test_ansilla_collection_scope_is_not_a_house_name
    assert_equal '안실라 인형(Ansilla dolls) 다섯 개를 찾았다.',
      M.transform(['default', '61887', ''],
        '안실라(Ansilla)의 인형 다섯 개를 찾았다.')
  end

  def test_blood_rite_variants_share_one_canonical_pair
    assert_equal '피의 의식(Blood Rite)은 레드 리전의 의식이다.',
      M.transform(['default', '29618', ''],
        '혈의 의식은 레드 리전의 의식이다.')
  end

  def test_existing_bilingual_occurrence_is_unchanged
    text = '피의 의식(Blood Rite)을 위하여!'
    assert_equal text, M.transform(['default', '40632', ''], text)
  end

  def test_unreviewed_key_cannot_be_silently_edited
    assert_equal '킨 대사',
      M.transform(['default', '99999', ''], '킨 대사')
  end
end
