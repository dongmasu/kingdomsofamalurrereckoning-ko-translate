require 'minitest/autorun'
require_relative 'review-fieros-lighthouse-D21406'

class FierosLighthouseD21406Test < Minitest::Test
  def test_pairs_the_complete_label
    [
      '피에로스(Fieros) 등대',
      '피에로스 등대',
      '피에로스 등대(Fieros Lighthouse)'
    ].each do |text|
      assert_equal '피에로스 등대(Fieros Lighthouse)',
                   FierosLighthouseD21406.transform(text)
    end
  end

  def test_rejects_unrelated_text
    assert_raises(RuntimeError) do
      FierosLighthouseD21406.transform('브로켄 등대')
    end
  end
end
