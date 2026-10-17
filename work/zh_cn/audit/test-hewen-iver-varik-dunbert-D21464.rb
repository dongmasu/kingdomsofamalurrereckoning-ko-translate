#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-hewen-iver-varik-dunbert-D21464'

class HewenIverVarikDunbertD21464Test < Minitest::Test
  M = HewenIverVarikDunbertD21464

  def test_two_people_are_distinct_and_have_no_surname_aliases
    definitions = M.definitions_for(%w[entity_key english_canonical category korean_canonical
                                       english_aliases korean_variants evidence_ids status notes])
    assert_equal [M::HEWEN, M::VARIK], definitions.map { |row| row.fetch('entity_key') }
    assert definitions.all? { |row| row.fetch('english_aliases').empty? }
    assert_equal 'Hewen Iver', definitions[0].fetch('english_canonical')
    assert_equal 'Varik Dunbert', definitions[1].fetch('english_canonical')
  end

  def test_exact_korean_normalizations_are_idempotent
    expected = {
      ['base', '1411', '11'] => '휴언 아이버(Hewen Iver)의 무덤',
      ['default', '47321', ''] => '휴언 아이버(Hewen Iver)의 무덤',
      ['default', '4706', ''] => '바릭 던버트(Varik Dunbert)',
      ['default', '43455', ''] => '난 바릭 던버트(Varik Dunbert)야. 장사꾼이지. 요즘 우리 마을엔 별난 물건들이 들어오거든. 마음껏 둘러봐.',
      ['default', '64201', ''] => '이제 본래 맡았던 일을 끝내고 아다스 스코리아(Adath Skoria)를 죽여야 한다. 그는 여기 화이트스톤(Whitestone)에 있는 상인 바릭 던버트(Varik Dunbert)의 집에 있을 것이다.'
    }
    expected.each do |key, korean|
      assert_equal korean, M.normalize(korean, key) unless
        %w[43455 64201].include?(key[1])
      assert_equal korean, M.normalize(M.normalize(korean, key), key)
    end
    assert_equal '휴언 아이버(Hewen Iver)의 무덤',
                 M.normalize('휴언 아이버의 무덤', ['default', '47321', ''])
    assert_equal expected.fetch(['default', '43455', '']),
                 M.normalize('난 배릭 던버트야. 장사꾼이지. 요즘 우리 마을엔 별난 물건들이 들어오거든. 마음껏 둘러봐.', ['default', '43455', ''])
  end

  def test_unreviewed_keys_and_korean_drift_fail_closed
    assert_raises(RuntimeError) { M.normalize('던버트(Dunbert)', ['default', '29527', '']) }
    assert_equal '휴언 아이버(Hewen Iver)',
                 M.normalize('휴언 아이버', ['default', '47321', ''])
    assert_raises(RuntimeError) { M.normalize('다른 이름', ['default', '43455', '']) }
  end
end
