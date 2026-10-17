#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-vipers-D21458'

class VipersD21458Test < Minitest::Test
  V = VipersD21458
  HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  KOREAN = {
    '1575' => '바이퍼즈(Vipers)를 얕보지 마.',
    '1970' => '바이퍼즈(Vipers)는 만만치 않아.',
    '8122' => '바이퍼스(Vipers)의 여러 훈련',
    '8549' => '바이퍼스에게는 유리한 점이 없어.',
    '13122' => '홀든(Holden); 바이퍼스(Vipers)가 이길 거야.',
    '16592' => '홀든 라파예트(Holden LaFayette)와 바이퍼스(Vipers)의 대결!',
    '18198' => "바이퍼스(The Vipers) 대 까마귀들(The Ravens)\r\n" \
               "20,000 - 바이퍼스\r\n\r\n10,000 - 바이퍼스",
    '18406' => '바이퍼스(The Vipers)에 대해 말해 줘.',
    '18703' => '술이다! 불이다! 바이퍼즈는 몰라.',
    '21057' => '바이퍼스',
    '21746' => '바이퍼스(Vipers)에 관해 말해 줘.',
    '22209' => '바이퍼스(Vipers)는 궁수와 검술 대가, 마법사를 고용해.',
    '23923' => '바이퍼스(Vipers)에 대해 말해 봐.',
    '28316' => '바이퍼스(Vipers)',
    '29745' => '바이퍼스는 힘을 합쳐.',
    '46163' => '홀든 라파예트(Holden LaFayette)와 바이퍼스를 처치해야 해.',
    '49230' => '상대는 바이퍼스야.',
    '49506' => '홀든 라파예트(Holden LaFayette)와 바이퍼스야.',
    '60283' => '바이퍼스(Vipers)를 박살 냈어! 크로우즈(The Crows)!',
    '61695' => '상대는 바이퍼스(Vipers)야.',
    '62103' => '크로우즈(The Crows)가 바이퍼스의 선수 구성을 상대해.',
    '63116' => '바이퍼스는 신생 팀이야. 대장 홀든(Holden).'
  }.freeze

  def definitions
    V.definitions_for(HEADERS)
  end

  def fixture_inventory
    rows = V::ENGLISH_ANCHORS.map do |id, english|
      mentions = id == '18198' ? 3 : 1
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'en_texts_json' => JSON.generate([english]),
        'ja_texts_json' => JSON.generate([Array.new(mentions, 'ヴァイパーズ').join("\n")]),
        'zh_text' => Array.new(mentions, '毒蛇队').join("\n"),
        'work_text' => KOREAN.fetch(id)
      }
    end
    rows.concat(V::GENERIC_ANCHORS.map do |id, english|
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'en_texts_json' => JSON.generate([english]),
        'ja_texts_json' => JSON.generate(['毒ヘビ']), 'zh_text' => '毒蛇',
        'work_text' => '평범한 독사들'
      }
    end)
    rows.to_h { |row| [V::M.key(row), row] }
  end

  def test_definition_is_an_arena_team_without_a_global_alias
    definition = definitions.fetch(0)
    assert_equal 'faction:the-vipers', definition['entity_key']
    assert_equal 'faction', definition['category']
    assert_equal 'The Vipers', definition['english_canonical']
    assert_equal V::CANONICAL, definition['korean_canonical']
    assert_equal '', definition['english_aliases']
    assert_equal '바이퍼스|바이퍼즈', definition['korean_variants']
    assert_includes definition['notes'], 'not a political faction'
    assert_includes definition['notes'], 'not reopened or recounted'
  end

  def test_exact_twenty_two_team_keys_and_three_generic_exclusions
    inventory = fixture_inventory
    generated = V.source_occurrences(inventory, definitions)
    assert_equal V.expected_keys.sort, generated.map { |row| V::M.key(row) }.sort
    refute generated.any? { |row| V::GENERIC_ANCHORS.key?(row['ID_Linha']) }
    assert_equal '', definitions.first['english_aliases']
    reviews = V.reviews_for(inventory, generated)
    assert_equal 22, reviews.length
    assert_equal 24, reviews.sum { |row| V.name_spans(row['new']).length }
    assert_equal V::EDIT_IDS.sort,
                 reviews.select { |row| row['old'] != row['new'] }.map { |row| row['ID_Linha'] }.sort
    assert_equal 9, reviews.count { |row| row['status'] == 'not-an-issue' }
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, [], [])
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
  end

  def test_extra_missing_or_generic_alias_matches_are_rejected
    inventory = fixture_inventory
    inventory.delete(['default', '1575', ''])
    assert_raises(RuntimeError) { V.source_occurrences(inventory, definitions) }
    inventory = fixture_inventory
    inventory.delete(['default', '8072', ''])
    assert_raises(RuntimeError) { V.source_occurrences(inventory, definitions) }
    inventory = fixture_inventory
    extra = inventory.fetch(['default', '21057', '']).merge('ID_Linha' => '99999')
    inventory[V::M.key(extra)] = extra
    assert_raises(RuntimeError) { V.source_occurrences(inventory, definitions) }
    assert_raises(RuntimeError) do
      V.source_occurrences(fixture_inventory, [definitions.first.merge('english_aliases' => 'Vipers')])
    end
    inventory = fixture_inventory
    inventory.fetch(['default', '8072', ''])['ja_texts_json'] = JSON.generate(['ヴァイパーズ'])
    assert_raises(RuntimeError) { V.source_occurrences(inventory, definitions) }
  end

  def test_each_locale_and_korean_span_count_is_guarded
    %w[en_texts_json ja_texts_json zh_text work_text].each do |field|
      inventory = fixture_inventory
      generated = V.source_occurrences(inventory, definitions)
      replacement = field.end_with?('_json') ? JSON.generate(['unrelated']) : 'unrelated'
      inventory.fetch(['default', '63116', ''])[field] = replacement
      assert_raises(RuntimeError) { V.reviews_for(inventory, generated) }
    end
    inventory = fixture_inventory
    generated = V.source_occurrences(inventory, definitions)
    inventory.fetch(['default', '63116', ''])['work_text'] += ' 바이퍼스'
    assert_raises(RuntimeError) { V.reviews_for(inventory, generated) }
    assert_raises(RuntimeError) { V.reviews_for(fixture_inventory, generated.drop(1)) }
  end

  def test_only_observed_variants_and_particles_are_normalized
    {
      '바이퍼스에게는' => '바이퍼스(Vipers)에게는',
      '바이퍼즈는' => '바이퍼스(Vipers)는',
      '바이퍼스를' => '바이퍼스(Vipers)를',
      '바이퍼스야.' => '바이퍼스(Vipers)야.',
      '바이퍼스의' => '바이퍼스(Vipers)의',
      '바이퍼즈(Vipers)를' => '바이퍼스(Vipers)를',
      '바이퍼스(The Vipers)에' => '바이퍼스(Vipers)에'
    }.each do |old, expected|
      assert_equal expected, V.normalize(old, '18406')
      assert_equal expected, V.normalize(expected, '18406')
    end
    %w[바이퍼 바이퍼(Viper) 바이퍼스톤 새바이퍼스 바이퍼즈다운].each do |text|
      assert_equal text, V.normalize(text, '18406')
    end
    assert_raises(RuntimeError) { V.normalize('바이퍼스', '8072') }
  end

  def test_roster_uses_the_complete_label_but_prose_and_short_labels_do_not
    roster = V.normalize(KOREAN.fetch('18198'), '18198')
    assert_equal 3, roster.scan(V::CANONICAL).length
    assert_equal roster, V.normalize(roster, '18198')
    assert_equal '바이퍼스(Vipers)', V.normalize('바이퍼스', '21057')
    refute_includes V.normalize(KOREAN.fetch('18406'), '18406'), '(The Vipers)'
    refute_includes roster, '(The Vipers)(The Vipers)'
  end

  def test_unrelated_annotations_tokens_roles_numbers_and_line_breaks_are_protected
    untouched = '(바이퍼스) 바이퍼스(Other Team) 바이퍼스 (Other Team) ' \
                '$바이퍼스$ <바이퍼즈> {바이퍼스} ' \
                '홀든 라파예트(Holden LaFayette), 크로우즈(The Crows), 궁수, 독사'
    assert_equal untouched, V.normalize(untouched, '18406')
    text = "#{untouched}\r\n바이퍼스의 20,000; 마법사\n바이퍼즈는 3명."
    proposed = V.normalize(text, '18406')
    assert_equal V.skeleton(text), V.skeleton(proposed)
    assert_equal text.scan(/\r\n|\r|\n/), proposed.scan(/\r\n|\r|\n/)
    assert_equal text.scan(ReviewedProperNameDiscovery::OPAQUE),
                 proposed.scan(ReviewedProperNameDiscovery::OPAQUE)
    assert_equal proposed, V.normalize(proposed, '18406')
  end

  def test_prepare_is_read_only_and_uses_standard_discovery_gates
    glossary = CSV.parse(HEADERS.join("\t") + "\n", headers: true, col_sep: "\t")
    index = CSV.parse(OCCURRENCE_HEADERS.join("\t") + "\n", headers: true, col_sep: "\t")
    tables = lambda do |path|
      case path
      when ReviewedProperNameDiscovery::GLOSSARY then glossary
      when V::M::INDEX then index
      else flunk "unexpected table read #{path}"
      end
    end
    no_write = ->(*) { flunk 'prepare attempted a write/refresh/apply' }
    V.stub(:active_inventory, fixture_inventory) do
      V::M.stub(:table, tables) do
        V::M.stub(:refresh_inventory, no_write) do
          V::M.stub(:write_table, no_write) do
            V::M.stub(:run, no_write) do
              ReviewedProperNameDiscovery.stub(:run, no_write) do
                ReviewedProperNameDiscovery.stub(:ensure_unused_batch!, nil) do
                  capture_io do
                    registered, reviews, generated = V.prepare
                    assert_equal definitions, registered
                    assert_equal 22, reviews.length
                    assert_equal 22, generated.length
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  def test_prior_terminal_decisions_are_not_reopened_or_recounted
    prior = {
      'entity_key' => 'person:holden-lafayette', 'resource' => 'default',
      'ID_Linha' => '16592', 'Tipo_Variante' => '', 'status' => 'not-an-issue',
      'evidence' => 'prior independent person decision', 'korean_current' => 'old'
    }
    additions = V.expected_keys.map do |resource, id, variant|
      {
        'entity_key' => V::ENTITY, 'resource' => resource, 'ID_Linha' => id,
        'Tipo_Variante' => variant, 'status' => 'accepted', 'evidence' => V::NOTE
      }
    end
    snapshot = V.prior_records([prior])
    final = [prior.merge('korean_current' => 'updated cell only'), *additions]
    V.verify_prior_records!(snapshot, final)
    assert_raises(RuntimeError) { V.verify_prior_records!(snapshot, final.drop(1)) }
    final.first['status'] = 'accepted'
    assert_raises(RuntimeError) { V.verify_prior_records!(snapshot, final) }
    assert_raises(RuntimeError) { V.prior_records([prior, prior.dup]) }
  end
end
