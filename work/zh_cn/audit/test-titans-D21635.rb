#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-titans-D21635'

class TitansD21635Test < Minitest::Test
  M = TitansD21635
  HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def test_exact_source_scope_and_per_key_mention_sequences
    assert_equal 36, M::SOURCE_KEYS.length
    assert_equal 20, M::LORE_KEYS.length
    assert_equal 3, M::ATOMIC_ITEM_KEYS.length
    assert_equal 9, M::NUMBERED_TITLE_KEYS.length
    assert_equal 4, M::EXISTING_TITLE_KEYS.length +
                    M::GENERIC_KEYS.length + M::UNCERTAIN_KEYS.length
    classified = M::LORE_KEYS + M::TITLE_SPECS.keys + M::EXISTING_TITLE_KEYS +
      M::GENERIC_KEYS + M::UNCERTAIN_KEYS
    assert_equal M::SOURCE_KEYS.sort, classified.sort
    assert_equal classified.length, classified.uniq.length
    assert_equal 42, M::EXPECTED_WORDS.values.sum(&:length)
    assert_equal %w[Titan Titans], M::EXPECTED_WORDS.fetch(['default', '18166', ''])
    assert_equal %w[Titans Titan],
                 ['타이탄(Titans) 중의 타이탄(Titan)']
                   .first.scan(/\((Titans?|titans?)\)/).flatten
  end

  def test_all_lore_rewrites_are_idempotent_and_keep_source_plural_labels
    assert_equal M::LORE_KEYS.sort, M::REWRITES.keys.sort
    M::REWRITES.each do |row_key, patches|
      old = patches.map(&:first).join(' / ')
      new = patches.map(&:last).join(' / ')
      assert_equal new, M.normalize(old, row_key)
      assert_equal new, M.normalize(new, row_key)
    end
    assert_equal '고대 타이탄(Titan)의 유물',
                 M.normalize('고대 타이탄의 유물', ['default', '7190', ''])
    assert_equal '타이탄(titans)들의 현명한 어머니',
                 M.normalize('타이탄들의 현명한 어머니', ['default', '18694', ''])
  end

  def test_18166_maps_english_order_to_reversed_korean_phrase_order
    key = ['default', '18166', '']
    english = M::EXPECTED_WORDS.fetch(key)
    korean = M.normalize('그는 타이탄 중의 타이탄이 되었다.', key)
    korean_words = korean.scan(/\((Titans?|titans?)\)/).flatten

    assert_equal %w[Titan Titans], english
    assert_equal %w[Titans Titan], korean_words
    assert_equal '그는 타이탄(Titans) 중의 타이탄(Titan)이 되었다.', korean
  end

  def test_atomic_titles_are_paired_without_nesting_and_holds_stay_unchanged
    M::TITLE_SPECS.each do |row_key, (_entity, english, korean, replacement)|
      assert_equal replacement, M.normalize_title(korean, row_key), english
      assert_equal replacement, M.normalize_title(replacement, row_key), english
      refute_match(/\((?:Titan|Titans)\)\z/, replacement, english)
    end
    assert_equal '타이탄의 창 (The Titan Spear)',
                 M.normalize('타이탄의 창 (The Titan Spear)', ['base', '35', '11'])
    assert_equal '조용한 거인', M.normalize('조용한 거인', ['default', '33479', ''])
    assert_equal '잠든 거인', M.normalize('잠든 거인', ['default', '8816', ''])
  end

  def test_definition_is_lore_class_with_only_grammatical_plural_alias
    definition = M.definitions_for(HEADERS).fetch(0)
    assert_equal M::ENTITY, definition.fetch('entity_key')
    assert_equal 'lore term', definition.fetch('category')
    assert_equal 'Titan', definition.fetch('english_canonical')
    assert_equal 'Titans', definition.fetch('english_aliases')
    assert_equal '타이탄(Titan)', definition.fetch('korean_canonical')
    assert_includes definition.fetch('notes'), 'does not make every generic titan'
    assert_includes definition.fetch('notes'), 'No Fatesworn identity'
    assert_includes definition.fetch('notes'), 'no nested annotation is produced'
  end

  def test_prepare_is_read_only_and_validates_exact_live_batch
    no_write = ->(*) { flunk 'prepare called a writing/apply helper' }
    before_outputs = Dir.glob(
      File.join(__dir__, '{proper-name-discovery,proper-name-discovery-definitions}-D21635.tsv')
    )
    inventory = M.active_inventory
    manifest = M::M.table(File.join(__dir__, 'proper-name-edits-D21635.tsv'))
    manifest.each do |row|
      inventory[M::M.key(row)] = inventory.fetch(M::M.key(row))
        .merge('work_text' => row['old'])
    end
    registered_entities = M.definitions_for(
      M::M.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    ).map { |row| row.fetch('entity_key') }
    glossary = M::M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
                  .reject { |row| registered_entities.include?(row['entity_key']) }
    index = M::M.table(M::M::INDEX).map(&:to_h)
                .reject { |row| registered_entities.include?(row['entity_key']) }
    backup_dir = '/private/tmp/ko-translate-backups/20261017/before-proper-name-D21635'
    csv_bytes = %w[base default].to_h do |resource|
      path = File.join(backup_dir, "locatexts_zh_cn.koalocatext_#{resource}.csv")
      [resource, File.binread(path)]
    end
    result = nil
    M::M.stub(:write_table, no_write) do
      M::M.stub(:refresh_inventory, no_write) do
        M::M.stub(:run, no_write) do
          ReviewedProperNameDiscovery.stub(:run, no_write) do
            ReviewedProperNameDiscovery.stub(:ensure_unused_batch!, nil) do
              capture_io do
                result = M.prepare(
                  inventory: inventory, glossary_rows: glossary,
                  index_rows: index, csv_bytes: csv_bytes
                )
              end
            end
          end
        end
      end
    end
    definitions, reviews = result

    assert_equal 13, definitions.length
    assert_equal 36, reviews.length
    assert_equal 32, reviews.count { |row| row['status'] == 'accepted' }
    assert_equal 3, reviews.count { |row| row['status'] == 'excluded' }
    assert_equal 1, reviews.count { |row| row['status'] == 'uncertain' }
    assert_equal 32, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 12, M::TITLE_SPECS.length
    assert_equal M::NORMALIZED_KEYS.sort,
                 reviews.select { |row| row['old'].include?('티탄') }
                        .map { |row| M::M.key(row) }.sort
    assert_equal M::SOURCE_KEYS.sort, reviews.map { |row| M::M.key(row) }.sort
    assert_equal before_outputs, Dir.glob(
      File.join(__dir__, '{proper-name-discovery,proper-name-discovery-definitions}-D21635.tsv')
    )

    held = reviews.find { |row| M::M.key(row) == ['default', '8816', ''] }
    assert_equal 'uncertain', held.fetch('status')
    assert_equal held.fetch('old'), held.fetch('new')
    assert_includes held.fetch('japanese'), 'まどろむ巨人'
    assert_includes held.fetch('chinese'), '沉睡的泰坦'

    reversed = reviews.find { |row| M::M.key(row) == ['default', '18166', ''] }
    assert_equal %w[Titan Titans], M.source_words(
      M.active_inventory.fetch(['default', '18166', ''])
    )
    assert_includes reversed.fetch('new'), '타이탄(Titans) 중의 타이탄(Titan)'

    M::TITLE_SPECS.each do |row_key, (title_entity, english, _korean, replacement)|
      review = reviews.find { |row| M::M.key(row) == row_key }
      assert_equal 'accepted', review.fetch('status'), row_key.inspect
      assert_equal replacement, review.fetch('new'), row_key.inspect
      assert_includes review.fetch('english'), english
      assert_equal 1, review.fetch('english').scan(Regexp.new(Regexp.escape(english))).length
      assert_equal 'excluded',
                   JSON.parse(review.fetch('entity_dispositions_json')).fetch(M::ENTITY)
      assert_equal 'accepted',
                   JSON.parse(review.fetch('entity_dispositions_json')).fetch(title_entity)
      refute_empty review.fetch('japanese')
      refute_empty review.fetch('chinese')
    end

    M::EXISTING_TITLE_KEYS.each do |row_key|
      review = reviews.find { |row| M::M.key(row) == row_key }
      assert_equal 'excluded', review.fetch('status')
      assert_equal review.fetch('old'), review.fetch('new')
    end
    M::GENERIC_KEYS.each do |row_key|
      review = reviews.find { |row| M::M.key(row) == row_key }
      assert_equal 'excluded', review.fetch('status')
      assert_equal review.fetch('old'), review.fetch('new')
    end
    M::UNCERTAIN_KEYS.each do |row_key|
      review = reviews.find { |row| M::M.key(row) == row_key }
      assert_equal 'uncertain', review.fetch('status')
      assert_equal review.fetch('old'), review.fetch('new')
    end
  end
end
