#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-docent-rank-D21546'

class DocentRankD21546Test < Minitest::Test
  R = DocentRankD21546
  M = ReviewedNameBatches

  def self.saved_or_planned
    @saved_or_planned ||= if File.file?(File.join(__dir__, 'proper-name-edits-D21546.tsv'))
      [
        M.table(R::DEFINITIONS).map(&:to_h),
        M.table(File.join(__dir__, 'proper-name-edits-D21546.tsv')).map(&:to_h),
        true
      ]
    else
      headers, definitions, reviews = R.prepare
      [definitions, reviews, false]
    end
  end

  def definitions
    self.class.saved_or_planned.fetch(0).to_h { |row| [row.fetch('entity_key'), row] }
  end

  def rows
    self.class.saved_or_planned.fetch(1)
  end

  def applied?
    self.class.saved_or_planned.fetch(2)
  end

  def inventory
    @inventory ||= R.source_inventory
  end

  def cells
    @cells ||= M::RESOURCES.to_h do |resource|
      table = CSV.read(M.csv_path(resource), headers: true, col_sep: ';', encoding: 'bom|utf-8')
      id_header = table.headers.find { |header| header.to_s.delete_prefix("\uFEFF") == 'ID_Linha' }
      variant_header = table.headers.find { |header| header == 'Tipo_Variante' }
      values = table.each_with_object({}) do |row, result|
        key = [resource, row[id_header], variant_header ? row[variant_header] : '']
        result[key] = row['Texto']
      end
      [resource, values]
    end
  end

  def by_key
    rows.to_h { |row| [M.key(row), row] }
  end

  def test_complete_source_scope_and_four_english_led_definitions
    expected_entities = [R::DOCENT, R::EWA, R::NENA, R::DEL].sort
    assert_equal expected_entities, definitions.keys.sort
    actual_pairs = rows.flat_map do |row|
      JSON.parse(row.fetch('entity_dispositions_json')).keys.map do |entity|
        [entity, *M.key(row)]
      end
    end
    assert_equal R.expected_pairs.sort, actual_pairs.sort
    assert_equal 23, rows.length
    assert_equal 26, R.expected_pairs.length
    assert_equal 22, R::TITLE_KEYS.length

    assert_equal ['강사(Docent)', 'title'],
                 [definitions.fetch(R::DOCENT).fetch('korean_canonical'),
                  definitions.fetch(R::DOCENT).fetch('category')]
    assert_equal '에와 테오프링(Ewa Teofring)',
                 definitions.fetch(R::EWA).fetch('korean_canonical')
    assert_equal '네나 아돌라(Nena Adolla)',
                 definitions.fetch(R::NENA).fetch('korean_canonical')
    assert_equal '델 가드라(Del Gadra)',
                 definitions.fetch(R::DEL).fetch('korean_canonical')
    assert_includes definitions.fetch(R::DOCENT).fetch('notes'), 'D-18475'
    assert_includes definitions.fetch(R::DOCENT).fetch('notes'), 'not museum-guide'
  end

  def test_sources_translations_and_active_cells_are_exact
    rows.each do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
                   row.fetch('english'), key.inspect
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
                   row.fetch('japanese'), key.inspect
      assert_equal source.fetch('zh_text'), row.fetch('chinese'), key.inspect
      active = applied? ? row.fetch('new') : row.fetch('old')
      current = cells.fetch(key[0]).fetch(key)
      expected = applied? ? M.rebase_review(row.fetch('old'), row.fetch('new'), current) : active
      assert_equal expected, current, key.inspect
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_rank_particles_atomic_person_labels_and_item_exclusion
    %w[9559 21459].each do |id|
      row = by_key.fetch(['default', id, ''])
      assert_includes row.fetch('new'), '강사(Docent)'
    end
    assert_includes by_key.fetch(['default', '10459', '']).fetch('new'), '강사(Docent)님'
    assert_includes by_key.fetch(['default', '14299', '']).fetch('new'), '강사(Docent)님'
    assert_includes by_key.fetch(['default', '9843', '']).fetch('new'), '강사(Docent) 직급'
    assert_includes by_key.fetch(['default', '19997', '']).fetch('new'), '강사(Docent)로 승진'
    assert_includes by_key.fetch(['default', '58499', '']).fetch('new'), '강사(Docent)에게'
    assert_includes by_key.fetch(['default', '59354', '']).fetch('new'), '강사(Docent) 계급'
    assert_includes by_key.fetch(['default', '63054', '']).fetch('new'), '강사(Docent)로군'
    assert_includes by_key.fetch(['default', '2240', '']).fetch('new'),
                    '강사(Docent) 에와 테오프링(Ewa Teofring)'
    assert_includes by_key.fetch(['default', '31977', '']).fetch('new'),
                    '강사(Docent) 네나 아돌라(Nena Adolla)'
    assert_includes by_key.fetch(['default', '27678', '']).fetch('new'),
                    '델 가드라(Del Gadra)'

    %w[5152 8405 23131 57055].each do |id|
      row = by_key.fetch(['default', id, ''])
      assert_equal 'excluded',
                   JSON.parse(row.fetch('entity_dispositions_json')).fetch(R::DOCENT)
      assert_equal row.fetch('old'), row.fetch('new')
    end
    ring = by_key.fetch(['base', '4021', '11'])
    assert_equal 'excluded',
                 JSON.parse(ring.fetch('entity_dispositions_json')).fetch(R::DOCENT)
    assert_equal ring.fetch('old'), ring.fetch('new')
  end

  def test_already_bilingual_rank_rows_remain_unchanged
    %w[22699 23334 28622].each do |id|
      row = by_key.fetch(['default', id, ''])
      assert_equal 'not-an-issue',
                   JSON.parse(row.fetch('entity_dispositions_json')).fetch(R::DOCENT)
      assert_equal row.fetch('old'), row.fetch('new')
    end
    assert_equal 14, rows.count { |row| row.fetch('old') != row.fetch('new') }
  end

  def test_planning_is_read_only
    skip 'Docent batch already applied' if applied?

    paths = [
      R::DEFINITIONS, R::REVIEWS, M::INDEX, M::INVENTORY,
      ReviewedProperNameDiscovery::GLOSSARY,
      *M::DOCS, *M::RESOURCES.map { |resource| M.csv_path(resource) }
    ]
    before = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    no_write = ->(*) { flunk 'read-only Docent planning attempted a write' }
    M.stub(:refresh_inventory, no_write) do
      M.stub(:write_table, no_write) do
        ReviewedProperNameDiscovery.stub(:run, no_write) do
          capture_io { R.prepare }
        end
      end
    end
    after = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal before, after
  end
end
