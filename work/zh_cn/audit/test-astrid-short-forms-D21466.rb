#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-astrid-short-forms-D21466'

class AstridShortFormsD21466Test < Minitest::Test
  M = AstridShortFormsD21466

  def review_inputs
    inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
      .map(&:to_h).to_h { |row| [ReviewedNameBatches.key(row), row] }
    index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX).map(&:to_h)
    return [inventory, index, nil] unless File.file?(M::REVIEW)

    manifest = ReviewedNameBatches.table(M::REVIEW).map(&:to_h)
    keys = manifest.map { |row| [M::PERSON, *ReviewedNameBatches.key(row)] }
    index.reject! do |row|
      keys.include?([row['entity_key'], *ReviewedNameBatches.key(row)])
    end
    manifest.each do |row|
      inventory.fetch(ReviewedNameBatches.key(row))['work_text'] = row.fetch('old')
    end
    [inventory, index, manifest]
  end

  def test_exact_short_name_scope_and_dispositions
    inventory, index, manifest = review_inputs
    reviews = M.build_reviews(inventory, index)

    assert_equal M::EXPECTED_IDS.sort, reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal(
      { 'accepted' => 6, 'not-an-issue' => 2, 'excluded' => 1 },
      reviews.group_by { |row| row['status'] }.transform_values(&:length)
    )
    assert_equal M::CHANGE_IDS.sort,
      reviews.select { |row| row['old'] != row['new'] }.map { |row| row['ID_Linha'] }.sort
    assert reviews.all? { |row| row['english'].match?(/\bAstrid\b/i) }
    assert reviews.all? { |row| row['japanese'].include?('アストリッド') }
    assert reviews.all? { |row| row['chinese'].include?('阿斯特丽德') }
    if manifest
      expected = manifest.to_h do |row|
        [ReviewedNameBatches.key(row),
         [row['status'], row['old'], row['new'], row['evidence']]]
      end
      actual = reviews.to_h do |row|
        [ReviewedNameBatches.key(row),
         [row['status'], row['old'], row['new'], row['evidence']]]
      end
      assert_equal expected, actual
    end
  end

  def test_homonymous_barelegs_sister_is_not_attributed_to_healer
    inventory, index, = review_inputs
    review = M.build_reviews(inventory, index).find { |row| row['ID_Linha'] == '49084' }

    assert_equal 'excluded', review.fetch('status')
    assert_equal review.fetch('old'), review.fetch('new')
    assert_includes review.fetch('english'), 'Barelegs Sisters'
    assert_includes review.fetch('evidence'), 'separate lore character'
  end

  def test_short_name_pairing_is_idempotent_and_preserves_existing_pair
    text = '아스트리드는 곧 나을 거라고 했어.'
    expected = '아스트리드(Astrid)는 곧 나을 거라고 했어.'
    assert_equal expected, M.normalize(text, '9891')
    assert_equal expected, M.normalize(expected, '9891')
    already_paired = '고맙군. 아스트리드(Astrid) 말로는 난 이제쯤 죽어 있었을 거래.'
    assert_equal already_paired, M.normalize(already_paired, '17981')
  end
end
