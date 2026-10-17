require 'minitest/autorun'
require_relative 'prepare-billis-nuer-short-alias-D21382'

class BillisNuerShortAliasD21382Test < Minitest::Test
  M = BillisNuerShortAliasD21382

  def test_canonicals_variants_and_family_entities_are_preserved
    glossary = M::M.table(M::GLOSSARY).map(&:to_h)
    updates = M.updated_entities(glossary)
    after_glossary = M.updated_glossary(glossary, updates)
    billis = updates.fetch('person:billis-aideh')
    nuer = updates.fetch('person:nuer-bedlym')
    bedlym_before = glossary.find { |row| row['entity_key'] == 'person:bedlym' }
    bedlym_after = after_glossary.find { |row| row['entity_key'] == 'person:bedlym' }

    assert_includes billis['english_aliases'].split('|'), 'Billis'
    assert_equal '빌리스 에이데(Billis Aideh)', billis['korean_canonical']
    assert_includes billis['korean_variants'].split('|'), '빌리스'
    assert_includes nuer['english_aliases'].split('|'), 'Nuer'
    assert_equal '누어 베들림(Nuer Bedlym)', nuer['korean_canonical']
    assert_equal %w[누에르 뉴어 누어], nuer['korean_variants'].split('|').last(3)
    assert_equal bedlym_before, bedlym_after
    refute_includes bedlym_after['english_aliases'].to_s.split('|'), 'Nuer'
  end

  def test_short_name_normalization_preserves_particles_and_bedlym
    billis = M::CONFIG.fetch('person:billis-aideh')
    nuer = M::CONFIG.fetch('person:nuer-bedlym')

    assert_equal ['빌리스(Billis)와 빌리스(Billis)는', 2],
      M.normalize_short_name('빌리스와 빌리스는', billis)
    assert_equal ['누어(Nuer)의 신용을 낮춰라. 누어(Nuer) 베들림(Bedlym)', 2],
      M.normalize_short_name('뉴어의 신용을 낮춰라. 누에르 베들림(Bedlym)', nuer)
    assert_equal ['(누어)는', 0], M.normalize_short_name('(누어)는', nuer)
  end

  def test_live_english_counts_keys_sources_and_isolated_inventory
    shared_path = M::M::INVENTORY
    shared_before = File.exist?(shared_path) ? File.binread(shared_path) : nil
    inventory = M.build_isolated_inventory
    glossary = M::M.table(M::GLOSSARY).map(&:to_h)
    index = M::M.table(M::INDEX).map(&:to_h)
    updates = M.updated_entities(glossary)
    generated = M.alias_occurrences(inventory, glossary, updates)
    scope = M.classify_scope(generated, index, inventory)
    reviews = M.build_reviews(scope.fetch(:new_rows), inventory)

    assert_equal 31, generated.length
    assert_equal 15, scope.fetch(:prior).length
    assert_equal 16, scope.fetch(:short_only).length
    assert_equal(
      M.ordered_keys(M::EXPECTED_SHORT_KEYS.values.flatten(1)),
      M.ordered_keys(scope.fetch(:short_only).map { |key| key.drop(1) })
    )
    assert_equal({ 'accepted' => 12, 'not-an-issue' => 4 },
      reviews.group_by { |row| row.fetch('status') }.transform_values(&:length))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.validate_byte_edits!(reviews)
    assert_equal shared_before, File.exist?(shared_path) ? File.binread(shared_path) : nil
  end

  def test_alias_collisions_are_rejected
    glossary = M::M.table(M::GLOSSARY).map(&:to_h)
    collision = glossary.map(&:dup)
    collision.find { |row| row['entity_key'] == 'person:bedlym' }['english_aliases'] = 'Billis'
    assert_raises(RuntimeError) { M.updated_entities(collision) }
  end

  def test_runtime_snapshot_covers_source_and_work_csv_bytes_without_changes
    before = M.snapshot
    assert_equal 9, before.fetch(:source_bytes).length
    assert_equal before.fetch(:source_bytes).transform_values { |bytes|
      Digest::SHA256.hexdigest(bytes)
    }, before.fetch(:source_hashes)
    assert_equal 3, before.fetch(:csv_bytes).length
    M.assert_snapshot_unchanged!(before)
  end

  def test_historical_rows_allow_only_alias_metadata_and_active_snapshot_refresh
    before = {
      'resource' => 'default', 'ID_Linha' => '549', 'Tipo_Variante' => '',
      'entity_key' => 'person:billis-aideh', 'status' => 'not-an-issue',
      'evidence' => 'D-20394: Existing full-name decision',
      'matched_english' => 'Billis Aideh', 'korean_current' => 'old snapshot',
      'extra' => 'preserve'
    }
    inventory = { M::M.key(before) => { 'work_text' => 'active CSV text' } }
    after = before.merge(
      'matched_english' => 'Billis|Billis Aideh',
      'korean_current' => 'active CSV text'
    )

    assert M.expected_historical_row(before, after, inventory, 'Billis|Billis Aideh')
    refute M.expected_historical_row(
      before, after.merge('status' => 'accepted'), inventory, 'Billis|Billis Aideh'
    )
    refute M.expected_historical_row(
      before, after.merge('evidence' => 'rewritten'), inventory, 'Billis|Billis Aideh'
    )
    refute M.expected_historical_row(
      before, after.merge('extra' => 'changed'), inventory, 'Billis|Billis Aideh'
    )
  end
end
