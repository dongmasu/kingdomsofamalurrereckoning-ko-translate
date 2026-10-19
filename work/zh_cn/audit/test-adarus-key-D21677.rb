#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-adarus-key-D21677'

class AdarusKeyD21677Test < Minitest::Test
  def all_keys_for_item
    definition = [{
      'entity_key' => 'item:adarus-key',
      'english_canonical' => 'Adarus Key',
      'english_aliases' => ''
    }]
    build_occurrences(ReviewedNameBatches.refresh_inventory.values, definition)
      .map { |row| row[1..3] }
      .sort
  end

  def source(key)
    expected = AdarusKeyD21677::TARGETS[key] || AdarusKeyD21677::PAIRED.fetch(key)
    {
      'en_texts_json' => JSON.generate([expected.fetch(:english)]),
      'ja_texts_json' => JSON.generate([expected.fetch(:japanese)]),
      'zh_text' => expected.fetch(:chinese)
    }
  end

  def protected_paths
    root = ReviewedNameBatches::ROOT
    audit = File.dirname(__FILE__)
    %w[en_us ja_jp zh_cn].flat_map do |locale|
      %w[affix base default].map do |resource|
        File.join(root, "src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{resource}.csv")
      end
    end + %w[base default].map do |resource|
      File.join(root, "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv")
    end + %w[
      proper-name-glossary.tsv
      proper-name-occurrences.tsv
      proper-name-reviewed-glossary-pending.tsv
      proper-name-candidates.tsv
      proper-name-short-label-discovery-20261018.tsv
      decision-register-20261009.md
      consolidated-context-review-default-26401-26450-20261011.md
    ].map { |name| File.join(audit, name) }
  end

  def hashes(paths)
    paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
  end

  def test_exact_english_scope_contains_only_item_and_paired_reference
    keys = all_keys_for_item
    assert_equal AdarusKeyD21677::ALL_KEYS, keys
    refute_includes keys, ['base', '1291', '11']
    refute_includes keys, ['base', '1398', '11']
    refute_includes keys, ['base', '2944', '11']
    refute_includes keys, ['base', '2837', '11']
    refute_includes keys, ['default', '27259', '']
    refute_includes keys, ['default', '42550', '']
  end

  def test_only_requested_exact_item_spans_are_bilingualized
    targets = AdarusKeyD21677::TARGETS
    spec = {key: 'item:adarus-key'}

    changed, excluded = AdarusKeyD21677.transform(
      spec, ['base', '2066', '11'], targets.fetch(['base', '2066', '11']).fetch(:old),
      source(['base', '2066', '11'])
    )
    refute excluded
    assert_equal AdarusKeyD21677::CANONICAL, changed

    old_blade = '아다루스 열쇠의 칼날에 쓰일 씨앗.'
    changed, excluded = AdarusKeyD21677.transform(
      spec, ['default', '26423', ''], old_blade, source(['default', '26423', ''])
    )
    refute excluded
    assert_equal '아다루스의 열쇠(Adarus Key)의 칼날에 쓰일 씨앗.', changed

    old_bow = '아다루스 열쇠 활에 쓸 씨앗'
    changed, excluded = AdarusKeyD21677.transform(
      spec, ['default', '30017', ''], old_bow, source(['default', '30017', ''])
    )
    refute excluded
    assert_equal '아다루스의 열쇠(Adarus Key) 활에 쓸 씨앗', changed
  end

  def test_already_paired_8189_remains_unchanged
    key = ['default', '8189', '']
    korean = AdarusKeyD21677::PAIRED.fetch(key).fetch(:korean)
    assert_equal [korean, false],
      AdarusKeyD21677.transform({key: 'item:adarus-key'}, key, korean, source(key))
  end

  def test_historical_decisions_and_open_sentence_hold_are_preserved
    AdarusKeyD21677.verify_historical_state!
    assert_includes AdarusKeyD21677::NOTE,
      'D-19307\'s terminal not-an-issue record for default:26423 remains verbatim'
    assert_match(
      /does not resolve the outstanding sentence and translation hold: D-9640 remains unchanged and open/,
      AdarusKeyD21677::NOTE
    )
  end

  def test_unreviewed_keys_changed_source_evidence_and_wrong_spans_fail_closed
    spec = {key: 'item:adarus-key'}
    assert_raises(RuntimeError) do
      AdarusKeyD21677.transform(spec, ['default', '1', ''], '아다루스 열쇠', source(['default', '8189', '']))
    end

    changed_source = source(['default', '26423', ''])
    changed_source['zh_text'] = 'changed'
    assert_raises(RuntimeError) do
      AdarusKeyD21677.transform(spec, ['default', '26423', ''],
                                '아다루스 열쇠의 칼날에 쓰일 씨앗.', changed_source)
    end
    assert_raises(RuntimeError) do
      AdarusKeyD21677.transform(spec, ['default', '30017', ''],
                                '아다루스 키 활에 쓸 씨앗', source(['default', '30017', '']))
    end
  end

  def test_review_checks_do_not_write_sources_or_history
    before = hashes(protected_paths)
    assert_equal AdarusKeyD21677::ALL_KEYS, all_keys_for_item
    AdarusKeyD21677.verify_historical_state!
    after = hashes(protected_paths)
    assert_equal before, after
  end
end
