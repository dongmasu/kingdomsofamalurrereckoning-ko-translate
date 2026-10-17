require 'minitest/autorun'
require_relative 'review-mixed-full-short-references-D21399'

class MixedFullShortReferencesD21399Test < Minitest::Test
  def test_protects_full_pair_and_fixes_only_later_short_name
    assert_equal(
      '페핀 자마네(Pepin Jamane)를 찾았다. 페핀(Pepin)과 함께 간다.',
      MixedFullShortReferencesD21399.transform(
        'person:pepin-jamane',
        '페핀 자마네(Pepin Jamane)를 찾았다. 페핀과 함께 간다.',
        '페핀 자마네(Pepin Jamane)'
      )
    )
  end

  def test_rejects_already_complete_annotation
    assert_raises(RuntimeError) do
      MixedFullShortReferencesD21399.transform(
        'person:alder-malloi',
        '앨더 말로이(Alder Malloi)는 앨더(Alder)다.',
        '앨더 말로이(Alder Malloi)'
      )
    end
  end

  def test_rejects_missing_full_name
    assert_raises(RuntimeError) do
      MixedFullShortReferencesD21399.transform('person:alder-malloi', '앨더다.', '앨더 말로이(Alder Malloi)')
    end
  end
end
