#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-walls-D21460'

class WallsD21460Test < Minitest::Test
  W = WallsD21460
  HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def definitions
    W.definitions_for(HEADERS)
  end

  def fixture_inventory
    W::EXPECTED_IDS.to_h do |id|
      spec = W::NAMED[id] || W::EXCLUDED.fetch(id)
      english = spec[0]
      english = "#{english}. The Walls." unless english.match?(/\bthe walls\b/i)
      korean = W::NAMED.key?(id) ? "앞\r\n#{spec[3]} 뒤 {TOKEN}" : '그 성벽은 그대로다.'
      row = {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'en_texts_json' => JSON.generate([english]),
        'ja_texts_json' => JSON.generate([spec[1]]),
        'zh_text' => spec[2], 'work_text' => korean
      }
      [W::M.key(row), row]
    end
  end

  def reviewed(inventory = fixture_inventory)
    generated = W.generated_for(inventory, definitions)
    W.reviews_for(inventory, generated)
  end

  def test_definition_is_place_without_wall_or_walls_alias
    definition = definitions.fetch(0)
    assert_equal W::ENTITY, definition.fetch('entity_key')
    assert_equal 'The Walls', definition.fetch('english_canonical')
    assert_equal 'place', definition.fetch('category')
    assert_equal W::CANONICAL, definition.fetch('korean_canonical')
    assert_empty definition.fetch('english_aliases')
    assert_includes definition.fetch('notes'), 'not physical walls'
    inventory = fixture_inventory
    %w[Wall Walls].each_with_index do |english, ordinal|
      key = ['base', (90_000 + ordinal).to_s, '11']
      inventory[key] = inventory.values.first.merge(
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'en_texts_json' => JSON.generate([english])
      )
    end
    assert_equal 53, W.generated_for(inventory, definitions).length
  end

  def test_all_53_have_explicit_dispositions_and_exact_localized_evidence
    inventory = fixture_inventory
    generated = W.generated_for(inventory, definitions)
    reviews = W.reviews_for(inventory, generated)
    assert_equal W.expected_pairs.sort,
                 generated.map { |row| [row.fetch('entity_key'), *W::M.key(row)] }.sort
    assert_equal W::EXPECTED_IDS, reviews.map { |row| row.fetch('ID_Linha') }
    assert_equal({ 'accepted' => 17, 'not-an-issue' => 2, 'excluded' => 34 },
                 reviews.group_by { |row| row.fetch('status') }.transform_values(&:length))
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, [], [])
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.each do |row|
      assert_equal({ W::ENTITY => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')))
      assert_includes row.fetch('evidence'), "default:#{row.fetch('ID_Linha')}:"
    end
  end

  def test_named_spans_preserve_everything_else_and_use_local_english
    rows = reviewed.to_h { |row| [row.fetch('ID_Linha'), row] }
    W::NAMED.each do |id, spec|
      assert_equal "앞\r\n#{spec[4]} 뒤 {TOKEN}", rows.fetch(id).fetch('new')
    end
    assert_includes rows.fetch('46393').fetch('new'), '장벽(The Walls)은'
    refute_includes rows.fetch('46393').fetch('new'), ')는'
    %w[5678 22108 25637 44158 45848 59610 60038].each do |id|
      assert_includes rows.fetch(id).fetch('new'), '장벽(Walls)'
    end
    %w[8090 22615].each do |id|
      assert_equal rows.fetch(id).fetch('old'), rows.fetch(id).fetch('new')
    end
  end

  def test_adessa_complete_compound_remains_atomic
    row = reviewed.find { |review| review.fetch('ID_Linha') == '61102' }
    assert_equal "앞\r\n아데사 - 장벽(Adessa - The Walls) 뒤 {TOKEN}", row.fetch('new')
    refute_includes row.fetch('new'), '장벽(The Walls)'
    assert_equal 1, row.fetch('new').scan('(Adessa - The Walls)').length
  end

  def test_all_physical_wall_exclusions_are_unchanged_even_in_adessa
    rows = reviewed.to_h { |row| [row.fetch('ID_Linha'), row] }
    assert_equal 34, W::EXCLUDED.length
    W::EXCLUDED.each_key do |id|
      row = rows.fetch(id)
      assert_equal 'excluded', row.fetch('status')
      assert_equal row.fetch('old'), row.fetch('new')
    end
    %w[36988 63792].each do |id|
      assert_includes rows.fetch(id).fetch('evidence'), 'not the district' if id == '36988'
      refute_includes rows.fetch(id).fetch('new'), '(The Walls)'
    end
  end

  def test_source_key_count_locale_and_korean_drift_fail_closed
    inventory = fixture_inventory
    generated = W.generated_for(inventory, definitions)
    assert_raises(RuntimeError) { W.reviews_for(inventory, generated.drop(1)) }
    assert_raises(RuntimeError) { W.reviews_for(inventory, generated + [generated.first]) }
    extra = generated.first.merge('resource' => 'affix', 'ID_Linha' => '123', 'Tipo_Variante' => '1')
    assert_raises(RuntimeError) { W.reviews_for(inventory, generated + [extra]) }
    %w[en_texts_json ja_texts_json zh_text work_text].each do |field|
      changed = fixture_inventory
      changed.fetch(['default', '5678', ''])[field] = field.end_with?('_json') ? '["unrelated"]' : 'unrelated'
      assert_raises(RuntimeError) { W.reviews_for(changed, generated) }
    end
    changed = fixture_inventory
    row = changed.fetch(['default', '5678', ''])
    row['work_text'] += ' 월즈(Walls)'
    assert_raises(RuntimeError) { W.reviews_for(changed, generated) }
  end

  def test_bone_wall_thorns_and_other_names_are_never_transformed
    inventory = fixture_inventory
    row = inventory.fetch(['default', '5678', ''])
    row['work_text'] += ' 뼈의 벽(Bone Wall) 가시벽(Wall of Thorns) 아르카디움(Arcadium)'
    result = reviewed(inventory).find { |review| review.fetch('ID_Linha') == '5678' }
    assert_equal row.fetch('work_text').sub('월즈(Walls)', '장벽(Walls)'), result.fetch('new')
  end

  def first_batch_result(generated, reviews)
    ordered = reviews.to_h { |row| [W::M.key(row), row] }
    applied_ids = W::EXPECTED_IDS.take(50)
    generated.map do |row|
      review = ordered.fetch(W::M.key(row))
      next row.dup unless applied_ids.include?(row.fetch('ID_Linha'))

      row.merge('status' => review.fetch('status'), 'korean_current' => review.fetch('new'),
                'evidence' => "D-#{W::D}: #{review.fetch('evidence')}")
    end
  end

  def test_first_50_proof_defers_only_last_three_and_protects_old_decisions
    inventory = fixture_inventory
    generated = W.generated_for(inventory, definitions)
    reviews = W.reviews_for(inventory, generated)
    old = {
      'entity_key' => 'place:adessa', 'resource' => 'default', 'ID_Linha' => '61102',
      'Tipo_Variante' => '', 'status' => 'accepted', 'evidence' => 'prior complete label',
      'matched_english' => 'Adessa', 'english_source' => 'Adessa - The Walls',
      'korean_current' => 'old'
    }
    snapshot = W.prior_records([old])
    result = [old.merge('korean_current' => 'refreshed'), *first_batch_result(generated, reviews)]
    W.verify_prior_records!(snapshot, result)
    W.verify_first_batch!(result, reviews, generated)
    assert_equal %w[61540 63792 64126], reviews.drop(50).map { |row| row.fetch('ID_Linha') }
    result.first['evidence'] = 'superseded without authority'
    assert_raises(RuntimeError) { W.verify_prior_records!(snapshot, result) }
    assert_raises(RuntimeError) { W.prior_records([old, old.dup]) }
    assert_raises(RuntimeError) { W.verify_prior_records!(snapshot, result.drop(1)) }
    result = first_batch_result(generated, reviews)
    result.last['status'] = 'excluded'
    assert_raises(RuntimeError) { W.verify_first_batch!(result, reviews, generated) }
  end

  def test_apply_registers_all_53_but_calls_only_one_batch_without_writing
    inventory = fixture_inventory
    generated = W.generated_for(inventory, definitions)
    reviews = W.reviews_for(inventory, generated)
    glossary = CSV::Table.new([], headers: HEADERS)
    initial_index = CSV::Table.new([], headers: OCCURRENCE_HEADERS)
    writes = []
    calls = []
    tables = {
      ReviewedProperNameDiscovery::GLOSSARY => glossary,
      W::M::INDEX => initial_index
    }
    write = lambda do |path, headers, rows|
      writes << [path, rows.length]
      tables[path] = CSV::Table.new(rows.map { |row| CSV::Row.new(headers, headers.map { |h| row[h] }) },
                                    headers: headers)
    end
    run = lambda do |*args|
      calls << args
      write.call(W::M::INDEX, OCCURRENCE_HEADERS, first_batch_result(generated, reviews))
    end
    W.stub(:prepare, [definitions, reviews, generated]) do
      W::M.stub(:table, ->(path) { tables.fetch(path) }) do
        W::M.stub(:write_table, write) do
          W::M.stub(:run, run) { W.apply }
        end
      end
    end
    assert_equal [[W::REVIEWS, 21_460, 1]], calls
    assert_includes writes, [W::DEFINITIONS, 1]
    assert_includes writes, [W::REVIEWS, 53]
    assert_includes writes, [W::M::INDEX, 53]
    assert writes.all? { |path, _| !path.include?('D21461') && !path.include?('D21462') }
  end

  def test_live_immutable_source_alignment_read_only_without_shared_refresh
    if File.file?(W::REVIEWS)
      reviews = W::M.table(W::REVIEWS).map(&:to_h)
      inventory = W.source_inventory
      index = W::M.table(W::M::INDEX).map(&:to_h)
      entity_rows = index.select { |row| row.fetch('entity_key') == W::ENTITY }
      assert_equal W::EXPECTED_IDS.sort, reviews.map { |row| row.fetch('ID_Linha') }.sort
      assert_equal W::EXPECTED_IDS.sort, entity_rows.map { |row| row.fetch('ID_Linha') }.sort
      assert_equal 17, reviews.count { |row| row.fetch('old') != row.fetch('new') }
      reviews.each do |review|
        source = inventory.fetch(W::M.key(review))
        indexed = entity_rows.find { |row| W::M.key(row) == W::M.key(review) }
        assert_equal review.fetch('new'), source.fetch('work_text')
        assert_equal review.fetch('status'), indexed.fetch('status') unless
          W::PENDING_IDS.include?(review.fetch('ID_Linha'))
        assert_equal 'excluded', indexed.fetch('status') if
          W::PENDING_IDS.include?(review.fetch('ID_Linha'))
      end
      definition = W::M.table(ReviewedProperNameDiscovery::GLOSSARY)
                       .find { |row| row['entity_key'] == W::ENTITY }
      assert_equal '', definition.fetch('english_aliases')
      return
    end

    inventory = W.source_inventory
    generated = W.generated_for(inventory, definitions)
    reviews = W.reviews_for(inventory, generated)
    glossary = W::M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = W::M.table(W::M::INDEX).map(&:to_h)
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, glossary, index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    assert_equal 53, reviews.length
    assert_equal 17, reviews.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal 19, W::NAMED.length
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
           .group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(W::M.csv_path(resource)), targets)
    end
  end
end
