require 'minitest/autorun'
require_relative 'review-edgar-short-references-D21392'

class EdgarShortReferencesD21392Test < Minitest::Test
  def test_normalizes_attested_stems_without_changing_particles
    assert_equal '에드거(Edgar)는 에드거(Edgar)의 유물을 돌려줬다.',
      EdgarShortReferencesD21392.transform('에드가는 에드거의 유물을 돌려줬다.')
  end

  def test_preserves_existing_pair_and_other_names
    text = '에드거(Edgar)와 모투스(Motus)에 관해 이야기한다.'
    assert_equal text, EdgarShortReferencesD21392.transform(text)
  end

  def test_requires_an_attested_korean_name
    assert_raises(RuntimeError) { EdgarShortReferencesD21392.transform('그에게 돌아간다.') }
  end

  def test_exact_scope
    m = ReviewedNameBatches
    manifest = File.join(__dir__, 'proper-name-edits-D21392.tsv')
    reviews = if File.file?(manifest)
                m.table(manifest)
              else
                result = EdgarShortReferencesD21392.plan
                assert_equal 39, result.fetch(:prior).length
                result.fetch(:reviews)
              end
    assert_equal EdgarShortReferencesD21392::TARGET_KEYS.sort,
      reviews.map { |row| m.key(row) }.sort
    assert reviews.all? { |row| row['status'] == 'accepted' && row['old'] != row['new'] }
    refute reviews.any? { |row| row['ID_Linha'] == '14764' }
    omitted = reviews.find { |row| row['ID_Linha'] == '63461' }
    assert_equal 1, omitted['new'].scan('에드거(Edgar)').length
  end
end
