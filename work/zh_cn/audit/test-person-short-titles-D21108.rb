#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-person-short-titles-D21108'

class PersonShortTitlesD21108Test < Minitest::Test
  P = PersonShortTitlesD21108
  M = ReviewedNameBatches
  PERSON_IDS = %w[
    2105 5481 8430 8470 9879 11952 12345 12991 14134 19101
    19714 23529 29275 31403 35714 44688 47280 50987 60021 63022
    4398 8508 16998 17010 19425 27197 35256 46451 56436
    9687 36472 36710 43512 44738 47173 48438 49173 49792
    52505 57549 59665 60849 16331 17761
  ].freeze
  EXCLUSION_IDS = %w[
    18606 21252 25264 39557 45188 47079 49259 56110
    4940 35735 44963 59714
  ].freeze
  APPROVED_KEYS = (
    (PERSON_IDS + EXCLUSION_IDS + %w[46513 47760]).map { |id| ['default', id, ''] } +
    [['base', '1602', '11']]
  ).freeze

  def setup
    @inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
    # Read active Korean without regenerating or writing the supplied inventory.
    %w[base default].each do |resource|
      CSV.read(M.csv_path(resource), headers: true, col_sep: ';', encoding: 'bom|utf-8').each do |row|
        key = [resource, row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
        next unless APPROVED_KEYS.include?(key)
        @inventory.fetch(key)['work_text'] = row.fetch('Texto')
      end
    end
    paths = [P::D, P::D + 1].map { |d| File.join(M::AUDIT, "proper-name-edits-D#{d}.tsv") }
    if paths.any? { |path| File.exist?(path) }
      raise 'partial D-21108/D-21109 application; both batch manifests required' unless
        paths.all? { |path| File.exist?(path) }
      @applied = true
      @reviews = paths.flat_map { |path| M.table(path).map(&:to_h) }
      @baseline = @inventory.transform_values(&:dup)
      @reviews.each { |row| @baseline.fetch(M.key(row))['work_text'] = row.fetch('old') }
    else
      @applied = false
      @baseline = @inventory
      @reviews = P.build_reviews(@baseline)
    end
  end

  def fixture_glossary
    P::PEOPLE.map do |entity, english|
      { 'entity_key' => entity, 'english_canonical' => english,
        'category' => 'person', 'english_aliases' => '' }
    end
  end

  def review(id)
    @reviews.find { |row| row.fetch('ID_Linha') == id }
  end

  def test_scope_counts_and_source_completeness_pre_or_post
    assert_equal 44, PERSON_IDS.length
    assert_equal 12, EXCLUSION_IDS.length
    assert_equal APPROVED_KEYS.sort, @reviews.map { |row| M.key(row) }.sort
    assert_equal 59, @reviews.map { |row| M.key(row) }.uniq.length
    assert_equal P::EXPECTED_COUNTS,
      @reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    assert P.validate_review_set!(@reviews)
    assert_equal({ 'base' => 1, 'default' => 58 },
      @reviews.group_by { |row| row.fetch('resource') }.transform_values(&:length))
    ReviewedProperNameDiscovery.validate_sources!(@reviews, @inventory)
    rebuilt = P.build_reviews(@baseline)
    @reviews.each do |row|
      key = M.key(row)
      source = @inventory.fetch(key)
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"), row.fetch('english')
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"), row.fetch('japanese')
      assert_equal source.fetch('zh_text'), row.fetch('chinese')
      expected = rebuilt.find { |candidate| M.key(candidate) == key }
      %w[entity_key status old new entity_dispositions_json].each do |field|
        assert_equal expected.fetch(field), row.fetch(field), "#{key.inspect} #{field}"
      end
    end
  end

  def test_exact_bounded_changes_and_protected_contexts
    specs = P.specs.to_h { |spec| [P.source_key(spec), spec] }
    @reviews.each do |row|
      spec = specs.fetch(M.key(row))
      expected = spec[:excluded] ? row.fetch('old') :
        row.fetch('old').sub(spec.fetch(:old_span), spec.fetch(:new_span))
      assert_equal expected, row.fetch('new')
      assert_equal row.fetch('old'), row.fetch('new') unless row.fetch('status') == 'accepted'
    end
    assert_includes review('35714').fetch('new'), '니암(Niahm)을 도왔다'
    refute_includes review('35714').fetch('new'), '니암(Niahm)를'
    assert_includes review('5481').fetch('new'), '나메리아 켄트(Nameria Kent)'
    assert_includes review('5481').fetch('new'), '니암(Niahm)의 자매'
    assert_equal review('12991').fetch('old'), review('12991').fetch('new')
    assert_includes review('12991').fetch('new'), '켄트(Kent)'
    assert_equal review('14134').fetch('old'), review('14134').fetch('new')
    assert_includes review('14134').fetch('new'), '켄트(Oathblade Kent)'
    assert_includes review('35256').fetch('new'), 'C. J.'
    assert_includes review('47280').fetch('new'), '나와 형제인 니암(Niahm)뿐이야'
    assert_equal 1, review('29275').fetch('old').scan('니암(Niahm)').length
    assert_equal 2, review('29275').fetch('new').scan('니암(Niahm)').length
    assert_equal review('17010').fetch('old').sub('카터리를', '카터리(Cartery)를'),
      review('17010').fetch('new')
  end

  def test_exclusions_preserve_only_notes_and_full_scope_controls
    excluded = @reviews.select { |row| row.fetch('status') == 'excluded' }
    assert_equal EXCLUSION_IDS.sort, excluded.map { |row| row.fetch('ID_Linha') }.sort
    assert_equal({ 'person:niahm-kent' => 8, 'person:nesta-gwynedd' => 3, 'person:byrn-elgar' => 1 },
      excluded.group_by { |row| row.fetch('entity_key') }.transform_values(&:length))
    %w[51539 38080 12286 19979 61614].each do |id|
      refute @reviews.any? { |row| row.fetch('ID_Linha') == id }, id
      refute P.occurrence_rows(@reviews).any? { |row| row.fetch('ID_Linha') == id }, id
    end
    assert_equal %w[38080 51539], P::PRESERVE_ONLY_NOTES.keys.sort
    refute @reviews.any? { |row| row.fetch('status') == 'uncertain' }
    refute P::PERSON_ROWS.fetch('person:niahm-kent').any? { |row| row[0] == '5481' && row[1] == 'Kent' }
  end

  def test_new_atomic_titles_source_generation_and_alias_collisions
    definitions = P.definitions
    assert_equal 3, definitions.length
    assert_equal ['unique item', 'title', 'title'], definitions.map { |row| row.fetch('category') }
    assert definitions.all? { |row| row.fetch('english_aliases').empty? }
    generated = P.title_occurrences(@baseline, definitions)
    assert_equal 3, generated.length
    title_entities = definitions.map { |row| row.fetch('entity_key') }
    titles = @reviews.select { |row| title_entities.include?(row.fetch('entity_key')) }
    assert_equal [
      "제이크의 칼(Jayck's Knife)",
      "니암의 과업(Niahm's Labors)",
      "니암의 임무(Niahm's Task)"
    ], definitions.map { |row| row.fetch('korean_canonical') }
    titles.each do |row|
      definition = definitions.find { |d| d.fetch('entity_key') == row.fetch('entity_key') }
      assert_equal definition.fetch('korean_canonical'), row.fetch('new')
    end
    ReviewedProperNameDiscovery.validate!(definitions, titles, generated, fixture_glossary, [])
    assert P.validate_registry!(fixture_glossary, [], @reviews, @baseline)
    collision = { 'entity_key' => 'title:other-owner', 'english_canonical' => 'Other title',
                  'english_aliases' => "Niahm's Labors" }
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, titles, generated, fixture_glossary + [collision], [])
    end
    extra = @baseline.dup
    source = @baseline.fetch(['default', '46513', '']).merge('ID_Linha' => '999999')
    extra[['default', '999999', '']] = source
    assert_raises(RuntimeError) { P.validate_registry!(fixture_glossary, [], @reviews, extra) }
  end

  def test_gates_duplicate_keys_missing_parents_and_global_aliases
    assert_raises(RuntimeError) { P.validate_registry!(fixture_glossary.drop(1), [], @reviews, @baseline) }
    global_alias = fixture_glossary.map(&:dup)
    global_alias.first['english_aliases'] = 'Niahm|Kent'
    assert_raises(RuntimeError) { P.validate_registry!(global_alias, [], @reviews, @baseline) }
    occurrence = P.occurrence_rows(@reviews).find { |row| row.fetch('ID_Linha') == '5481' }
    assert_raises(RuntimeError) { P.validate_registry!(fixture_glossary, [occurrence], @reviews, @baseline) }
    assert_raises(RuntimeError) { P.validate_registry!(fixture_glossary, [occurrence, occurrence], @reviews, @baseline) }
    unrelated = occurrence.merge('entity_key' => 'person:nameria', 'status' => 'not-an-issue')
    assert P.validate_registry!(fixture_glossary, [unrelated], @reviews, @baseline)
    missing_source = @baseline.transform_values(&:dup)
    missing_source.fetch(['default', '5481', ''])['ja_texts_json'] = '[]'
    assert_raises(RuntimeError) { P.build_reviews(missing_source) }
    duplicated_span = @baseline.transform_values(&:dup)
    duplicated_span.fetch(['default', '35714', ''])['work_text'] += ' 니아흐를'
    assert_raises(RuntimeError) { P.build_reviews(duplicated_span) }
  end

  def test_both_batch_slots_are_checked_before_preparation
    checked = []
    guard = lambda do |batch|
      checked << batch
      raise 'occupied second batch' if batch == P::D + 1
    end
    P.stub(:prepare, -> { raise 'preparation ran before both batch gates' }) do
      ReviewedProperNameDiscovery.stub(:ensure_unused_batch!, guard) do
        error = assert_raises(RuntimeError) { P.apply }
        assert_equal 'occupied second batch', error.message
      end
    end
    assert_equal [P::D, P::D + 1], checked
  end

  def test_registered_subset_and_csv_preflight_without_writes
    occurrences = P.occurrence_rows(@reviews)
    assert_equal 59, occurrences.length
    assert occurrences.all? { |row| row.fetch('status') == 'needs-context' }
    assert_equal APPROVED_KEYS.sort, occurrences.map { |row| M.key(row) }.sort
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    requested = @reviews.to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row] }
    registered = index.select { |row| requested.key?([row.fetch('entity_key'), *M.key(row)]) }
    if @applied
      # Future row-local scopes may add other occurrences of these same entities.
      assert_equal 59, registered.length
      registered.each do |row|
        expected = requested.fetch([row.fetch('entity_key'), *M.key(row)])
        assert_equal expected.fetch('status'), row.fetch('status')
        spec = P.specs.find { |s| P.source_key(s) == M.key(row) }
        assert_includes @inventory.fetch(M.key(row)).fetch('work_text'), spec.fetch(:new_span) unless spec[:excluded]
      end
      P.definitions.each do |definition|
        found = glossary.find { |row| row.fetch('entity_key') == definition.fetch('entity_key') }
        refute_nil found
        %w[english_canonical korean_canonical category english_aliases].each do |field|
          assert_equal definition.fetch(field), found.fetch(field)
        end
      end
    else
      assert_empty registered
      if (P::PEOPLE.keys - glossary.map { |row| row.fetch('entity_key') }).empty?
        assert P.validate_registry!(glossary, index, @reviews, @baseline)
      else
        assert_raises(RuntimeError) { P.validate_registry!(glossary, index, @reviews, @baseline) }
      end
      @reviews.select { |row| row.fetch('status') == 'accepted' }
        .group_by { |row| row.fetch('resource') }.each do |resource, edits|
          ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
        end
    end
  end
end
