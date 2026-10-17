#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-ivan-hugues-residual-D21544'

class IvanHuguesResidualD21544Test < Minitest::Test
  R = IvanHuguesResidualD21544
  M = ReviewedNameBatches

  def self.inventory
    @inventory ||= R.source_inventory
  end

  def reviews
    @reviews ||= if File.file?(R::PROPOSAL)
                   M.table(R::PROPOSAL).map(&:to_h)
                 else
                   R.reviews(self.class.inventory, M.table(M::INDEX).map(&:to_h))
                 end
  end

  def test_all_full_names_already_indexed_without_new_identity
    R.validate_full_scope!(self.class.inventory, M.table(M::INDEX).map(&:to_h))
    assert_equal 18, R::ALL_IDS.length
    assert_equal 3, reviews.length
    assert_equal %w[35405 59697 63841], reviews.map { |row| row['ID_Linha'] }
    assert reviews.all? { |row| row['entity_key'] == 'person:hugues' && row['status'] == 'accepted' }
  end

  def test_exact_existing_key_annotations_and_prose_preservation
    reviews.each do |row|
      from, to, = R::PATCHES.fetch(row['ID_Linha'])
      assert_equal row['old'].sub(from, to), row['new']
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_includes row['new'], '이반 휴그(Ivan Hugues)'
      refute_includes row['new'], '아이반'
    end
    assert_equal '이반 휴그(Ivan Hugues)', reviews.find { |row| row['ID_Linha'] == '35405' }['new']
    short = reviews.find { |row| row['ID_Linha'] == '63841' }
    assert_includes short['new'], '이반(Ivan)의 시신'
    assert_equal 1, short['new'].scan('이반 휴그(Ivan Hugues)').length
  end

  def test_earlier_dispositions_are_captured_without_new_occurrence_keys
    index = M.table(M::INDEX)
    reviews.each do |row|
      record = index.find { |prior| prior['entity_key'] == R::ENTITY && M.key(prior) == M.key(row) }
      refute_nil record
      if File.file?(R::PROPOSAL)
        event = M.table(File.join(__dir__, 'proper-name-edits-D21544.tsv'))
          .find { |prior| M.key(prior) == M.key(row) }
        assert_equal R::PATCHES.fetch(row['ID_Linha'])[2],
                     JSON.parse(event['previous_status'])[R::ENTITY]
        assert_match(/D-20579|D-20580/, JSON.parse(event['previous_evidence'])[R::ENTITY])
      else
        assert_equal R::PATCHES.fetch(row['ID_Linha'])[2], record['status']
      end
    end
  end

  def test_source_scope_drift_fails_closed
    changed = self.class.inventory.reject { |key, _| key == ['default', '32543', ''] }
    assert_raises(RuntimeError) { R.validate_full_scope!(changed, M.table(M::INDEX).map(&:to_h)) }
    ReviewedProperNameDiscovery.validate_sources!(reviews, self.class.inventory)
  end
end
