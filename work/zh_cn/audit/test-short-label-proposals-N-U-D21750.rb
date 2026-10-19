#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'run-short-label-proposals-20261018'

class ShortLabelProposalsNUd21750Test < Minitest::Test
  M = ShortLabelProposals20261018
  D = 21_750
  CANDIDATE_PATH = File.join(__dir__, 'proper-name-short-label-discovery-D21726.tsv')
  PROPOSAL_PATH = File.join(__dir__, 'proper-name-short-label-proposals-N-U-20261018.tsv')

  def setup
    @candidate_rows = M::M.table(CANDIDATE_PATH).map(&:to_h)
    @candidates = @candidate_rows.to_h { |row| [row.fetch('english_candidate'), row] }
    @inventory = M::M.table(M::M::INVENTORY).to_h do |row|
      [M::M.key(row), row.to_h]
    end
    @index = CSV.read(
      M::M::INDEX, headers: true, col_sep: "\t",
      liberal_parsing: true, encoding: 'UTF-8'
    ).map(&:to_h)
    @prior = ShortLabelDiscovery20261018.reviewed_dispositions
    @proposals = M::M.table(PROPOSAL_PATH).map(&:to_h).select do |row|
      row.fetch('batch').to_i == D
    end
    @rows = M.prepare(@proposals, @candidates, @inventory, @index, @prior)
  end

  def test_stage_is_contiguous_bounded_and_owns_only_n_candidates
    assert File.file?(CANDIDATE_PATH)
    assert_equal [D], @proposals.map { |row| row.fetch('batch').to_i }.uniq
    assert_equal %w[Neophyte Nightblade Nil\ the\ White Niskaru\ Horrinox Niskaru\ Lord],
                 @proposals.map { |row| row.fetch('english_candidate') }
    keys = @rows.map { |row| M::M.key(row) }.uniq
    assert_equal 20, keys.length
    assert_operator keys.length, :<=, 50
  end

  def test_expected_key_counts_match_the_discovery_snapshot
    expected = {
      'Neophyte' => 3,
      'Nightblade' => 2,
      'Nil the White' => 4,
      'Niskaru Horrinox' => 2,
      'Niskaru Lord' => 9
    }
    expected.each do |term, count|
      candidate = @candidates.fetch(term)
      keys = %w[unpaired_label_keys_json paired_evidence_keys_json]
        .flat_map { |field| JSON.parse(candidate.fetch(field)) }.uniq
      assert_equal count, keys.length, term
      assert_equal count, @rows.count { |row| row.fetch('english_candidate') == term }, term
    end
  end

  def test_dispositions_and_uncertainty_are_explicit
    statuses = @proposals.to_h do |row|
      [row.fetch('english_candidate'), row.fetch('disposition')]
    end
    assert_equal 'not-an-issue', statuses.fetch('Neophyte')
    assert_equal 'uncertain', statuses.fetch('Nightblade')
    assert_equal 'uncertain', statuses.fetch('Nil the White')
    assert_equal 'uncertain', statuses.fetch('Niskaru Horrinox')
    assert_equal 'not-an-issue', statuses.fetch('Niskaru Lord')
    assert_includes @proposals.find { |row| row['english_candidate'] == 'Nil the White' }['evidence'],
                    'person:white-nil-kern'
    assert_includes @proposals.find { |row| row['english_candidate'] == 'Niskaru Horrinox' }['evidence'],
                    'monster:enfamanir'
  end

  def test_manifest_keeps_aligned_sources_prior_index_states_and_korean_unchanged
    @rows.each do |row|
      key = M::M.key(row)
      source = @inventory.fetch(key)
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"), row.fetch('english')
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"), row.fetch('japanese')
      assert_equal source.fetch('zh_text'), row.fetch('chinese')
      assert_equal source.fetch('work_text'), row.fetch('korean')
      assert_equal JSON.generate(
        @index.select { |prior| M::M.key(prior) == key }.map do |prior|
          [prior.fetch('entity_key'), prior.fetch('status'), prior.fetch('evidence')]
        end
      ), row.fetch('prior_index_dispositions_json')
      refute row.key?('new')
    end
  end
end
