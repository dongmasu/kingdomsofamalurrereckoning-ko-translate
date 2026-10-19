#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'build-proper-name-discovery-D21754'

class ProperNameDiscoveryD21754Test < Minitest::Test
  M = ProperNameDiscoveryD21754

  def test_gallows_bloom_forms_reuse_existing_bilingual_name
    assert_equal '교수대 꽃(Gallows Bloom)을 모아라',
      M.proposed_text('resource:gallows-bloom', '교수대의 꽃을 모아라')
    assert_equal '교수대 꽃(Gallows Bloom) 표본',
      M.proposed_text('resource:gallows-bloom', '교수대 꽃(Gallows Bloom) 표본')
  end

  def test_glasspillar_variants_use_the_established_place_form
    assert_equal '글래스필러 동굴(Glasspillar Caves)',
      M.proposed_text('place:glasspillar-caves', '유리기둥 동굴')
    assert_equal '글래스필러 동굴(Glasspillar Caves)',
      M.proposed_text('place:glasspillar-caves', '글라스필러 동굴(Glasspillar Caves)')
  end

  def test_compound_names_do_not_create_nested_parentheses
    assert_equal '그리지의 무덤(Grave of Gridge)',
      M.proposed_text('place:grave-of-gridge', '그리지(Gridge)의 무덤')
    assert_equal '그릴리카스 메달(Grilricas Medallion)',
      M.proposed_text('unique_item:grilricas-medallion', '그릴리카스(Grilricas)의 메달')
  end
end
