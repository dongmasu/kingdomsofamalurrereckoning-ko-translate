#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-the-mountain-card-D21531'

class TheMountainCardD21531Test < Minitest::Test
  R = TheMountainCardD21531
  M = ReviewedNameBatches

  def plan
    @plan ||= begin
      inventory = R.source_inventory
      [inventory, R.reviews(inventory, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers)]
    end
  end

  def by_key
    plan.fetch(1).to_h { |row| [M.key(row), row] }
  end

  def test_all_case_insensitive_matches_are_accounted_for_without_reopening_other_entities
    rows = plan.fetch(1)
    assert_equal 79, rows.length
    assert_equal(
      { 'accepted' => 1, 'uncertain' => 1, 'excluded' => 77 },
      rows.group_by { |row| row.fetch('status') }.transform_values(&:length)
    )
    assert_equal R::CARD_KEY, M.key(rows.find { |row| row['status'] == 'accepted' })
    assert_equal R::AMBIGUOUS_KEY, M.key(rows.find { |row| row['status'] == 'uncertain' })
    assert rows.all? { |row| row.fetch('entity_key') == R::ENTITY_KEY }
  end

  def test_fate_card_name_is_paired_twice_and_line_breaks_are_preserved
    row = by_key.fetch(R::CARD_KEY)
    assert_equal 2, row.fetch('old').scan(R::REPLACEMENT).length
    assert_equal 2, row.fetch('new').scan(R::REPLACEMENT_WITH_ENGLISH).length
    assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                 row.fetch('new').scan(/\r\n|\r|\n/)
    assert_equal(
      '산(The Mountain) 카드가 나타내는 운명은 천천히, 조용히 찾아온다. 페이트위버들의 설명에 따르면, 산(The Mountain) 카드의 운명을 타고난 사람은 변화가 이미 자신을 지나간 뒤에야 그 변화를 알아차릴 때도 있다고 한다.',
      row.fetch('new')
    )
  end

  def test_standalone_base_label_remains_an_identity_hold
    row = by_key.fetch(R::AMBIGUOUS_KEY)
    assert_equal 'uncertain', row.fetch('status')
    assert_equal row.fetch('old'), row.fetch('new')
    assert_match(/could be the Fate card or a separate item/i, row.fetch('evidence'))
  end

  def test_entity_is_only_the_attested_fate_card_title
    assert_equal 'title:the-mountain-fate-card', R::ENTITY.fetch('entity_key')
    assert_equal 'The Mountain', R::ENTITY.fetch('english_canonical')
    assert_equal '산(The Mountain)', R::ENTITY.fetch('korean_canonical')
    assert_equal '', R::ENTITY.fetch('english_aliases')
    assert_match(/Fate card/i, R::ENTITY.fetch('notes'))
  end

  def test_planning_does_not_write_project_state
    paths = [
      R::DEFINITIONS, R::REVIEWS, ReviewedProperNameDiscovery::GLOSSARY,
      M::INDEX, *M::RESOURCES.map { |resource| M.csv_path(resource) }, *M::DOCS
    ]
    before = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    inventory = R.source_inventory
    R.reviews(inventory, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers)
    after = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal before, after
  end
end
