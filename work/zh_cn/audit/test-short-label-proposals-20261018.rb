require 'minitest/autorun'
require_relative 'run-short-label-proposals-20261018'

class ShortLabelProposals20261018Test < Minitest::Test
  M = ShortLabelProposals20261018

  def setup
    @key = ['default', '1', '']
    @source = {
      'en_texts_json' => '["Legs"]', 'ja_texts_json' => '["脚"]',
      'zh_text' => '腿', 'work_text' => '다리'
    }
    @candidate = {
      'unpaired_label_keys_json' => JSON.generate([@key]),
      'paired_evidence_keys_json' => '[]'
    }
    @proposal = {
      'english_candidate' => 'Legs', 'disposition' => 'not-an-issue',
      'expected_keys' => '1', 'evidence' => 'Generic body/equipment slot.'
    }
  end

  def prepare(prior = Set.new)
    M.prepare([@proposal], { 'Legs' => @candidate }, { @key => @source }, [], prior)
  end

  def test_records_evidence_without_proposing_text_changes
    row = prepare.first
    assert_equal '다리', row.fetch('korean')
    assert_equal 'not-an-issue', row.fetch('disposition')
    assert_equal '[]', row.fetch('prior_index_dispositions_json')
    refute row.key?('new')
  end

  def test_rejects_accepted_edit_status
    @proposal['disposition'] = 'accepted'
    assert_raises(RuntimeError) { prepare }
  end

  def test_rejects_duplicate_previous_candidate_key
    assert_raises(RuntimeError) { prepare(Set.new([['Legs', *@key]])) }
  end

  def test_rejects_source_count_drift
    @proposal['expected_keys'] = '2'
    assert_raises(RuntimeError) { prepare }
  end

  def test_rejects_wrong_english_source
    @source['en_texts_json'] = '["Other"]'
    assert_raises(RuntimeError) { prepare }
  end
end
