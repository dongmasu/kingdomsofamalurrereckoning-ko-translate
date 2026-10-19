#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-bloodstone-D21680'

class BloodstoneD21680Test < Minitest::Test
  def self.source_plan
    @source_plan ||= BloodstoneD21680.plan
  end

  def rows
    self.class.source_plan.to_h { |row| [row.fetch(:key), row] }
  end

  def all_source_keys
    definition = [{
      'entity_key' => BloodstoneD21680::ENTITY,
      'english_canonical' => 'Bloodstone',
      'english_aliases' => ''
    }]
    build_occurrences(ReviewedNameBatches.refresh_inventory.values, definition)
      .map { |row| row[1..3] }
      .sort
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
      README.md
      decision-register-20261009.md
      consolidated-context-review-default-legacy-85-D19740-20261012.md
    ].map { |name| File.join(audit, name) }
  end

  def hashes(paths)
    paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
  end

  def test_exact_source_scope_is_fourteen_requested_rows_plus_atomic_exclusion
    assert_equal BloodstoneD21680::MATCH_KEYS, all_source_keys
    assert_equal 14, BloodstoneD21680::TARGET_KEYS.length
    assert_equal ['default', '39869', ''], BloodstoneD21680::EXCLUDED
  end

  def test_only_the_seven_unpaired_item_spans_change
    plan = rows
    unexcluded_keys = plan.keys.reject do |key|
      key == BloodstoneD21680::EXCLUDED
    end.sort
    assert_equal BloodstoneD21680::TARGET_KEYS.sort, unexcluded_keys

    BloodstoneD21680::EDITS.each do |key, evidence|
      row = plan.fetch(key)
      assert_equal evidence.fetch(:old_span), row.fetch(:old).scan(evidence.fetch(:old_span)).first
      assert_equal row.fetch(:old).sub(evidence.fetch(:old_span), BloodstoneD21680::CANONICAL),
                   row.fetch(:new), key.inspect
      refute row.fetch(:excluded), key.inspect
    end
    assert_equal 7, BloodstoneD21680::EDITS.length
  end

  def test_already_paired_rows_and_d9093_pairing_are_unchanged
    plan = rows
    BloodstoneD21680::PAIRED.each_key do |key|
      row = plan.fetch(key)
      assert_equal row.fetch(:old), row.fetch(:new), key.inspect
      refute row.fetch(:excluded), key.inspect
    end
    assert_equal '블러드스톤(Bloodstone) 획득하기',
      plan.fetch(['default', '29053', '']).fetch(:new)
  end

  def test_bloodstone_deep_remains_separate_and_unchanged
    row = rows.fetch(BloodstoneD21680::EXCLUDED)
    assert row.fetch(:excluded)
    assert_equal '블러드스톤 심연', row.fetch(:old)
    assert_equal row.fetch(:old), row.fetch(:new)
    assert_equal 'ブラッドストーン・ディープ',
      BloodstoneD21680::SOURCES.fetch(BloodstoneD21680::EXCLUDED).fetch(:japanese)
    assert_equal '血石深渊',
      BloodstoneD21680::SOURCES.fetch(BloodstoneD21680::EXCLUDED).fetch(:chinese)
  end

  def test_58632_changes_only_bloodstone_and_preserves_circlet_history
    row = rows.fetch(['default', '58632', ''])
    assert_includes row.fetch(:old), '서클릿'
    assert_includes row.fetch(:new), '서클릿'
    assert_equal '혈석',
      BloodstoneD21680::SOURCES.fetch(['default', '58632', '']).fetch(:old_span)
    assert_equal row.fetch(:old).sub('혈석', BloodstoneD21680::CANONICAL), row.fetch(:new)
    BloodstoneD21680.verify_history!
  end

  def test_changed_evidence_and_unreviewed_keys_fail_closed
    source = {
      'en_texts_json' => JSON.generate(['Bloodstone']),
      'ja_texts_json' => JSON.generate(['ブラッドストーン']),
      'zh_text' => 'changed'
    }
    assert_raises(RuntimeError) do
      BloodstoneD21680.transform(
        BloodstoneD21680.spec, ['base', '1115', '11'], '혈석', source
      )
    end
    assert_raises(RuntimeError) do
      BloodstoneD21680.transform(
        BloodstoneD21680.spec, ['default', '1', ''], '혈석', source
      )
    end
  end

  def test_plan_and_history_checks_do_not_write_sources_or_shared_data
    before = hashes(protected_paths)
    BloodstoneD21680.plan
    BloodstoneD21680.verify_history!
    after = hashes(protected_paths)
    assert_equal before, after
  end
end
