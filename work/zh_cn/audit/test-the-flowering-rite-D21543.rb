#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'minitest/autorun'
require_relative 'review-the-flowering-rite-D21543'

class TheFloweringRiteD21543Test < Minitest::Test
  R = TheFloweringRiteD21543
  M = ReviewedNameBatches
  EXPECTED_KEYS = R.expected_keys.sort

  def saved_or_planned
    if File.file?(R::MANIFEST)
      assert File.file?(R::DEFINITIONS), 'saved Flowering definition is missing'
      assert File.file?(R::REVIEWS), 'saved Flowering review is missing'
      definitions = M.table(R::DEFINITIONS).map(&:to_h)
      reviews = M.table(R::MANIFEST).map(&:to_h)
      [definitions, reviews, true]
    else
      _headers, definition, reviews = R.prepare
      [[definition], reviews, false]
    end
  end

  def inventory
    @inventory ||= R.source_inventory
  end

  def active_cells
    @active_cells ||= M::RESOURCES.to_h do |resource|
      table = CSV.read(M.csv_path(resource), headers: true, col_sep: ';', encoding: 'bom|utf-8')
      id_header = table.headers.find { |header| header.to_s.delete_prefix("\uFEFF") == 'ID_Linha' }
      variant_header = table.headers.find { |header| header == 'Tipo_Variante' }
      cells = table.each_with_object({}) do |row, result|
        key = [resource, row[id_header], variant_header ? row[variant_header] : '']
        result[key] = row['Texto']
      end
      [resource, cells]
    end
  end

  def source_for(key)
    inventory.fetch(key)
  end

  def test_exact_28_key_scope_definitions_and_dispositions
    definitions, reviews, = saved_or_planned
    assert_equal 1, definitions.length
    definition = definitions.fetch(0)
    assert_equal R::ENTITY, definition.fetch('entity_key')
    assert_equal 'The Flowering', definition.fetch('english_canonical')
    assert_equal 'named event', definition.fetch('category')
    assert_equal R::CANONICAL, definition.fetch('korean_canonical')
    assert_equal 'Flowering', definition.fetch('english_aliases')
    assert_equal %w[accepted excluded not-an-issue].sort,
                 reviews.map { |row| row.fetch('status') }.uniq.sort

    keys = reviews.map { |row| M.key(row) }
    assert_equal EXPECTED_KEYS, keys.sort
    assert_equal 28, keys.uniq.length
    assert_equal 23, reviews.count { |row| R::RITE_IDS.include?(row['ID_Linha']) }
    assert_equal 5, reviews.count { |row| R::EXCLUDED_IDS.include?(row['ID_Linha']) }
    assert_equal 22, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 1, reviews.count { |row| row['status'] == 'not-an-issue' }
    assert_equal 5, reviews.count { |row| row['status'] == 'excluded' }
  end

  def test_aligned_english_japanese_chinese_evidence_and_source_local_labels
    _definitions, reviews, applied = saved_or_planned
    reviews.each do |row|
      key = M.key(row)
      source = source_for(key)
      expected_text = applied ? row.fetch('new') : row.fetch('old')
      assert_equal expected_text, active_cells.fetch(key[0]).fetch(key), key.inspect
      assert_equal expected_text, source.fetch('work_text'), key.inspect
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
                   row.fetch('english'), key.inspect
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
                   row.fetch('japanese'), key.inspect
      assert_equal source.fetch('zh_text'), row.fetch('chinese'), key.inspect

      id = key.fetch(1)
      assert_equal R::ENGLISH_COUNTS.fetch(id),
                   row.fetch('english').scan(/(?<![A-Za-z])flowering(?![A-Za-z])/i).length,
                   key.inspect
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/), key.inspect
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      assert_equal({ R::ENTITY => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')), key.inspect)

      if R::RITE_IDS.include?(id)
        assert_match(/開花/, row.fetch('japanese'), key.inspect)
        assert_match(/(?:花期|开花)/, row.fetch('chinese'), key.inspect)
        annotation_labels = row.fetch('new').scan(/\((?:The )?Flowering\)/).map do |label|
          label == '(The Flowering)' ? 'The Flowering' : 'Flowering'
        end
        annotation_counts = annotation_labels.each_with_object(Hash.new(0)) do |label, counts|
          counts[label] += 1
        end.to_h
        assert_equal R::ANNOTATION_COUNTS.fetch(id), annotation_counts,
                     key.inspect
      else
        assert_equal row.fetch('old'), row.fetch('new'), key.inspect
        assert_equal 'excluded', row.fetch('status'), key.inspect
      end
    end
  end

  def test_only_explicit_rite_spans_change_and_particle_or_context_holds_remain
    _definitions, reviews, = saved_or_planned
    by_id = reviews.to_h { |row| [row.fetch('ID_Linha'), row] }
    R::RITE_IDS.each do |id|
      row = by_id.fetch(id)
      key = M.key(row)
      assert_equal R.normalize(row.fetch('old'), key), row.fetch('new'), key.inspect
      assert_equal row.fetch('new'), R.normalize(row.fetch('new'), key), key.inspect
    end
    R::EXCLUDED_IDS.each do |id|
      row = by_id.fetch(id)
      assert_equal row.fetch('old'), row.fetch('new'), id
    end
    assert_includes by_id.fetch('52164').fetch('new'), '발라드야'
    assert_includes by_id.fetch('62899').fetch('new'), '의식은 완성됐지'
    assert_includes by_id.fetch('11245').fetch('new'), "'개화 의식(The Flowering)'을 시작했다"
    assert_includes by_id.fetch('27677').fetch('new'), "'개화 의식(The Flowering)'을 오스두인"
    assert_includes by_id.fetch('19840').fetch('new'), "‘개화 의식(The Flowering)’이 열릴 예정이다"
    assert_includes by_id.fetch('61196').fetch('new'), '개화 의식(The Flowering)이 다가오면'
  end

  def test_planning_is_in_memory_and_does_not_refresh_or_write_shared_state
    skip 'saved manifest means the discovery has already been applied' if File.file?(R::MANIFEST)

    paths = [
      M::INVENTORY, M::INDEX, ReviewedProperNameDiscovery::GLOSSARY,
      R::DEFINITIONS, R::REVIEWS, R::MANIFEST,
      *M::RESOURCES.map { |resource| M.csv_path(resource) }
    ]
    before = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    no_write = ->(*) { flunk 'read-only Flowering planning attempted a write or refresh' }
    M.stub(:refresh_inventory, no_write) do
      M.stub(:write_table, no_write) do
        M.stub(:run, no_write) do
          ReviewedProperNameDiscovery.stub(:run, no_write) do
            capture_io { R.prepare }
          end
        end
      end
    end
    after = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal before, after
  end
end
