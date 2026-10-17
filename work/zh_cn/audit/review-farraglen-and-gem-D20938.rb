#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module FarraglenAndGemD20938
  extend self

  M = ReviewedNameBatches
  PERSON = 'person:farraglen'
  ITEM = 'unique_item:farraglens-gem'
  ITEM_KEYS = [
    ['base', '3103', '11'],
    ['default', '35210', '']
  ].freeze
  PERSON_KEYS = [
    ['default', '477', ''], ['default', '2159', ''], ['default', '3308', ''],
    ['default', '4041', ''], ['default', '4468', ''], ['default', '4683', ''],
    ['default', '6052', ''], ['default', '11013', ''], ['default', '11794', ''],
    ['default', '17632', ''], ['default', '18250', ''], ['default', '25501', ''],
    ['default', '30945', ''], ['default', '31717', ''], ['default', '33353', ''],
    ['default', '34058', ''], ['default', '35762', ''], ['default', '38301', ''],
    ['default', '46269', ''], ['default', '47838', ''], ['default', '47924', ''],
    ['default', '48612', ''], ['default', '59483', ''], ['default', '62585', '']
  ].freeze

  DEFINITION_SPECS = [
    {
      'entity_key' => PERSON,
      'english_canonical' => 'Farraglen',
      'category' => 'person',
      'korean_canonical' => '파라글렌(Farraglen)',
      'english_aliases' => 'Master Farraglen',
      'korean_variants' => '패러글렌|파라글렌|마스터 패러글렌|대가 파라글렌',
      'evidence_ids' => 'D-20938|base:3103:11|default:477|default:2159|default:3308|default:4041|default:4468|default:4683|default:6052|default:11013|default:11794|default:17632|default:18250|default:25501|default:30945|default:31717|default:33353|default:34058|default:35210|default:35762|default:38301|default:46269|default:47838|default:47924|default:48612|default:59483|default:62585',
      'status' => 'confirmed',
      'notes' => 'English identifies one Master Maker and Tuatha character across all reviewed contexts. Japanese ファラグレン and Chinese 法拉格伦 corroborate the same person. Standardize the mixed Korean spellings to 파라글렌(Farraglen); retain translated Master/사부/대가 wording while pairing the name. Complete Farraglen’s Gem is a distinct unique-item compound and is excluded from the personal-name label at base:3103 and default:35210. The official Korean manual reference and extraction contain no direct entry for Farraglen, so they establish no spelling. No PAK-derived evidence.'
    },
    {
      'entity_key' => ITEM,
      'english_canonical' => "Farraglen's Gem",
      'category' => 'unique item',
      'korean_canonical' => "파라글렌의 보석(Farraglen's Gem)",
      'english_aliases' => '',
      'korean_variants' => '패러글렌(Farraglen)의 보석|파라글렌의 보석',
      'evidence_ids' => "D-20938|base:3103:11|default:35210",
      'status' => 'confirmed',
      'notes' => "English names the complete unique-item title Farraglen's Gem at both occurrences. Japanese ファラグレンのジェム and Chinese 法拉格伦的宝石 corroborate the same gem; default:35210 identifies it as the gem Farraglen made. Keep the possessive title atomic and distinct from person:farraglen. The official Korean manual reference and extraction do not name this item. No PAK-derived evidence."
    }
  ].freeze

  # Each pair is an exact, reviewed Korean span; surrounding text is untouched.
  PERSON_SPANS = {
    ['default', '477', ''] => [['패러글렌(Farraglen)', '파라글렌(Farraglen)']],
    ['default', '2159', ''] => [['패러글렌(Farraglen)', '파라글렌(Farraglen)']],
    ['default', '6052', ''] => [['마스터 패러글렌(Master Farraglen)', '마스터 파라글렌(Master Farraglen)']],
    ['default', '17632', ''] => [
      ['마스터 패러글렌(Farraglen)', '마스터 파라글렌(Master Farraglen)'],
      ['패러글렌이', '파라글렌(Farraglen)이']
    ],
    ['default', '18250', ''] => [['마스터 패러글렌(Farraglen)', '마스터 파라글렌(Master Farraglen)']],
    ['default', '25501', ''] => [['마스터 패러글렌', '마스터 파라글렌(Master Farraglen)']],
    ['default', '30945', ''] => [['파라글렌', '파라글렌(Farraglen)']],
    ['default', '31717', ''] => [['패러글렌', '파라글렌(Farraglen)']],
    ['default', '33353', ''] => [['파라글렌 사부', '파라글렌(Farraglen) 사부']],
    ['default', '34058', ''] => [['대가 파라글렌', '대가 파라글렌(Master Farraglen)']],
    ['default', '35762', ''] => [['마스터 파라글렌', '마스터 파라글렌(Master Farraglen)']],
    ['default', '38301', ''] => [['파라글렌', '파라글렌(Farraglen)']],
    ['default', '46269', ''] => [['패러글렌', '파라글렌(Farraglen)']],
    ['default', '47838', ''] => [['마스터 패러글렌', '마스터 파라글렌(Master Farraglen)']],
    ['default', '47924', ''] => [['패러글렌', '파라글렌(Farraglen)']],
    ['default', '48612', ''] => [['패러글렌', '파라글렌(Farraglen)']],
    ['default', '59483', ''] => [['대가 파라글렌', '대가 파라글렌(Farraglen)']]
  }.freeze

  ITEM_SPANS = {
    ['base', '3103', '11'] => [['패러글렌(Farraglen)의 보석', "파라글렌의 보석(Farraglen's Gem)"]],
    ['default', '35210', ''] => [['파라글렌의 보석', "파라글렌의 보석(Farraglen's Gem)"]]
  }.freeze

  SPECIAL_CONTEXT = {
    ['base', '3103', '11'] => 'Complete item title; do not annotate Farraglen as a separate person inside the compound.',
    ['default', '35210', ''] => 'The source names Farraglen’s Gem and later mentions Witchknight Anira; only the gem title is in this batch.',
    ['default', '6052', ''] => 'Quest objective: preserve the complete instruction and standardize only the Master Farraglen name.',
    ['default', '11013', ''] => 'English repeats Farraglen, but the later subject is rendered as a Korean pronoun; keep the already-correct bilingual Master title and do not add a redundant name.',
    ['default', '17632', ''] => 'Two references occur. Restore Master in the first bilingual title and normalize the later name.',
    ['default', '18250', ''] => 'Retain the translated Master title and pair the complete source title Master Farraglen.',
    ['default', '25501', ''] => 'The cell describes the unique gem, but the name match is the craftsman Master Farraglen.',
    ['default', '34058', ''] => 'Standalone Master Farraglen label; preserve the existing Korean title order.',
    ['default', '46269', ''] => 'Quest objective: preserve the complete Speak with Farraglen instruction.',
    ['default', '47838', ''] => 'Quest objective: preserve the complete Bring Master Farraglen instruction.',
    ['default', '47924', ''] => 'Quest objective: preserve the complete Speak with Farraglen instruction.',
    ['default', '59483', ''] => 'Preserve the faction reference Tuatha and translated Master title while pairing Farraglen.'
  }.freeze

  def replace_spans(text, spans, key)
    spans.each do |old, new|
      raise "unexpected Korean span at #{key.inspect}: #{old}" unless text.scan(old).length == 1
      text = text.sub(old, new)
    end
    text
  end

  def run
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    definitions = DEFINITION_SPECS
    raise 'entity already registered' unless
      (definitions.map { |row| row.fetch('entity_key') } & glossary.map { |row| row['entity_key'] }).empty?

    inventory_rows = M.table(M::INVENTORY).map(&:to_h)
    inventory = inventory_rows.to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory_rows, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "unexpected source matches: #{counts.inspect}" unless counts == {PERSON => 26, ITEM => 2}
    rows = generated.group_by { |row| M.key(row) }
    expected_keys = (PERSON_KEYS + ITEM_KEYS).uniq.sort
    raise 'unexpected exact source key coverage' unless rows.keys.sort == expected_keys

    entity_specs = definitions.to_h { |row| [row.fetch('entity_key'), row] }
    reviews = rows.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []

      matches.each do |match|
        entity = match.fetch('entity_key')
        spec = entity_specs.fetch(entity)
        if entity == PERSON && ITEM_KEYS.include?(key)
          dispositions[entity] = 'excluded'
          evidence << 'Farraglen is only a component of the complete unique-item title in this cell; keep the item atomic.'
          next
        end

        spans = entity == PERSON ? PERSON_SPANS.fetch(key, []) : ITEM_SPANS.fetch(key)
        text = replace_spans(text, spans, key)
        dispositions[entity] = text == old ? 'not-an-issue' : 'accepted'
        evidence << spec.fetch('notes')
      end

      status = if text != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      evidence << SPECIAL_CONTEXT[key] if SPECIAL_CONTEXT.key?(key)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => matches.map { |row| row.fetch('entity_key') }.join('|'),
        'status' => status, 'old' => old, 'new' => text,
        'evidence' => evidence.join(' '),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante')] }

    raise 'unexpected reviewed row count' unless reviews.length == 26
    raise 'missing cross-locale source evidence' unless reviews.all? do |row|
      !row['english'].strip.empty? && !row['japanese'].strip.empty? && !row['chinese'].strip.empty?
    end
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-definitions-D20938.tsv'),
      glossary.headers,
      definitions
    )
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-D20938.tsv'),
      M::HEADERS,
      reviews
    )
    puts "#{definitions.length} definitions; #{generated.length} entity occurrences; #{reviews.length} exact source keys"
    puts reviews.group_by { |row| row.fetch('status') }.transform_values(&:length).inspect
  end
end

FarraglenAndGemD20938.run if $PROGRAM_NAME == __FILE__
