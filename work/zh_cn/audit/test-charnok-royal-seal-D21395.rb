require 'minitest/autorun'
require_relative 'review-charnok-royal-seal-D21395'

class CharnokRoyalSealD21395Test < Minitest::Test
  def test_pairs_complete_quarry
    assert_equal '샤르녹 채석장(Charnok Quarry)',
      CharnokRoyalSealD21395.transform('place:charnok-quarry', '샤르녹(Charnok) 채석장')
  end

  def test_normalizes_both_seal_labels
    ['안실라(Ansilla)의 왕실 인장', '안실라 왕가의 인장'].each do |text|
      assert_equal '안실라의 왕실 인장(Royal Seal of Ansilla)',
        CharnokRoyalSealD21395.transform('title:royal-seal-of-ansilla', text)
    end
  end

  def test_does_not_change_other_scopes
    assert_raises(RuntimeError) do
      CharnokRoyalSealD21395.transform('place:charnok-quarry', '샤르노크(Charnok)')
    end
    assert_raises(RuntimeError) do
      CharnokRoyalSealD21395.transform('title:royal-seal-of-ansilla', '안실라의 열쇠(Ansilla Key)')
    end
  end
end
