#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module ProperNameDiscoveryD21773
  extend self

  M = ReviewedNameBatches
  DEFINITION_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21773.tsv')
  OUTPUT_PATH = File.join(__dir__, 'proper-name-discovery-D21773.tsv')
  SHORT_OUTPUT_PATH = File.join(__dir__, 'proper-name-short-label-dispositions-D21773.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  SHORT_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EXPECTED_KEYS = {
    'people:master-makers' => %w[
      2701 4925 10010 11794 11806 17657 24952 26369 33980 36013 38826
      39809 40255 41284 42086 43517 43782 44037 45100 46432 47065 51325
      51960 53875 55820 62794
    ],
    'organization:order-of-fateweavers' =>
      %w[10165 27868 30776 32055 33259 41469 52727 61054 63124],
    'unique_item:ordination-tome' =>
      %w[1833 9994 17311 17862 29112 30884 44436 59891 64601]
  }.freeze
  EDITS = {
    'people:master-makers' => {
      '4925' => ['장인들을', '명장들(Master Makers)을'],
      '10010' => ['세 명의 대장장이 대가를', '세 명의 명장들(Master Makers)을'],
      '11794' => ['세 명의 장인 대가인', '세 명의 명장들(Master Makers)인'],
      '11806' => ['우리 장인 대가들을', '우리 명장들(Master Makers)을'],
      '17657' => ['명장(Master Makers)', '명장들(Master Makers)'],
      '24952' => ['우리 명장들을', '우리 명장들(Master Makers)을'],
      '26369' => ['세 명의 명장들을', '세 명의 명장들(Master Makers)을'],
      '33980' => ['대가 제작자들', '명장들(Master Makers)'],
      '36013' => ['명장들', '명장들(Master Makers)'],
      '38826' => ['장인회 우두머리들이 하는 일', '우리 명장들(Master Makers)의 일'],
      '39809' => ['명장들이', '명장들(Master Makers)이'],
      '40255' => ['명장들', '명장들(Master Makers)'],
      '41284' => ['명장들', '명장들(Master Makers)'],
      '42086' => ['장인 대가들', '명장들(Master Makers)'],
      '43517' => ['우리 세 명의 거장 제작자가', '우리 세 명의 명장들(Master Makers)이'],
      '43782' => ['거장 제작자들', '명장들(Master Makers)'],
      '44037' => ['거장 제작자들', '명장들(Master Makers)'],
      '45100' => ['명장들', '명장들(Master Makers)'],
      '46432' => ['명장들', '명장들(Master Makers)'],
      '47065' => ['명장들', '명장들(Master Makers)'],
      '51325' => ['장인(Master Makers)인 우리도', '우리 명장들(Master Makers)도'],
      '53875' => ['대장장이의 명인들', '명장들(Master Makers)'],
      '62794' => ['명장들을', '명장들(Master Makers)을']
    },
    'organization:order-of-fateweavers' => {
      '10165' => ['운명 직조사단의 도움', '페이트위버 교단(Order of Fateweavers)의 도움'],
      '27868' => ['페이트위버 교단', '페이트위버 교단(Order of Fateweavers)'],
      '30776' => ['페이트위버 교단으로', '페이트위버 교단(Order of Fateweavers)으로'],
      '32055' => ['페이트위버 결사에서', '페이트위버 교단(Order of Fateweavers)에서'],
      '33259' => ['운명술사단의 지도자', '페이트위버 교단(Order of Fateweavers)의 지도자'],
      '41469' => ['페이트위버 교단에 따르면', '페이트위버 교단(Order of Fateweavers)에 따르면'],
      '63124' => ['페이트위버 교단을 끌어들여야', '페이트위버 교단(Order of Fateweavers)을 끌어들여야']
    },
    'unique_item:ordination-tome' => {
      '1833' => ['서품 예식서', '서품서(Ordination Tome)'],
      '9994' => ['그 서품의 서에 관해서', '그 서품서(Ordination Tome)에 관해서'],
      '17311' => ['고대 서품 예식서 말이야', '고대 서품서(Ordination Tome) 말이야'],
      '17862' => ['성직 수임서(Ordination Tome)', '서품서(Ordination Tome)'],
      '29112' => ['서품서를 훔쳤다', '서품서(Ordination Tome)를 훔쳤다'],
      '30884' => ['서임 의식서까지', '서품서(Ordination Tome)까지'],
      '44436' => ['서품 의식의 책을', '서품서(Ordination Tome)를'],
      '64601' => ['서임식 서적 훔치기', '서품서(Ordination Tome) 훔치기']
    }
  }.freeze
  DEFINITION_NOTES = {
    'people:master-makers' =>
      'English identifies the Master Makers as the three craftmasters Belne, Farraglen, and Kiftal; later dialogue calls them “we three” and speaks of their shared craft and affairs. Japanese 伝説の鍛冶師 and Chinese 制作大师 corroborate the collective craftmaster sense. Register this bounded collective label, not a formal faction, race, or every generic master maker. Reuse 명장들(Master Makers), consistent with D-19042 and D-19528. The lowercase generic use at default:2701 is excluded. No prior person or translation decision is reopened or recounted.',
    'organization:order-of-fateweavers' =>
      'English identifies one recurring organized Order; aligned Japanese フェイトウィーバー会 and Chinese 织命者教团 corroborate. Reuse 페이트위버 from the official Korean manual and the established paired form 페이트위버 교단(Order of Fateweavers). Standardize only these exact nine organization references; do not register Fateweaver as a separate entity or alter generic Fateweaver references. Prior person, place, faction, and translation decisions remain unchanged.',
    'unique_item:ordination-tome' =>
      'English consistently identifies one specific ancient religious tome, stolen from a reliquary and used as proof that women may join the Order of Mitharu. Aligned Japanese 聖職授任式の書 and Chinese 圣职书 corroborate the book. Reuse the existing pair 서품서(Ordination Tome), standardizing only exact full-name spans. The official Korean manual extraction/reference has no direct entry for this tome. Prior deity, person, mission, and translation decisions remain unchanged.'
  }.freeze

  module_function

  def definitions
    [
      {
        'entity_key' => 'people:master-makers',
        'english_canonical' => 'Master Makers',
        'category' => 'people',
        'korean_canonical' => '명장들(Master Makers)',
        'english_aliases' => '',
        'korean_variants' => '장인들|장인 대가들|장인회 우두머리들|대가 제작자들|거장 제작자들|대장장이의 명인들',
        'evidence_ids' => 'D-19042|D-19528|D-21773',
        'status' => 'confirmed',
        'notes' => DEFINITION_NOTES.fetch('people:master-makers')
      },
      {
        'entity_key' => 'organization:order-of-fateweavers',
        'english_canonical' => 'Order of Fateweavers',
        'category' => 'organization',
        'korean_canonical' => '페이트위버 교단(Order of Fateweavers)',
        'english_aliases' => '',
        'korean_variants' => '운명 직조사단|운명술사단|페이트위버 결사|페이트위버 교단',
        'evidence_ids' => 'D-21773',
        'status' => 'confirmed',
        'notes' => DEFINITION_NOTES.fetch('organization:order-of-fateweavers')
      },
      {
        'entity_key' => 'unique_item:ordination-tome',
        'english_canonical' => 'Ordination Tome',
        'category' => 'unique item',
        'korean_canonical' => '서품서(Ordination Tome)',
        'english_aliases' => '',
        'korean_variants' => '서품 예식서|서품의 서|성직 수임서|서임 의식서|서품 의식의 책|서임식 서적|서품서',
        'evidence_ids' => 'D-21773',
        'status' => 'confirmed',
        'notes' => DEFINITION_NOTES.fetch('unique_item:ordination-tome')
      }
    ]
  end

  def replace_once(text, old, replacement, key)
    count = text.scan(Regexp.new(Regexp.escape(old))).length
    raise "expected one reviewed Korean span at #{key.join(':')}: #{old.inspect} (#{count})" unless count == 1
    text.sub(old, replacement)
  end

  def proposed_text(entity, key, korean)
    id = key[1]
    return korean if entity == 'people:master-makers' && id == '2701'
    replacement = EDITS.fetch(entity)[id]
    return korean unless replacement
    replace_once(korean, replacement[0], replacement[1], key)
  end

  def build_rows(inventory, index)
    definitions = definitions()
    hits = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual = hits.group_by { |row| row.fetch('entity_key') }
      .transform_values { |rows| rows.map { |row| row.fetch('ID_Linha') }.sort_by(&:to_i) }
    raise "unexpected source-key coverage: #{actual.inspect}" unless actual == EXPECTED_KEYS

    prior_by_key = index.group_by { |row| M.key(row) }
    reviews = hits.map do |hit|
      key = M.key(hit)
      entity = hit.fetch('entity_key')
      old = hit.fetch('korean_current')
      excluded = entity == 'people:master-makers' && key[1] == '2701'
      new_text = proposed_text(entity, key, old)
      disposition = if excluded
                      'excluded'
                    elsif new_text == old
                      'not-an-issue'
                    else
                      'accepted'
                    end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => entity,
        'status' => disposition,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{DEFINITION_NOTES.fetch(entity)} Exact source key: #{key.join(':')}.",
        'english' => hit.fetch('english_source').split("\n---\n").join("\n"),
        'japanese' => JSON.parse(inventory.fetch(key).fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => inventory.fetch(key).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => disposition),
        'prior_index_dispositions_json' => JSON.generate(
          prior_by_key.fetch(key, []).map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
    raise 'discovery review keys overlap' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise "unexpected D-21773 status totals: #{counts.inspect}" unless
      counts == { 'accepted' => 38, 'not-an-issue' => 5, 'excluded' => 1 }
    [definitions, reviews]
  end

  def build
    raise 'D-21773 outputs already exist; preserve the prior review' if
      [DEFINITION_PATH, OUTPUT_PATH, SHORT_OUTPUT_PATH].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    definitions, reviews = build_rows(inventory, index)
    M.write_table(DEFINITION_PATH, DEFINITION_HEADERS, definitions)
    M.write_table(OUTPUT_PATH, REVIEW_HEADERS, reviews)
    term_by_entity = definitions.to_h do |definition|
      [definition.fetch('entity_key'), definition.fetch('english_canonical')]
    end
    short_rows = reviews.map do |row|
      {
        'english_candidate' => term_by_entity.fetch(row.fetch('entity_key')),
        'disposition' => row.fetch('status'),
        'resource' => row.fetch('resource'),
        'ID_Linha' => row.fetch('ID_Linha'),
        'Tipo_Variante' => row.fetch('Tipo_Variante'),
        'english' => row.fetch('english'),
        'japanese' => row.fetch('japanese'),
        'chinese' => row.fetch('chinese'),
        'korean' => row.fetch('old'),
        'evidence' => row.fetch('evidence'),
        'prior_index_dispositions_json' => row.fetch('prior_index_dispositions_json')
      }
    end
    M.write_table(SHORT_OUTPUT_PATH, SHORT_HEADERS, short_rows)
    puts "Wrote 3 definitions and #{reviews.length} exact source keys: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
    puts OUTPUT_PATH
  end
end

ProperNameDiscoveryD21773.build if $PROGRAM_NAME == __FILE__
