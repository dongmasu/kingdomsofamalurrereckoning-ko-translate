#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'

class ReconcileProperNamePendingFinalTest < Minitest::Test
  SCRIPT = File.join(__dir__, 'reconcile-proper-name-pending-final.rb')
  KEY = %w[default 42].push('').freeze

  def setup
    no_io = lambda { |*| flunk 'loading the verifier attempted reconciliation I/O' }
    assert_output('', '') do
      ReviewedNameBatches.stub(:table, no_io) do
        ReviewedNameBatches.stub(:write_table, no_io) { load SCRIPT }
      end
    end
  end

  def entry(batch, old, new_text, entity = 'person:fixture')
    {
      'batch' => batch, 'manifest' => "proper-name-edits-D#{batch}.tsv",
      'entity_key' => entity, 'old' => old, 'new' => new_text
    }
  end

  def history
    [
      entry(8, 'earlier', 'before'),
      entry(10, 'before', 'proposal'),
      entry(11, 'proposal', "middle\r\n{TOKEN}", 'place:fixture'),
      entry(12, "middle\r\n{TOKEN}", 'current', 'faction:fixture')
    ]
  end

  def test_valid_chronological_chain_preserves_history_and_exact_text
    original = history
    snapshot = Marshal.dump(original)
    chain = verify_manifest_chain(KEY, 'proposal', 'current', original)

    assert_equal [10, 11, 12], chain.map { |row| row['batch'] }
    assert_equal %w[proposal-origin superseding-edit superseding-edit],
      chain.map { |row| row['relation'] }
    assert_equal "middle\r\n{TOKEN}", chain[1]['new']
    assert_equal snapshot, Marshal.dump(original)
  end

  def test_broken_middle_old_fails_even_when_later_tail_matches
    broken = history
    broken[2]['old'] = 'wrong middle old'

    error = assert_raises(RuntimeError) do
      verify_manifest_chain(KEY, 'proposal', 'current', broken)
    end
    assert_includes error.message, 'broken edit-manifest chain'
    assert_includes error.message, 'proper-name-edits-D11.tsv'
    assert_includes error.message, 'expected old "proposal", got "wrong middle old"'
  end

  def test_wrong_current_tail_fails
    error = assert_raises(RuntimeError) do
      verify_manifest_chain(KEY, 'proposal', 'wrong current', history)
    end
    assert_includes error.message, 'does not reach current text'
  end

  def test_missing_exact_origin_fails_even_when_proposal_is_an_old_value
    missing = [
      entry(10, 'before', 'proposal '),
      entry(11, 'proposal', 'current')
    ]

    error = assert_raises(RuntimeError) do
      verify_manifest_chain(KEY, 'proposal', 'current', missing)
    end
    assert_includes error.message, 'no exact edit-manifest origin'
  end

  def test_empty_history_fails
    error = assert_raises(RuntimeError) do
      verify_manifest_chain(KEY, 'proposal', 'current', [])
    end
    assert_includes error.message, 'no exact edit-manifest origin'
  end

  def test_out_of_order_successors_fail
    reordered = history
    reordered[2], reordered[3] = reordered[3], reordered[2]

    error = assert_raises(RuntimeError) do
      verify_manifest_chain(KEY, 'proposal', 'current', reordered)
    end
    assert_includes error.message, 'broken edit-manifest chain'
  end

  def test_default_49155_iluvia_fae_tuatha_chain
    old = '이루비아의 몸이 나아져서 다행이야. 투아사만 아니면 페이도 싫지 않아.'
    proposal = '일루비아(Iluvia)의 몸이 나아져서 다행이야. 투아사만 아니면 페이도 싫지 않아.'
    fae = '일루비아(Iluvia)의 몸이 나아져서 다행이야. 투아사만 아니면 페이(Fae)도 싫지 않아.'
    current = '일루비아(Iluvia)의 몸이 나아져서 다행이야. 투아사(Tuatha)만 아니면 페이(Fae)도 싫지 않아.'
    concrete = [
      entry(20583, old, proposal, 'person:iluvia'),
      entry(20705, proposal, fae, 'people:fae'),
      entry(20914, fae, current, 'faction:tuatha')
    ]

    chain = verify_manifest_chain(['default', '49155', ''], proposal, current, concrete)
    assert_equal [20583, 20705, 20914], chain.map { |row| row['batch'] }
    assert_equal %w[person:iluvia people:fae faction:tuatha],
      chain.map { |row| row['entity_key'] }
    assert_equal proposal, chain.first['new']
    assert_equal current, chain.last['new']
  end
end
