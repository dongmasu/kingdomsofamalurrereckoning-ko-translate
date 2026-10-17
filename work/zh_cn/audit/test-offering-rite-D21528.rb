#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-offering-rite-D21528'

class OfferingRiteD21528Test < Minitest::Test
  R = OfferingRiteD21528
  M = ReviewedNameBatches

  def plan
    @plan ||= begin
      inventory = R.source_inventory
      rows = if File.file?(R::REVIEWS)
               M.table(R::REVIEWS).map(&:to_h)
             else
               R.reviews(inventory, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers)
             end
      [inventory, rows]
    end
  end

  def by_key
    plan.fetch(1).to_h { |row| [M.key(row), row] }
  end

  def test_complete_english_occurrence_scope_and_dispositions
    assert_equal 61, R.candidate_keys.length
    rows = plan.fetch(1)
    assert_equal 90, rows.length
    assert_equal 90, rows.map { |row| M.key(row) }.uniq.length
    assert_equal(
      { 'accepted' => 55, 'excluded' => 30, 'not-an-issue' => 3, 'uncertain' => 2 },
      rows.group_by { |row| row['status'] }.transform_values(&:length)
    )
    assert_equal 'excluded', by_key.fetch(R::ITEM_KEY)['status']
    R::UNCERTAIN_KEYS.each do |key|
      assert_equal 'uncertain', by_key.fetch(key)['status']
      assert_equal by_key.fetch(key)['old'], by_key.fetch(key)['new']
    end
  end

  def test_rite_labels_are_bilingual_and_generic_matches_are_untouched
    rows = plan.fetch(1)
    rows.select { |row| %w[accepted not-an-issue].include?(row['status']) }.each do |row|
      source = plan.fetch(0).fetch(M.key(row))
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      expected = english.scan(/(?<![A-Za-z])(?:The )?Offering(?![A-Za-z])/).length
      actual = row.fetch('new').scan(/봉헌 의식\(Offering\)/).length
      assert_equal expected, actual, M.key(row).inspect
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
    rows.select { |row| row['status'] == 'excluded' }.each do |row|
      assert_equal row['old'], row['new'], M.key(row).inspect
    end
    assert_equal '봉헌 의식(Offering)이란 무엇인가?',
                 by_key.fetch(['default', '32249', ''])['new']
    assert_equal '봉헌 의식(Offering)이 나쁘냐고? 그래.',
                 by_key.fetch(['default', '32440', ''])['new']
    assert_equal '우리 마을 사람들은 새로운 사이온(Scion)을 맞이할 봉헌 의식(Offering)을 준비하고 있어. 그때가 되어야 네가 진정으로 이해할 거야.',
                 by_key.fetch(['default', '54489', ''])['new']
    assert_equal '봉헌 의식(Offering)이 가까워진다.',
                 by_key.fetch(['default', '59193', ''])['new']
    assert_equal '봉헌 의식(Offering)을 치르고 축복을 받아야 한다. 아카라(Akara)를 찬양하라.',
                 by_key.fetch(['default', '63982', ''])['new']
  end

  def test_changed_cells_are_only_source_local_offering_spans
    rows = plan.fetch(1).select { |row| row['old'] != row['new'] }
    refute_empty rows
    rows.each do |row|
      refute_match(/\([^)]*\(/, row['new'], M.key(row).inspect)
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_includes row['new'], '봉헌 의식(Offering)'
    end
  end

  def test_applied_values_match_manifest_and_normalization_is_idempotent
    inventory, rows = plan
    rows.each do |row|
      source = inventory.fetch(M.key(row))
      assert_equal row['new'], source.fetch('work_text'), M.key(row).inspect
      if row['entity_dispositions_json'].include?('"accepted"')
        assert_equal row['new'], R.normalize(row['new'], source), M.key(row).inspect
      end
    end
  end

  def test_planning_does_not_write_project_state
    paths = [
      R::DEFINITIONS, R::REVIEWS, ReviewedProperNameDiscovery::GLOSSARY,
      M::INDEX, *M::RESOURCES.map { |resource| M.csv_path(resource) }, *M::DOCS
    ]
    before = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    R.reviews(R.source_inventory, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers)
    after = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal before, after
  end
end
