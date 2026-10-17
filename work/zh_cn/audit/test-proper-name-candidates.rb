#!/usr/bin/env ruby

require 'minitest/autorun'
require 'tmpdir'
require_relative 'build-proper-name-candidates'

class ProperNameCandidatesTest < Minitest::Test
  def row(text, id = '1', resource = 'default', variant = '')
    { 'resource' => resource, 'ID_Linha' => id, 'Tipo_Variante' => variant,
      'en_texts_json' => JSON.generate(Array(text)), 'work_text' => 'NOT English',
      'zh_text' => 'NOT English', 'ja_texts_json' => '["NOT English"]' }
  end

  def candidates(rows, glossary = [])
    ProperNameCandidates.build(rows, glossary).to_h { |item| [item[1], item] }
  end

  def test_sentence_initial_names_and_ordinary_capitals
    result = candidates([row('Agarth waits. Alyn Shir arrives. Welcome home.')])
    %w[Agarth Alyn Shir Welcome].each { |name| assert_includes result.keys, name }
    assert_includes result.keys, 'Alyn Shir'
    assert_equal 'needs-context', result['Welcome'][5]
  end

  def test_apostrophes_and_hyphenated_multiword_names
    result = candidates([row("O'Connell's Iron-Fist Keep")])
    assert_includes result.keys, "O'Connell's"
    assert_includes result.keys, "O'Connell's Iron-Fist Keep"
    curved = "D\u2019Alfar"
    assert_includes candidates([row(curved)]).keys, curved
  end

  def test_ordinary_standalone_and_multiword_labels_remain
    result = candidates([row('loot'), row('ordinary wooden shield', '2')])
    assert_includes result.keys, 'loot'
    assert_includes result.keys, 'ordinary wooden shield'
    assert_equal 'standalone-label', result['loot'][2]
  end

  def test_title_spans_with_lowercase_connectors
    result = candidates([row('House of Ballads awaits. Go to Iron-Fist Keep now.')])
    assert_includes result.keys, 'House of Ballads'
    assert_includes result.keys, 'Iron-Fist Keep'
    refute_includes result.keys, 'Ballads Go'
  end

  def test_internal_capitalization
    result = candidates([row('we met a dAlfar yesterday.')])
    assert_equal 'internal-capitalization', result['dAlfar'][2]
  end

  def test_variant_replicas_do_not_inflate_evidence
    rows = [row(['Agarth', 'Agarth'], '7', 'base', '11'),
            row('Agarth', '7', 'base', '12'), row('Agarth', '7', 'base', '12'),
            row('Agarth', '7'), row('Agarth', '8', 'base', '11')]
    result = candidates(rows)['Agarth']
    assert_equal 'base:7|base:8|default:7', result[3]
    assert_equal 'base:7:11|base:7:12|base:8:11|default:7', result[4]
  end

  def test_distinct_source_texts_under_same_id_are_not_lost
    result = candidates([row('Agarth', '7', 'base', '11'),
                         row('Alyn Shir', '7', 'base', '12')])
    assert_includes result.keys, 'Agarth'
    assert_includes result.keys, 'Alyn Shir'
  end

  def test_known_lowercase_aliases_and_word_boundaries
    glossary = [{ 'english_canonical' => 'House of Ballads', 'english_aliases' => 'ballads|old house' }]
    result = candidates([row('we heard ballads in the old house yesterday.')], glossary)
    %w[ballads].each { |term| assert_includes result[term][2], 'known-glossary-key' }
    assert_includes result['old house'][2], 'known-glossary-key'
    refute candidates([row('we heard balladsmith yesterday.')], glossary).key?('ballads')
    uppercase = candidates([row('the HOUSE OF BALLADS stands.')], glossary)
    assert_includes uppercase['HOUSE OF BALLADS'][2], 'known-glossary-key'
  end

  def test_placeholders_removed_without_mutating_sources
    source = row('{TOKEN} Agarth {QuestName}')
    before = Marshal.dump(source)
    glossary = [{ 'english_canonical' => 'TOKEN', 'english_aliases' => 'QuestName' }]
    result = candidates([source, row('{TOKEN} 123 ---', '2')], glossary)
    assert_includes result.keys, 'Agarth'
    refute_includes result.keys, 'TOKEN'
    refute_includes result.keys, 'QuestName'
    assert_equal before, Marshal.dump(source)
  end

  def test_deterministic_casefolded_aggregation
    glossary = [{ 'english_canonical' => 'Agarth', 'english_aliases' => 'agarth' }]
    rows = [row('Agarth', '2'), row('agarth', '1')]
    result = ProperNameCandidates.build(rows, glossary)
    assert_equal result, ProperNameCandidates.build(rows.reverse, glossary.reverse)
    assert_equal 1, result.length
    assert_equal 'candidate:agarth', result.first[0]
    assert_equal 'default:1|default:2', result.first[3]
    assert_equal result.sort_by(&:first), result
  end

  def test_malformed_inventory_rejected
    assert_raises(ProperNameCandidates::Error) do
      ProperNameCandidates.build([row('Agarth').merge('en_texts_json' => '{broken')], [])
    end
    assert_raises(ProperNameCandidates::Error) do
      ProperNameCandidates.build([row('Agarth').merge('en_texts_json' => '{"name":"Agarth"}')], [])
    end
  end

  def test_output_safety
    Dir.mktmpdir('proper-name-candidate-test-', '/private/tmp') do |dir|
      input = File.join(dir, 'inventory.tsv')
      File.write(input, 'unchanged')
      assert_raises(ProperNameCandidates::Error) { ProperNameCandidates.safe_output(input, [input]) }
      assert_raises(ProperNameCandidates::Error) do
        ProperNameCandidates.safe_output(File.join(dir, 'current.csv'), [input])
      end
      assert_raises(ProperNameCandidates::Error) do
        ProperNameCandidates.safe_output(File.expand_path('../current.tsv', __dir__), [input])
      end
      link = File.join(dir, 'linked.tsv')
      File.symlink(input, link)
      assert_raises(ProperNameCandidates::Error) { ProperNameCandidates.safe_output(link, [input]) }
      hardlink = File.join(dir, 'hardlinked.tsv')
      File.link(input, hardlink)
      assert_raises(ProperNameCandidates::Error) { ProperNameCandidates.safe_output(hardlink, []) }
      escape = File.join(dir, 'outside')
      File.symlink(File.expand_path('..', __dir__), escape)
      assert_raises(ProperNameCandidates::Error) do
        ProperNameCandidates.safe_output(File.join(escape, 'current.tsv'), [input])
      end
      assert_equal 'unchanged', File.read(input)
    end
  end

  def test_cli_round_trip_sorted_and_inputs_unchanged
    Dir.mktmpdir('proper-name-candidate-test-', '/private/tmp') do |dir|
      inventory = File.join(dir, 'inventory.tsv')
      glossary = File.join(dir, 'glossary.tsv')
      output = File.join(dir, 'candidates.tsv')
      CSV.open(inventory, 'w', col_sep: "\t") do |csv|
        csv << %w[resource ID_Linha Tipo_Variante en_texts_json]
        [row('Zara waits.', '2'), row('Agarth', '1')].each do |item|
          csv << item.values_at('resource', 'ID_Linha', 'Tipo_Variante', 'en_texts_json')
        end
      end
      CSV.open(glossary, 'w', col_sep: "\t") { |csv| csv << %w[english_canonical english_aliases] }
      before = [inventory, glossary].map { |path| File.binread(path) }
      count = nil
      capture_io do
        count = ProperNameCandidates.run(['--inventory', inventory, '--glossary', glossary, '--out', output])
      end
      result = CSV.read(output, headers: true, col_sep: "\t")
      assert_equal ProperNameCandidates::HEADERS, result.headers
      assert_equal 2, count
      assert_equal %w[Agarth Zara], result.map { |item| item['english_candidate'] }
      assert result.all? { |item| item['status'] == 'needs-context' }
      assert_equal before, [inventory, glossary].map { |path| File.binread(path) }
    end
  end
end
