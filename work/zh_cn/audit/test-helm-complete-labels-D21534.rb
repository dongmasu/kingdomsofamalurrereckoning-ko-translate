#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-helm-complete-labels-D21534'

class HelmCompleteLabelsD21534Test < Minitest::Test
  R = HelmCompleteLabelsD21534
  M = ReviewedNameBatches

  def reviews
    @reviews ||= R.reviews(M.refresh_inventory)
  end

  def test_fourteen_exact_complete_labels_across_all_source_resources
    assert_equal 14, R.entities.length
    assert_equal 14, reviews.length
    assert reviews.all? { |row| row['resource'] == 'base' && row['Tipo_Variante'] == '11' }
    assert_equal 14, reviews.map { |row| M.key(row) }.uniq.length
    reviews.each do |row|
      assert_equal 'accepted', row['status']
      refute_empty row['japanese']
      refute_empty row['chinese']
      assert row['new'].end_with?("(#{row['english']})")
      assert_equal 1, row['new'].count('(')
    end
  end

  def test_prior_entities_and_historical_hold_not_reopened
    index = M.table(M::INDEX)
    entities = R.entities.map { |entity| entity['entity_key'] }
    refute index.any? { |row| entities.include?(row['entity_key']) }
    wrath = index.find { |row| row['entity_key'] == 'skill:wrath' && M.key(row) == ['base', '3120', '11'] }
    assert_equal 'excluded', wrath['status']
    refute reviews.any? { |row| %w[2943 41620].include?(row['ID_Linha']) }
    assert_equal '오스트의 투구(Ost\'s Helm)',
                 reviews.find { |row| row['ID_Linha'] == '4388' }['new']
    assert_equal '볼간을 처치하는 투구(Helm of Bolgans\' Bane)',
                 reviews.find { |row| row['ID_Linha'] == '4056' }['new']
  end

  def test_planning_does_not_modify_active_files_or_registers
    paths = [*M::RESOURCES.map { |resource| M.csv_path(resource) },
             M::INDEX, ReviewedProperNameDiscovery::GLOSSARY, *M::DOCS]
    before = paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
    R.reviews(M.refresh_inventory)
    assert_equal before, paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
  end
end
