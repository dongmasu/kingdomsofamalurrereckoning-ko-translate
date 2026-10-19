#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'short-label-specs-poison-reverie'

class TestPoisonReveriePreparation < Minitest::Test
  P = PoisonReveriePreparation

  def setup
    @inventory = {}
    P::SPECS.each do |spec|
      spec.fetch(:keys).each do |source_key|
        parts = source_key.split(':', -1)
        span = P::SPANS[source_key]
        korean = span ? span.first : spec.fetch(:korean)
        korean = '비명을 지르는 환영' if P::EXCLUDED_KEYS.include?(source_key)
        @inventory[parts] = {
          'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
          'en_texts_json' => JSON.generate([source_key == 'default:62763:' ? 'Quarterling' : spec.fetch(:english)]),
          'ja_texts_json' => JSON.generate(['aligned Japanese evidence']),
          'zh_text' => 'aligned Chinese evidence',
          'work_text' => "prefix\r\n#{korean}\r\nsuffix"
        }
      end
    end
  end

  def test_stages_cover_exact_full_scopes_with_no_batch_allocation
    stages = P.stages(@inventory)
    assert_equal [39, 40], stages.map { |stage| stage.fetch(:reviews).length }
    assert_equal [5, 1], stages.map { |stage| stage.fetch(:definitions).length }
    rows = stages.flat_map { |stage| stage.fetch(:reviews) }
    assert_equal 79, rows.map { |row| P.key(row) }.uniq.length
    assert_equal(
      { 'accepted' => 66, 'not-an-issue' => 11, 'excluded' => 2 },
      rows.group_by { |row| row.fetch('status') }.transform_values(&:length)
    )
    rows.each do |row|
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/), row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal({ row.fetch('entity_key') => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')))
    end
  end

  def test_full_source_scope_drift_is_rejected
    extra = @inventory.values.first.dup
    extra['ID_Linha'] = 'unexpected'
    @inventory[P.key(extra)] = extra
    assert_raises(RuntimeError) { P.reviews(@inventory) }
  end

  def test_changed_and_repeated_explicit_korean_spans_are_rejected
    row = @inventory.fetch(['default', '36842', ''])
    row['work_text'] = 'changed source text'
    assert_raises(RuntimeError) { P.reviews(@inventory) }
    row['work_text'] = '레네릿 계곡 / 레네릿 계곡'
    assert_raises(RuntimeError) { P.reviews(@inventory) }
  end

  def test_prior_terminal_dispositions_are_retained_without_resolution
    prior = {
      'resource' => 'base', 'ID_Linha' => '1838', 'Tipo_Variante' => '11',
      'entity_key' => 'faction:house-of-pride', 'status' => 'excluded',
      'evidence' => 'Existing terminal evidence must remain unchanged.'
    }
    rows = P.reviews(@inventory, [prior])
    row = rows.find { |item| P.key(item) == ['base', '1838', '11'] }
    assert_equal [[prior['entity_key'], prior['status'], prior['evidence']]],
                 JSON.parse(row.fetch('prior_index_dispositions_json'))
    assert_equal 'excluded', prior.fetch('status')
  end

  def test_candidate_payload_is_separate_and_bounded
    groups = P.candidate_groups
    assert_equal 9, groups.length
    assert_equal 31, groups.values.flat_map { |group| group.fetch(:keys) }.uniq.length
    assert_equal 'uncertain', groups.fetch('Reckoning').fetch(:dispositions).fetch('default:63328:')
    refute groups.key?('Reverie')
  end

  def test_singular_resident_name_is_explicitly_defined_and_paired
    definition = P.definitions.find { |row| row['entity_key'] == 'people:quarterlings' }
    assert_equal 'Quarterling', definition.fetch('english_aliases')
    row = P.reviews(@inventory).find { |item| item['ID_Linha'] == '62763' }
    assert_includes row.fetch('new'), '쿼털링(Quarterling)'
    assert_equal 'Quarterling', row.fetch('english')
  end

  def test_hospitalis_singular_and_bare_name_stay_out_of_scope
    keys = P::SPECS.flat_map { |spec| spec.fetch(:keys) }
    refute_empty P::OUT_OF_SCOPE_KEYS
    assert_empty keys & P::OUT_OF_SCOPE_KEYS
    assert_empty P::SPANS.keys & P::OUT_OF_SCOPE_KEYS
    notes = P::SPECS.find { |spec| spec.fetch(:english) == 'Quarterlings' }.fetch(:notes)
    assert_includes notes, 'place:hospitalis-quarters'
  end
end
