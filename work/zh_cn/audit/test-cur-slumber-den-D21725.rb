require 'minitest/autorun'
require_relative 'review-cur-slumber-den-D21725'

class ReviewCurSlumberDenD21725Test < Minitest::Test
  M = ReviewCurSlumberDenD21725

  def transform(index, id, english, korean)
    M.transform(M::SPECS[index], ['default', id, ''], korean,
                { 'en_texts_json' => JSON.generate([english]) })
  end

  def test_bounded_all_source_matches
    assert_equal 44, M::SPECS.sum { |spec| spec.fetch(:count) }
  end

  def test_cur_insult_is_not_a_name
    assert_equal ['그 늙은이는', true], transform(0, '51549', 'the old cur', '그 늙은이는')
  end

  def test_short_label_mistranslation_and_full_epithet_are_distinguished
    assert_equal ['커(Cur)', false], transform(0, '30864', 'Cur', '개자식')
    assert_equal ['복수의 사냥개(Cur of Vengeance)', false],
                 transform(0, '45624', 'Cur of Vengeance', '복수의 사냥개')
  end

  def test_sleep_simile_is_not_fae_ritual
    assert_equal ['깊이 잠든 바게스트', true],
                 transform(1, '10548', 'barghest in deep slumber', '깊이 잠든 바게스트')
    assert_equal ['깊은 잠(Deep Slumber)은', false],
                 transform(1, '37741', 'The Deep Slumber predicted', '깊은 잠은')
  end

  def test_place_variant_has_one_atomic_english_pair
    assert_equal ['밤의 소굴(Den of Night)에', false],
                 transform(2, '51028', 'Den of Night', '밤의 굴(Den of Night)에')
  end
end
