#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-fae-cairn-paragon-D21547'

class FaeCairnParagonD21547Test < Minitest::Test
  R = FaeCairnParagonD21547
  M = ReviewedNameBatches

  def self.saved_or_planned
    @saved_or_planned ||= if File.file?(File.join(__dir__, 'proper-name-edits-D21547.tsv'))
      [
        M.table(File.join(__dir__, 'proper-name-discovery-definitions-D21547.tsv')).map(&:to_h),
        M.table(File.join(__dir__, 'proper-name-edits-D21547.tsv')).map(&:to_h) +
          M.table(File.join(__dir__, 'proper-name-edits-D21548.tsv')).map(&:to_h),
        true
      ]
    else
      _headers, definitions, reviews = R.prepare
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
    @inventory ||= M.table(M::INVENTORY).map(&:to_h).to_h do |row|
      [M.key(row), row]
    end
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

  def test_exact_candidate_scope_and_definitions
    assert_equal [R::FAE_CAIRN, R::PARAGON].sort, definitions.keys.sort
    assert_equal 51, R::CAIRN_KEYS.length
    assert_equal 28, R::PARAGON_KEYS.length
    assert_equal 79, rows.length
    assert_equal({ 'accepted' => 49, 'excluded' => 21, 'not-an-issue' => 3, 'uncertain' => 6 },
                 rows.group_by { |row| row.fetch('status') }.transform_values(&:length))
    assert_equal 49, rows.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal ['페이 케언(Fae Cairn)', 'item'],
                 [definitions.fetch(R::FAE_CAIRN).fetch('korean_canonical'),
                  definitions.fetch(R::FAE_CAIRN).fetch('category')]
    assert_equal ['파라곤(Paragon)', 'title'],
                 [definitions.fetch(R::PARAGON).fetch('korean_canonical'),
                  definitions.fetch(R::PARAGON).fetch('category')]
    assert_equal %w[affix base default], rows.map { |row| row.fetch('resource') }.uniq.sort
  end

  def test_all_source_evidence_matches_aligned_inventory_and_cells
    rows.each do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
                   row.fetch('english'), key.inspect
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
                   row.fetch('japanese'), key.inspect
      assert_equal source.fetch('zh_text'), row.fetch('chinese'), key.inspect
      current = cells.fetch(key[0]).fetch(key)
      expected = applied? ? M.rebase_review(row.fetch('old'), row.fetch('new'), current) : row.fetch('old')
      assert_equal expected, current, key.inspect
      fae_terms = row.fetch('english').scan(/(?<![A-Za-z])Fae\s+Cairns?(?![A-Za-z])/i).length
      korean_fae_pairs = row.fetch('new').scan(/페이 케언\(Fae Cairns?\)/).length
      assert_equal fae_terms, korean_fae_pairs, "atomic Fae Cairn pairs #{key.inspect}"
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_fae_cairn_canonical_and_unrelated_burial_exclusion
    assert_equal 'excluded',
                 JSON.parse(by_key.fetch(['base', '3658', '11']).fetch('entity_dispositions_json'))
                   .fetch(R::FAE_CAIRN)
    assert_equal by_key.fetch(['base', '3658', '11']).fetch('old'),
                 by_key.fetch(['base', '3658', '11']).fetch('new')

    %w[8366 14859 25425 34694 48910 53810].each do |id|
      row = by_key.fetch(['default', id, ''])
      assert_match(/페이 케언\(Fae Cairns?\)/, row.fetch('new'), id)
    end
    assert_includes by_key.fetch(['default', '51562', '']).fetch('new'), '케언(Cairn)'
    assert_includes by_key.fetch(['default', '38793', '']).fetch('new'), '케언(Cairn)'
    assert_includes by_key.fetch(['default', '36912', '']).fetch('new'), '이 케언(Cairns)들은'
    assert_equal 1, rows.count { |row| M.key(row) == ['default', '38793', ''] }
  end

  def test_paragon_title_and_atomic_monster_compounds
    %w[32495 62731].each do |id|
      row = by_key.fetch(['default', id, ''])
      assert_equal 'accepted', JSON.parse(row.fetch('entity_dispositions_json')).fetch(R::PARAGON)
      assert_includes row.fetch('new'), '파라곤(Paragon)'
    end
    %w[7153 10902 11948 15280 19289 19407 21797 23811 25885 28172 31745 32494 35713 42132 47095 55449 61518 62706 63508].each do |id|
      row = by_key.fetch(['default', id, ''])
      assert_equal 'excluded', JSON.parse(row.fetch('entity_dispositions_json')).fetch(R::PARAGON)
      assert_equal row.fetch('old'), row.fetch('new')
    end
    row = by_key.fetch(['base', '4086', '11'])
    assert_equal 'excluded', JSON.parse(row.fetch('entity_dispositions_json')).fetch(R::PARAGON)
    assert_equal row.fetch('old'), row.fetch('new')
  end

  def test_paragons_affix_variants_remain_uncertain_and_unedited
    %w[11 12 14 21 22 24].each do |variant|
      row = by_key.fetch(['affix', '73', variant])
      assert_equal 'uncertain',
                   JSON.parse(row.fetch('entity_dispositions_json')).fetch(R::PARAGON)
      assert_equal row.fetch('old'), row.fetch('new')
    end
  end

  def test_planning_is_read_only
    skip 'Fae Cairn/Paragon batch already applied' if applied?

    paths = [
      R::DEFINITIONS, R::REVIEWS, M::INDEX, M::INVENTORY,
      ReviewedProperNameDiscovery::GLOSSARY,
      *M::DOCS, *M::RESOURCES.map { |resource| M.csv_path(resource) }
    ]
    before = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    no_write = ->(*) { flunk 'read-only proper-name planning attempted a write' }
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
