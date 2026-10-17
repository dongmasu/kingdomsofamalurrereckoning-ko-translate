require 'minitest/autorun'
require_relative 'review-dennrit-short-references-D21404'

class DennritShortReferencesD21404Test < Minitest::Test
  def test_pairs_existing_short_form_and_particle
    assert_equal '덴릿(Dennrit)은 떠났다.',
      DennritShortReferencesD21404.transform('덴릿은 떠났다.')
  end

  def test_standardizes_spelling_variants
    assert_equal '덴릿(Dennrit)과 함께',
      DennritShortReferencesD21404.transform('데른릿(Dennrit)과 함께')
    assert_equal '덴릿(Dennrit)의 정신',
      DennritShortReferencesD21404.transform('덴리트의 정신')
  end

  def test_preserves_existing_pair
    text = '덴릿(Dennrit)과 함께'
    assert_equal text, DennritShortReferencesD21404.transform(text)
  end

  def test_does_not_touch_full_name
    assert_raises(RuntimeError) do
      DennritShortReferencesD21404.transform('덴릿 론드(Dennrit Rond)가 왔다.')
    end
  end
end
