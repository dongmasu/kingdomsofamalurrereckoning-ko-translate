#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-helm-items-D21530'

class HelmItemsD21530Test < Minitest::Test
  R = HelmItemsD21530
  M = ReviewedNameBatches

  def plan
    @plan ||= begin
      inventory = R.source_inventory
      rows = M.table(R::REVIEWS).map(&:to_h)
      [inventory, rows]
    end
  end

  def by_key
    plan.fetch(1).to_h { |row| [M.key(row), row] }
  end

  def test_all_six_item_labels_have_exact_complete_source_coverage
    assert_equal 6, R::ENTITIES.length
    assert_equal 8, plan.fetch(1).length
    assert_equal R::EXPECTED_KEYS.transform_values(&:sort),
                 plan.fetch(1).group_by { |row| row.fetch('entity_key') }
                   .transform_values { |rows| rows.map { |row| M.key(row) }.sort }
    assert_equal(
      { 'accepted' => 6, 'not-an-issue' => 2 },
      plan.fetch(1).group_by { |row| row['status'] }.transform_values(&:length)
    )
  end

  def test_source_names_are_bilingual_and_existing_translations_are_preserved
    expected = {
      ['base', '4502', '11'] => '페이 사냥꾼의 투구(Helm of the Faehunter)',
      ['default', '35159', ''] => '페이 사냥꾼의 투구(Helm of the Faehunter)',
      ['default', '6441', ''] => '페이 사냥꾼의 투구(Helm of the Faehunter)',
      ['base', '2009', '11'] => "카스티의 투구(Khas-ti's Helm)",
      ['base', '2854', '11'] => "케로드의 투구(Kerrod's Helm)",
      ['base', '4516', '11'] => "셰퍼드의 투구(Shepard's Helm)",
      ['base', '1860', '11'] => '수호자의 투구 (The Guardian Helm)',
      ['base', '3722', '11'] => '골리앗의 투구 (The Goliath Helm)'
    }
    expected.each do |key, value|
      current = plan.fetch(0).fetch(key).fetch('work_text')
      if key.first == 'base'
        assert_equal value, current, key.inspect
      else
        assert_equal 1, current.scan(value).length, key.inspect
      end
      row = by_key.fetch(key)
      assert_equal current, row.fetch('new'), key.inspect
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_only_reviewed_name_spans_changed_and_existing_holds_are_out_of_scope
    by_key.each do |key, row|
      source = plan.fetch(0).fetch(key)
      assert_equal source.fetch('work_text'), row.fetch('new'), key.inspect
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE),
                   key.inspect
    end
    assert_equal '도가니의 투구',
                 plan.fetch(0).fetch(['base', '1584', '11']).fetch('work_text')
    assert_equal '경고의 투구',
                 plan.fetch(0).fetch(['base', '2725', '11']).fetch('work_text')
    assert_equal '흉측한 얼굴의 투구',
                 plan.fetch(0).fetch(['base', '3661', '11']).fetch('work_text')
    assert_equal '투구의 계승',
                 plan.fetch(0).fetch(['default', '9401', '']).fetch('work_text')
  end

  def test_definitions_do_not_infer_item_rarity_or_merge_people
    R::ENTITIES.each do |entity|
      assert_equal 'item', entity.fetch('category')
      assert_match(/[가-힣].*\(#{Regexp.escape(entity.fetch('english_canonical'))}\)/,
                   entity.fetch('korean_canonical'))
      assert_match(/(?:does not|do not).{0,110}rarity/i, entity.fetch('notes'))
    end
    refute_includes R::ENTITIES.map { |entity| entity['entity_key'] }, 'person:kerrod'
    refute_includes R::ENTITIES.map { |entity| entity['entity_key'] }, 'person:shepard'
    refute_includes R::ENTITIES.map { |entity| entity['entity_key'] }, 'person:khas-ti'
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
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    R.reviews(inventory, glossary.headers)
    after = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal before, after
  end
end
