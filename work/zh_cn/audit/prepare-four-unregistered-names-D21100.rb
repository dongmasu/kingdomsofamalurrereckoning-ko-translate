#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module FourUnregisteredNamesD21100
  M = ReviewedNameBatches
  DEFINITIONS_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21100.tsv')
  REVIEWS_PATH = File.join(__dir__, 'proper-name-discovery-D21100.tsv')

  DEFINITIONS = [
    {
      'entity_key' => 'person:elund-carth',
      'english_canonical' => 'Elund Carth',
      'category' => 'person',
      'korean_canonical' => '엘룬드 카스(Elund Carth)',
      'english_aliases' => '',
      'korean_variants' => '엘룬 카스',
      'status' => 'confirmed',
      'notes' => 'The English identifies the same Rathir council mouthpiece and city ruler across the reviewed lines; Japanese エランド・カース and Chinese 埃朗德·卡尔斯 corroborate. Reuse the prevailing active Korean form, normalize two shortened/misspelled labels, and pair the repeated given-name reference with the full English identity.'
    },
    {
      'entity_key' => 'person:lina-ardeen',
      'english_canonical' => 'Lina Ardeen',
      'category' => 'person',
      'korean_canonical' => '리나 아딘(Lina Ardeen)',
      'english_aliases' => '',
      'korean_variants' => '',
      'status' => 'confirmed',
      'notes' => 'English identifies the Traveler involved in the Whitestone poisoning cover-up; Japanese リナ・アーディーン and Chinese 莉娜·阿尔顿 corroborate. Preserve the established active Korean form and pair the standalone and repeated given-name references.'
    },
    {
      'entity_key' => 'person:eloren-criet',
      'english_canonical' => 'Eloren Criet',
      'category' => 'person',
      'korean_canonical' => '엘로렌 크리엣(Eloren Criet)',
      'english_aliases' => '',
      'korean_variants' => '엘로렌 크리에트',
      'status' => 'confirmed',
      'notes' => 'English identifies the woman in Adessa who owns the Master’s Pick; Japanese エロレン・クリエト and Chinese 艾洛伦·克里特 corroborate. Select the prevailing active spelling 크리엣, add missing English labels, and preserve the item, seizure, and location context.'
    },
    {
      'entity_key' => 'unique_item:rivener-tarsus',
      'english_canonical' => 'Rivener Tarsus',
      'category' => 'unique item',
      'korean_canonical' => '리베너 타르수스(Rivener Tarsus)',
      'english_aliases' => '',
      'korean_variants' => '리브너 타르수스',
      'status' => 'confirmed',
      'notes' => 'English explicitly identifies one of the three named Fae staffs; Japanese リベナーターサス and the matching Chinese item text corroborate. Use the prevailing active spelling 리베너, standardize both base rows, and add English labels where absent; retain staff and restoration context.'
    }
  ].freeze

  EVIDENCE = {
    'person:elund-carth' => 'Rathir council spokesperson and city ruler; aligned English, Japanese, and Chinese establish the same person.',
    'person:lina-ardeen' => 'Named Traveler in the Whitestone poisoning-cover-up quest; aligned English, Japanese, and Chinese establish the same person.',
    'person:eloren-criet' => 'Named woman in Adessa and owner of the Master’s Pick; aligned English, Japanese, and Chinese establish the same person.',
    'unique_item:rivener-tarsus' => 'One of the three named Fae staffs; aligned English, Japanese, and Chinese establish the same unique item.'
  }.freeze

  TRANSFORMS = {
    ['default', '17230', ''] => [
      ['엘룬드를 찾아', '엘룬드(Elund Carth)를 찾아']
    ],
    ['default', '44791', ''] => [
      ['엘룬 카스가', '엘룬드 카스(Elund Carth)가']
    ],
    ['default', '52388', ''] => [
      ['엘룬 카스(Elund Carth)', '엘룬드 카스(Elund Carth)']
    ],
    ['default', '36541', ''] => [
      ['리나 아딘', '리나 아딘(Lina Ardeen)']
    ],
    ['default', '59973', ''] => [
      ['리나의 도움', '리나(Lina Ardeen)의 도움']
    ],
    ['base', '4023', '11'] => [
      ['엘로렌 크리에트(Eloren Criet)', '엘로렌 크리엣(Eloren Criet)']
    ],
    ['default', '18969', ''] => [
      ['엘로렌 크리엣이', '엘로렌 크리엣(Eloren Criet)이']
    ],
    ['default', '38994', ''] => [
      ['엘로렌 크리엣에게', '엘로렌 크리엣(Eloren Criet)에게']
    ],
    ['default', '44753', ''] => [
      ['엘로렌 크리엣에게', '엘로렌 크리엣(Eloren Criet)에게']
    ],
    ['default', '49504', ''] => [
      ['엘로렌 크리에트라는', '엘로렌 크리엣(Eloren Criet)이라는']
    ],
    ['default', '59235', ''] => [
      ['엘로렌 크리에트의', '엘로렌 크리엣(Eloren Criet)의']
    ],
    ['default', '59439', ''] => [
      ['엘로렌 크리에트', '엘로렌 크리엣(Eloren Criet)']
    ],
    ['default', '9019', ''] => [
      ['엘로렌 크리엣이', '엘로렌 크리엣(Eloren Criet)이']
    ],
    ['default', '9043', ''] => [
      ['엘로렌 크리엣의', '엘로렌 크리엣(Eloren Criet)의']
    ],
    ['base', '2695', '11'] => [
      ['리브너 타르수스', '리베너 타르수스']
    ],
    ['base', '2811', '11'] => [
      ['리브너 타르수스', '리베너 타르수스']
    ],
    ['default', '33792', ''] => [
      ['리베너 타르수스, 글룸프로스트', '리베너 타르수스(Rivener Tarsus), 글룸프로스트']
    ],
    ['default', '39451', ''] => [
      ['리베너 타르수스, 글룸프로스트', '리베너 타르수스(Rivener Tarsus), 글룸프로스트']
    ]
  }.freeze

  module_function

  def build
    inventory = M.refresh_inventory
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    existing_keys = glossary.map { |row| row.fetch('entity_key') }
    raise 'discovery entity already exists' unless
      (existing_keys & DEFINITIONS.map { |row| row.fetch('entity_key') }).empty?

    occurrences = build_occurrences(inventory.values, DEFINITIONS).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    rows = occurrences.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old_text = source.fetch('work_text')
      new_text = old_text.dup
      TRANSFORMS.fetch(key, []).each do |before, after|
        raise "expected one exact text span at #{key.inspect}" unless
          new_text.scan(Regexp.new(Regexp.escape(before))).length == 1

        new_text = new_text.sub(before, after)
      end
      entity = occurrence.fetch('entity_key')
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key.fetch(0),
        'ID_Linha' => key.fetch(1),
        'Tipo_Variante' => key.fetch(2),
        'entity_key' => entity,
        'status' => status,
        'old' => old_text,
        'new' => new_text,
        'evidence' => EVIDENCE.fetch(entity),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    raise 'duplicate reviewed row keys' unless rows.map { |row| M.key(row) }.uniq.length == rows.length
    raise 'unused text transformation' unless
      (TRANSFORMS.keys - rows.map { |row| M.key(row) }).empty?
    raise 'unexpected target edit count' unless rows.count { |row| row['old'] != row['new'] } == 18

    definitions = DEFINITIONS.map do |definition|
      keys = rows.select { |row| row['entity_key'] == definition['entity_key'] }
                 .map { |row| M.key(row).join(':') }
      definition.merge('evidence_ids' => (["D-21100"] + keys).join('|'))
    end
    M.write_table(DEFINITIONS_PATH, DEFINITIONS.first.keys + ['evidence_ids'], definitions)
    M.write_table(REVIEWS_PATH, rows.first.keys, rows)
    puts "Prepared #{definitions.length} definitions and #{rows.length} row keys; #{rows.count { |row| row['old'] != row['new'] }} approved text edits."
  end
end

FourUnregisteredNamesD21100.build if $PROGRAM_NAME == __FILE__
