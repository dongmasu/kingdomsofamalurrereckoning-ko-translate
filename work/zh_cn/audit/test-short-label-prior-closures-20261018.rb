#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'build-short-label-discovery-20261018'

class ShortLabelPriorClosures20261018Test < Minitest::Test
  M = ReviewedNameBatches

  def test_templar_closures_suppress_only_the_historically_closed_keys
    rows = M.table(
      File.join(M::AUDIT, 'proper-name-short-label-prior-closures-20261018.tsv')
    ).map(&:to_h)
    assert_equal %w[D-18738 D-14914 D-20395], rows.map { |row| row.fetch('prior_decision') }
    assert_equal [
      ['Templar', 'default', '23891', ''],
      ['Templar', 'default', '48712', ''],
      ['Templar', 'default', '52027', '']
    ], ShortLabelDiscovery20261018.reviewed_dispositions
         .select { |entry| entry.first == 'Templar' }.sort
  end

  def test_current_discovery_does_not_requeue_closed_templar_candidate
    inventory = M.refresh_inventory
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    refute candidates.any? { |row| row.fetch('english_candidate') == 'Templar' }
  end
end
