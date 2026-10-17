#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'scout-unregistered-person-names'

class UnregisteredPersonNameScoutTest < Minitest::Test
  def test_known_terms_include_entities_from_every_category
    glossary = [
      {
        'category' => 'place',
        'english_canonical' => 'Rathir',
        'english_aliases' => 'Rathir-town'
      },
      {
        'category' => 'place',
        'english_canonical' => 'Tala-Rane',
        'english_aliases' => ''
      },
      {
        'category' => 'place',
        'english_canonical' => 'Teeth of Naros',
        'english_aliases' => ''
      },
      {
        'category' => 'title',
        'english_canonical' => 'Weeping King',
        'english_aliases' => 'The Weeping King'
      }
    ]

    assert_equal(
      Set[
        'rathir', 'rathir town', 'tala rane', 'teeth of naros',
        'weeping king', 'the weeping king'
      ],
      UnregisteredPersonNameScout.known_entity_terms(glossary)
    )
    known = UnregisteredPersonNameScout.known_entity_terms(glossary)
    ['Tala-Rane', 'Teeth of Naros', 'Weeping King'].each do |candidate|
      refute(
        UnregisteredPersonNameScout.person_candidate?(candidate, known),
        "known glossary term was rediscovered: #{candidate}"
      )
    end
  end

  def test_token_index_preserves_crosslink_order_and_excludes_self
    names = ['Aethan Engar', 'Aethan Tor', 'Engar', 'Arden Aethan']
    index = UnregisteredPersonNameScout.name_token_index(names)

    assert_equal(
      ['Engar', 'Aethan Tor', 'Arden Aethan'],
      UnregisteredPersonNameScout.lexical_crosslinks('Aethan Engar', index).split('|')
    )
  end

  def test_offset_returns_the_next_ranked_candidate
    inventory = %w[Aldan Berran].each_with_index.map do |name, index|
      {
        'resource' => 'default',
        'ID_Linha' => (index + 1).to_s,
        'Tipo_Variante' => '',
        'en_texts_json' => JSON.generate([name]),
        'ja_texts_json' => '[]',
        'zh_text' => '',
        'work_text' => ''
      }
    end

    result = UnregisteredPersonNameScout.build(inventory, [], 1, offset: 1)

    assert_equal(2, result.first.first)
    assert_equal('Berran', result.first[1])
  end
end
