#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-eldest-D21459'

class EldestD21459Test < Minitest::Test
  M = EldestD21459
  HEADERS = %w[entity_key english_canonical korean_canonical category english_aliases
               korean_variants evidence_ids status notes].freeze
  NAMED_IDS = %w[
    11407 11580 14741 15316 16729 16818 18493 21281 21818 22055 2577
    31140 31295 33316 34977 36727 39766 40115 42431 42799 48551 5491
    55614 56750 57631 57807 58712 58980 61089 63040 64218 64801 9374
  ].freeze

  def key(id)
    ['default', id, '']
  end

  def test_exact_scope_and_alias_free_named_collective_definition
    definition = M.definitions_for(HEADERS).fetch(0)
    assert_equal 'people:the-eldest', definition.fetch('entity_key')
    assert_equal 'people', definition.fetch('category')
    assert_equal 'The Eldest', definition.fetch('english_canonical')
    assert_equal M::CANONICAL, definition.fetch('korean_canonical')
    assert_empty definition.fetch('english_aliases')
    assert_includes definition.fetch('notes'), 'not a race'
    assert_includes definition.fetch('notes'), 'House of Sorrows, not the House of Ballads'
    assert_equal NAMED_IDS.sort, M::ROWS.keys.sort
    assert_equal %w[3221 56468 7764].sort, M::EXCLUSIONS.keys.sort
    assert_equal 36, M.expected_keys.length
    assert_equal 34, M::ROWS.values.sum { |_old, _new, count| count }
    assert_equal 25, M::ROWS.count { |_id, (old, proposed, _count)| old != proposed }
  end

  def test_every_scoped_span_is_exact_and_idempotent
    M::ROWS.each do |id, (old_span, new_span, count)|
      old = Array.new(count, old_span).join(' / ')
      expected = Array.new(count, new_span).join(' / ')
      assert_equal expected, M.normalize(old, key(id)), id
      assert_equal expected, M.normalize(expected, key(id)), id
      refute_match(/\([^)]*\(/, expected, id)
    end
  end

  def test_plural_variants_retain_grammatical_particles
    {
      '11580' => ['맏이들은 다시 만난다.', "#{M::CANONICAL}는 다시 만난다."],
      '14741' => ['맏이들의 존재', "#{M::CANONICAL}의 존재"],
      '16729' => ['장로들만 알고 있다.', "#{M::CANONICAL}만 알고 있다."],
      '40115' => ['맏이들을 찾아 깨웠다.', "#{M::CANONICAL}를 찾아 깨웠다."],
      '42431' => ['장로들은 도륙당했다.', "#{M::CANONICAL}는 도륙당했다."],
      '64801' => ['엘디스트가 모인다.', "#{M::CANONICAL}가 모인다."]
    }.each do |id, (old, expected)|
      assert_equal expected, M.normalize(old, key(id))
    end
  end

  def test_source_local_article_and_counterparts_are_preserved
    assert_equal "남은 #{M::SHORT_PAIR}를 찾아가라",
                 M.normalize('남은 장로를 찾아가라', key('57631'))
    %w[55614 56750].each do |id|
      old = '엘더스트(Eldest) 중 케일로드(Caelrod)와 알라레인(Alarane).'
      expected = "#{M::CANONICAL} 중 케일로드(Caelrod)와 알라레인(Alarane)."
      assert_equal expected, M.normalize(old, key(id))
    end
    assert_equal "#{M::CANONICAL}에게", M.normalize('장로(Eldest)에게', key('5491'))
  end

  def test_both_48551_mentions_and_mixed_already_correct_spans
    old = '대장로에게 가는 길, 대장로에게 가는 길.'
    expected = "#{M::CANONICAL}에게 가는 길, #{M::CANONICAL}에게 가는 길."
    assert_equal expected, M.normalize(old, key('48551'))
    assert_equal expected, M.normalize(old.sub('대장로에게', "#{M::CANONICAL}에게"), key('48551'))
    assert_equal expected, M.normalize(expected, key('48551'))
  end

  def test_61089_pronoun_derived_second_korean_name_is_not_paired
    old = "비사라네(Bisarane)가 #{M::CANONICAL}를 찾으라고 했다. 엘더스트에 관해 알아내자."
    assert_equal old, M.normalize(old, key('61089'))
    assert_equal 1, M.normalize(old, key('61089')).scan(M::CANONICAL).length
    assert_includes M.normalize(old, key('61089')), '엘더스트에 관해'
  end

  def test_generic_eldest_exclusions_are_unchanged
    {
      '3221' => '핀(Phinne)은 가장 오래된 제자야.',
      '7764' => '케일로드(Caelrod)와 알라레인(Alarane)은 가장 나이가 많아.',
      '56468' => '실드링(Shieldring)이 가장 연장자야.'
    }.each do |id, old|
      assert_equal old, M.normalize(old, key(id))
    end
  end

  def test_unrelated_names_annotations_tokens_and_line_breaks_are_protected
    old = "$엘더스트를$\r\n<엘더스트를> {엘더스트를} (엘더스트를) " \
          '엘더스트를 죽이려 해! 장로, 맏이, 케일로드(Caelrod), 알라레인(Alarane).'
    expected = old.sub('엘더스트를 죽이려', "#{M::CANONICAL}를 죽이려")
    assert_equal expected, M.normalize(old, key('31140'))
    assert_equal old.scan(/\r\n|\r|\n/), expected.scan(/\r\n|\r|\n/)
    assert_equal old.scan(ReviewedProperNameDiscovery::OPAQUE),
                 expected.scan(ReviewedProperNameDiscovery::OPAQUE)
  end

  def test_unknown_keys_counts_nested_labels_and_compounds_fail_closed
    [
      ['엘더스트를', key('99999')],
      ['대장로에게', key('48551')],
      ['엘더스트를 엘더스트를', key('31140')],
      ['{엘더스트를}', key('31140')],
      ['(엘더스트를)', key('31140')],
      ['엘더스트를(Other Name)', key('31140')],
      ['가짜엘더스트를', key('31140')],
      ['맏이들은데', key('11580')],
      [M::CANONICAL, ['base', '11407', '11']]
    ].each do |text, row_key|
      assert_raises(RuntimeError) { M.normalize(text, row_key) }
    end
  end

  def test_full_live_prepare_is_read_only_with_all_discovery_gates
    no_write = ->(*) { flunk 'Eldest prepare attempted a write, shared refresh or apply' }
    outputs = [M::DEFINITIONS, M::REVIEWS]
    before = outputs.map { |path| File.exist?(path) }
    result = nil
    M::M.stub(:refresh_inventory, no_write) do
      M::M.stub(:write_table, no_write) do
        M::M.stub(:run, no_write) do
          ReviewedProperNameDiscovery.stub(:run, no_write) do
            File.stub(:write, no_write) do
              File.stub(:binwrite, no_write) { capture_io { result = M.prepare } }
            end
          end
        end
      end
    end
    definitions, reviews, generated = result
    assert_equal before, outputs.map { |path| File.exist?(path) }
    assert_equal 1, definitions.length
    assert_empty definitions.first.fetch('english_aliases')
    assert_equal 36, reviews.length
    assert_operator reviews.length, :<=, 50
    assert_equal M.expected_keys.sort, reviews.map { |row| M::M.key(row) }.sort
    assert_equal 25, reviews.count { |row| row['status'] == 'accepted' }
    assert_equal 8, reviews.count { |row| row['status'] == 'not-an-issue' }
    assert_equal 3, reviews.count { |row| row['status'] == 'excluded' }
    named = reviews.reject { |row| row['status'] == 'excluded' }
    assert_equal 33, named.sum { |row| row.fetch('new').scan(M::CANONICAL).length }
    assert_equal 1, named.sum { |row| row.fetch('new').scan(M::SHORT_PAIR).length }
    repeated = reviews.find { |row| row['ID_Linha'] == '48551' }
    assert_equal 2, repeated.fetch('english').scan(/\bEldest\b/).length
    assert_equal 1, repeated.fetch('japanese').scan('エルデスト').length
    assert_equal 2, repeated.fetch('chinese').scan('长者').length
    reviews.each do |row|
      assert_equal row['new'], M.normalize(row['new'], M::M.key(row))
      assert_equal({ M::ENTITY => row['status'] }, JSON.parse(row['entity_dispositions_json']))
      assert_equal row['old'], row['new'] if row['status'] == 'excluded'
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
    end

    inventory = reviews.to_h do |row|
      [M::M.key(row), row.slice('resource', 'ID_Linha', 'Tipo_Variante').merge(
        'en_texts_json' => JSON.generate([row.fetch('english')]),
        'ja_texts_json' => JSON.generate([row.fetch('japanese')]),
        'zh_text' => row.fetch('chinese'), 'work_text' => row.fetch('old')
      )]
    end
    assert_equal generated, M.source_occurrences(inventory, definitions)
    %w[en_texts_json ja_texts_json zh_text work_text].each do |field|
      changed = inventory.transform_values(&:dup)
      changed.fetch(key('64218'))[field] =
        field.end_with?('_json') ? JSON.generate(['unreviewed source']) : 'unreviewed source'
      assert_raises(RuntimeError) { M.reviews_for(changed, generated) }
    end
    extra = inventory.merge(['affix', '99999', '11'] =>
      inventory.fetch(key('11407')).merge('resource' => 'affix', 'ID_Linha' => '99999',
                                         'Tipo_Variante' => '11'))
    assert_raises(RuntimeError) { M.source_occurrences(extra, definitions) }
    assert_raises(RuntimeError) { M.assert_scope!(generated.drop(1)) }
    assert_raises(RuntimeError) { M.assert_scope!(generated + generated) }
    assert_raises(RuntimeError) do
      M.source_occurrences(inventory, [definitions.first.merge('english_aliases' => 'Eldest')])
    end
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, reviews.drop(1), generated, [], [])
    end
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, definitions, [])
    end
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, [], [generated.first])
    end
  end

  def test_prior_dispositions_are_preserved_and_only_exact_new_keys_allowed
    previous = {
      'entity_key' => 'person:caelrod', 'resource' => 'default', 'ID_Linha' => '56750',
      'Tipo_Variante' => '', 'status' => 'accepted', 'evidence' => 'prior decision',
      'korean_current' => '이전 텍스트'
    }
    before = M.prior_records([previous])
    additions = M.expected_keys.map do |row_key|
      { 'entity_key' => M::ENTITY, 'resource' => row_key[0],
        'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2] }
    end
    after = [previous.merge('korean_current' => '현재 텍스트'), *additions]
    M.verify_prior_records!(before, after)
    assert_raises(RuntimeError) do
      M.verify_prior_records!(before, [previous.merge('status' => 'excluded'), *additions])
    end
    assert_raises(RuntimeError) { M.verify_prior_records!(before, after.drop(1)) }
    assert_raises(RuntimeError) { M.verify_prior_records!(before, after + [additions.first]) }
  end

  def test_final_dispositions_require_runner_evidence_prefix_and_complete_keys
    reviews = %w[accepted not-an-issue excluded].each_with_index.map do |status, i|
      { 'resource' => 'default', 'ID_Linha' => i.to_s, 'Tipo_Variante' => '',
        'entity_key' => M::ENTITY, 'status' => status, 'evidence' => 'review evidence' }
    end
    final = reviews.map { |row| row.merge('evidence' => "D-#{M::D}: #{row['evidence']}") }
    M.verify_final_dispositions!(reviews, final.reverse)
    assert_raises(RuntimeError) { M.verify_final_dispositions!(reviews, reviews) }
    assert_raises(RuntimeError) { M.verify_final_dispositions!(reviews, final.drop(1)) }
    assert_raises(RuntimeError) { M.verify_final_dispositions!(reviews, final + [final.first]) }
    assert_raises(RuntimeError) do
      M.verify_final_dispositions!(reviews, final.map { |row| row.merge('status' => 'uncertain') })
    end
  end
end
