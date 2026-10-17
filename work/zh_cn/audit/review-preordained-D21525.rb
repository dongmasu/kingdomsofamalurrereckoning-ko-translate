#!/usr/bin/env ruby

require_relative 'review-well-of-souls-D21510'

module PreordainedD21525
  extend self

  M = ReviewedNameBatches
  D = 21_525
  FACTION = 'faction:the-preordained'
  TALISMAN = 'item:preordained-talisman'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ITEM_KEY = ['base', '1380', '11'].freeze
  DEFAULT_IDS = %w[
    251 350 1103 2667 2673 3142 4051 4541 6004 6231 6303 6358 7253
    7528 7632 7713 8051 8968 9359 9422 9717 9997 10679 11436 11487
    11803 12111 12430 12528 12633 12654 13489 13534 13786 14018
    15020 15376 15389 15422 15851 16156 16578 16822 16823 17241
    17781 17962 18483 18544 18567 18876 18999 19717 19917 20316
    20431 20861 21390 21724 22064 22818 23113 23640 23681 24035
    24055 24825 25290 25834 26799 27508 28098 28598 29197 29338
    29692 30611 32041 32286 32427 33030 33308 33365 33942 34339
    34684 35076 35219 35709 36374 37675 37797 38349 38726 39064
    39512 41780 41998 42265 43123 44699 47120 47506 48058 48124
    48195 48201 49091 50160 50537 50598 51459 52025 52727 54148
    54702 54709 55230 57110 57164 57717 58256 60513 60969 61399
    62325 63169 63503 63531 63552 63740 64025 64217
  ].freeze
  GENERIC_IDS = %w[4051 17781 38349].freeze
  SINGULAR_IDS = %w[3142 10679 35709 48058 48201 50160 58256 61399].freeze
  TITLE_HOLD_ID = '35219'
  ITEM_OLD = '예정된 자의 부적'
  ITEM_NEW = '예정된 자의 부적(Preordained Talisman)'

  ENGLISH_NAME = /(?<![A-Za-z])(?:the\s+)?Preordained(?![A-Za-z])/i
  ENGLISH_FULL_ITEM = /(?<![A-Za-z])Preordained Talisman(?![A-Za-z])/i
  KOREAN_NAME = /(?<![가-힣])(?:예정된 자들|예정된 자(?!들)|예정자들|정해진 자들|선결된 자들|선견자들|운명받은 자들)(\((?:The )?Preordained\))?/
  SOURCE_KEYS = ([ITEM_KEY] + DEFAULT_IDS.map { |id| ['default', id, ''] }).map(&:freeze).freeze
  EXPECTED_PAIRS = SOURCE_KEYS.map { |key| [FACTION, *key].freeze } +
    [[TALISMAN, *ITEM_KEY].freeze]
  BATCH_SIZES = [50, 50, 34].freeze

  GENERIC_NOTE = 'The English word is the ordinary adjective “preordained,” not the named faction. ' \
                 'Japanese and Chinese describe a fate that was predetermined; retain the complete ' \
                 'Korean prose unchanged and exclude this faction match.'
  TITLE_NOTE = 'English default:35219 is the title “A Preordained Encounter.” Japanese ' \
               '定められし出会い reads as a fated encounter, while Chinese 天命者遭遇 can mean ' \
               'an encounter with the faction. Preserve the Korean title and keep the faction ' \
               'disposition uncertain; do not infer a separate title entity in this batch.'
  FACTION_NOTE = 'English default:7253 explicitly says the group calls itself the Preordained; ' \
                 'default:52727 calls them Chaos cultists known as the Preordained, and ' \
                 'default:251 identifies their cult and worship of Telogrus. Japanese ' \
                 '定められし者 and Chinese 天命者 corroborate the named collective. Register ' \
                 'faction:the-preordained as 예정된 자들(Preordained), with only the supported ' \
                 'source-label alias The Preordained. Normalize source-supported Korean variants, ' \
                 'but retain the eight reviewed singular member forms. Exclude ordinary adjective ' \
                 'uses, preserve default:35219 as uncertain, and do not annotate a nested faction ' \
                 'inside the complete talisman label.'
  TALISMAN_NOTE = 'English base:1380:11 is the complete item label Preordained Talisman; Japanese ' \
                  '定められし者のタリスマン and Chinese 天命者护符 corroborate it. Use the atomic ' \
                  'item label 예정된 자의 부적(Preordained Talisman). The overlapping faction hit ' \
                  'is excluded inside this complete item title. No mechanics, rarity, unique-item ' \
                  'status, or additional item aliases are inferred.'
  COMMON_NOTE = 'Preserve unrelated wording, particles, punctuation, opaque tokens, exact line ' \
                'breaks, and every existing terminal record. English is the meaning/identity ' \
                'anchor; aligned Japanese and Chinese are supporting evidence. No source edits, ' \
                'PAK evidence, or historical tally changes.'

  def source_keys
    SOURCE_KEYS
  end

  def definitions(headers)
    specs = [
      [FACTION, 'Preordained', 'faction', '예정된 자들(Preordained)',
       'The Preordained',
       '예정된 자들|예정된 자|예정자들|정해진 자들|선결된 자들|선견자들|운명받은 자들',
       'default:251|default:7253|default:52727',
       "#{FACTION_NOTE} #{COMMON_NOTE}"],
      [TALISMAN, 'Preordained Talisman', 'item', ITEM_NEW, '',
       ITEM_OLD, 'base:1380:11',
       "#{TALISMAN_NOTE} #{COMMON_NOTE}"]
    ]
    specs.map do |entity, english, category, korean, aliases, variants, evidence, notes|
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|#{evidence}",
        'status' => 'confirmed', 'notes' => notes
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def source_inventory
    WellOfSoulsD21510.load_inventory
  end

  def english_text(source)
    texts = JSON.parse(source.fetch('en_texts_json')).compact
    raise "Preordained English alignment differs #{M.key(source).inspect}" unless texts.one?

    texts.first
  end

  def source_labels(source)
    english_text(source).to_enum(:scan, ENGLISH_NAME).map do
      raw = Regexp.last_match[0]
      raw.match?(/\Athe\s/i) ? 'The Preordained' : 'Preordained'
    end
  end

  def expected_pairs
    EXPECTED_PAIRS
  end

  def generated_occurrences(inventory, defs)
    build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def validate_scope!(inventory, generated)
    raise 'Preordained source-key constants differ' unless
      DEFAULT_IDS.length == 133 && DEFAULT_IDS.uniq == DEFAULT_IDS &&
      SOURCE_KEYS.length == 134 && SOURCE_KEYS.uniq == SOURCE_KEYS

    english_keys = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
        text.match?(ENGLISH_NAME)
      end
    end.map { |source| M.key(source) }.sort
    raise 'Preordained English source key coverage differs' unless
      english_keys == SOURCE_KEYS.sort

    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Preordained entity-match scope differs' unless
      actual.sort == expected_pairs.sort && actual.uniq == actual
    raise 'Preordained entity-match count differs' unless generated.length == 135
    raise 'Preordained batch boundaries differ' unless
      generated.group_by { |row| M.key(row) }.length == 134
    true
  end

  def validate_locale_evidence!(source)
    key = M.key(source)
    english = english_text(source)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    count = english.scan(ENGLISH_NAME).length
    expected_count = key == ['default', '41998', ''] ? 2 : 1
    raise "Preordained English mention count differs #{key.inspect}" unless count == expected_count

    if key == ITEM_KEY
      raise 'Preordained Talisman English title differs' unless
        english == 'Preordained Talisman' &&
        english.scan(ENGLISH_FULL_ITEM).length == 1
      raise 'Preordained Talisman Japanese evidence differs' unless
        japanese == '定められし者のタリスマン'
      raise 'Preordained Talisman Chinese evidence differs' unless
        chinese == '天命者护符'
    elsif key[0] == 'default' && GENERIC_IDS.include?(key[1])
      raise "ordinary preordained adjective casing differs #{key.inspect}" unless
        english.scan(/(?<![A-Za-z])preordained(?![A-Za-z])/).length == 1 &&
        english.scan(/(?<![A-Za-z])Preordained(?![A-Za-z])/).empty?
      raise "ordinary preordained locale evidence differs #{key.inspect}" unless
        !japanese.include?('定められし者') &&
        !chinese.include?('天命者') &&
        japanese.include?('定め') && chinese.include?('命中注定')
    elsif key == ['default', TITLE_HOLD_ID, '']
      raise 'Preordained title ambiguity evidence differs' unless
        english == 'A Preordained Encounter' &&
        japanese == '定められし出会い' && chinese == '天命者遭遇'
    else
      raise "Preordained Japanese faction evidence differs #{key.inspect}" unless
        japanese.include?('定められし者')
      if key == ['default', '54148', '']
        raise 'Preordained follower translation differs' unless
          chinese.include?('泰罗格拉斯') && chinese.include?('他的追随者')
      else
        raise "Preordained Chinese faction evidence differs #{key.inspect}" unless
          chinese.include?('天命者')
      end
    end
    [english, japanese, chinese]
  end

  def source_dispositions(key, old, new_text)
    if key == ITEM_KEY
      { FACTION => 'excluded', TALISMAN => old == new_text ? 'not-an-issue' : 'accepted' }
    elsif key[0] == 'default' && GENERIC_IDS.include?(key[1])
      { FACTION => 'excluded' }
    elsif key == ['default', TITLE_HOLD_ID, '']
      { FACTION => 'uncertain' }
    else
      { FACTION => old == new_text ? 'not-an-issue' : 'accepted' }
    end
  end

  def normalize_faction(text, source, labels)
    key = M.key(source)
    raise "unreviewed Preordained key #{key.inspect}" unless
      SOURCE_KEYS.include?(key) && key != ITEM_KEY &&
      !(key[0] == 'default' && (GENERIC_IDS.include?(key[1]) || key[1] == TITLE_HOLD_ID))

    matches = text.to_enum(:scan, KOREAN_NAME).map { Regexp.last_match.dup }
    raise "Preordained Korean source spans differ #{key.inspect}" unless
      matches.length == labels.length
    matches.each do |match|
      next_index = match.begin(0) + match[0].length
      raise "nested Preordained Korean annotation #{key.inspect}" if
        match[1].nil? && text[next_index] == '('
    end

    slot = 0
    normalized = text.gsub(KOREAN_NAME) do
      label = labels.fetch(slot) { raise "extra Preordained Korean span #{key.inspect}" }
      slot += 1
      korean = SINGULAR_IDS.include?(key[1]) ? '예정된 자' : '예정된 자들'
      "#{korean}(#{label})"
    end
    raise "missing Preordained Korean span #{key.inspect}" unless slot == labels.length
    normalized
  end

  def normalize(text, source)
    key = M.key(source)
    if key == ITEM_KEY
      return ITEM_NEW if text == ITEM_OLD
      return text if text == ITEM_NEW
      raise "Preordained Talisman Korean label differs #{key.inspect}"
    end

    return text if key[0] == 'default' &&
      (GENERIC_IDS.include?(key[1]) || key[1] == TITLE_HOLD_ID)

    labels = source_labels(source)
    normalize_faction(text, source, labels)
  end

  def review_source(source)
    key = M.key(source)
    expected_entities = key == ITEM_KEY ? [FACTION, TALISMAN] : [FACTION]
    old = source.fetch('work_text')
    english, japanese, chinese = validate_locale_evidence!(source)
    labels = source_labels(source)
    raise "Preordained label count differs #{key.inspect}" unless
      labels.length == (key == ['default', '41998', ''] ? 2 : 1)

    new_text = if key[0] == 'default' &&
        (GENERIC_IDS.include?(key[1]) || key[1] == TITLE_HOLD_ID)
                 old
               else
                 normalize(old, source)
               end
    note = if key == ITEM_KEY
             TALISMAN_NOTE
           elsif key[0] == 'default' && GENERIC_IDS.include?(key[1])
             GENERIC_NOTE
           elsif key == ['default', TITLE_HOLD_ID, '']
             TITLE_NOTE
           else
             FACTION_NOTE
           end
    dispositions = source_dispositions(key, old, new_text)
    status = if dispositions.value?('accepted')
               'accepted'
             elsif dispositions.value?('uncertain')
               'uncertain'
             elsif dispositions.values.all? { |value| value == 'excluded' }
               'excluded'
             else
               'not-an-issue'
             end
    raise "Preordained transform changed tokens or line breaks #{key.inspect}" unless
      old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        new_text.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)

    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => expected_entities.sort.join('|'), 'status' => status,
      'old' => old, 'new' => new_text, 'evidence' => "#{note} #{COMMON_NOTE}",
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(dispositions)
    }
  end

  def prepare
    (D...(D + BATCH_SIZES.length)).each do |batch|
      ReviewedProperNameDiscovery.ensure_unused_batch!(batch)
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    defs = definitions(glossary.headers)
    inventory = source_inventory
    generated = generated_occurrences(inventory, defs)
    validate_scope!(inventory, generated)
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      expected = expected_pairs.select { |pair| pair.drop(1) == key }.map(&:first).sort
      raise "Preordained row entity mapping differs #{key.inspect}" unless
        occurrences.map { |row| row.fetch('entity_key') }.sort == expected
      review_source(source)
    end
    raise 'Preordained review row count differs' unless reviews.length == 134
    raise 'Preordained reviewed entity-match count differs' unless
      reviews.sum { |row| JSON.parse(row.fetch('entity_dispositions_json')).length } == 135
    raise 'Preordained batch row counts differ' unless
      reviews.each_slice(50).map(&:length) == BATCH_SIZES
    reviews.each_slice(50).with_index do |batch_reviews, ordinal|
      ReviewedProperNameDiscovery.ensure_unused_batch!(D + ordinal)
      edits = batch_reviews.count { |row| row.fetch('old') != row.fetch('new') }
      raise "Preordained batch #{D + ordinal} exceeds fifty rows" if batch_reviews.length > 50
      puts "D-#{D + ordinal}: #{batch_reviews.length} rows; #{edits} edits."
    end
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
      .group_by { |row| row.fetch('resource') }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}-#{D + 2}: 134 rows; 135 entity matches; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} edits; " \
         "batches=#{BATCH_SIZES.join('/')}; prepare only, no writes."
    [glossary.headers, defs, reviews]
  end

  def occurrence_snapshot
    M.table(M::INDEX).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.to_h.reject { |field, _| field == 'korean_current' }]
    end
  end

  def apply
    headers, defs, reviews = prepare
    previous_occurrences = occurrence_snapshot
    previous_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    M.write_table(DEFINITIONS, headers, defs)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    current_occurrences = occurrence_snapshot
    previous_occurrences.each do |key, value|
      raise "prior terminal occurrence changed #{key.inspect}" unless
        current_occurrences[key] == value
    end
    raise 'Preordained registered occurrence set differs' unless
      (current_occurrences.keys - previous_occurrences.keys).sort == expected_pairs.sort
    raise 'Preordained prior glossary entries changed' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == previous_glossary + defs

    active = source_inventory
    reviews.each do |review|
      source = active.fetch(M.key(review))
      raise "Preordained post-apply normalization differs #{M.key(review).inspect}" unless
        normalize(source.fetch('work_text'), source) == source.fetch('work_text')
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PreordainedD21525.prepare
  when ['apply'] then PreordainedD21525.apply
  else abort 'usage: review-preordained-D21525.rb [prepare|apply]'
  end
end
