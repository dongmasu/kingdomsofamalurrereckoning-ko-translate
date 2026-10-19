#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-candidate-only-batches-20261018'

class TestCandidateOnlyBatches20261018 < Minitest::Test
  def setup
    @key = ['default', '7', '']
    @source = {
      'en_texts_json' => '["Ring"]', 'ja_texts_json' => '["指輪"]',
      'zh_text' => '戒指', 'work_text' => '반지'
    }
    @candidate = {
      'unpaired_label_keys_json' => JSON.generate([@key]),
      'paired_evidence_keys_json' => JSON.generate([@key])
    }
    @group = { 'Ring' => { keys: [@key], disposition: 'excluded', evidence: 'Generic jewelry label, not one named item.' } }
  end

  def build
    CandidateOnlyBatches20261018.prepare(@group, { @key => @source }, [], { 'Ring' => @candidate })
  end

  def test_deduplicates_same_label_and_evidence_key
    rows = build
    assert_equal 1, rows.length
    assert_equal 'excluded', rows.first.fetch('disposition')
    assert_equal '戒指', rows.first.fetch('chinese')
    assert_equal '반지', rows.first.fetch('korean')
  end

  def test_rejects_changed_explicit_scope
    @group['Ring'][:keys] = []
    assert_raises(RuntimeError) { build }
  end

  def test_rejects_acceptance_in_no_edit_runner
    @group['Ring'][:disposition] = 'accepted'
    assert_raises(RuntimeError) { build }
  end

  def test_rejects_term_missing_from_source
    @source['en_texts_json'] = '["Spring"]'
    assert_raises(RuntimeError) { build }
  end
end
