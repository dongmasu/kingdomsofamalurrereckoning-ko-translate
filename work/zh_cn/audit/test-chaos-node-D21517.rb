#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-chaos-node-D21517'

class ChaosNodeD21517Test < Minitest::Test
  C = ChaosNodeD21517
  M = ReviewedNameBatches
  PLURAL_IDS = %w[11414 13857 57186].freeze
  OPAQUE_KEYS = [
    ['default', '56572', ''], ['default', '63443', '']
  ].map(&:freeze).freeze

  def self.prepared
    @prepared ||= begin
      paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
        M::DOCS + [M::INDEX, ReviewedProperNameDiscovery::GLOSSARY]
      before = paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
      no_write = ->(*) { raise 'Chaos Node prepare attempted a shared write/apply/refresh' }
      result = M.stub(:refresh_inventory, no_write) do
        M.stub(:write_table, no_write) do
          M.stub(:run, no_write) do
            ReviewedProperNameDiscovery.stub(:run, no_write) do
              File.stub(:write, no_write) do
                File.stub(:binwrite, no_write) { C.prepare }
              end
            end
          end
        end
      end
      after = paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
      raise 'Chaos Node prepare changed protected files' unless before == after
      result
    end
  end

  def definitions
    if File.file?(C::DEFINITIONS)
      M.table(C::DEFINITIONS).map(&:to_h)
    else
      self.class.prepared.fetch(1)
    end
  end

  def reviews
    if File.file?(C::REVIEWS)
      M.table(C::REVIEWS).map(&:to_h)
    else
      self.class.prepared.fetch(2)
    end
  end

  def by_id
    reviews.to_h { |row| [row.fetch('ID_Linha'), row] }
  end

  def test_exact_scope_definition_and_counts
    definition = definitions.fetch(0)
    assert_equal 'lore_term:chaos-node', definition.fetch('entity_key')
    assert_equal 'lore term', definition.fetch('category')
    assert_equal 'Chaos Node', definition.fetch('english_canonical')
    assert_equal C::CANONICAL, definition.fetch('korean_canonical')
    assert_equal 'Chaos Nodes', definition.fetch('english_aliases')
    assert_equal '혼돈 노드|혼돈의 결절', definition.fetch('korean_variants')

    assert_equal 13, reviews.length
    assert_equal C.expected_pairs.sort,
                 reviews.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    assert_equal 12, reviews.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal [['default', '55107', '']],
                 reviews.select { |row| row.fetch('old') == row.fetch('new') }.map { |row| M.key(row) }
    assert_equal C::IDS.sort, C::SPANS.keys.sort
  end

  def test_all_fourteen_full_name_mentions_have_trilingual_support
    reviews.each do |row|
      id = row.fetch('ID_Linha')
      term, count = C::SOURCE_NAMES.fetch(id)
      pattern = Regexp.new("(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])", Regexp::IGNORECASE)
      assert_equal count, row.fetch('english').scan(pattern).length, id
      assert_equal count, row.fetch('japanese').scan('混沌のノード').length, id
      zh_term = id == '63443' ? 'Chaos Nodes' : '混乱节点'
      assert_equal count, row.fetch('chinese').scan(zh_term).length, id
      assert_includes row.fetch('japanese'), '混沌'
      assert_includes row.fetch('chinese'), id == '63443' ? 'Chaos Nodes' : '混乱'
    end
    assert_equal 14, C::SOURCE_NAMES.values.sum(&:last)
  end

  def test_exact_name_only_transforms_plural_source_labels_and_particles
    reviews.each do |row|
      id = row.fetch('ID_Linha')
      key = M.key(row)
      assert_equal C.normalize(row.fetch('old'), key), row.fetch('new'), id
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/), row.fetch('new').scan(/\r\n|\r|\n/), id
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), id
      unless id == '12596' || OPAQUE_KEYS.include?(key)
        assert_equal 1, row.fetch('new').scan(/혼돈 노드\(Chaos Nodes?\)/).length, id
      end
      assert_equal({ C::ENTITY => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')), id)
    end
    PLURAL_IDS.each do |id|
      assert_equal 1, by_id.fetch(id).fetch('new').scan('혼돈 노드(Chaos Nodes)').length, id
    end
    assert_equal 2, by_id.fetch('12596').fetch('new').scan('혼돈 노드(Chaos Node)').length
    assert_includes by_id.fetch('12596').fetch('new'),
                    '노드(Nodes)를 파괴하면 운명 없는 자에게'
    assert_includes by_id.fetch('12596').fetch('new'),
                    '노드(Chaos Node)를 파괴하면 던전이 붕괴되어'
    assert_includes by_id.fetch('12596').fetch('new'),
                    '노드(Node)를 파괴하기 전에'
    %w[56572 63443].each do |id|
      row = by_id.fetch(id)
      source_token = C::SPANS.fetch(id).first.first
      opaque_tokens = row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal 1, row.fetch('old').scan(source_token).length
      assert_equal opaque_tokens, row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_includes row.fetch('new'), "#{source_token}(Chaos Nodes)"
    end
    assert_includes by_id.fetch('11414').fetch('new'), '혼돈 노드(Chaos Nodes)를'
    assert_includes by_id.fetch('13857').fetch('new'), '혼돈 노드(Chaos Nodes)를'
    assert_includes by_id.fetch('57186').fetch('new'), '혼돈 노드(Chaos Nodes)를'
    assert_includes by_id.fetch('20075').fetch('new'), '혼돈 노드(Chaos Node)를 공격하다'
    assert_includes by_id.fetch('29421').fetch('new'), '혼돈 노드(Chaos Node)를 파괴하고'
    refute_match(/\([^)]*\(/, reviews.map { |row| row.fetch('new') }.join("\n"))
  end

  def test_chaos_realm_and_opaque_plural_label_are_preserved
    row = by_id.fetch('12596')
    assert_includes row.fetch('new'), '{*1혼돈의 영역}'
    assert_includes row.fetch('new'), '혼돈의 영역으로 이동합니다.'
    assert_includes row.fetch('english'), 'Chaos Realm'
    inventory = WellOfSoulsD21510.load_inventory
    generated = C.source_occurrences(inventory, definitions.fetch(0))
    OPAQUE_KEYS.each do |key|
      assert generated.any? { |occurrence| M.key(occurrence) == key }
      id = key.fetch(1)
      row = by_id.fetch(id)
      assert_includes row.fetch('english'), '{*1Chaos Nodes}'
      assert_includes row.fetch('japanese'), '{*1混沌のノード}'
      zh_node = id == '63443' ? '{*1Chaos Nodes}' : '{*1混乱节点}'
      assert_includes row.fetch('chinese'), zh_node
    end
  end

  def test_56572_has_a_later_chaos_nodes_label_after_unrelated_item_tokens
    row = by_id.fetch('56572')
    assert_includes row.fetch('english'), '{*1Chaos Flame}'
    assert_includes row.fetch('english'), '{*1Chaos Weapons}'
    assert_includes row.fetch('english'), '{*1Chaos Nodes}'
    assert_includes row.fetch('japanese'), '{*1混沌の炎}'
    assert_includes row.fetch('japanese'), '{*1混沌のノード}'
    assert_includes row.fetch('chinese'), '{*1混乱烈焰}'
    assert_includes row.fetch('chinese'), '{*1混乱节点}'
    assert_includes row.fetch('old'), '{*1혼돈 노드}'
    assert_includes row.fetch('new'), '{*1혼돈 노드}(Chaos Nodes)'
  end

  def test_entity_and_occurrence_state_before_or_after_apply
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    entities = glossary.select { |row| row.fetch('entity_key') == C::ENTITY }
    occurrences = index.select { |row| row.fetch('entity_key') == C::ENTITY }
    if File.file?(C::REVIEWS)
      assert_equal 1, entities.length
      assert_equal C::CANONICAL, entities.first.fetch('korean_canonical')
      assert_equal 'Chaos Nodes', entities.first.fetch('english_aliases')
      assert_equal C.expected_pairs.sort,
                   occurrences.map { |row| [C::ENTITY, *M.key(row)] }.sort
    else
      assert_empty entities
      assert_empty occurrences
    end
  end

  def test_source_span_and_alias_gates_fail_closed
    assert_raises(RuntimeError) do
      C.normalize('혼돈 노드 혼돈 노드', ['default', '52798', ''])
    end
    assert_raises(RuntimeError) do
      C.normalize('혼돈 노드(Other)', ['default', '52798', ''])
    end
    assert_raises(RuntimeError) do
      C.normalize('{*1혼돈 노드}(Other)', ['default', '63443', ''])
    end
    assert_raises(RuntimeError) do
      C.source_occurrences({}, definitions.fetch(0).merge('english_aliases' => 'Node'))
    end
  end

  def test_only_the_exact_plural_alias_is_registered_for_matching
    matcher = build_matchers(definitions)
    assert_equal [C::ENTITY], candidate_matches(['Chaos Nodes'], matcher).keys
    assert_equal [C::ENTITY], candidate_matches(['Chaos Node'], matcher).keys
    assert_empty candidate_matches(['Node', 'Nodes', 'Chaos Realm'], matcher)
  end
end
