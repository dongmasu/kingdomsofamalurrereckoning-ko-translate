#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'build-short-label-discovery-20261018'

class ShortLabelDiscovery20261018Test < Minitest::Test
  def row(id, english, korean)
    {
      'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
      'en_texts_json' => JSON.generate([english]), 'work_text' => korean
    }
  end

  def test_pairs_need_english_source_evidence_and_do_not_approve_edits
    rows = [
      row('1', 'Named Site', '장소'),
      row('2', 'Go to Named Site.', '장소(Named Site)로 가라.'),
      row('3', 'Another Site', '다른 장소'),
      row('4', 'Unrelated sentence.', '다른 장소(Another Site)'),
      row('5', 'Registered Site', '등록된 장소')
    ]
    glossary = [{'english_canonical' => 'Registered Site', 'english_aliases' => ''}]
    result = ShortLabelDiscovery20261018.build(rows, glossary, [])
    assert_equal ['Named Site'], result.map { |item| item['english_candidate'] }
    assert_equal 'candidate-not-reviewed', result.first['status']
    assert_equal [['default', '1', '']], JSON.parse(result.first['unpaired_label_keys_json'])
  end

  def test_existing_entity_ownership_is_retained_as_review_evidence
    rows = [row('1', 'Named Person', '인물'), row('2', 'Named Person', '인물(Named Person)')]
    occurrences = [{
      'resource' => 'default', 'ID_Linha' => '1', 'Tipo_Variante' => '',
      'entity_key' => 'person:component', 'status' => 'not-an-issue'
    }]
    result = ShortLabelDiscovery20261018.build(rows, [], occurrences)
    owners = JSON.parse(result.first['existing_label_owners_json'])
    assert_equal [['person:component', 'not-an-issue']], owners.fetch('default:1:')
  end

  def test_empty_korean_cell_is_treated_as_unpaired_text
    rows = [
      row('1', 'Named Site', nil),
      row('2', 'Visit the Named Site.', '장소(Named Site)를 방문해라.')
    ]
    result = ShortLabelDiscovery20261018.build(rows, [], [])
    assert_equal ['Named Site'], result.map { |item| item['english_candidate'] }
    assert_equal [['default', '1', '']], JSON.parse(result.first['unpaired_label_keys_json'])
  end

  def test_prior_candidate_dispositions_are_removed_key_by_key
    rows = [
      row('1', 'Named Site', '장소'),
      row('2', 'Visit the Named Site.', '장소(Named Site)를 방문해라.'),
      row('3', 'Named Site', '장소')
    ]
    reviewed = Set.new([['Named Site', 'default', '1', '']])
    result = ShortLabelDiscovery20261018.build(
      rows, [], [], reviewed_dispositions: reviewed
    )
    assert_equal [['default', '3', '']],
                 JSON.parse(result.first['unpaired_label_keys_json'])
    assert_equal [['default', '2', '']],
                 JSON.parse(result.first['paired_evidence_keys_json'])
  end

  def test_fully_dispositioned_candidate_group_is_not_requeued
    rows = [
      row('1', 'Named Site', '장소'),
      row('2', 'Visit the Named Site.', '장소(Named Site)를 방문해라.')
    ]
    reviewed = Set.new([
      ['Named Site', 'default', '1', ''],
      ['Named Site', 'default', '2', '']
    ])
    result = ShortLabelDiscovery20261018.build(
      rows, [], [], reviewed_dispositions: reviewed
    )
    assert_empty result
  end
end
