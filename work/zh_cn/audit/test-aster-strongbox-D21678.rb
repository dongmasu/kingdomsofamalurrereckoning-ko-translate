#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-aster-strongbox-D21678'

class AsterStrongboxD21678Test < Minitest::Test
  def protected_paths
    audit = AsterStrongboxD21678::AUDIT
    root = AsterStrongboxD21678::ROOT
    sources = %w[en_us ja_jp zh_cn].flat_map do |locale|
      %w[affix base default].map do |resource|
        File.join(root, "src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{resource}.csv")
      end
    end
    sources + [
      *%w[affix base default].map do |resource|
        File.join(root, "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv")
      end,
      File.join(root, 'NEXT-SESSION.md'),
      File.join(root, 'work/zh_cn/TRANSLATION_PROGRESS.md'),
      File.join(audit, 'README.md'),
      File.join(audit, 'decision-register-20261009.md'),
      File.join(audit, 'consolidated-context-review-default-uncertain-100-D19725-20261012.md'),
      File.join(audit, 'named-scope-review-D20077-20261013.md'),
      File.join(audit, 'proper-name-edits-D20764.tsv'),
      File.join(audit, 'proper-name-glossary.tsv'),
      ReviewedNameBatches::INVENTORY,
      File.join(audit, 'proper-name-occurrences.tsv'),
      File.join(audit, 'proper-name-reviewed-glossary-pending.tsv'),
      File.join(audit, 'proper-name-candidates.tsv'),
      File.join(audit, 'proper-name-short-label-discovery-20261018.tsv')
    ]
  end

  def hashes(paths)
    paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
  end

  def test_exact_source_scope_and_read_only_actions
    before = hashes(protected_paths)
    rows = ReviewedDiscoverySpecs.stub(:run, ->(*) { flunk 'dry run invoked mutator' }) do
      AsterStrongboxD21678.actual_source_dry_run
    end
    after = hashes(protected_paths)

    assert_equal before, after, 'review must not write source, active CSV, or history files'
    assert_equal AsterStrongboxD21678::KEYS, rows.map { |row| row.fetch(:key) }.sort
    assert_equal 6, rows.length
    assert_equal 5, rows.count { |row| row.fetch(:current_korean) != row.fetch(:recommended_korean) }
    paired = rows.find { |row| row.fetch(:key) == ['default', '13184', ''] }
    assert_equal AsterStrongboxD21678::CANONICAL, paired.fetch(:recommended_korean)
    assert_equal paired.fetch(:current_korean), paired.fetch(:recommended_korean)
  end

  def test_all_prior_dispositions_remain_explicit
    rows = AsterStrongboxD21678.actual_source_dry_run.to_h do |row|
      [row.fetch(:key), row]
    end

    assert_match(/D19725/, rows.fetch(['default', '19925', '']).fetch(:action))
    assert_match(/D9213.*D9225/, rows.fetch(['default', '29348', '']).fetch(:action))
    assert_match(/D20764/, rows.fetch(['default', '46517', '']).fetch(:action))
    assert_match(/D15238.*D20077/, rows.fetch(['default', '50130', '']).fetch(:action))
  end

  def test_missing_extra_or_changed_locale_rows_fail_closed
    inventory = AsterStrongboxD21678.load_exact_rows

    assert_raises(RuntimeError) do
      AsterStrongboxD21678.review_rows(
        inventory.reject { |key, _| key == ['default', '50130', ''] }
      )
    end

    changed = Marshal.load(Marshal.dump(inventory))
    changed.fetch(['default', '29348', ''])['ja_jp'] = 'changed'
    assert_raises(RuntimeError) { AsterStrongboxD21678.review_rows(changed) }

    extra = Marshal.load(Marshal.dump(inventory))
    extra[['default', '99999', '']] = {}
    assert_raises(RuntimeError) { AsterStrongboxD21678.review_rows(extra) }
  end

  def source(key)
    expected = AsterStrongboxD21678::TARGETS.fetch(key)
    {
      'en_texts_json' => JSON.generate([expected.fetch('en_us')]),
      'ja_texts_json' => JSON.generate([expected.fetch('ja_jp')]),
      'zh_text' => expected.fetch('zh_cn')
    }
  end

  def test_registered_item_spec_and_real_occurrence_matcher_cover_exactly_six_keys
    spec = AsterStrongboxD21678.specs.fetch(0)
    assert_equal 'item:aster-strongbox', spec.fetch(:key)
    assert_equal 'item', spec.fetch(:category)
    assert_equal AsterStrongboxD21678::CANONICAL, spec.fetch(:korean)
    assert_equal 6, spec.fetch(:count)
    definitions = [{
      'entity_key' => spec.fetch(:key),
      'english_canonical' => spec.fetch(:english),
      'english_aliases' => spec.fetch(:aliases)
    }]
    # Exercise the runner's matcher without refresh_inventory (which writes).
    inventory = %w[affix base default].flat_map do |resource|
      CSV.read(AsterStrongboxD21678.source_path('en_us', resource),
               headers: true, col_sep: ';', encoding: 'bom|utf-8').map do |row|
        {
          'resource' => resource,
          'ID_Linha' => row.fetch('ID_Linha'),
          'Tipo_Variante' => AsterStrongboxD21678.row_key(row, resource).last,
          'en_texts_json' => JSON.generate([row.fetch('Texto')]),
          'work_text' => ''
        }
      end
    end
    matches = build_occurrences(inventory, definitions)
    assert_equal AsterStrongboxD21678::KEYS, matches.map { |row| row[1..3] }.sort
    assert_empty candidate_matches(['Aster Key', 'Aster inheritance', 'Aster'],
                                   build_matchers(definitions))
  end

  def test_all_five_changes_are_single_atomic_source_bounded_spans
    rows = AsterStrongboxD21678.review_rows(AsterStrongboxD21678.load_exact_rows)
    AsterStrongboxD21678::SPANS.each do |key, (old_span, new_span)|
      row = rows.find { |item| item.fetch(:key) == key }
      old = row.fetch(:current_korean)
      new_text = row.fetch(:recommended_korean)
      prefix, suffix = old.split(old_span, -1)
      assert_equal prefix + new_span + suffix, new_text
      assert_equal old, new_text.sub(new_span, old_span)
      assert_equal 1, new_text.scan(new_span).length
      refute_match(/\([^)]*\(/, new_text)
    end
  end

  def test_50130_keeps_key_uncover_and_open_hold_separate
    key = ['default', '50130', '']
    old = AsterStrongboxD21678::TARGETS.fetch(key).fetch('ko')
    new_text, excluded = AsterStrongboxD21678.transform(
      AsterStrongboxD21678.specs.first, key, old, source(key)
    )
    refute excluded
    assert_equal '아스터 열쇠를 복원해 탈라레인(Tala-Rane)에 있는 애스터 금고(Aster strongboxes)를 전부 찾아냈다.',
                 new_text
    assert new_text.start_with?('아스터 열쇠를 복원해 ')
    assert new_text.end_with?('를 전부 찾아냈다.')
    assert_includes AsterStrongboxD21678::NOTE, '을→를'
    assert_includes AsterStrongboxD21678::NOTE, 'D-9225 and D-15238 remain unresolved'
    assert_includes AsterStrongboxD21678::NOTE, 'not a sentence judgment'
    assert AsterStrongboxD21678.verify_history!
  end

  def test_transform_rejects_wrong_entity_unreviewed_keys_and_any_evidence_drift
    spec = AsterStrongboxD21678.specs.first
    key = ['base', '4419', '11']
    old = AsterStrongboxD21678::TARGETS.fetch(key).fetch('ko')
    assert_raises(RuntimeError) do
      AsterStrongboxD21678.transform({key: 'item:aster-key'}, key, old, source(key))
    end
    assert_raises(RuntimeError) do
      AsterStrongboxD21678.transform(spec, ['base', '4419', '12'], old, source(key))
    end

    AsterStrongboxD21678::KEYS.each do |target_key|
      text = AsterStrongboxD21678::TARGETS.fetch(target_key).fetch('ko')
      %w[en_texts_json ja_texts_json zh_text].each do |field|
        changed_source = source(target_key)
        changed_source[field] = field.end_with?('_json') ? JSON.generate(['changed']) : 'changed'
        assert_raises(RuntimeError) do
          AsterStrongboxD21678.transform(spec, target_key, text, changed_source)
        end
      end
      assert_raises(RuntimeError) do
        AsterStrongboxD21678.transform(spec, target_key, text + 'changed', source(target_key))
      end
    end
  end

  def test_preserved_history_is_explicit_in_batch_note
    %w[D-19725 D-9213 D-9225 D-15238 D-20077 D-20764].each do |decision|
      assert_includes AsterStrongboxD21678::NOTE, decision
    end
    assert_includes AsterStrongboxD21678::NOTE,
      'remain verbatim and are not reopened, superseded, or recounted'
    assert_includes AsterStrongboxD21678::NOTE,
      'no family, group, or personal ownership is established or claimed'
  end
end
