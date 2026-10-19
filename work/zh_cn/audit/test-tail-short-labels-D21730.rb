require 'minitest/autorun'
require_relative 'review-tail-short-labels-D21730'

class ReviewTailShortLabelsD21730Test < Minitest::Test
  def test_tail_batch_has_23_distinct_candidate_keys
    path = File.join(__dir__, 'proper-name-short-label-proposals-D21730.tsv')
    rows = ReviewedNameBatches.table(path).map(&:to_h)
    assert_equal 6, rows.length
    assert_equal 23, rows.sum { |row| row.fetch('expected_keys').to_i }
    assert rows.all? { |row| row.fetch('batch') == '21730' }
    assert_equal %w[not-an-issue uncertain], rows.map { |row| row.fetch('disposition') }.uniq.sort
  end

  def test_ambiguous_wyle_and_well_are_not_globalized
    rows = ReviewedNameBatches.table(
      File.join(__dir__, 'proper-name-short-label-proposals-D21730.tsv')
    ).map(&:to_h).to_h { |row| [row.fetch('english_candidate'), row] }
    %w[Wyle Well The\ Well].each do |term|
      assert_equal 'uncertain', rows.fetch(term).fetch('disposition')
    end
    assert_includes rows.fetch('Wyle').fetch('evidence'), 'default:24979'
    assert_includes rows.fetch('Well').fetch('evidence'), 'default:6055'
  end

  def test_existing_place_rank_and_person_names_are_no_ops
    rows = ReviewedNameBatches.table(
      File.join(__dir__, 'proper-name-short-label-proposals-D21730.tsv')
    ).map(&:to_h).to_h { |row| [row.fetch('english_candidate'), row] }
    %w[Ysa\ Chapter Witch\ Knight Witch\ Knight\ Khleran].each do |term|
      assert_equal 'not-an-issue', rows.fetch(term).fetch('disposition')
    end
    assert_includes rows.fetch('Ysa Chapter').fetch('evidence'), 'place:ysa'
    assert_includes rows.fetch('Witch Knight Khleran').fetch('evidence'), 'person:khleran'
  end
end
