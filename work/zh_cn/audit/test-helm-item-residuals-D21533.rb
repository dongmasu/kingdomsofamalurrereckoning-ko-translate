#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-helm-item-residuals-D21533'

class HelmItemResidualsD21533Test < Minitest::Test
  R = HelmItemResidualsD21533
  M = ReviewedNameBatches

  def plan
    @plan ||= begin
      inventory = R.source_inventory
      [inventory, R.reviews(inventory)]
    end
  end

  def by_key
    plan.fetch(1).to_h { |row| [M.key(row), row] }
  end

  def test_exact_four_item_definitions_and_five_source_keys
    assert_equal 4, R::ENTITIES.length
    assert_equal 5, plan.fetch(1).length
    assert_equal R::EXPECTED_KEYS.transform_values(&:sort),
                 plan.fetch(1).group_by { |row| row.fetch('entity_key') }
                   .transform_values { |rows| rows.map { |row| M.key(row) }.sort }
    assert_equal({ 'accepted' => 5 },
                 plan.fetch(1).group_by { |row| row['status'] }.transform_values(&:length))
  end

  def test_complete_item_labels_are_bilingual
    R::ENTITIES.each do |entity|
      assert_match(/[가-힣].*\(#{Regexp.escape(entity.fetch('english_canonical'))}\)/,
                   entity.fetch('korean_canonical'))
      row = by_key.values.find { |review| review.fetch('entity_key') == entity.fetch('entity_key') }
      assert_match(/#{Regexp.escape(entity.fetch('english_canonical'))}/i, row.fetch('english'))
      refute_empty row.fetch('japanese')
      refute_empty row.fetch('chinese')
    end
  end

  def test_only_named_item_spans_change_and_infernal_ui_token_is_preserved
    expected = {
      ['base', '357', '11'] => '코르티아의 투구(Corthian Helm)',
      ['base', '3688', '11'] => '티베리안 투구(Tiberian Helm)',
      ['base', '3933', '11'] => '나이트스톤 투구(Nightstone Helm)',
      ['base', '4670', '11'] => '지옥의 투구(Infernal Helm)'
    }
    expected.each do |key, text|
      assert_equal text, by_key.fetch(key).fetch('new'), key.inspect
    end
    infernal = by_key.fetch(['default', '63378', ''])
    assert_includes infernal.fetch('new'), '{*1지옥불 투구}(Infernal Helm)'
    assert_equal infernal.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                 infernal.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
    assert_equal infernal.fetch('old').scan(/\r\n|\r|\n/),
                 infernal.fetch('new').scan(/\r\n|\r|\n/)
  end

  def test_prior_helm_items_generic_labels_and_historical_holds_are_out_of_scope
    excluded = %w[
      item:the-goliath-helm item:the-guardian-helm item:helm-of-the-faehunter
      item:khas-tis-helm item:kerrods-helm item:shepards-helm
    ]
    refute R::ENTITIES.any? { |entity| excluded.include?(entity.fetch('entity_key')) }
    assert_equal 'Hotheaded Helm',
                 M.table(File.join(__dir__, 'proper-name-candidates.tsv'))
                   .find { |row| row['english_candidate'] == 'Hotheaded Helm' }['english_candidate']
    refute R::EXPECTED_KEYS.values.flatten(1).include?(['base', '2943', '11'])
    refute R::EXPECTED_KEYS.values.flatten(1).include?(['default', '41620', ''])
  end

  def test_planning_does_not_write_project_state
    paths = [
      R::DEFINITIONS, R::REVIEWS, ReviewedProperNameDiscovery::GLOSSARY,
      M::INDEX, *M::RESOURCES.map { |resource| M.csv_path(resource) }, *M::DOCS
    ]
    before = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    R.reviews(R.source_inventory)
    after = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal before, after
  end
end
