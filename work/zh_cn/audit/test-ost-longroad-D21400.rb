require 'minitest/autorun'
require_relative 'review-ost-short-references-D21400'
require_relative 'review-longroad-storehouse-D21401'

class OstLongroadD21400Test < Minitest::Test
  def test_ost_placeholder_and_particle_preserved
    assert_equal 'PH - 오스트(Ost)가 예전에 소유했던 화려한 투구.',
      OstShortReferencesD21400.transform('PH - 오스트가 예전에 소유했던 화려한 투구.')
  end

  def test_existing_ost_pair_retained
    text = '오스트(Ost)의 표창장'
    assert_equal text, OstShortReferencesD21400.transform(text)
  end

  def test_longroad_pair_is_atomic
    ['롱로드(Longroad) 창고', '롱로드 창고', '롱로드 창고(Longroad Storehouse)'].each do |text|
      assert_equal '롱로드 창고(Longroad Storehouse)', LongroadStorehouseD21401.transform(text)
    end
  end

  def test_ost_exact_new_scope
    m = ReviewedNameBatches
    path = File.join(__dir__, 'proper-name-edits-D21400.tsv')
    rows = File.file?(path) ? m.table(path) : OstShortReferencesD21400.plan.fetch(:reviews)
    assert_equal OstShortReferencesD21400::KEYS.sort, rows.map { |row| m.key(row) }.sort
    assert_equal 13, rows.count { |row| row['status'] == 'accepted' }
    assert_equal 13, rows.count { |row| row['status'] == 'not-an-issue' }
  end
end
