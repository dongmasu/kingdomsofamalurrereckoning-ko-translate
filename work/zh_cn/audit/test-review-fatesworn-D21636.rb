#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require 'json'
require_relative 'review-fatesworn-D21636'

class ReviewFateswornD21636Test < Minitest::Test
  W = ReviewFateswornD21636
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery

  def self.prepared
    @prepared ||= begin
      protected_paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
        M::DOCS + [
          M::INDEX, M::INVENTORY, R::GLOSSARY, R::DISCOVERY_CANDIDATES,
          File.join(__dir__, 'proper-name-discovery-D21636.tsv'),
          File.join(__dir__, 'proper-name-discovery-definitions-D21636.tsv'),
          W::MANIFEST, W::REPORT, W::ADDENDUM
        ]
      before = protected_paths.to_h do |path|
        [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : :missing]
      end
      reject_write = ->(*) { raise 'prepare attempted a shared-data write, refresh, or apply' }
      inventory = W.active_inventory
      manifest = M.table(W::MANIFEST)
      manifest.each do |row|
        inventory[M.key(row)] = inventory.fetch(M.key(row))
          .merge('work_text' => row['old'])
      end
      backup = File.binread(
        '/private/tmp/ko-translate-backups/20261017/before-proper-name-D21636/' \
        'locatexts_zh_cn.koalocatext_default.csv'
      )
      result = M.stub(:write_table, reject_write) do
        M.stub(:refresh_inventory, reject_write) do
          M.stub(:run, reject_write) do
            R.stub(:run, reject_write) do
              R.stub(:ensure_unused_batch!, nil) do
                W.prepare(
                  inventory: inventory,
                  glossary: M.table(R::GLOSSARY),
                  index: M.table(M::INDEX),
                  csv_bytes: { 'default' => backup }
                )
              end
            end
          end
        end
      end
      after = protected_paths.to_h do |path|
        [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : :missing]
      end
      raise 'prepare changed a protected file' unless before == after
      result
    end
  end

  def reviews
    self.class.prepared.fetch(:reviews)
  end

  def by_id
    reviews.to_h { |row| [row.fetch('ID_Linha'), row] }
  end

  def test_all_resource_scope_is_exact_and_hopes_are_excluded
    prepared = self.class.prepared
    assert_equal 19, W::REVIEW_KEYS.length
    assert_equal 19, reviews.length
    assert_equal 37, W::ALL_FATESWORN_KEYS.length
    assert_equal W::REVIEW_KEYS.sort, reviews.map { |row| M.key(row) }.sort
    assert_equal W::ALL_FATESWORN_KEYS.sort,
                 (W::REVIEW_KEYS + W::HOPE_OWNER_KEYS).uniq.sort
    assert_equal 18, W::HOPE_OWNER_KEYS.length
    assert_equal W::HOPE_OWNER_KEYS.sort,
                 prepared.fetch(:hope_index_snapshot).map { |row| M.key(row) }.sort
    assert_equal 16, prepared.fetch(:hope_index_snapshot)
                       .count { |row| row['status'] == 'accepted' }
    assert_equal 1, prepared.fetch(:hope_index_snapshot)
                      .count { |row| row['status'] == 'not-an-issue' }
    assert_equal 'uncertain',
                 prepared.fetch(:hope_index_snapshot)
                         .find { |row| M.key(row) == ['default', '8089', ''] }
                         .fetch('status')
    assert_empty prepared.fetch(:definitions)
  end

  def test_source_label_edits_are_exact_and_idempotent
    expected = {
      '9945' => [
        '페이트스원(Fatesworn)에서 새로 도입된 무기',
        '페이트스원에서 새로 도입된 무기'
      ],
      '36174' => ['페이트스원(Fatesworn) DLC 사전 구매', '페이트스원 DLC 사전 구매'],
      '39916' => ['페이트스원(Fatesworn)은 용병이 되어', '페이트스원은 용병이 되어'],
      '43993' => ['페이트스원(Fatesworn)은 조각들을', '페이트스원은 조각들을'],
      '49217' => ['페이트스원(Fatesworn)이라 불렀다', '페이트스원이라 불렀다'],
      '49657' => [
        '옛 페이트스워른(Fatesworn) 갑옷',
        '옛 페이트스워른 갑옷'
      ],
      '62915' => [
        '페이트스원의 위협(Threat of the Fatesworn)',
        '페이트스원의 위협'
      ],
      '64450' => [
        '페이트스원(Fatesworn) 이야기의 일정 지점',
        '페이트스원 이야기의 일정 지점'
      ]
    }
    assert_equal 8, reviews.count { |row| row['old'] != row['new'] }
    expected.each do |id, (proposed, original)|
      row = by_id.fetch(id)
      assert_includes row.fetch('old'), original
      assert_includes row.fetch('new'), proposed
      assert_equal 'accepted', row.fetch('status')
      assert_equal row.fetch('new'), W.revised_text(
        M.key(row), row.fetch('new'), W::SPECS.fetch(M.key(row))
      )
      assert_equal row.fetch('old').scan(R::STRUCTURAL),
                   row.fetch('new').scan(R::STRUCTURAL)
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/)
    end
  end

  def test_existing_pairings_and_all_six_holds_remain_unchanged
    %w[4598 39567 16239 29630 60886].each do |id|
      row = by_id.fetch(id)
      assert_equal row.fetch('old'), row.fetch('new'), id
      assert_equal 'not-an-issue', row.fetch('status'), id
    end
    W::HOLD_KEYS.each do |source_key|
      row = by_id.fetch(source_key[1])
      assert_equal row.fetch('old'), row.fetch('new'), source_key.inspect
      assert_equal 'uncertain', row.fetch('status'), source_key.inspect
    end
    assert_includes by_id.fetch('3351').fetch('old'), '운명에 맹세한 자들(Fatesworn)'
    assert_includes by_id.fetch('13237').fetch('english'), 'The Fatesworn will glimpse'
    assert_includes by_id.fetch('13237').fetch('english'), 'The Fatesworn will seal'
    assert_includes by_id.fetch('13237').fetch('english'), 'The Fatesworn will seek'
    assert_includes by_id.fetch('37184').fetch('old'), '페이트스원'
    assert_includes by_id.fetch('62264').fetch('old'), '페이트스원(Fatesworn)'
  end

  def test_row_scoped_warsworn_use_and_mixed_terminal_decisions_are_preserved
    prepared = self.class.prepared
    assert_equal 'faction:warsworn',
                 by_id.fetch('49217').fetch('existing_owner_scope')
    assert_includes by_id.fetch('49217').fetch('new'), '워스원(Warsworn)'

    prior_49217 = JSON.parse(by_id.fetch('49217').fetch('prior_terminal_json'))
    warsworn = prior_49217.find { |row| row['entity_key'] == 'faction:warsworn' }
    assert_equal 'accepted', warsworn.fetch('status')
    assert_includes warsworn.fetch('evidence'), 'D-20789'
    assert_equal 1, prepared.fetch(:mixed_index_snapshot)
                      .count { |row| row['entity_key'] == 'faction:warsworn' &&
                                     M.key(row) == ['default', '49217', ''] }

    assert_equal %w[deity:telogrus monster:niskaru],
                 prepared.fetch(:mixed_index_snapshot)
                         .select { |row| M.key(row) == ['default', '13237', ''] }
                         .map { |row| row['entity_key'] }.sort
    assert_equal %w[place:amalur place:chaos-portal place:chaos-realm skill:chaos-sight],
                 prepared.fetch(:mixed_index_snapshot)
                         .select { |row| M.key(row) == ['default', '16239', ''] }
                         .map { |row| row['entity_key'] }.sort

    glossary = prepared.fetch(:glossary_snapshot)
    exact_owners = glossary.select do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.to_s.casecmp?('Fatesworn') }
    end
    assert_empty exact_owners
  end

  def test_every_row_retains_aligned_en_ja_zh_evidence_and_expected_scope
    inventory = W.active_inventory
    W.exact_source_scope!(inventory)
    reviews.each do |row|
      source = inventory.fetch(M.key(row))
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
                   row.fetch('english')
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
                   row.fetch('japanese')
      assert_equal source.fetch('zh_text'), row.fetch('chinese')
      refute_empty row.fetch('english')
      refute_empty row.fetch('japanese')
      refute_empty row.fetch('chinese')
      assert_equal W::SPECS.fetch(M.key(row)).fetch('scope'), row.fetch('scope')
    end
    assert_equal 'dlc-story-product', by_id.fetch('9945').fetch('scope')
    assert_equal 'player-epithet', by_id.fetch('60886').fetch('scope')
    assert_equal 'atomic-title', by_id.fetch('62915').fetch('scope')
  end

  def test_scope_drift_fails_closed
    inventory = W.active_inventory
    key = ['default', '37184', '']
    poisoned = inventory.dup
    poisoned[key] = poisoned.fetch(key).merge(
      'en_texts_json' => JSON.generate(['No named group here'])
    )
    assert_raises(RuntimeError) { W.exact_source_scope!(poisoned) }
  end
end
