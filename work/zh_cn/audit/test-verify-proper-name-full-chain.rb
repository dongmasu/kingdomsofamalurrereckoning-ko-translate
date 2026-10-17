#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'verify-proper-name-full-chain'

class VerifyProperNameFullChainTest < Minitest::Test
  def fixture
    before = "\xEF\xBB\xBF".b + "ID_Linha;Texto\r\n0;old\r\n1;\"old;\nquoted\"\r\n".b
    after = "\xEF\xBB\xBF".b + "ID_Linha;Texto\r\n0;new\r\n1;\"new;\nquoted\"\r\n".b
    rows = [
      { 'ID_Linha' => '0', 'Tipo_Variante' => '', 'old' => 'old', 'new' => 'new' },
      { 'ID_Linha' => '1', 'Tipo_Variante' => '',
        'old' => "old;\nquoted", 'new' => "new;\nquoted" }
    ]
    [before, after, rows]
  end

  def test_exact_inverse_with_bom_quotes_and_mixed_line_endings
    before, after, rows = fixture
    assert_equal before, reconstruct_before(after, rows)
    assert_equal [before, 2], reconstruct_before_with_count(after, rows)
  end

  def test_wrong_manifest_new_is_rejected
    _before, after, rows = fixture
    rows.first['new'] = 'unexpected'
    assert_raises(RuntimeError) { reconstruct_before(after, rows) }
  end

  def test_missing_key_is_rejected
    _before, after, rows = fixture
    rows.first['ID_Linha'] = '999'
    assert_raises(RuntimeError) { reconstruct_before(after, rows) }
  end

  def test_absent_recorded_hash_is_rejected
    assert_raises(RuntimeError) { recorded_hashes({ d: 0 }, 'default') }
  end

  def test_modern_bullet_hash_pair
    text = "- default: 5 cells; pre `#{'a' * 64}`; post `#{'b' * 64}`; unchanged cells recorded\n"
    assert_equal [['a' * 64, 'b' * 64]],
                 parse_document_hashes(text, 'default')
  end

  def test_single_resource_multiline_hash_pair_requires_documented_backup
    text = <<~MARKDOWN
      - `/private/tmp/before/locatexts_zh_cn.koalocatext_default.csv`

      Pre-edit SHA-256:
      `#{'a' * 64}`.
      Post-edit SHA-256:
      `#{'b' * 64}`.
    MARKDOWN
    assert_equal [['a' * 64, 'b' * 64]],
                 parse_document_hashes(text, 'default')
    assert_empty parse_document_hashes(
      text.sub('koalocatext_default.csv', 'koalocatext_base.csv'), 'default'
    )
  end

  def test_d20923_addendum_records_default_hash_pair
    path = File.join(AUDIT, 'named-scope-edit-addendum-D20923-20261015.md')
    assert_equal [[
      'cfa8f5fab26ec2b7870c15db035077712e0d0ffee1b03ee3c2995757dd9bea4d',
      'e9a841405bb10f2567c81042d777c8e27751707898e7727c3209d5a944463767'
    ]], parse_document_hashes(File.read(path), 'default')
  end

  def test_resource_keyed_multiline_hash_pairs
    text = <<~MARKDOWN
      Pre-edit SHA-256: `base`
      `#{'a' * 64}`;
      `default`
      `#{'b' * 64}`.
      Post-edit SHA-256: `base`
      `#{'c' * 64}`;
      `default`
      `#{'d' * 64}`.
    MARKDOWN
    assert_equal [['a' * 64, 'c' * 64]],
                 parse_document_hashes(text, 'base')
    assert_equal [['b' * 64, 'd' * 64]],
                 parse_document_hashes(text, 'default')
    assert_empty parse_document_hashes(text, 'affix')
  end

  def test_resource_markdown_table
    text = <<~MARKDOWN
      | Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
      | --- | --- | --- |
      | `default` | `#{'a' * 64}` | `#{'b' * 64}` |
    MARKDOWN
    assert_equal [['a' * 64, 'b' * 64]],
                 parse_document_hashes(text, 'default')
  end

  def test_stage_resource_table_requires_matching_stage
    text = <<~MARKDOWN
      | Stage/resource | Pre-edit SHA-256 | Post-edit SHA-256 |
      | --- | --- | --- |
      | Peoples / base | `#{'a' * 64}` | `#{'b' * 64}` |
      | Deities / base | `#{'c' * 64}` | `#{'d' * 64}` |
    MARKDOWN
    assert_equal [['a' * 64, 'b' * 64]],
                 parse_document_hashes(text, 'base', stage_label: 'Peoples')
    assert_equal [['c' * 64, 'd' * 64]],
                 parse_document_hashes(text, 'base', stage_label: 'Deities')
    assert_empty parse_document_hashes(text, 'base')
    assert_empty parse_document_hashes(
      text, 'base', stage_label: 'Houses'
    )
  end

  def test_conflicting_document_hashes_are_rejected
    document = lambda do |pre, post|
      <<~MARKDOWN
        | Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
        | --- | --- | --- |
        | default | `#{pre}` | `#{post}` |
      MARKDOWN
    end
    assert_raises(RuntimeError) do
      resolve_recorded_hashes(
        [document.call('a' * 64, 'b' * 64),
         document.call('c' * 64, 'd' * 64)],
        'default',
        stage_id: 1
      )
    end
  end

  def test_conflicting_multiline_sections_are_rejected
    first = <<~MARKDOWN
      - `/private/tmp/before/locatexts_zh_cn.koalocatext_default.csv`
      Pre-edit SHA-256:
      `#{'a' * 64}`
      Post-edit SHA-256:
      `#{'b' * 64}`
    MARKDOWN
    second = first.sub('`' + ('a' * 64) + '`', '`' + ('c' * 64) + '`')
    assert_raises(RuntimeError) do
      resolve_recorded_hashes([first + second], 'default', stage_id: 1)
    end
  end

  def test_duplicate_targets_are_rejected
    _before, after, rows = fixture
    rows << rows.first.dup
    assert_raises(RuntimeError) { reconstruct_before(after, rows) }
  end
end
