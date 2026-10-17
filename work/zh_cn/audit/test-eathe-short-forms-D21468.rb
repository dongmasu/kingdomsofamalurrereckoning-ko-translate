#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'review-eathe-short-forms-D21468'

class EatheShortFormsD21468Test < Minitest::Test
  R = EatheShortFormsD21468
  M = ReviewedNameBatches

  def test_scope_and_exact_edits
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    index = M.table(M::INDEX).map(&:to_h)
    manifest = File.file?(R::REVIEW) ? M.table(R::REVIEW).map(&:to_h) : []
    manifest.each { |row| inventory.fetch(M.key(row))['work_text'] = row['old'] }
    index.reject! { |row| row['entity_key'] == R::PERSON && R::SPECS.key?(M.key(row)) }
    reviews = R.build_reviews(inventory, index)
    assert_equal 13, reviews.length
    assert_equal 12, reviews.count { |row| row['status'] == 'accepted' }
    assert_equal 1, reviews.count { |row| row['status'] == 'excluded' }
    doll = reviews.find { |row| row['resource'] == 'base' }
    assert_equal doll['old'], doll['new']
    label = reviews.find { |row| row['ID_Linha'] == '62105' }
    assert_equal '이스 던버트(Eathe Dumbert)', label['new']
    refute_empty label['evidence']
    assert_equal manifest, reviews if manifest.any?
  end

  def test_pronoun_expansion_and_nickname
    key = ['default', '8897', '']
    text = '이시(Eathe)와 나는 성공했다. 이시와 이야기해야 한다.'
    expected = '이스(Eathe)와 나는 성공했다. 이스와 이야기해야 한다.'
    assert_equal expected, R.normalize(text, key)
    assert_equal expected, R.normalize(expected, key)
    assert_equal '이스(Eathe)는 내 이름이야. 블랙 이스(Black Eathe)라고 부르지.',
      R.normalize('이드는 내 이름이야. 블랙 이드라고 부르지.', ['default', '37779', ''])
  end
end
