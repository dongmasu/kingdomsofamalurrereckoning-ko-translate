#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21721'

class ReviewShortLabelCandidatesD21721Test < Minitest::Test
  R = ReviewShortLabelCandidatesD21721
  M = ReviewedNameBatches

  def self.inventory
    @inventory ||= M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
  end

  def inventory
    self.class.inventory
  end

  def spec(entity)
    R::SPECS.find { |row| row.fetch(:key) == entity } || raise(entity)
  end

  def test_scope_covers_all_source_matches_and_stays_bounded
    generated = build_occurrences(inventory.values, R.definitions)
    assert_equal({
      'item:clan-totem' => 12,
      'place:consistorium' => 5,
      'place:crown-of-the-sun' => 9
    }, generated.group_by(&:first).transform_values(&:length))
    keys = generated.map { |row| row[1..3] }
    assert_equal 26, keys.uniq.length
    assert_equal 40, R::GROUPS.values.sum { |group| group.fetch(:expected_keys) }
    assert_operator 40, :<=, 50
    refute_includes R::GROUPS.keys, 'Cur'
  end

  def test_named_place_and_quest_object_have_explicit_categories
    assert_equal ['unique item', 'place', 'place'], R::SPECS.map { |row| row.fetch(:category) }
    assert_includes R::SPECS.first.fetch(:notes), 'default:412/43112'
    assert_includes spec('place:consistorium').fetch(:notes), 'under construction'
    assert_includes spec('place:crown-of-the-sun').fetch(:notes), 'sacred place'
  end

  def test_all_reviewed_spans_change_once_and_are_idempotent
    R::SPANS.each do |entity, spans|
      spans.each do |key, (old, replacement)|
        source = inventory.fetch(key)
        text = source.fetch('work_text')
        result, excluded = R.transform(spec(entity), key, text, source)
        refute excluded
        assert_equal text.sub(old, replacement), result
        assert_equal [result, false], R.transform(spec(entity), key, result, source)
        assert_equal text.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                     result.scan(ReviewedProperNameDiscovery::STRUCTURAL)
        assert_equal text.scan(/\r\n|\r|\n/), result.scan(/\r\n|\r|\n/)
      end
    end
  end

  def test_complete_pairs_and_source_article_are_preserved
    R::COMPLETE_KEYS.each do |entity, keys|
      keys.each do |key|
        source = inventory.fetch(key)
        assert_equal [source.fetch('work_text'), false],
                     R.transform(spec(entity), key, source.fetch('work_text'), source)
      end
    end
    assert_equal '콘시스토리움(the Consistorium)',
                 inventory.fetch(['base', '2166', '11']).fetch('work_text')
  end

  def test_longer_atomic_item_labels_are_excluded_byte_identically
    R::EXCLUDED_KEYS.each do |entity, keys|
      keys.each do |key|
        source = inventory.fetch(key)
        assert_equal [source.fetch('work_text'), true],
                     R.transform(spec(entity), key, source.fetch('work_text'), source)
        refute R::SPANS.fetch(entity).key?(key)
      end
    end
    assert_includes spec('item:clan-totem').fetch(:notes), 'D-20798'
    assert_includes spec('place:consistorium').fetch(:notes), 'D-20668'
  end

  def test_counsel_is_not_a_duplicate_arkes_or_a_global_generic_alias
    assert R::SPECS.none? { |row| row.fetch(:english) == 'Counsel' }
    assert_equal 'uncertain', R::GROUPS.fetch('Counsel').fetch(:disposition)
    evidence = R::GROUPS.fetch('Counsel').fetch(:evidence)
    assert_includes evidence, 'person:arkes'
    assert_includes evidence, '11381/13955 resolved'
    source = inventory.fetch(['default', '42824', ''])
    assert_match(/Counsel was actually Arkes/, JSON.parse(source.fetch('en_texts_json')).join)
    assert_includes JSON.parse(source.fetch('ja_texts_json')).join, 'アーケス'
    assert_includes source.fetch('zh_text'), '阿克斯'
  end

  def test_clouds_tunnel_does_not_establish_a_parent_place
    assert_equal 'uncertain', R::GROUPS.fetch('Crown of Clouds').fetch(:disposition)
    assert R::SPECS.none? { |row| row.fetch(:english) == 'Crown of Clouds' }
    assert_includes R::GROUPS.fetch('Crown of Clouds').fetch(:evidence), 'longer Crown of Clouds Tunnel'
  end

  def test_full_candidate_reviews_preserve_prior_terminal_decisions_and_holds
    index = M.table(M::INDEX).map(&:to_h)
    before = Marshal.dump(index)
    reviews = R.build_candidate_reviews(inventory, index, R.load_candidates)
    assert_equal before, Marshal.dump(index)
    assert_equal 40, reviews.length
    assert_equal 40, reviews.map { |row| M.key(row) }.uniq.length
    assert_equal({ 'accepted' => 17, 'excluded' => 3, 'not-an-issue' => 6, 'uncertain' => 14 },
                 reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length))
    reviews.each do |row|
      key = M.key(row)
      prior = index.select { |old| M.key(old) == key }.map do |old|
        [old.fetch('entity_key'), old.fetch('status'), old.fetch('evidence')]
      end
      assert_equal prior, JSON.parse(row.fetch('prior_index_dispositions_json'))
      refute_empty row.fetch('english')
      refute_empty row.fetch('japanese')
      refute_empty row.fetch('chinese')
      if %w[Counsel Crown\ of\ Clouds].include?(row.fetch('english_candidate'))
        assert_equal 'uncertain', row.fetch('disposition')
        assert_equal inventory.fetch(key).fetch('work_text'), row.fetch('korean')
      end
    end
    guardian = reviews.find { |row| M.key(row) == ['default', '49045', ''] }
    assert JSON.parse(guardian.fetch('prior_index_dispositions_json')).any? { |entity, state, _|
      entity == 'monster:the-guardian' && state == 'excluded'
    }
  end

  def test_changed_or_unmapped_spans_fail_closed
    entity = 'item:clan-totem'
    key = ['default', '25022', '']
    source = inventory.fetch(key)
    assert_raises(RuntimeError) { R.transform(spec(entity), key, '다른 물건', source) }
    assert_raises(RuntimeError) { R.transform(spec(entity), key, '부족 토템(Other Totem)', source) }
    assert_raises(RuntimeError) { R.transform(spec(entity), ['default', '999999', ''], '부족 토템', source) }
    wrong_source = source.merge('en_texts_json' => '["Other Totem"]')
    assert_raises(RuntimeError) { R.transform(spec(entity), key, '부족 토템', wrong_source) }
  end

  def test_ownership_collision_fails_before_apply
    owner = {
      'entity_key' => 'person:arkes', 'english_canonical' => 'Arkes', 'english_aliases' => ''
    }
    R.validate_ownership!([owner])
    collision = owner.merge('entity_key' => 'place:other', 'english_aliases' => 'Consistorium')
    assert_raises(RuntimeError) { R.validate_ownership!([owner, collision]) }
    assert_raises(RuntimeError) { R.validate_ownership!([]) }
  end

  def test_registration_manifest_passes_standard_runner_validation_without_writes
    generated = build_occurrences(inventory.values, R.definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      entity = occurrence.fetch('entity_key')
      old = source.fetch('work_text')
      proposed, excluded = R.transform(spec(entity), key, old, source)
      status = excluded ? 'excluded' : (old == proposed ? 'not-an-issue' : 'accepted')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'), 'evidence' => R::CONTEXT,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    ReviewedProperNameDiscovery.validate!(R.definitions, reviews, generated, glossary, index)
    assert_equal 26, reviews.length
    assert_equal 17, reviews.count { |row| row.fetch('status') == 'accepted' }
  end

  def test_preflight_does_not_call_a_writer_refresh_or_apply
    calls = ->(*) { flunk 'read-only preflight attempted a shared-state write or apply' }
    hashes = M.hashes
    M.stub(:refresh_inventory, calls) do
      M.stub(:write_table, calls) do
        ReviewedDiscoverySpecs.stub(:run, calls) do
          File.stub(:write, calls) do
            output, = capture_io { assert_equal 40, R.preflight.length }
            assert_equal 'read-only', JSON.parse(output).fetch('mode')
          end
        end
      end
    end
    assert_equal hashes, M.hashes
    refute File.exist?(R::OUTPUT)
    refute File.exist?(R::SNAPSHOT)
  end
end
