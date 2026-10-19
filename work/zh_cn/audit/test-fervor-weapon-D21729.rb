require 'minitest/autorun'
require_relative 'review-fervor-weapon-D21729'

class ReviewFervorWeaponD21729Test < Minitest::Test
  M = ReviewFervorWeaponD21729

  def test_named_item_is_bounded_to_two_source_keys
    assert_equal 'item:fervor', M::SPEC.fetch(:key)
    assert_equal 'item', M::SPEC.fetch(:category)
    assert_equal 7, M::SPEC.fetch(:count)
    assert_equal '열정(Fervor)', M::SPEC.fetch(:korean)
  end

  def test_standalone_item_label_is_paired
    source = {
      'en_texts_json' => '["Fervor"]',
      'ja_texts_json' => '["ファーバー"]',
      'zh_text' => '激情'
    }
    assert_equal ['열정(Fervor)', false],
                 M.transform(M::SPEC, ['base', '4094', '11'], '열정', source)
  end

  def test_description_with_existing_pair_is_preserved
    source = {
      'en_texts_json' => '["Fervor favors a fencer skilled with both point and edge."]',
      'ja_texts_json' => '["熱情を意味するファーバーは剣士に向いている"]',
      'zh_text' => '激情更青睐剑手'
    }
    text = '열정(Fervor)은 한손검에 적합하다.'
    assert_equal [text, false],
                 M.transform(M::SPEC, ['default', '39983', ''], text, source)
  end

  def test_generic_abstract_fervor_rows_are_excluded
    source = {
      'en_texts_json' => '["A religious and philosophical fervor has picked up."]',
      'ja_texts_json' => '["熱意が高まっている"]',
      'zh_text' => '激情日益高涨'
    }
    text = '종교와 철학의 열풍이 일고 있어.'
    assert_equal [text, true],
                 M.transform(M::SPEC, ['default', '47535', ''], text, source)
  end

  def test_unrelated_generic_fervor_cannot_be_edited
    source = {
      'en_texts_json' => '["Her fervor was notable."]',
      'ja_texts_json' => '["彼女の熱意は注目に値した"]',
      'zh_text' => '她的热情值得注意'
    }
    assert_raises(RuntimeError) do
      M.transform(M::SPEC, ['default', '1', ''], '열정', source)
    end
  end
end
