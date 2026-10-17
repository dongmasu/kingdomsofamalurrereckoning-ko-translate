#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-chaos-magic-weapons-D21522'

class ChaosMagicWeaponsD21522Test < Minitest::Test
  W = ChaosMagicWeaponsD21522
  HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def inventory
    self.class.inventory
  end

  def self.inventory
    @inventory ||= W.source_inventory
  end

  def definitions
    W.definitions_for(HEADERS)
  end

  def source(id)
    row = inventory.fetch(['default', id, ''])
    return row unless File.file?(W::REVIEWS)

    historical = self.class.saved_reviews.fetch(id)
    row.merge('work_text' => historical.fetch('old'))
  end

  def self.saved_reviews
    @saved_reviews ||= W::M.table(W::REVIEWS).map(&:to_h).to_h do |row|
      [row.fetch('ID_Linha'), row]
    end
  end

  def review(id)
    entities = W.expected_pairs.select { |pair| pair[2] == id }.map(&:first).sort
    W.review_source(source(id), entities)
  end

  def test_definitions_are_field_and_weapon_class_not_single_skill_or_unique_item
    magic, weapon = definitions
    assert_equal [W::MAGIC, W::WEAPON], definitions.map { |row| row['entity_key'] }
    assert_equal 'lore term', magic['category']
    assert_equal '혼돈 마법(Chaos Magic)', magic['korean_canonical']
    assert_equal '', magic['english_aliases']
    assert_equal 'item', weapon['category']
    assert_equal '혼돈 무기(Chaos Weapon)', weapon['korean_canonical']
    assert_equal 'Chaos Weapons', weapon['english_aliases']
    assert_includes weapon['notes'], 'not a unique item'
    assert_includes weapon['notes'], 'D-21521'
    refute_includes weapon['english_aliases'], 'Core'
    refute_includes weapon['english_aliases'], 'non-Chaos'
  end

  def test_exact_all_resource_source_scope_and_batch_boundaries
    generated = W.generated_for(inventory, definitions)
    assert W.validate_scope!(inventory, generated)
    assert_equal 33, generated.count { |row| row['entity_key'] == W::MAGIC }
    assert_equal 56, generated.count { |row| row['entity_key'] == W::WEAPON }
    assert_equal 89, W.expected_pairs.length
    assert_equal 87, W.expected_keys.length
    assert_equal [50, 37], W.expected_keys.each_slice(50).map(&:length)
    assert generated.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'] == '' }
    assert_includes generated.map { |row| row['ID_Linha'] }, '61394'
    assert_equal %w[9966 31656],
                 generated.group_by { |row| W::M.key(row) }
                   .select { |_, rows| rows.length == 2 }.keys.map { |key| key[1] }
    assert_equal 50, (W::WEAPON_IDS - W::CORE_ONLY_IDS).length
  end

  def test_source_guards_fail_on_any_locale_drift_or_scope_loss
    generated = W.generated_for(inventory, definitions)
    assert_raises(RuntimeError) { W.validate_scope!(inventory, generated.drop(1)) }
    assert_raises(RuntimeError) { W.validate_scope!(inventory, generated + [generated.first]) }
    %w[en_texts_json ja_texts_json zh_text].each do |field|
      changed = inventory.merge(
        ['default', '350', ''] => source('350').merge(field => "#{source('350')[field]} ")
      )
      assert_raises(RuntimeError) { W.validate_scope!(changed, generated) }
    end
  end

  def test_all_87_rows_have_source_evidence_explicit_dispositions_and_safe_transforms
    generated = W.generated_for(inventory, definitions)
    rows = W.reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    # A new discovery validates independently of an eventual applied glossary.
    ReviewedProperNameDiscovery.validate!(definitions, rows, generated, [], [])
    rows.each do |row|
      assert_equal JSON.parse(source(row['ID_Linha'])['en_texts_json']).join("\n"), row['english']
      assert_equal JSON.parse(source(row['ID_Linha'])['ja_texts_json']).join("\n---\n"), row['japanese']
      assert_equal source(row['ID_Linha'])['zh_text'], row['chinese']
      assert_includes row['evidence'], "default:#{row['ID_Linha']}:"
      assert_equal row['entity_key'].split('|').sort,
                   JSON.parse(row['entity_dispositions_json']).keys.sort
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_equal row['new'],
                   W.normalize(row['new'], source(row['ID_Linha']), row['entity_key'].split('|'))
    end
  end

  def test_core_only_exclusions_are_not_registered_as_parent_weapons
    W::CORE_ONLY_IDS.each do |id|
      original = source(id)['work_text']
      assert_equal original, W.normalize_entity(W::WEAPON, original, source(id))
      row = review(id)
      assert_equal 'excluded', JSON.parse(row['entity_dispositions_json'])[W::WEAPON]
      assert_includes row['evidence'], 'D-21521'
      if id == '31656'
        expected = original.sub(/혼돈 마법(?:\(Chaos Magic\))?/, '혼돈 마법(Chaos Magic)')
        assert_equal expected,
                     W.normalize(original, source(id), [W::MAGIC, W::WEAPON])
      else
        assert_equal 'excluded', row['status']
        assert_equal row['old'], row['new']
      end
    end
  end

  def test_mixed_core_and_parent_rows_preserve_complete_core_annotations
    {
      '26266' => [
        '간단해. 혼돈 무기 핵(Chaos Weapon Core)을 가져오면 내가 혼돈 무기를 만들어 주지.',
        '간단해. 혼돈 무기 핵(Chaos Weapon Core)을 가져오면 내가 혼돈 무기(Chaos Weapon)를 만들어 주지.'
      ],
      '63443' => [
        '{*1혼돈 무기 핵}(Chaos weapon cores)을 만든다. 새로운 혼돈 무기를 만든다.',
        '{*1혼돈 무기 핵}(Chaos weapon cores)을 만든다. 새로운 혼돈 무기(Chaos Weapons)를 만든다.'
      ]
    }.each do |id, (old_text, expected)|
      assert_equal expected, W.normalize_entity(W::WEAPON, old_text, source(id))
    end
    row = review('26266')
    assert_equal row['old'].split('가져오면').first,
                 row['new'].split('가져오면').first
    refute_includes row['new'], '혼돈 무기(Chaos Weapon)의 핵'
  end

  def test_opaque_name_markers_are_annotated_outside_not_rewritten
    %w[9945 56572 61394].each do |id|
      row = review(id)
      assert_includes row['new'], '{*1혼돈 무기}(Chaos Weapons)'
      refute_includes row['new'], '{*1혼돈 무기(Chaos'
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
    end
    row = review('63443')
    assert_includes row['new'], '{*1혼돈 무기 핵}'
    refute_includes row['new'], '{*1혼돈 무기 핵}(Chaos Weapons)'
  end

  def test_mixed_numbers_repeated_mentions_and_legitimate_omission
    assert_equal ['Chaos Weapons', 'Chaos Weapon', 'Chaos Weapons'],
                 review('51825')['new'].scan(/혼돈 무기\((Chaos Weapons?)\)/).flatten
    assert_equal %w[37903 61754].map { 2 },
                 %w[37903 61754].map { |id| review(id)['new'].scan('혼돈 마법(Chaos Magic)').length }
    assert_equal 2, review('59599')['new'].scan('혼돈 무기(Chaos Weapons)').length
    assert_equal ['Chaos Weapons', 'Chaos Weapons', 'Chaos Weapons',
                  'Chaos Weapons', 'Chaos Weapon', 'Chaos Weapons'],
                 review('9945')['new'].scan(/\((Chaos Weapons?)\)/).flatten
    assert_includes review('9945')['new'], '고품질 무기를 분해하려면'
    refute_includes review('9945')['new'], '고품질 혼돈'
  end

  def test_negative_weapon_contrasts_are_atomic_and_do_not_change_the_sentence
    row = review('25542')
    assert_includes row['new'], '혼돈 무기(Chaos Weapons)로 갑옷을'
    assert_includes row['new'], '혼돈 무기가 아닌 다른 무기(non-Chaos Weapons)로'
    assert_includes row['new'], '혼돈 무기(Chaos Weapon)를,'
    assert_includes row['new'], '비혼돈 무기(non-Chaos weapon)를 장착하는'
    refute_includes row['new'], '비혼돈 무기(Chaos'
    refute_includes row['new'], '혼돈 무기(Chaos Weapons)가 아닌'
    assert_equal row['old'], row['new'].gsub(/\((?:non-)?Chaos [Ww]eapons?\)/, '')
  end

  def test_particles_and_salvation_hold_are_unchanged
    {
      '3417' => '혼돈 마법(Chaos Magic)은',
      '9515' => '혼돈 무기(Chaos Weapon)로는',
      '27165' => '혼돈 무기(Chaos Weapons)가',
      '32925' => '혼돈 무기(Chaos Weapons)만',
      '35736' => '혼돈 무기(Chaos Weapons)를',
      '58931' => '혼돈 무기(Chaos Weapons)와'
    }.each { |id, expected| assert_includes review(id)['new'], expected }
    row = review('43683')
    assert_includes row['new'], '혼돈 무기(Chaos Weapons)를 회수하고 제작할 수 있습니다.'
    assert_includes row['evidence'], 'D-13412'
    assert_includes row['evidence'], 'remains uncertain'
    assert_equal row['old'], row['new'].sub('(Chaos Weapons)', '')
  end

  def test_normalization_fails_closed_on_missing_extra_or_unreviewed_names
    src = source('350')
    assert_raises(RuntimeError) { W.normalize_entity(W::MAGIC, '마법', src) }
    assert_raises(RuntimeError) { W.normalize_entity(W::MAGIC, '혼돈 마법과 혼돈 마법', src) }
    assert_raises(RuntimeError) { W.normalize_entity(W::WEAPON, '혼돈 무기', src) }
    assert_raises(RuntimeError) do
      W.normalize_entity(W::WEAPON, '혼돈 무기로 갑옷을 깬다.', source('25542'))
    end
    assert_raises(RuntimeError) do
      W.normalize_entity(W::MAGIC, '{*1혼돈 마법}', src)
    end
    assert_raises(RuntimeError) do
      W.normalize_entity(W::MAGIC, '혼돈 마법(Other Name)', src)
    end
    assert_raises(RuntimeError) do
      W.normalize_entity(W::WEAPON, '{*1혼돈 무기}(Other Name)', source('61394'))
    end
  end

  def test_prior_entity_records_are_preserved_and_duplicate_occurrences_rejected
    prior = {
      'entity_key' => 'item:chaos-weapon-core', 'resource' => 'default', 'ID_Linha' => '26266',
      'Tipo_Variante' => '', 'status' => 'accepted', 'evidence' => 'D-21521: core only',
      'korean_current' => 'old cell'
    }
    before = W.prior_records([prior])
    additions = W.generated_for(inventory, definitions)
    assert W.verify_prior_records!(before, [prior.merge('korean_current' => 'new cell'), *additions])
    assert_raises(RuntimeError) do
      W.verify_prior_records!(before, [prior.merge('evidence' => 'overwritten'), *additions])
    end
    assert_raises(RuntimeError) { W.prior_records([prior, prior.dup]) }
  end

  def test_new_entity_snapshots_include_both_candidates_on_overlap_rows
    row = review('9966').merge(
      'previous_status' => JSON.generate(W::MAGIC => 'needs-context', W::WEAPON => 'needs-context'),
      'previous_evidence' => JSON.generate(W::MAGIC => W::INITIAL_EVIDENCE, W::WEAPON => W::INITIAL_EVIDENCE)
    )
    assert W.verify_snapshot!(row)
    assert_raises(RuntimeError) do
      W.verify_snapshot!(row.merge('previous_status' => JSON.generate(W::MAGIC => 'needs-context')))
    end
    assert_raises(RuntimeError) do
      W.verify_snapshot!(row.merge(
        'previous_evidence' => JSON.generate(W::MAGIC => W::INITIAL_EVIDENCE, W::WEAPON => 'different')
      ))
    end
  end

  def memory_table(headers, rows)
    CSV.parse(
      CSV.generate(col_sep: "\t") do |csv|
        csv << headers
        rows.each { |row| csv << headers.map { |header| row[header] } }
      end,
      headers: true, col_sep: "\t"
    )
  end

  def test_saved_manifest_validation_accepts_unrelated_live_edits_but_rejects_lost_labels
    original = inventory.merge(
      W.expected_keys.to_h do |key|
        [key, source(key[1])]
      end
    )
    generated = W.generated_for(original, definitions)
    reviews = W.reviews_for(original, generated)
    edits = reviews.map do |row|
      entities = row.fetch('entity_key').split('|')
      row.merge(
        'previous_status' => JSON.generate(entities.to_h { |entity| [entity, 'needs-context'] }),
        'previous_evidence' => JSON.generate(entities.to_h { |entity| [entity, W::INITIAL_EVIDENCE] })
      )
    end
    live = original.merge(
      reviews.to_h do |row|
        key = W::M.key(row)
        [key, original.fetch(key).merge('work_text' => "#{row.fetch('new')} 다른 이름(Other Name).")]
      end
    )
    index = generated.map do |row|
      ordinal = reviews.index { |review| W::M.key(review) == W::M.key(row) }
      review = reviews.fetch(ordinal)
      status = JSON.parse(review.fetch('entity_dispositions_json')).fetch(row.fetch('entity_key'))
      row.merge(
        'status' => status, 'evidence' => "D-#{W::D + ordinal / 50}: #{review.fetch('evidence')}",
        'korean_current' => live.fetch(W::M.key(row)).fetch('work_text')
      )
    end
    tables = {
      W::DEFINITIONS => memory_table(HEADERS, definitions),
      W::REVIEWS => memory_table(W::M::HEADERS.take(12), reviews),
      ReviewedProperNameDiscovery::GLOSSARY => memory_table(HEADERS, definitions),
      W::M::INDEX => memory_table(OCCURRENCE_HEADERS, index)
    }
    edits.each_slice(50).with_index do |rows, ordinal|
      path = File.join(File.dirname(W::REVIEWS), "proper-name-edits-D#{W::D + ordinal}.tsv")
      tables[path] = memory_table(W::M::HEADERS, rows)
    end
    W::M.stub(:table, ->(path) { tables.fetch(path) }) do
      W.stub(:source_inventory, live) { assert W.validate_saved_manifest! }
      key = ['default', '350', '']
      damaged = live.merge(key => live.fetch(key).merge(
        'work_text' => live.fetch(key).fetch('work_text').sub('(Chaos Magic)', '')
      ))
      W.stub(:source_inventory, damaged) do
        assert_raises(RuntimeError) { W.validate_saved_manifest! }
      end
      corrupted = index.map.with_index do |row, ordinal|
        ordinal.zero? ? row.merge('status' => 'uncertain') : row
      end
      tables[W::M::INDEX] = memory_table(OCCURRENCE_HEADERS, corrupted)
      W.stub(:source_inventory, live) do
        assert_raises(RuntimeError) { W.validate_saved_manifest! }
      end
    end
  end

  def test_live_or_historical_manifests_and_targeted_labels_read_only
    if File.file?(W::REVIEWS)
      assert W.validate_saved_manifest!
      return
    end
    generated = W.generated_for(inventory, definitions)
    rows = W.reviews_for(inventory, generated)
    assert_equal 82, rows.count { |row| row['old'] != row['new'] }
    assert_equal 5, rows.count { |row| row['status'] == 'excluded' }
    assert_equal({ 'accepted' => 83, 'excluded' => 6 },
                 rows.flat_map { |row| JSON.parse(row['entity_dispositions_json']).values }
                   .group_by { |status| status }.transform_values(&:length))
    ReviewedProperNameDiscovery.validate!(
      definitions, rows, generated,
      W::M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h),
      W::M.table(W::M::INDEX).map(&:to_h)
    )
    rows.select { |row| row['old'] != row['new'] }
      .group_by { |row| row['resource'] }.each do |resource, targets|
        prepared = ProperNameCellEditor.prepare(File.binread(W::M.csv_path(resource)), targets)
        refute_nil prepared
      end
  end
end
