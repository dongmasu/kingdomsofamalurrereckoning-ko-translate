require 'minitest/autorun'
require_relative 'review-unbound-path-D21410'

class UnboundPathD21410Test < Minitest::Test
  def test_normalizes_path_variants_and_preserves_particles
    {
      '속박받지 않는 길이란 무엇인가?' =>
        '언바운드의 길(Unbound Path)이란 무엇인가?',
      '속박 없는 길로 부름받는다.' =>
        '언바운드의 길(Unbound Path)로 부름받는다.',
      '언바운드의 길(Unbound path)을 찾았다.' =>
        '언바운드의 길(Unbound Path)을 찾았다.',
      '속박되지 않는 길을 다시 찾아냈어.' =>
        '언바운드의 길(Unbound Path)을 다시 찾아냈어.'
    }.each do |source, expected|
      assert_equal expected,
                   UnboundPathD21410.transform(source, '10655')
    end
  end

  def test_rejects_faction_and_unscoped_rows
    assert_raises(RuntimeError) do
      UnboundPathD21410.transform('언바운드(The Unbound)', '10655')
    end
    assert_raises(RuntimeError) do
      UnboundPathD21410.transform('언바운드의 길', '9550')
    end
    assert_equal 20, UnboundPathD21410::IDS.length
  end
end
