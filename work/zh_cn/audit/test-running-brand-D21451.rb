#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-running-brand-D21451'

class RunningBrandD21451Test < Minitest::Test
  M = RunningBrandD21451
  HEADERS = %w[entity_key english_canonical korean_canonical category english_aliases
               korean_variants evidence_ids status notes].freeze
  DESCRIPTION = '달리는 자(The Running Man)는 절망을 상징하는 카드다. 그 이름을 딴 갑옷처럼 안전과 보호가 필요한 사람을 나타낸다. 테로신의 고리(Circle of Therosin)는 이 카드가 바꿀 수 있는 운명도 뜻한다고 믿었다.'

  def inventory
    M::ROWS.to_h do |key, spec|
      entity, english, japanese, chinese, old_span, = spec
      [key, {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'en_texts_json' => JSON.generate([english]),
        'ja_texts_json' => JSON.generate([japanese]), 'zh_text' => chinese,
        'work_text' => key == M::DESCRIPTION_KEY ? DESCRIPTION : old_span
      }]
    end
  end

  def generated(rows)
    build_occurrences(rows.values, M.definitions_for(HEADERS)).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def test_description_changes_only_the_first_name_and_preserves_pronoun
    expected = DESCRIPTION.sub('달리는 자(The Running Man)', '달리는 사나이(The Running Man)')
    assert_equal expected, M.normalize(DESCRIPTION, M::DESCRIPTION_KEY)
    assert_includes expected, '이 카드가'
    assert_equal 1, expected.scan('달리는 사나이(The Running Man)').length
    assert_includes expected, '테로신의 고리(Circle of Therosin)는'
    assert_includes expected, '(The Running Man)는'
  end

  def test_lowercase_card_mentions_keep_source_casing_and_other_card_names
    {
      ['default', '24902', ''] => [
        '달리는 사내',
        '달리는 사나이(the running man)'
      ],
      ['default', '52067', ''] => [
        '달리는 자',
        '달리는 사나이(the running man)'
      ]
    }.each do |key, (old, expected_name)|
      text = "오늘 아침 뽑은 카드는... 무덤 파는 자, #{old}, 그리고 야수였어."
      expected = text.sub(old, expected_name)
      assert_equal expected, M.normalize(text, key)
      assert_equal expected, M.normalize(expected, key)
      assert_includes expected, '무덤 파는 자'
      assert_includes expected, '야수'
      refute_includes expected, '(The Running Man)'
    end
  end

  def test_complete_label_changes_are_atomic_and_idempotent
    {
      ['default', '26006', ''] => ['달리는 사나이', '달리는 사나이(The Running Man)'],
      ['default', '45033', ''] => ['메스를 들고 달리기', '메스를 들고 달리기(Running with Scalpels)'],
      ['base', '632', '11'] => ['운명의 낙인', "운명의 낙인(Fate's Brand)"]
    }.each do |key, (old, expected)|
      assert_equal expected, M.normalize(old, key)
      assert_equal expected, M.normalize(expected, key)
      refute_match(/\([^)]*\(/, expected)
    end
    normalized = M.normalize(DESCRIPTION, M::DESCRIPTION_KEY)
    assert_equal normalized, M.normalize(normalized, M::DESCRIPTION_KEY)
  end

  def test_all_five_equipment_titles_are_preserved_bytewise
    items = M::ROWS.select { |_key, spec| spec.fetch(5).nil? }
    assert_equal 5, items.length
    items.each do |key, spec|
      text = spec.fetch(4)
      assert_equal text.b, M.normalize(text, key).b
    end
  end

  def test_tokens_line_breaks_and_unrelated_prose_are_preserved
    text = "$X$\r\n<color>{*1보호} #{DESCRIPTION}\n운명의 낙인, Running, Brand"
    expected = text.sub('달리는 자(The Running Man)', '달리는 사나이(The Running Man)')
    actual = M.normalize(text, M::DESCRIPTION_KEY)
    assert_equal expected, actual
    assert_equal text.scan(/\r\n|\r|\n/), actual.scan(/\r\n|\r|\n/)
    assert_equal text.scan(ReviewedProperNameDiscovery::OPAQUE),
                 actual.scan(ReviewedProperNameDiscovery::OPAQUE)
  end

  def test_unsafe_spans_and_unknown_keys_fail_closed
    assert_raises(RuntimeError) { M.normalize(DESCRIPTION * 2, M::DESCRIPTION_KEY) }
    assert_raises(RuntimeError) { M.normalize('{*1달리는 자(The Running Man)}', M::DESCRIPTION_KEY) }
    assert_raises(RuntimeError) { M.normalize('다른 제목', ['default', '26006', '']) }
    assert_raises(RuntimeError) { M.normalize('달리는 사나이', ['default', '26006', '11']) }
    assert_raises(RuntimeError) { M.normalize('Running Brand', ['affix', '632', '11']) }
  end

  def test_eleven_key_plan_evidence_and_dispositions
    rows = inventory
    definitions = M.definitions_for(HEADERS)
    occurrences = generated(rows)
    reviews = M.reviews_for(rows, occurrences)
    assert_equal 11, reviews.length
    assert_equal 9, occurrences.count { |row| row['entity_key'] == M::RUNNING }
    assert_equal 6, reviews.count { |row| row['status'] == 'accepted' }
    assert_equal 5, reviews.count { |row| row['status'] == 'excluded' }
    assert definitions.all? { |row| row['english_aliases'] == '' }
    assert_equal ['lore term', 'quest', 'unique item'], definitions.map { |row| row['category'] }
    ReviewedProperNameDiscovery.validate!(definitions, reviews, occurrences, [], [])
    ReviewedProperNameDiscovery.validate_sources!(reviews, rows)
    reviews.select { |row| row['status'] == 'excluded' }.each do |row|
      assert_equal row.fetch('old').b, row.fetch('new').b
    end
    reviews.each do |row|
      rows.fetch(M::M.key(row))['work_text'] = row.fetch('new')
    end
    repeated = M.reviews_for(rows, occurrences)
    assert_equal 6, repeated.count { |row| row['status'] == 'not-an-issue' }
    assert repeated.all? { |row| row['old'] == row['new'] }
  end

  def test_alignment_and_protected_item_drift_are_rejected
    %w[en_texts_json ja_texts_json zh_text work_text].each do |field|
      rows = inventory
      rows.fetch(['base', '871', '11'])[field] = field.end_with?('_json') ? '["changed"]' : 'changed'
      assert_raises(RuntimeError) { M.reviews_for(rows, generated(rows)) }
    end
  end

  def test_scope_includes_verified_lowercase_hits_and_rejects_unreviewed_hits
    rows = inventory
    %w[24902 52067].each do |id|
      assert rows.key?(['default', id, ''])
    end
    occurrences = generated(rows)
    assert_equal 11, occurrences.length
    assert_equal 11, M.reviews_for(rows, occurrences).length
    assert_raises(RuntimeError) { M.assert_scope!(generated(inventory).drop(1)) }
    assert_raises(RuntimeError) { M.assert_scope!(generated(inventory) * 2) }
  end
end
