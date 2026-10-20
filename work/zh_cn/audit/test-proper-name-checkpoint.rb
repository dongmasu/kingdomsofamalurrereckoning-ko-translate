#!/usr/bin/env ruby

require 'minitest/autorun'
require 'tmpdir'
require_relative 'continue-proper-name-reviewed-batches'

class ProperNameCheckpointTest < Minitest::Test
  M = ReviewedNameBatches

  def setup
    @directory = Dir.mktmpdir('proper-name-checkpoint-')
    @originals = %i[AUDIT INVENTORY INDEX DOCS].to_h { |name| [name, M.const_get(name)] }
    replacements = {
      AUDIT: @directory,
      INVENTORY: File.join(@directory, 'inventory.tsv'),
      INDEX: File.join(@directory, 'index.tsv'),
      DOCS: 5.times.map { |n| File.join(@directory, "checkpoint-#{n}.md") }
    }
    replacements.each { |name, value| M.send(:remove_const, name); M.const_set(name, value) }
    File.write(M::INVENTORY, 'fixture inventory')
    M.write_table(File.join(M::AUDIT, 'proper-name-glossary.tsv'), ['entity_key'],
                  [{'entity_key' => 'person:test'}])
    M.write_table(File.join(M::AUDIT, 'proper-name-variant-discovery-candidates-20261015.tsv'),
                  %w[english_candidate status],
                  [{'english_candidate' => 'Test', 'status' => 'registered-reviewed'}])
    headers = %w[entity_key resource ID_Linha Tipo_Variante status evidence korean_current]
    rows = [
      {'entity_key' => 'person:test', 'resource' => 'base', 'ID_Linha' => '1',
       'Tipo_Variante' => '', 'status' => 'needs-context', 'evidence' => 'candidate', 'korean_current' => 'old'},
      {'entity_key' => 'person:held', 'resource' => 'default', 'ID_Linha' => '2',
       'Tipo_Variante' => '', 'status' => 'uncertain', 'evidence' => 'held evidence', 'korean_current' => 'hold'}
    ]
    M.write_table(M::INDEX, headers, rows)
    @inventory = {
      ['base', '1', ''] => {'work_text' => 'new'},
      ['default', '2', ''] => {'work_text' => 'hold'}
    }
    @review = {
      'entity_key' => 'person:test', 'resource' => 'base', 'ID_Linha' => '1',
      'Tipo_Variante' => '', 'status' => 'accepted', 'evidence' => 'reviewed'
    }
    @base = '- base: 1 cells; pre `old-base`; post `base`; backup `/tmp/base-old`.'
    @default = '- default: 2 cells; pre `old-default`; post `default`; backup `/tmp/default-old`.'
    M::DOCS.each do |path|
      File.write(path, "<!-- current-proper-name-batch:start -->\nLast actual CSV-edit backups (retained across no-edit batches):\n#{@base}\n#{@default}\nReport: old\n<!-- current-proper-name-batch:end -->\n")
    end
  end

  def teardown
    @originals.each { |name, value| M.send(:remove_const, name); M.const_set(name, value) }
    FileUtils.remove_entry(@directory)
  end

  def run_checkpoint(checks)
    M.stub(:hashes, {'base' => 'base', 'default' => 'default'}) do
      capture_io { M.checkpoint(99_999, [@review], checks, 'verified', @inventory) }
    end
    M::DOCS.map { |path| File.read(path) }
  end

  def test_new_backup_replaces_only_its_resource_and_does_not_suggest_a_hold
    checks = [{resource: 'base', cells: 1, before_sha256: 'base',
               after_sha256: 'new-base', backup: '/tmp/base-new'}]
    documents = run_checkpoint(checks)
    assert_equal 1, documents.uniq.length
    text = documents.first
    assert_includes text, @default
    assert_includes text, 'backup `/tmp/base-new`'
    refute_includes text, '/tmp/base-old'
    assert_includes text, 'continue bounded proper-name checks until the user explicitly asks to stop'
    refute_includes text, 'first reviewed held'
    assert_includes text, "Occurrence index: 2 rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`"
    assert_includes text, 'Proper-name glossary: 1 entries; SHA-256'
    held = M.table(M::INDEX).find { |row| row['entity_key'] == 'person:held' }
    assert_equal 'uncertain', held['status']
    assert_equal 'held evidence', held['evidence']
  end

  def test_no_edit_batch_retains_all_last_backups
    @review['status'] = 'not-an-issue'
    text = run_checkpoint([]).first
    assert_includes text, @base
    assert_includes text, @default
    assert_includes text, 'No CSV edits in this batch'
  end
end
