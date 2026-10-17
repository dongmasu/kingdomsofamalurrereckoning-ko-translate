#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-praetorians-order-D21541'

class PraetoriansOrderD21541Test < Minitest::Test
  W = PraetoriansOrderD21541
  M = ReviewedNameBatches

  def self.reviewed_state
    @reviewed_state ||= if File.file?(W::DEFINITIONS)
      manifests = [21_541, 21_542].map do |d|
        File.join(__dir__, "proper-name-edits-D#{d}.tsv")
      end
      raise 'Praetorian batch manifest is missing' unless manifests.all? { |path| File.file?(path) }
      [
        M.table(W::DEFINITIONS).map(&:to_h),
        manifests.flat_map { |path| M.table(path).map(&:to_h) },
        true
      ]
    else
      paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
        M::DOCS + [
          M::INDEX, M::INVENTORY, ReviewedProperNameDiscovery::GLOSSARY,
          W::DEFINITIONS, W::REVIEWS
        ]
      before = paths.to_h do |path|
        [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : :absent]
      end
      reject_write = ->(*) { raise 'prepare called a shared writer or inventory refresher' }
      result = M.stub(:refresh_inventory, reject_write) do
        M.stub(:write_table, reject_write) do
          ReviewedProperNameDiscovery.stub(:run, reject_write) { W.prepare }
        end
      end
      after = paths.to_h do |path|
        [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : :absent]
      end
      raise 'prepare changed protected files' unless before == after
      [result.fetch(1), result.fetch(2), false]
    end
  end

  def definitions
    self.class.reviewed_state.fetch(0).to_h { |row| [row.fetch('entity_key'), row] }
  end

  def reviews
    self.class.reviewed_state.fetch(1)
  end

  def applied?
    self.class.reviewed_state.fetch(2)
  end

  def by_key
    reviews.to_h { |row| [M.key(row).join(':'), row] }
  end

  def test_complete_source_scope_four_definitions_and_batches
    defs = definitions
    rows = reviews
    assert_equal [W::PRAETORIANS, W::WATCH, W::GUARD, W::KEYMASTER].sort, defs.keys.sort
    assert_equal 67, rows.length
    assert_equal [50, 17], rows.each_slice(50).map(&:length)

    generated = W.expected_pairs
    assert_equal 71, generated.length
    assert_equal 67, generated.count { |pair| pair.first == W::PRAETORIANS }
    assert_equal 3, (generated.map { |pair| pair.first }.uniq - [W::PRAETORIANS]).length
    assert_equal 4, generated.count { |pair| pair.first != W::PRAETORIANS }
    reviewed_pairs = rows.flat_map do |row|
      JSON.parse(row.fetch('entity_dispositions_json')).keys.map do |entity|
        [entity, *M.key(row)]
      end
    end
    assert_equal generated.sort, reviewed_pairs.sort

    assert_equal 'organization', defs.fetch(W::PRAETORIANS).fetch('category')
    assert_equal 'Praetorians', defs.fetch(W::PRAETORIANS).fetch('english_canonical')
    assert_equal W::PRAETORIANS_KO, defs.fetch(W::PRAETORIANS).fetch('korean_canonical')
    assert_equal 'Praetorian|Praetorian order',
                 defs.fetch(W::PRAETORIANS).fetch('english_aliases')
    assert_equal 'title', defs.fetch(W::KEYMASTER).fetch('category')
    assert_includes defs.fetch(W::PRAETORIANS).fetch('notes'), 'not a species'
  end

  def test_exact_english_and_aligned_japanese_chinese_are_recorded_per_row
    rows = reviews
    active = M::RESOURCES.to_h do |resource|
      table = CSV.read(M.csv_path(resource), headers: true, col_sep: ';', encoding: 'bom|utf-8')
      id_header = table.headers.find { |header| header.to_s.delete_prefix("\uFEFF") == 'ID_Linha' }
      variant_header = table.headers.find { |header| header == 'Tipo_Variante' }
      cells = table.each_with_object({}) do |row, result|
        key = [resource, row[id_header], variant_header ? row[variant_header] : '']
        result[key] = row['Texto']
      end
      [resource, cells]
    end
    later_path = File.join(__dir__, 'proper-name-edits-D21545.tsv')
    later_edits = if File.file?(later_path)
      M.table(later_path).map(&:to_h).to_h { |row| [M.key(row), row.fetch('new')] }
    else
      {}
    end
    rows.each do |row|
      expected_active = if applied?
        later_edits.fetch(M.key(row), row.fetch('new'))
      else
        row.fetch('old')
      end
      assert_equal expected_active, active.fetch(row.fetch('resource')).fetch(M.key(row))
      assert_match W::PRAETORIAN_SOURCE, row.fetch('english')
      assert_match(/軍団兵|近衛兵|軍団警備兵|兵士|詰所/, row.fetch('japanese'))
      assert_match(/禁卫军|军团兵|哨兵/, row.fetch('chinese'))
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
    end
    assert_equal 1, by_key.fetch('base:948:11').fetch('english').scan(W::PRAETORIAN_SOURCE).length
    assert_equal 1, by_key.fetch('default:1553:').fetch('english').scan(W::PRAETORIAN_SOURCE).length
    assert_equal 1, by_key.fetch('default:62486:').fetch('english').scan(W::PRAETORIAN_SOURCE).length
    assert_includes by_key.fetch('default:1553:').fetch('new'), '프레토리안 근위대원(Praetorians)'
  end

  def test_complete_garrison_and_person_labels_are_not_rewritten
    W::GARRISON_KEYS.each do |key|
      row = by_key.fetch(key.join(':'))
      assert_equal 'excluded',
                   JSON.parse(row.fetch('entity_dispositions_json')).fetch(W::PRAETORIANS)
      assert_equal row.fetch('old'), row.fetch('new')
      assert_includes row.fetch('old'), '(Praetorian Garrison)'
    end
    %w[412 19797].each do |id|
      row = by_key.fetch("default:#{id}:")
      assert_equal 'excluded',
                   JSON.parse(row.fetch('entity_dispositions_json')).fetch(W::PRAETORIANS)
      assert_equal row.fetch('old'), row.fetch('new')
      assert_includes row.fetch('old'), '(Praetorian Orsinian Paige)'
    end
    %w[18902 28142].each do |id|
      row = by_key.fetch("default:#{id}:")
      assert_equal 'uncertain',
                   JSON.parse(row.fetch('entity_dispositions_json')).fetch(W::PRAETORIANS)
      assert_equal row.fetch('old'), row.fetch('new')
      refute_includes JSON.parse(row.fetch('entity_dispositions_json')).keys, 'person:orsinian-paige'
    end
  end

  def test_prior_holds_remain_unchanged_and_separate_complete_labels_are_scoped
    W::EXISTING_HOLDS.each do |id|
      row = by_key.fetch("default:#{id}:")
      assert_equal 'uncertain',
                   JSON.parse(row.fetch('entity_dispositions_json')).fetch(W::PRAETORIANS)
      assert_equal row.fetch('old'), row.fetch('new')
    end

    W::SEPARATE_LABEL_IDS.each do |id|
      row = by_key.fetch("default:#{id}:")
      states = JSON.parse(row.fetch('entity_dispositions_json'))
      assert_equal 'excluded', states.fetch(W::PRAETORIANS)
      assert_equal row.fetch('old'), row.fetch('new') if id == '50993'
    end

    watch = by_key.fetch('default:41070:')
    watch_states = JSON.parse(watch.fetch('entity_dispositions_json'))
    assert_equal 'accepted', watch_states.fetch(W::WATCH)
    assert_includes watch.fetch('new'), W::WATCH_KO

    watch_label = by_key.fetch('default:7653:')
    assert_includes watch_label.fetch('new'), W::WATCH_KO

    guard = by_key.fetch('default:50993:')
    guard_states = JSON.parse(guard.fetch('entity_dispositions_json'))
    assert_equal 'not-an-issue', guard_states.fetch(W::GUARD)
    assert_includes guard.fetch('new'), W::GUARD_KO

    keymaster = by_key.fetch('default:62921:')
    keymaster_states = JSON.parse(keymaster.fetch('entity_dispositions_json'))
    assert_equal 'accepted', keymaster_states.fetch(W::KEYMASTER)
    assert_includes keymaster.fetch('new'), W::KEYMASTER_KO
  end

  def test_existing_registration_and_terminal_rows_are_not_reopened
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    current_defs = glossary.select do |row|
      [W::PRAETORIANS, W::WATCH, W::GUARD, W::KEYMASTER].include?(row.fetch('entity_key'))
    end
    if applied?
      assert_equal definitions.keys.sort,
                   current_defs.map { |row| row.fetch('entity_key') }.sort
    else
      assert_empty current_defs
    end
    assert glossary.any? { |row| row.fetch('entity_key') == 'place:praetorian-garrison' }

    index = M.table(M::INDEX).map(&:to_h)
    %w[412 19797].each do |id|
      assert index.any? do |row|
        row.fetch('entity_key') == 'person:orsinian-paige' &&
          M.key(row) == ['default', id, '']
      end
    end
    if applied?
      assert_equal 4, current_defs.length
      [21_541, 21_542].each do |d|
        assert File.file?(File.join(__dir__, "proper-name-edits-D#{d}.tsv"))
      end
    else
      [W::DEFINITIONS, W::REVIEWS].each do |path|
        refute File.exist?(path), "prepared output already exists: #{path}"
      end
    end
    assert W.respond_to?(:apply)
  end
end
