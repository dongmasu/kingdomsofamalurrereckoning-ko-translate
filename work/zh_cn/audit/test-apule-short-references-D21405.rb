require 'minitest/autorun'
require_relative 'review-apule-short-references-D21405'

class ApuleShortReferencesD21405Test < Minitest::Test
  def test_pairs_short_name_and_preserves_existing_pair
    assert_equal '아풀레(Apule)은 여기 있어.',
      ApuleShortReferencesD21405.transform('아풀레(Apule)은 여기 있어.')
    assert_equal '아풀레(Apule)에게 돌아가.',
      ApuleShortReferencesD21405.transform('아풀(Apule)에게 돌아가.')
  end

  def test_corrects_spelling_variants_and_subject_particle
    assert_equal '아풀레(Apule)가 보냈어.',
      ApuleShortReferencesD21405.transform('아퓰(Apule)가 보냈어.')
    assert_equal '아풀레(Apule)와 수염',
      ApuleShortReferencesD21405.transform('아풀과 수염')
  end

  def test_does_not_touch_the_full_name
    assert_raises(RuntimeError) do
      ApuleShortReferencesD21405.transform('아풀레 비르(Apule Vire)가 왔다.')
    end
  end
end
