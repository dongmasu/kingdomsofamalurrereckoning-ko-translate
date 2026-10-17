#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-primal-magic-D21509'

class PrimalMagicD21509Test < Minitest::Test
  M = PrimalMagicD21509
  B = ReviewedNameBatches
  EXPECTED_KEYS = [['base', '2085', '11']] +
    M::IDS.map { |id| ['default', id, ''] }
  TERM = /원초 마법(?:\(Primal Magic\))?/

  def inventory
    @inventory ||= B.table(B::INVENTORY).map(&:to_h).to_h do |row|
      [B.key(row), row]
    end
  end

  def active_cells
    @active_cells ||= B::RESOURCES.grep(/base|default/).each_with_object({}) do |resource, cells|
      table = CSV.read(B.csv_path(resource), headers: true, col_sep: ';')
      id_header = table.headers.find { |header| header.to_s.delete_prefix("\uFEFF") == 'ID_Linha' }
      variant_header = table.headers.find { |header| header == 'Tipo_Variante' }
      table.each do |row|
        key = [resource, row[id_header], variant_header ? row[variant_header] : '']
        cells[key] = row['Texto']
      end
    end
  end

  def prepare_read_only
    no_write = ->(*) { flunk 'prepare attempted a write, shared refresh, or apply' }
    result = nil
    B.stub(:refresh_inventory, -> { inventory }) do
      B.stub(:write_table, no_write) do
        B.stub(:run, no_write) do
          ReviewedProperNameDiscovery.stub(:run, no_write) do
            File.stub(:write, no_write) do
              File.stub(:binwrite, no_write) do
                capture_io { result = M.prepare }
              end
            end
          end
        end
      end
    end
    result
  end

  def load_saved_or_prepare
    if File.file?(M::DEFINITIONS) || File.file?(M::REVIEWS)
      assert File.file?(M::DEFINITIONS), 'saved definition is missing'
      assert File.file?(M::REVIEWS), 'saved review manifest is missing'
      definitions = B.table(M::DEFINITIONS).map(&:to_h)
      reviews = B.table(M::REVIEWS).map(&:to_h)
      [definitions, reviews, true]
    else
      _headers, definition, reviews = prepare_read_only
      [[definition], reviews, false]
    end
  end

  def test_saved_manifest_or_read_only_prepare_matches_sources_and_changes
    watched = [
      B::INVENTORY, B::INDEX, ReviewedProperNameDiscovery::GLOSSARY,
      M::DEFINITIONS, M::REVIEWS, *%w[base default].map { |r| B.csv_path(r) }
    ]
    snapshot = watched.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end

    definitions, reviews, applied_manifest = load_saved_or_prepare
    after = watched.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal snapshot, after

    assert_equal 1, definitions.length
    definition = definitions.fetch(0)
    assert_equal [M::ENTITY], [definition.fetch('entity_key')]
    assert_equal 'lore term', definition.fetch('category')
    assert_equal 'Primal Magic', definition.fetch('english_canonical')
    assert_equal M::CANONICAL, definition.fetch('korean_canonical')
    assert_empty definition.fetch('english_aliases')
    refute_match(/\([^)]*\(/, M::CANONICAL)

    keys = reviews.map { |row| B.key(row) }
    assert_equal 18, reviews.length
    assert_equal EXPECTED_KEYS.sort, keys.sort
    assert_equal keys.length, keys.uniq.length
    assert_equal 14, reviews.count { |row| row['old'] != row['new'] }
    assert_equal 14, reviews.count { |row| row['status'] == 'accepted' }
    assert_equal 1, reviews.count { |row| row['status'] == 'excluded' }
    assert_equal 3, reviews.count { |row| row['status'] == 'not-an-issue' }

    reviews.each do |row|
      key = B.key(row)
      source = inventory.fetch(key)
      expected_live_text = applied_manifest ? row.fetch('new') : row.fetch('old')
      assert_equal expected_live_text, active_cells.fetch(key), key.inspect
      assert_equal expected_live_text, source.fetch('work_text'), key.inspect
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
                   row.fetch('english'), key.inspect
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
                   row.fetch('japanese'), key.inspect
      assert_equal source.fetch('zh_text'), row.fetch('chinese'), key.inspect
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/), key.inspect
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      assert_equal({ M::ENTITY => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')), key.inspect)
    end

    by_key = reviews.to_h { |row| [B.key(row), row] }
    title = by_key.fetch(['default', '25241', ''])
    assert_equal 'Forward: Primal Magic Examined', title.fetch('english')
    assert_includes title.fetch('japanese'), '進歩について: プライマル・マジックの研究'
    assert_includes title.fetch('chinese'), '向前：原初魔法已检查'
    assert_equal '서문: 원초 마법 고찰', title.fetch('old')
    assert_equal title.fetch('old'), title.fetch('new')
    assert_equal 'excluded', title.fetch('status')

    marker_row = by_key.fetch(['default', '62612', ''])
    marker = '{*3원초 마법}'
    assert_equal 1, marker_row.fetch('old').scan(marker).length
    assert_equal marker_row.fetch('old').sub(marker, "#{marker}(Primal Magic)"),
                 marker_row.fetch('new')
    assert_equal [marker], marker_row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE)
    assert_equal [marker], marker_row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)

    passage = by_key.fetch(['default', '47196', ''])
    assert_equal 10, passage.fetch('old').scan(TERM).length
    assert_equal 10, passage.fetch('new').scan(M::CANONICAL).length
    assert_equal passage.fetch('old').gsub(TERM, M::CANONICAL), passage.fetch('new')
    assert_includes by_key.fetch(['default', '19047', '']).fetch('english'),
                    'a new kind of magic called Primal Magic'
    assert_includes by_key.fetch(['default', '33284', '']).fetch('english'),
                    'imbued upon weapons and gems'
  end
end
