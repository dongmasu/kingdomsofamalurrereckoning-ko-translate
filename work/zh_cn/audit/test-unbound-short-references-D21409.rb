require 'minitest/autorun'
require_relative 'review-unbound-short-references-D21409'

class UnboundShortReferencesD21409Test < Minitest::Test
  def test_normalizes_only_reviewed_rows
    assert_equal '이제부터 나를 통해 사는 물건은 전부 언바운드(The Unbound)에게 할인을 적용할게.',
      UnboundShortReferencesD21409.transform(
        '28955',
        '이제부터 나를 통해 사는 물건은 전부 속박되지 않은 자(Unbound) 할인을 적용할게.'
      )
    assert_equal '새 언바운드(The Unbound) 신도 중 한 명이야.',
      UnboundShortReferencesD21409.transform(
        '48396', '새 언바운드 신도 중 한 명이야.'
      )
    assert_equal '언바운드(The Unbound)의 활동',
      UnboundShortReferencesD21409.transform('50072', '언바운드의 활동')
  end

  def test_rejects_unreviewed_row_and_ambiguous_text
    assert_raises(KeyError) do
      UnboundShortReferencesD21409.transform('50932', '언바운드의 길')
    end
    assert_raises(RuntimeError) do
      UnboundShortReferencesD21409.transform('50072', '언바운드의 활동과 언바운드의 활동')
    end
  end
end
