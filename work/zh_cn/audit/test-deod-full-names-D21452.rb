#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'review-deod-full-names-D21452'

class DeodFullNamesD21452Test < Minitest::Test
  M = DeodFullNamesD21452
  GLOSSARY_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def fixture_inventory
    M::ENTITIES.flat_map do |entity|
      entity.fetch(:rows).map do |spec|
        title_twillt = spec.fetch(:id) == '57055'
        english = title_twillt ? 'Docent Deod Twillt' : entity.fetch(:english)
        japanese = title_twillt ? '導師デオド・トウィルト' : spec.fetch(:japanese_anchor)
        chinese = title_twillt ? '迪欧德·忒尔特讲师' : spec.fetch(:chinese_anchor)
        korean = if spec.fetch(:id) == '24970'
                   "앞 문장\r\n#{spec.fetch(:old_span)} 뒤 문장"
                 elsif %w[40060 15083 57055].include?(spec.fetch(:id))
                   spec.fetch(:old_span)
                 else
                   "앞 문장 #{spec.fetch(:old_span)} 뒤 문장"
                 end
        source = {
          'resource' => 'default', 'ID_Linha' => spec.fetch(:id),
          'Tipo_Variante' => '', 'en_texts_json' => JSON.generate([english]),
          'ja_texts_json' => JSON.generate([japanese]), 'zh_text' => chinese,
          'work_text' => korean
        }
        [M::M.key(source), source]
      end
    end.to_h
  end

  def generated_for(inventory)
    build_occurrences(inventory.values, M.definitions_for(GLOSSARY_HEADERS)).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def test_definitions_are_two_distinct_people_without_aliases
    definitions = M.definitions_for(GLOSSARY_HEADERS)

    assert_equal %w[person:deod-dungaras person:deod-twillt],
                 definitions.map { |row| row.fetch('entity_key') }
    assert definitions.all? { |row| row.fetch('english_aliases').empty? }
    assert_equal M::CANONICAL_DUNGARAS,
                 definitions.find { |row| row.fetch('entity_key') == 'person:deod-dungaras' }.fetch('korean_canonical')
    assert_equal M::CANONICAL_TWILLT,
                 definitions.find { |row| row.fetch('entity_key') == 'person:deod-twillt' }.fetch('korean_canonical')
    refute_equal definitions[0].fetch('entity_key'), definitions[1].fetch('entity_key')
    assert_includes definitions[0].fetch('notes'), 'not the separately named docent'
    assert_includes definitions[1].fetch('notes'), 'distinct full-name scope'
  end

  def test_fixture_covers_only_the_seven_exact_full_name_keys
    inventory = fixture_inventory
    generated = generated_for(inventory)
    reviews = M.reviews_for(inventory, generated)

    assert_equal 7, M.expected_pairs.length
    assert_equal M.expected_pairs.sort,
                 generated.map { |row| [row.fetch('entity_key'), *M::M.key(row)] }.sort
    assert reviews.all? { |row| row.fetch('resource') == 'default' }
    assert_equal 6, reviews.count { |row| row.fetch('status') == 'accepted' }
    assert_equal 1, reviews.count { |row| row.fetch('status') == 'not-an-issue' }
  end

  def test_dungaras_uses_prevailing_stem_and_changes_only_the_reviewed_span
    inventory = fixture_inventory
    generated = generated_for(inventory)
    reviews = M.reviews_for(inventory, generated)
    dungaras = reviews.select { |row| row.fetch('entity_key') == 'person:deod-dungaras' }

    assert_equal %w[24970 28732 40060 45089 63401],
                 dungaras.map { |row| row.fetch('ID_Linha') }
    assert dungaras.all? { |row| row.fetch('new').include?(M::CANONICAL_DUNGARAS) }
    corrected = dungaras.find { |row| row.fetch('ID_Linha') == '28732' }
    assert_equal "앞 문장 #{M::CANONICAL_DUNGARAS} 뒤 문장", corrected.fetch('new')
    narrative = dungaras.find { |row| row.fetch('ID_Linha') == '24970' }
    assert_equal "앞 문장\r\n#{M::CANONICAL_DUNGARAS} 뒤 문장", narrative.fetch('new')
  end

  def test_docent_title_stays_atomic_and_unadorned_twillt_is_annotated
    inventory = fixture_inventory
    reviews = M.reviews_for(inventory, generated_for(inventory))
    twillt = reviews.select { |row| row.fetch('entity_key') == 'person:deod-twillt' }
    standalone = twillt.find { |row| row.fetch('ID_Linha') == '15083' }
    docent = twillt.find { |row| row.fetch('ID_Linha') == '57055' }

    assert_equal M::CANONICAL_TWILLT, standalone.fetch('new')
    assert_equal '강사 데오드 트윌트(Docent Deod Twillt)', docent.fetch('new')
    assert_equal 'not-an-issue', docent.fetch('status')
    refute_includes docent.fetch('new'), '(Deod Twillt)'
  end

  def test_unexpected_key_or_locale_evidence_is_rejected
    inventory = fixture_inventory
    generated = generated_for(inventory)
    extra = generated.first.dup
    extra['ID_Linha'] = '99999'
    assert_raises(RuntimeError) { M.reviews_for(inventory, generated + [extra]) }

    inventory.fetch(['default', '24970', ''])['zh_text'] = 'unrelated source'
    assert_raises(RuntimeError) { M.reviews_for(inventory, generated) }
  end

  def test_prior_other_entity_rows_are_required_and_remain_distinct
    rows = M::PRESERVED_PRIOR.flat_map do |key, entities|
      entities.map do |entity, status|
        {
          'entity_key' => entity, 'resource' => key[0], 'ID_Linha' => key[1],
          'Tipo_Variante' => key[2], 'status' => status,
          'evidence' => "prior decision for #{entity}"
        }
      end
    end
    snapshot = M.preserved_prior(rows)

    assert_equal 6, snapshot.length
    refute snapshot.keys.any? { |entity, *| entity.start_with?('person:deod-') }
    rows.first['status'] = 'uncertain'
    assert_raises(RuntimeError) { M.preserved_prior(rows) }
  end

  def test_all_prior_records_are_preserved_except_current_korean_text
    prior = {
      'entity_key' => 'person:unrelated', 'resource' => 'base',
      'ID_Linha' => '999', 'Tipo_Variante' => '11',
      'matched_english' => 'Unrelated', 'english_source' => 'Unrelated',
      'korean_current' => 'previous text', 'status' => 'uncertain',
      'evidence' => 'prior hold, outside the seven reviewed rows'
    }
    snapshot = M.prior_records([prior])
    additions = M.expected_pairs.map do |entity, resource, id, variant|
      {
        'entity_key' => entity, 'resource' => resource, 'ID_Linha' => id,
        'Tipo_Variante' => variant, 'status' => 'accepted',
        'evidence' => 'new full-name disposition'
      }
    end
    final = [prior.merge('korean_current' => 'refreshed text'), *additions]
    M.verify_prior_records!(snapshot, final)

    final.first['evidence'] = 'overwritten hold'
    assert_raises(RuntimeError) { M.verify_prior_records!(snapshot, final) }
    final.first['evidence'] = prior.fetch('evidence')
    assert_raises(RuntimeError) { M.verify_prior_records!(snapshot, final.drop(1)) }
    assert_raises(RuntimeError) { M.verify_prior_records!(snapshot, final[0...-1]) }
    assert_raises(RuntimeError) { M.prior_records([prior, prior.dup]) }
  end
end
