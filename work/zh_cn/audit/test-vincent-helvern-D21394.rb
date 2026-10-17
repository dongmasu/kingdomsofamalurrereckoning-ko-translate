require 'minitest/autorun'
require_relative 'review-vincent-helvern-D21394'

class VincentHelvernD21394Test < Minitest::Test
  def test_pairs_full_name_with_its_particle
    assert_equal '시설 관리인 빈센트 헬번(Vincent Helvern)입니다.',
      VincentHelvernD21394.transform('시설 관리인 빈센트 헬번입니다.')
  end

  def test_preserves_existing_pair_and_other_person
    text = '빈센트 헬번(Vincent Helvern)과 보르 안자르(Bor Anjar)'
    assert_equal text, VincentHelvernD21394.transform(text)
  end

  def test_rejects_country_or_short_name
    assert_raises(RuntimeError) do
      VincentHelvernD21394.transform('세인트빈센트 그레나딘')
    end
  end
end
