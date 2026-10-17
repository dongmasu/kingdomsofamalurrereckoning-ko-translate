#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-preordained-D21525'

class PreordainedD21525Test < Minitest::Test
  W = PreordainedD21525
  M = ReviewedNameBatches

  def self.plan
    @plan ||= if File.file?(W::DEFINITIONS) || File.file?(W::REVIEWS)
                raise 'incomplete saved Preordained plan' unless
                  File.file?(W::DEFINITIONS) && File.file?(W::REVIEWS)
                [M.table(W::DEFINITIONS).headers,
                 M.table(W::DEFINITIONS).map(&:to_h),
                 M.table(W::REVIEWS).map(&:to_h)]
              else
                protected_paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
                  M::DOCS + [
                    M::INDEX, ReviewedProperNameDiscovery::GLOSSARY,
                    ReviewedProperNameDiscovery::DISCOVERY_CANDIDATES,
                    M::INVENTORY, W::DEFINITIONS, W::REVIEWS
                  ] + (0...3).map do |offset|
                    File.join(__dir__, "proper-name-edits-D#{W::D + offset}.tsv")
                  end
                snapshot = lambda do
                  protected_paths.to_h do |path|
                    [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
                  end
                end
                before = snapshot.call
                no_write = ->(*) { raise 'Preordained prepare attempted shared write/apply/refresh' }
                result = M.stub(:refresh_inventory, no_write) do
                  M.stub(:write_table, no_write) do
                    ReviewedProperNameDiscovery.stub(:run, no_write) do
                      ProperNameCellEditor.stub(:apply, no_write) do
                        File.stub(:write, no_write) do
                          File.stub(:binwrite, no_write) { W.prepare }
                        end
                      end
                    end
                  end
                end
                raise 'Preordained prepare changed protected files' unless before == snapshot.call
                result
              end
  end

  def definitions
    self.class.plan.fetch(1)
  end

  def reviews
    self.class.plan.fetch(2)
  end

  def by_key
    reviews.to_h { |row| [M.key(row), row] }
  end

  def inventory
    @inventory ||= W.source_inventory
  end

  def source(review)
    inventory.fetch(M.key(review))
  end

  def source_with_review_old(review)
    source(review).merge('work_text' => review.fetch('old'))
  end

  def test_two_entities_exact_scope_match_counts_and_three_batch_partition
    assert_equal [W::FACTION, W::TALISMAN],
                 definitions.map { |row| row.fetch('entity_key') }
    assert_equal 134, reviews.length
    assert_equal 134, reviews.map { |row| M.key(row) }.uniq.length
    assert_equal W::SOURCE_KEYS.sort, reviews.map { |row| M.key(row) }.sort
    assert_equal 135,
                 reviews.sum { |row| JSON.parse(row.fetch('entity_dispositions_json')).length }
    assert_equal [50, 50, 34], reviews.each_slice(50).map(&:length)
    assert_equal [W::FACTION, W::TALISMAN],
                 definitions.map { |row| row.fetch('entity_key') }
    assert_equal 'faction', definitions.find { |row| row['entity_key'] == W::FACTION }['category']
    assert_equal 'item', definitions.find { |row| row['entity_key'] == W::TALISMAN }['category']
  end

  def test_canonical_alias_and_source_evidence_notes
    faction = definitions.find { |row| row.fetch('entity_key') == W::FACTION }
    talisman = definitions.find { |row| row.fetch('entity_key') == W::TALISMAN }
    assert_equal 'Preordained', faction.fetch('english_canonical')
    assert_equal 'The Preordained', faction.fetch('english_aliases')
    assert_equal '예정된 자들(Preordained)', faction.fetch('korean_canonical')
    assert_equal W::ITEM_NEW, talisman.fetch('korean_canonical')
    assert_equal '', talisman.fetch('english_aliases')
    assert_includes faction.fetch('notes'), 'default:7253'
    assert_includes faction.fetch('notes'), 'default:52727'
    assert_includes talisman.fetch('notes'), 'No mechanics, rarity'
    assert_includes faction.fetch('korean_variants'), '선결된 자들'
    assert_includes faction.fetch('korean_variants'), '운명받은 자들'
  end

  def test_every_source_locale_is_aligned_and_review_rebuilds_from_immutable_sources
    generated = W.generated_occurrences(inventory, definitions)
    assert W.validate_scope!(inventory, generated)
    assert_equal W.expected_pairs.sort,
                 generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    assert_equal 135, generated.length
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)

    reviews.each do |review|
      rebuilt = W.review_source(source_with_review_old(review))
      assert_equal review.fetch('new'), rebuilt.fetch('new'), M.key(review).inspect
      assert_equal review.fetch('status'), rebuilt.fetch('status'), M.key(review).inspect
      assert_equal review.fetch('entity_dispositions_json'),
                   rebuilt.fetch('entity_dispositions_json'), M.key(review).inspect
      assert_equal JSON.parse(source(review).fetch('en_texts_json')).compact.join("\n"),
                   review.fetch('english')
      assert_equal JSON.parse(source(review).fetch('ja_texts_json')).compact.join("\n---\n"),
                   review.fetch('japanese')
      assert_equal source(review).fetch('zh_text'), review.fetch('chinese')
    end
  end

  def test_generic_adjectives_title_hold_and_nested_talisman_disposition
    W::GENERIC_IDS.each do |id|
      row = by_key.fetch(['default', id, ''])
      assert_equal row.fetch('old'), row.fetch('new')
      assert_equal 'excluded', JSON.parse(row.fetch('entity_dispositions_json')).fetch(W::FACTION)
      refute_match(/예정된 자들?\((?:The )?Preordained\)/, row.fetch('new'))
    end

    title = by_key.fetch(['default', W::TITLE_HOLD_ID, ''])
    assert_equal 'uncertain', title.fetch('status')
    assert_equal title.fetch('old'), title.fetch('new')
    assert_includes title.fetch('evidence'), '定められし出会い'
    assert_includes title.fetch('evidence'), '天命者遭遇'

    talisman = by_key.fetch(W::ITEM_KEY)
    dispositions = JSON.parse(talisman.fetch('entity_dispositions_json'))
    assert_equal 'excluded', dispositions.fetch(W::FACTION)
    assert_equal 'accepted', dispositions.fetch(W::TALISMAN)
    assert_equal W::ITEM_OLD, talisman.fetch('old')
    assert_equal W::ITEM_NEW, talisman.fetch('new')
    refute_includes talisman.fetch('new'), '예정된 자(Preordained)의 부적'
    assert_equal W::ITEM_NEW, talisman.fetch('new')
  end

  def test_eight_member_singular_forms_remain_singular
    W::SINGULAR_IDS.each do |id|
      row = by_key.fetch(['default', id, ''])
      labels = W.source_labels(source_with_review_old(row))
      assert_equal 1, labels.length, id
      assert_equal 1, row.fetch('new').scan(/예정된 자\((?:The )?Preordained\)/).length, id
      refute_match(/예정된 자들\((?:The )?Preordained\)/, row.fetch('new'), id)
    end
  end

  def test_source_variants_are_normalized_only_at_their_exact_rows
    expected = {
      '15389' => '예정된 자들(Preordained)',
      '25834' => '예정된 자들(Preordained)',
      '33308' => '예정된 자들(Preordained)',
      '38726' => '예정된 자들(Preordained)',
      '54709' => '예정된 자들(Preordained)',
      '8051' => '예정된 자들(Preordained)'
    }
    expected.each do |id, canonical|
      row = by_key.fetch(['default', id, ''])
      label = W.source_labels(source_with_review_old(row)).first
      assert_includes row.fetch('new'), canonical.sub('(Preordained)', "(#{label})"), id
      refute_includes row.fetch('new'), '선결된 자들'
      refute_includes row.fetch('new'), '선견자들'
      refute_includes row.fetch('new'), '운명받은 자들'
      refute_includes row.fetch('new'), '예정자들'
      refute_includes row.fetch('new'), '정해진 자들'
    end
    assert_equal '예정된 자들(Preordained)의 부적',
                 by_key.fetch(['default', '41998', '']).fetch('new')
                   .scan(/예정된 자들\(Preordained\)의 부적/).first
    assert_equal 2, by_key.fetch(['default', '41998', '']).fetch('new')
      .scan(/예정된 자들\((?:The )?Preordained\)/).length
  end

  def test_all_accepted_faction_spans_are_source_local_and_idempotent
    reviews.each do |review|
      key = M.key(review)
      source_row = source_with_review_old(review)
      assert_equal review.fetch('new'), W.normalize(review.fetch('old'), source_row), key.inspect
      assert_equal review.fetch('new'), W.normalize(review.fetch('new'), source_row), key.inspect
      assert_equal review.fetch('old').scan(/\r\n|\r|\n/),
                   review.fetch('new').scan(/\r\n|\r|\n/), key.inspect
      assert_equal review.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   review.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      refute_match(/\([^)]*\(/, review.fetch('new'), key.inspect)
      labels = W.source_labels(source_row)
      unless W::GENERIC_IDS.include?(key[1]) || key == ['default', W::TITLE_HOLD_ID, ''] ||
             key == W::ITEM_KEY
        assert_equal labels.length,
                     review.fetch('new').scan(/\((?:The )?Preordained\)/).length, key.inspect
      end
    end
  end

  def test_prepare_and_post_apply_checks_tolerate_unrelated_later_cell_changes
    row = by_key.fetch(['default', '251', ''])
    src = source_with_review_old(row)
    synthetic = row.fetch('old').sub('혼돈의 신 텔로그루스(Telogrus)', '혼돈의 신 텔로그루스(Telogrus) [LaterName]')
    normalized = W.normalize(synthetic, src)
    assert_includes normalized, '텔로그루스(Telogrus) [LaterName]'
    assert_includes normalized, "예정된 자들(#{W.source_labels(src).first}) 교단"

    if File.file?(File.join(__dir__, "proper-name-edits-D#{W::D}.tsv"))
      reviews.each do |review|
        active = source(review)
        assert_equal active.fetch('work_text'), W.normalize(active.fetch('work_text'), active),
                     M.key(review).inspect
      end
    end
  end
end
