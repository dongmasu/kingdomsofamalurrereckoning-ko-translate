#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-late-alphabet-D21731'

class ReviewLateAlphabetD21731Test < Minitest::Test
  R = ReviewLateAlphabetD21731
  M = ReviewedNameBatches
  CANDIDATE_FIXTURE = File.join(__dir__, 'proper-name-short-label-discovery-D21727.tsv')

  def self.inventory
    @inventory ||= M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
  end

  def self.generated
    @generated ||= build_occurrences(inventory.values, R.definitions)
  end

  def self.reviews
    @reviews ||= R.build_candidate_reviews(inventory, M.table(M::INDEX).map(&:to_h),
                                           R.load_candidates(candidate_path))
  end

  def self.candidate_path
    File.exist?(R::INPUT) ? R::INPUT : CANDIDATE_FIXTURE
  end

  def inventory
    self.class.inventory
  end

  def spec(entity)
    R::SPECS.find { |row| row.fetch(:key) == entity } || raise(entity)
  end

  def test_eight_groups_cover_exactly_44_source_keys
    assert_equal 'proper-name-short-label-discovery-D21730.tsv', File.basename(R::INPUT)
    assert_equal [2, 10, 7, 4, 3, 11, 3, 4],
                 R::GROUPS.values.map { |group| group.fetch(:expected_keys) }
    reviews = self.class.reviews
    assert_equal 44, reviews.length
    assert_equal 44, reviews.map { |row| M.key(row) }.uniq.length
    assert_operator reviews.map { |row| M.key(row) }.uniq.length, :<=, 50
    assert_equal R::GROUPS.keys.sort, reviews.map { |row| row.fetch('english_candidate') }.uniq.sort
  end

  def test_registered_scopes_have_source_supported_categories_and_counts
    assert_equal(
      {
        'item:votive-of-leaf' => 2,
        'lore:wall-of-thorns' => 10,
        'place:wandering-well' => 7,
        'title:warden-of-light' => 4,
        'unique_item:warsworn-ledger' => 3,
        'place:vorm-lodge' => 4
      },
      self.class.generated
        .group_by(&:first).transform_values(&:length)
    )
    assert_equal ['unique item', 'lore term', 'place', 'title', 'unique item', 'place'],
                 R::SPECS.map { |row| row.fetch(:category) }
  end

  def test_wall_is_a_lore_barrier_not_a_place_or_objective
    evidence = spec('lore:wall-of-thorns').fetch(:notes)
    assert_includes evidence, 'magical'
    assert_includes evidence, 'not a place'
    assert_equal [['default', '57998', '']], R::EXCLUDED_KEYS.fetch('lore:wall-of-thorns')
    source = inventory.fetch(['default', '57998', ''])
    assert_equal ['가시덩굴 장벽을 통과하라', true],
                 R.transform(spec('lore:wall-of-thorns'), ['default', '57998', ''],
                             source.fetch('work_text'), source)
  end

  def test_wandering_well_preserves_atomic_draught_and_d11477_hold
    assert_equal [
      ['base', '3618', '11'], ['default', '33169', ''], ['default', '35453', '']
    ], R::EXCLUDED_KEYS.fetch('place:wandering-well')
    assert_includes spec('place:wandering-well').fetch(:notes), 'D-11477'
    reviews = self.class.reviews
    row = reviews.find { |item| M.key(item) == ['default', '35453', ''] }
    assert_equal 'uncertain', row.fetch('disposition')
    assert_equal inventory.fetch(M.key(row)).fetch('work_text'), row.fetch('korean')
  end

  def test_generic_warsworn_descriptors_and_historical_holds_are_not_registered
    refute R::SPECS.any? { |row| row.fetch(:english).start_with?('Warsworn Galley') }
    refute R::SPECS.any? { |row| row.fetch(:english).start_with?('Warsworn Keep') }
    reviews = self.class.reviews
    {
      ['default', '52447', ''] => 'Warsworn Galley',
      ['default', '35531', ''] => 'Warsworn Keep',
      ['default', '48933', ''] => 'Warsworn Keep'
    }.each do |key, term|
      row = reviews.find { |item| item.fetch('english_candidate') == term && M.key(item) == key }
      assert_equal 'uncertain', row.fetch('disposition')
      assert_match(/preserve/i, row.fetch('evidence'))
    end
  end

  def test_exact_span_transforms_are_idempotent_and_byte_structural_safe
    R::SPANS.each do |entity, spans|
      spans.each do |key, (old, replacement)|
        source = inventory.fetch(key)
        text = source.fetch('work_text')
        changed, excluded = R.transform(spec(entity), key, text, source)
        refute excluded
        assert_equal text.sub(old, replacement), changed
        assert_equal [changed, false], R.transform(spec(entity), key, changed, source)
        assert_equal text.scan(ReviewedProperNameDiscovery::STRUCTURAL),
                     changed.scan(ReviewedProperNameDiscovery::STRUCTURAL)
        assert_equal text.scan(/\r\n|\r|\n/), changed.scan(/\r\n|\r|\n/)
      end
    end
  end

  def test_complete_labels_and_owner_exclusions_are_preserved_or_scoped
    R::COMPLETE_KEYS.each do |entity, keys|
      keys.each do |key|
        source = inventory.fetch(key)
        assert_equal [source.fetch('work_text'), false],
                     R.transform(spec(entity), key, source.fetch('work_text'), source)
      end
    end
    index = M.table(M::INDEX).map(&:to_h)
    [
      ['base', '4137', '11'], ['default', '81', ''],
      ['default', '34595', ''], ['default', '59086', '']
    ].each do |key|
      assert index.any? do |row|
        M.key(row) == key && row.fetch('entity_key') == 'person:vorm' &&
          row.fetch('status') == 'excluded'
      end
    end
  end

  def test_candidate_manifest_retains_all_prior_index_dispositions
    index = M.table(M::INDEX).map(&:to_h)
    before = Marshal.dump(index)
    reviews = self.class.reviews
    assert_equal before, Marshal.dump(index)
    assert_equal({ 'accepted' => 21, 'excluded' => 3, 'not-an-issue' => 15, 'uncertain' => 5 },
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
    end
  end

  def test_standard_registration_validation_accepts_only_reviewed_occurrences
    generated = self.class.generated.map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      spec = R::SPECS.find { |row| row.fetch(:key) == occurrence.fetch('entity_key') }
      old = source.fetch('work_text')
      proposed, excluded = R.transform(spec, key, old, source)
      status = excluded ? 'excluded' : (old == proposed ? 'not-an-issue' : 'accepted')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => occurrence.fetch('entity_key'), 'status' => status,
        'old' => old, 'new' => proposed,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'), 'evidence' => R::CONTEXT,
        'entity_dispositions_json' => JSON.generate(occurrence.fetch('entity_key') => status)
      }
    end
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    ReviewedProperNameDiscovery.validate!(R.definitions, reviews, generated, glossary, index)
    assert_equal 30, generated.length
    assert_equal 21, reviews.count { |row| row.fetch('status') == 'accepted' }
  end

  def test_ownership_collisions_fail_closed
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    R.validate_ownership!(glossary)
    collision = glossary.first.merge(
      'entity_key' => 'test:collision', 'english_canonical' => 'Vorm Lodge',
      'english_aliases' => ''
    )
    assert_raises(RuntimeError) { R.validate_ownership!(glossary + [collision]) }
  end

  def test_check_mode_is_read_only
    fail_if_called = ->(*) { flunk 'read-only check called an apply/shared-state writer' }
    hashes = M.hashes
    M.stub(:refresh_inventory, fail_if_called) do
      M.stub(:write_table, fail_if_called) do
        ReviewedDiscoverySpecs.stub(:run, fail_if_called) do
          ReviewedProperNameDiscovery.stub(:run, fail_if_called) do
            File.stub(:write, fail_if_called) do
              R.stub(:load_candidates, R.load_candidates(self.class.candidate_path)) do
                output, = capture_io { assert_equal 44, R.preflight.length }
                assert_equal 'read-only', JSON.parse(output).fetch('mode')
              end
            end
          end
        end
      end
    end
    assert_equal hashes, M.hashes
    refute File.exist?(R::OUTPUT)
    refute File.exist?(R::SNAPSHOT)
  end
end
