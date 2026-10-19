#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-crymbil-D21669'
require_relative 'build-proper-name-inventory'

class CrymbilD21669Test < Minitest::Test
  C = CrymbilD21669

  def source(english)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['クリンビル']),
      'zh_text' => '克伦比尔'
    }
  end

  def transform(key, text, english = C::ENGLISH.fetch(key))
    C.transform(C::SPEC, key, text, source(english))
  end

  def test_article_alias_is_limited_to_exact_source_labels
    assert_equal ['크림빌(The Crymbil)', false], transform(C::DEFAULT_LABEL, '크림빌')
    ['크림빌(The Crymbil)', '크림빌 (The Crymbil)'].each do |label|
      assert_equal [label, false], transform(C::BASE_LABEL, label)
    end
    assert_equal 'Crymbil', C::SPEC.fetch(:english)
    assert_equal 'The Crymbil', C::SPEC.fetch(:aliases)
    assert_equal 'people', C::SPEC.fetch(:category)
  end

  def test_existing_prose_pair_and_other_entity_are_unchanged
    key = ['default', '55479', '']
    text = '크림빌(Crymbil) 물의 정령 오도나타(Odonata)를 본뜬 석상 흉상.'
    assert_equal [text, false], transform(key, text)
  end

  def test_all_eight_lore_mentions_preserve_particles_tokens_and_line_breaks
    english = C::RACE_INTRO + "\n\n" + Array.new(7, 'Crymbil').join(' ')
    old = "크림빌과 스크라타.\r\n\r\n크림빌이 크림빌의 크림빌을 크림빌에게 크림빌은 크림빌도 크림빌. {*1 종족} $TOKEN$ <b>이름</b>"
    expected = old.gsub('크림빌', C::CANONICAL)
    revised, excluded = transform(C::LORE, old, english)
    refute excluded
    assert_equal expected, revised
    assert_equal [revised, false], transform(C::LORE, revised, english)
  end

  def test_equipment_name_cannot_be_inferred_from_species_identity
    key = ['default', '12848', '']
    assert_raises(RuntimeError) { transform(key, '크림빌의 장갑', 'Crymbil Gloves') }
    compound = '크림빌의 장갑(Crymbil Gloves)'
    assert_raises(RuntimeError) { transform(key, compound) }
    assert_equal '크림빌의 장갑(Crymbil Gloves)', compound
    assert_raises(RuntimeError) do
      transform(['base', '99999', '11'], compound, 'Crymbil Gloves')
    end
  end

  def test_unknown_alias_missing_mentions_and_changed_locales_fail_closed
    key = ['default', '12848', '']
    assert_raises(RuntimeError) { transform(key, '크림빌(The Crymbil)') }
    assert_raises(RuntimeError) { transform(key, '고블린에 관한 책.') }
    assert_raises(RuntimeError) { transform(C::DEFAULT_LABEL, '크림빌', 'The Crymbils') }
    %w[ja_texts_json zh_text].each do |field|
      row = source(C::ENGLISH.fetch(key)).merge(field => (field == 'ja_texts_json' ? '[]' : ''))
      assert_raises(RuntimeError) { C.transform(C::SPEC, key, '크림빌', row) }
    end
  end

  def test_runner_wiring_is_intercepted_without_invoking_a_writer
    called = false
    runner = lambda do |d, title, specs, context, marker, &block|
      called = true
      assert_equal 21_669, d
      assert_equal 'Crymbil Goblin Race And Source Labels', title
      assert_equal [C::SPEC], specs
      assert_includes context, "D-18275's terminal not-an-issue"
      assert_equal '<!-- current-proper-name-batch:start -->', marker
      assert_equal [C::LABEL, false],
        block.call(specs.first, C::DEFAULT_LABEL, '크림빌', source('The Crymbil'))
    end
    ReviewedDiscoverySpecs.stub(:run, runner) { C.apply }
    assert called
  end

  def test_full_cross_resource_no_write_dry_run
    m = ReviewedNameBatches
    r = ReviewedProperNameDiscovery
    inventory_rows = m::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(m::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    assert_equal 73_430, inventory_rows.length
    inventory = inventory_rows.to_h { |row| [m.key(row), row] }
    assert_equal inventory_rows.length, inventory.length
    glossary = m.table(r::GLOSSARY)
    index = m.table(m::INDEX)
    entity = C::SPEC.fetch(:key)
    registered = glossary.any? { |row| row['entity_key'] == entity }
    definition = {
      'entity_key' => C::SPEC.fetch(:key),
      'english_canonical' => C::SPEC.fetch(:english),
      'category' => C::SPEC.fetch(:category),
      'korean_canonical' => C::SPEC.fetch(:korean),
      'english_aliases' => C::SPEC.fetch(:aliases),
      'korean_variants' => C::SPEC.fetch(:variants),
      'evidence_ids' => "D-#{C::D}", 'status' => 'confirmed', 'notes' => C::NOTE
    }
    generated = build_occurrences(inventory_rows, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    assert_equal C::COUNTS.keys.sort, generated.map { |row| m.key(row) }.sort
    assert_equal C::SPEC.fetch(:count), generated.length
    assert generated.none? { |row| row.fetch('resource') == 'affix' }
    assert_equal '크림빌 (The Crymbil)', inventory.fetch(C::BASE_LABEL).fetch('work_text')

    reviews = generated.map do |occurrence|
      key = m.key(occurrence)
      row = inventory.fetch(key)
      old = row.fetch('work_text')
      revised, excluded = C.transform(C::SPEC, key, old, row)
      assert_equal [revised, excluded], C.transform(C::SPEC, key, revised, row)
      status = excluded ? 'excluded' : (old == revised ? 'not-an-issue' : 'accepted')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => C::SPEC.fetch(:key), 'status' => status,
        'old' => old, 'new' => revised, 'evidence' => C::NOTE,
        'english' => JSON.parse(row.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(row.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => row.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(C::SPEC.fetch(:key) => status)
      }
    end
    r.validate!([definition], reviews, generated,
      glossary.map(&:to_h).reject { |row| row['entity_key'] == entity },
      index.map(&:to_h).reject { |row| row['entity_key'] == entity })
    r.validate_sources!(reviews, inventory)
    edits = reviews.reject { |row| row.fetch('old') == row.fetch('new') }
    expected_edits = registered ? [] : [C::LORE, C::DEFAULT_LABEL].sort
    assert_equal expected_edits, edits.map { |row| m.key(row) }.sort
    edits.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(m.csv_path(resource)), rows)
    end
    assert_equal 6 - edits.length, reviews.count { |row| row.fetch('status') == 'not-an-issue' }
    assert_includes C::NOTE, 'historical global totals'
    puts "D-#{C::D} no-write dry run: #{reviews.length} source keys, #{edits.length} proposed Texto edits; validation passed."
  end
end
