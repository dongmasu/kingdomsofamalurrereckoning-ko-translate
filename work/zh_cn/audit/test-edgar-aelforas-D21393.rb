require 'minitest/autorun'
require_relative 'review-edgar-aelforas-D21393'

class EdgarAelforasD21393Test < Minitest::Test
  def test_pairs_the_whole_name_and_preserves_other_names
    assert_equal(
      '알마인(Almain) 왕자 에드거 알포라스(Edgar Aelforas)는 쓰러졌다.',
      EdgarAelforasD21393.transform('알마인(Almain) 왕자 에드거 알포라스는 쓰러졌다.')
    )
  end

  def test_idempotent
    text = '에드거 알포라스(Edgar Aelforas)의 방패'
    assert_equal text, EdgarAelforasD21393.transform(text)
  end

  def test_does_not_conflate_the_other_edgar
    assert_raises(RuntimeError) do
      EdgarAelforasD21393.transform('에드거 아론(Edgar Aron)과 대화하기')
    end
  end
end
