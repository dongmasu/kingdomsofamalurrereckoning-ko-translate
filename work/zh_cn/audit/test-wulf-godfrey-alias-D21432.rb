#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'minitest/autorun'
require_relative 'review-wulf-godfrey-alias-D21432'

class WulfGodfreyAliasD21432Test < Minitest::Test
  M = ReviewedNameBatches
  A = WulfGodfreyAliasD21432

  def test_glossary_registers_full_name_and_preserves_short_alias
    entry = M.table(A::GLOSSARY).find { |row| row['entity_key'] == A::ENTITY }
    assert_equal 'Wulf Godfrey', entry['english_canonical']
    assert_equal '울프 고드프리(Wulf Godfrey)', entry['korean_canonical']
    assert_equal 'Wulf', entry['english_aliases']
    assert_includes entry['evidence_ids'].split('|'), 'D-21432'
  end

  def test_all_twenty_aligned_rows_are_manifest_backed_and_bilingual
    reviews = M.table(A::REVIEW)
    assert_equal 20, reviews.length
    assert_equal A::IDS.sort_by(&:to_i), reviews.map { |row| row['ID_Linha'] }.sort_by(&:to_i)
    reviews.each do |row|
      assert_includes row['english'], 'Wulf Godfrey'
      assert_includes row['japanese'], 'ウルフ・ゴドフリー'
      assert_includes row['chinese'], '伍尔夫·戈弗雷'
      assert_includes row['korean'], '울프 고드프리(Wulf Godfrey)'
      assert_includes %w[accepted not-an-issue], row['previous_status']
      assert_match(/\AD-20\d{3}: /, row['previous_evidence'])
    end
  end

  def test_registration_does_not_change_csv_or_occurrence_index
    proof = JSON.parse(File.read(A::PROOF))
    assert_equal proof['csv_sha256_before'], proof['csv_sha256_after']
    assert_equal proof['initial_occurrence_index_sha256'],
      proof['final_occurrence_index_sha256']
    assert_equal 0, proof['new_occurrences']
    assert_equal 0, proof['new_entities']
  end

  def test_heuristic_candidate_is_now_glossary_matched
    candidate = M.table(A::CANDIDATES).find do |row|
      row['candidate_key'] == 'candidate:wulf godfrey'
    end
    refute_nil candidate
    assert_includes candidate['reason'].split('|'), 'known-glossary-key'
    assert_equal A::IDS.sort.map { |id| "default:#{id}" }, candidate['source_context_keys'].split('|').sort
    assert_equal 29_604, M.table(A::CANDIDATES).length
  end

  def test_candidate_context_refresh_has_exact_terminal_manifest_coverage
    rows = M.table(A::CANDIDATE_REFRESH)
    assert_equal 577, rows.length
    observations = rows.sum do |row|
      row['added_source_context_keys'].split('|').length
    end
    links = rows.sum do |row|
      JSON.parse(row['covered_occurrences_json']).length
    end
    assert_equal 4_460, observations
    assert_equal 4_461, links
    proof = JSON.parse(File.read(A::PROOF))
    assert_equal 35, proof['candidate_refresh_terms_reconciled_from_D21431']
    assert_equal 1, proof['context_link_status_counts']['uncertain']
  end

  def test_checkpoint_documents_and_residual_result_are_recorded
    summary = File.read(A::REPORT)
    assert_includes summary, 'Full proper-name discovery remains incomplete'
    assert_includes summary, '20 source rows'
    proof = JSON.parse(File.read(A::PROOF))
    assert proof['residual_validation'].any? do |line|
      line.include?('Terminal matches without a covering bilingual English label: 0')
    end
    M::DOCS.each { |path| assert_includes File.read(path), 'D-21432' }
  end
end
