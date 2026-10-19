#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-mining-family-contexts-D21617'

class ProperNameMiningContextsD21617Test < Minitest::Test
  M = ReviewedNameBatches

  def test_exact_bounded_scope_and_aligned_evidence
    rows = M.table(File.join(__dir__, 'proper-name-edits-D21617.tsv'))
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    assert_equal 32, rows.length
    assert_equal 32, rows.map { |row| M.key(row) }.uniq.length
    assert_equal 33, rows.sum { |row| JSON.parse(row['entity_dispositions_json']).length }
    rows.each do |row|
      source = inventory.fetch(M.key(row))
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
      assert_equal source['zh_text'], row['chinese']
      assert_equal row['new'], source['work_text']
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_equal 'accepted', row['status']
      assert_equal ['needs-context'], JSON.parse(row['previous_status']).values.uniq
    end
  end

  def test_prior_dispositions_and_non_global_surnames_are_preserved
    index = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    assert_equal 'excluded', index.fetch(['person:skoria', 'default', '39106', ''])['status']
    assert_equal 'accepted', index.fetch(['person:darkvari', 'default', '30620', ''])['status']
    assert index.fetch(['person:darkvari', 'default', '30620', ''])['evidence'].start_with?('D-20597:')
    assert_equal 'accepted', index.fetch(['family:skoria', 'default', '39106', ''])['status']
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    %w[darkvari cynric skoria zungar].each do |suffix|
      family = glossary.find { |entry| entry['entity_key'] == "family:#{suffix}" }
      refute_includes family['english_aliases'].to_s.split('|').map(&:downcase), suffix
    end
  end

  def test_family_membership_not_race_and_guess_not_assertion
    rows = M.table(File.join(__dir__, 'proper-name-edits-D21617.tsv')).to_h { |row| [row['ID_Linha'], row] }
    assert_includes rows.fetch('39106')['new'], '스코리아 가문(Skoria) 사람이야'
    refute_includes rows.fetch('39106')['new'], '스콜리아인'
    assert_includes rows.fetch('58119')['new'], '아마 다크바리 가문(Darkvari) 사람이겠지'
    assert_includes rows.fetch('62269')['new'], '다크바리 가문(Darkvari)과 중가르 가문(Zungar)'
    assert_includes rows.fetch('3701')['new'], '광산업을 하는 스코리아 가문(Skoria)의'
  end
end
