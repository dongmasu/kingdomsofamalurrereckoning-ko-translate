#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-related-titles-discovery-D21069'

class RelatedTitlesDiscoveryD21069Test < Minitest::Test
  M = RelatedTitlesDiscoveryD21069

  def test_only_standalone_titles_are_title_labels
    assert M.title_key?('work:orella-notes', ['base', '1328', '11'])
    refute M.title_key?('work:orella-notes', ['base', '1328', ''])
    refute M.title_key?('work:orella-notes', ['default', '31251', ''])
    assert M.title_key?('place:skald-forge', ['default', '62878', ''])
    refute M.title_key?('place:skald-forge', ['default', '21753', ''])
  end

  def test_complete_diary_title_replaces_only_the_label
    source = {
      'resource' => 'base', 'ID_Linha' => '2227', 'Tipo_Variante' => '11',
      'work_text' => '마이파 론웬(Myfa Rhonwen)의 일기'
    }
    assert_equal '마이파 론웬의 일기(Diary of Myfa Rhonwen)',
                 M.reviewed_text(source, [{'entity_key' => 'work:diary-of-myfa-rhonwen'}], M.definitions)
  end

  def test_descriptive_possessive_is_not_rewritten_as_a_title
    source = {
      'resource' => 'default', 'ID_Linha' => '21753', 'Tipo_Variante' => '',
      'work_text' => '스칼드(Skald)의 대장간을 찾았다.'
    }
    assert_equal source['work_text'],
                 M.reviewed_text(source, [{'entity_key' => 'place:skald-forge'}], M.definitions)
  end
end
