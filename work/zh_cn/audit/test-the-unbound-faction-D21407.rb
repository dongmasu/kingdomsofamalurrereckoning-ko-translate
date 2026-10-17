require 'minitest/autorun'
require_relative 'review-the-unbound-faction-D21407'

class TheUnboundFactionD21407Test < Minitest::Test
  def test_normalizes_variants_and_preserves_particles
    [
      ['결박을 벗어난 자들(The Unbound)은 모였다.',
       '언바운드(The Unbound)는 모였다.', '762'],
      ['속박 없는 자들(Unbound)을 습격했다.',
       '언바운드(The Unbound)를 습격했다.', '22105'],
      ['언바운드(Unbound)에게서 소식을 들었다.',
       '언바운드(The Unbound)에게서 소식을 들었다.', '12809'],
      ['언바운드라고 불렀다.',
       '언바운드(The Unbound)라고 불렀다.', '62976']
    ].each do |source, expected, id|
      assert_equal expected,
                   TheUnboundFactionD21407.transform(source, id)
    end
  end

  def test_excludes_path_and_atomic_church_scopes
    assert_raises(RuntimeError) do
      TheUnboundFactionD21407.transform('언바운드의 길(Unbound Path)', '11399')
    end
    assert_equal 40, TheUnboundFactionD21407::POSITIVE_IDS.length
    assert_equal 17, TheUnboundFactionD21407::EXCLUDED_IDS.length
    assert_empty(TheUnboundFactionD21407::POSITIVE_IDS &
                 TheUnboundFactionD21407::EXCLUDED_IDS)
  end
end
