#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-idris-theonen-D21593'

class IdrisTheonenD21593Test < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @reviews = M.table(File.join(__dir__, 'proper-name-edits-D21593.tsv'))
                 .map(&:to_h)
  end

  def test_canonical_and_source_local_english_spellings_are_scoped
    assert_equal ReviewIdrisTheonenD21593::EXPECTED_IDS.sort,
      @reviews.map { |row| row['ID_Linha'] }.sort
    assert_equal 9, @reviews.map { |row| M.key(row) }.uniq.length
    definition = M.table(ReviewIdrisTheonenD21593::DEFINITIONS).first
    assert_equal 'person:idris-theonen', definition['entity_key']
    assert_equal 'Idris Theonen', definition['english_canonical']
    assert_equal 'Idiris Theonen', definition['english_aliases']
    assert_equal '이드리스 테오넨(Idris Theonen)',
      definition['korean_canonical']
  end

  def test_only_unpaired_name_spans_were_changed
    changed = @reviews.select { |row| row['old'] != row['new'] }
    assert_equal %w[4426 29544 35267 36609 45216 59745 60012 8984].sort,
      changed.map { |row| row['ID_Linha'] }.sort
    changed.each do |row|
      assert_equal 'accepted', row['status']
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
    %w[4426 60012].each do |id|
      row = changed.find { |entry| entry['ID_Linha'] == id }
      assert_includes row['new'], '이드리스 테오넨(Idiris Theonen)'
    end
    assert_includes changed.find { |row| row['ID_Linha'] == '59745' }['new'],
      '현자 이드리스 테오넨(Idris Theonen)에게 돌아가라'
    unchanged = @reviews.find { |row| row['ID_Linha'] == '14100' }
    assert_equal unchanged['old'], unchanged['new']
    assert_equal 'not-an-issue', unchanged['status']
  end

  def test_prior_59745_non_person_decisions_remain_unchanged
    index = M.table(M::INDEX)
    expected = {
      'faction:scholia-arcana' => 'accepted',
      'faction:tuatha' => 'accepted',
      'place:kandrian' => 'accepted',
      'place:mel-aglir' => 'accepted'
    }
    expected.each do |entity, status|
      row = index.find do |entry|
        entry['entity_key'] == entity && entry['resource'] == 'default' &&
          entry['ID_Linha'] == '59745'
      end
      refute_nil row
      assert_equal status, row['status']
    end
    person = index.find do |row|
      row['entity_key'] == 'person:idris-theonen' &&
        row['resource'] == 'default' && row['ID_Linha'] == '59745'
    end
    refute_nil person
    assert_equal 'accepted', person['status']
  end
end
