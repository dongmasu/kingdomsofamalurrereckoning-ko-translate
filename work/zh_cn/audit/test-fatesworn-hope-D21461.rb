#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-fatesworn-hope-D21461'

class HopeOfTheFateswornD21461Test < Minitest::Test
  M = HopeOfTheFateswornD21461
  HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def test_all_eighteen_title_spans_normalize_idempotently
    assert_equal 18, M::ROWS.length
    M::ROWS.each do |key, (_english, old, replacement)|
      source = old == replacement ? old : "앞말 #{old} 뒤말"
      expected = old == replacement ? replacement : "앞말 #{replacement} 뒤말"
      assert_equal expected, M.normalize(source, key)
      assert_equal expected, M.normalize(expected, key)
      refute_match(/\([^)]*\(/, replacement)
    end
  end

  def test_five_base_pieces_are_complete_atomic_titles
    expected_titles = {
      '1338' => 'Hope of the Fatesworn Greaves',
      '2088' => 'Hope of the Fatesworn Helm',
      '2741' => 'Hope of the Fatesworn Cuirass',
      '3405' => 'Hope of the Fatesworn Chausses',
      '3564' => 'Hope of the Fatesworn Gauntlets'
    }
    base = M::ROWS.select { |key, _| key.first == 'base' }
    assert_equal expected_titles.keys.sort, base.keys.map { |key| key[1] }.sort
    base.each do |key, (english_title, _old, replacement)|
      assert_equal expected_titles.fetch(key[1]), english_title
      assert_includes replacement, "(#{english_title})"
      refute_includes replacement, '(Fatesworn)'
    end
  end

  def test_particle_quotes_prose_and_line_breaks_are_preserved
    key = ['default', '41974', '']
    source = "운명맹세단의 희망이라는 방어구 세트를 되찾았다.\r\n" \
             "산속 대장간에 있는 스칼드(Skald)에게 가져가야 한다."
    expected = "#{M::CANONICAL}이라는 방어구 세트를 되찾았다.\r\n" \
               "산속 대장간에 있는 스칼드(Skald)에게 가져가야 한다."
    actual = M.normalize(source, key)
    assert_equal expected, actual
    assert_equal source.scan(/\r\n|\r|\n/), actual.scan(/\r\n|\r|\n/)
    assert_equal source.scan(ReviewedProperNameDiscovery::OPAQUE),
                 actual.scan(ReviewedProperNameDiscovery::OPAQUE)

    quote_key = ['default', '18681', '']
    quoted = '"운명에 충실한 자의 희망(Hope of the Fatesworn)"이라는 고대 갑옷'
    assert_equal %("#{M::CANONICAL}"이라는 고대 갑옷), M.normalize(quoted, quote_key)
  end

  def test_definition_is_only_the_named_set_not_fatesworn_faction
    definition = M.definitions_for(HEADERS).fetch(0)
    assert_equal M::ENTITY, definition.fetch('entity_key')
    assert_equal 'unique item', definition.fetch('category')
    assert_equal M::ENGLISH, definition.fetch('english_canonical')
    assert_equal M::CANONICAL, definition.fetch('korean_canonical')
    assert_equal '', definition.fetch('english_aliases')
    refute_includes definition.fetch('english_aliases'), 'Fatesworn'
    assert_includes definition.fetch('notes'), 'no Fatesworn faction/person identity'
    assert_includes definition.fetch('notes'), 'does not reopen or recount'
  end

  def test_source_scope_and_review_guards_reject_drift
    rows = M::ROWS.to_h do |key, (english_title, old, _replacement)|
      english_source = if M::UNCERTAIN_KEYS.include?(key)
                         'Now you must take the role of one more hero: Hope of the Fatesworn.'
                       else
                         english_title
                       end
      japanese_source = if M::UNCERTAIN_KEYS.include?(key)
                          '担うべき英雄の役割が増えたな。"フェイトスウォーンの希望"だ'
                        else
                          M::JAPANESE
                        end
      chinese_source = if M::UNCERTAIN_KEYS.include?(key)
                         '现在你必须扮演另一个英雄角色：誓命者的希望。'
                       else
                         M::CHINESE
                       end
      [
        key,
        {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'en_texts_json' => JSON.generate([english_source]),
          'ja_texts_json' => JSON.generate([japanese_source]),
          'zh_text' => chinese_source, 'work_text' => old
        }
      ]
    end
    generated = build_occurrences(rows.values, M.definitions_for(HEADERS)).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = M.reviews_for(rows, generated)
    assert_equal 18, reviews.length
    assert_equal 16, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 1, reviews.count { |row| row['status'] == 'not-an-issue' }
    held = reviews.find { |row| row['ID_Linha'] == '8089' }
    assert_equal 'uncertain', held.fetch('status')
    assert_equal held.fetch('old'), held.fetch('new')
    assert_includes held.fetch('evidence'), 'held because its English/Japanese/Chinese context assigns the phrase to a hero role'
    ReviewedProperNameDiscovery.validate!(
      M.definitions_for(HEADERS), reviews, generated, [], []
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, rows)
    assert_raises(RuntimeError) { M.assert_scope!(generated.drop(1)) }
    assert_raises(RuntimeError) { M.assert_scope!(generated + generated.take(1)) }

    rows.fetch(['default', '505', ''])['ja_texts_json'] = JSON.generate(['changed'])
    assert_raises(RuntimeError) { M.reviews_for(rows, generated) }
  end

  def test_live_prepare_reads_or_completed_batch_remains_consistent
    if File.file?(M::REVIEWS)
      reviews = M::M.table(M::REVIEWS).map(&:to_h)
      inventory = M.active_inventory
      index = M::M.table(M::M::INDEX).map(&:to_h)
      entity_rows = index.select { |row| row.fetch('entity_key') == M::ENTITY }
      assert_equal M::SOURCE_KEYS.sort, reviews.map { |row| M::M.key(row) }.sort
      assert_equal 18, entity_rows.length
      assert_equal 1, reviews.count { |row| row.fetch('status') == 'uncertain' }
      reviews.each do |review|
        source = inventory.fetch(M::M.key(review))
        indexed = entity_rows.find { |row| M::M.key(row) == M::M.key(review) }
        assert_equal review.fetch('new'), source.fetch('work_text')
        assert_equal review.fetch('status'), indexed.fetch('status')
      end
      definition = M::M.table(ReviewedProperNameDiscovery::GLOSSARY)
                       .find { |row| row['entity_key'] == M::ENTITY }
      assert_empty definition.fetch('english_aliases')
      return
    end

    no_write = ->(*) { flunk 'prepare attempted an output/helper write' }
    outputs = [M::DEFINITIONS, M::REVIEWS]
    before = outputs.map { |path| File.exist?(path) }
    result = nil
    M::M.stub(:refresh_inventory, no_write) do
      M::M.stub(:write_table, no_write) do
        M::M.stub(:run, no_write) do
          ReviewedProperNameDiscovery.stub(:run, no_write) do
            capture_io { result = M.prepare }
          end
        end
      end
    end
    _definitions, reviews = result
    assert_equal before, outputs.map { |path| File.exist?(path) }
    assert_equal M::SOURCE_KEYS.sort, reviews.map { |row| M::M.key(row) }.sort
    assert_equal 16, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 1, reviews.count { |row| row['status'] == 'not-an-issue' }
    assert_equal 1, reviews.count { |row| row['status'] == 'uncertain' }
    assert reviews.all? { |row| row['entity_key'] == M::ENTITY }
  end
end
