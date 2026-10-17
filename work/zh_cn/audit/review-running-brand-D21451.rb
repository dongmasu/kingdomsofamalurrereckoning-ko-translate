#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module RunningBrandD21451
  extend self

  M = ReviewedNameBatches
  D = 21_451
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  RUNNING = 'lore_term:the-running-man'
  QUEST = 'quest:running-with-scalpels'
  BRAND = 'unique_item:fates-brand'
  ENTITIES = [
    [RUNNING, 'The Running Man', '달리는 사나이(The Running Man)', 'lore term',
     '달리는 자(The Running Man)|달리는 사나이',
     'Name of the card, not a person or a global Running alias. Preserve complete equipment titles byte-for-byte. In default:1723 annotate only the existing first name span; retain 이 카드 for the second English mention.'],
    [QUEST, 'Running with Scalpels', '메스를 들고 달리기(Running with Scalpels)', 'quest',
     '메스를 들고 달리기',
     'Complete source-local quest title; no global Running alias.'],
    [BRAND, "Fate's Brand", "운명의 낙인(Fate's Brand)", 'unique item', '운명의 낙인',
     'Complete source-local named item label; do not infer weapon type, rarity, a bearer, or a global Brand alias.']
  ].map(&:freeze).freeze

  # entity, exact English/Japanese/Chinese, reviewed Korean span, replacement
  # A nil replacement excludes the complete equipment label from the card scope.
  ROWS = {
    ['base', '871', '11'] => [
      RUNNING, 'The Running Man Boots', 'ザ・ランニングマンのブーツ', '奔跑者靴子',
      '달리는 사나이의 장화 (The Running Man Boots)', nil
    ],
    ['base', '1174', '11'] => [
      RUNNING, 'The Running Man Leggings', 'ザ・ランニングマンのレギング', '奔跑者护腿',
      '달리는 사나이의 레깅스 (The Running Man Leggings)', nil
    ],
    ['base', '1271', '11'] => [
      RUNNING, 'The Running Man Gloves', 'ザ・ランニングマンのグローブ', '奔跑者手套',
      '달리는 사나이의 장갑 (The Running Man Gloves)', nil
    ],
    ['base', '3520', '11'] => [
      RUNNING, 'The Running Man Armor', 'ザ・ランニングマンの鎧', '奔跑者护甲',
      '달리는 사나이의 갑옷 (The Running Man Armor)', nil
    ],
    ['base', '3532', '11'] => [
      RUNNING, 'The Running Man Hood', 'ザ・ランニングマンのフード', '奔跑者兜帽',
      '달리는 사나이의 두건 (The Running Man Hood)', nil
    ],
    ['default', '1723', ''] => [
      RUNNING,
      'The Running Man is a card of desperation. It, like the armor crafted in its name, indicates someone in need of safety and security. The Circle of Therosin believed that the Running Man also indicated a fate that could be changed.',
      'ザ・ランニングマンは絶望のカードである。その名のとおり、安全性や守りを必要とする人物を示唆している。サークル・オブ・セロシンは、変えられる運命を指し示しているとも信じていた。',
      '跑者是一张绝望的卡牌。它就像以它的名字制作的盔甲一样，表明有人需要安全和保障。瑟洛辛之环相信跑者也预示着一个可以改变的命运。',
      '달리는 자(The Running Man)', '달리는 사나이(The Running Man)'
    ],
    ['default', '26006', ''] => [
      RUNNING, 'The Running Man', 'ザ・ランニングマン', '跑者',
      '달리는 사나이', '달리는 사나이(The Running Man)'
    ],
    ['default', '24902', ''] => [
      RUNNING,
      'The cards this morning ‒ I drew the gravedigger, the running man, and the beast.',
      '今朝、引いたカードは... グレイブディガー、ザ・ランニングマン、そしてザ・ビーストだった',
      '今天早上的卡牌，我抽中了掘墓人，跑步者和野兽。',
      '달리는 사내', '달리는 사나이(the running man)'
    ],
    ['default', '52067', ''] => [
      RUNNING,
      'The cards this morning ‒ I drew the gravedigger, the running man, and the beast.',
      '今朝、引いたカードは... グレイブディガー、ザ・ランニングマン、そしてザ・ビーストだった',
      '今天早上的卡牌，我抽中了掘墓人，跑步者和野兽。',
      '달리는 자', '달리는 사나이(the running man)'
    ],
    ['default', '45033', ''] => [
      QUEST, 'Running with Scalpels', 'メスを手に走る', '运送手术刀',
      '메스를 들고 달리기', '메스를 들고 달리기(Running with Scalpels)'
    ],
    ['base', '632', '11'] => [
      BRAND, "Fate's Brand", 'フェイト・ブランド', '命运巨剑',
      '운명의 낙인', "운명의 낙인(Fate's Brand)"
    ]
  }.transform_values(&:freeze).freeze
  DESCRIPTION_KEY = ['default', '1723', ''].freeze
  LOWERCASE_CARD_KEYS = [['default', '24902', ''], ['default', '52067', '']].freeze

  def definitions_for(headers)
    ENTITIES.map do |entity, english, korean, category, variants, note|
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'korean_canonical' => korean, 'category' => category,
        'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|" + ROWS.select { |_key, spec| spec[0] == entity }
          .keys.map { |key| key.reject(&:empty?).join(':') }.join('|'),
        'status' => 'confirmed',
        'notes' => "English-led complete name, corroborated by aligned Japanese and Chinese. #{note}"
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def normalize(text, key)
    spec = ROWS.fetch(key) { raise "unreviewed Running/Brand key #{key.inspect}" }
    old_span, new_span = spec.values_at(4, 5)
    return text if new_span.nil? || text == new_span

    unless [DESCRIPTION_KEY, *LOWERCASE_CARD_KEYS].include?(key)
      raise "complete Korean label differs #{key.inspect}" unless text == old_span
      return new_span
    end

    old_count = text.scan(Regexp.new(Regexp.escape(old_span))).length
    new_count = text.scan(Regexp.new(Regexp.escape(new_span))).length
    return text if old_count.zero? && new_count == 1
    raise "Running Man card-name span differs #{key.inspect}" unless old_count == 1 && new_count.zero?

    proposed = text.sub(old_span, new_span)
    raise 'Running Man span changes opaque tokens' unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        proposed.scan(ReviewedProperNameDiscovery::OPAQUE)
    raise 'Running Man span changes line breaks' unless
      text.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    proposed
  end

  def assert_scope!(generated)
    expected = ROWS.map { |key, spec| [spec.fetch(0), *key] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    return if actual == expected

    raise "Running/Brand source scope differs: missing=#{(expected - actual).inspect}; " \
          "extra=#{(actual - expected).inspect}; expected eleven reviewed keys."
  end

  def reviews_for(inventory, generated)
    assert_scope!(generated)
    generated.map do |occurrence|
      key = M.key(occurrence)
      entity, expected_en, expected_ja, expected_zh, = ROWS.fetch(key)
      source = inventory.fetch(key)
      raise "English source differs #{key.inspect}" unless
        JSON.parse(source.fetch('en_texts_json')).compact == [expected_en]
      raise "Japanese source differs #{key.inspect}" unless
        JSON.parse(source.fetch('ja_texts_json')).compact == [expected_ja]
      raise "Chinese source differs #{key.inspect}" unless source.fetch('zh_text') == expected_zh

      old = source.fetch('work_text')
      excluded = ROWS.fetch(key).fetch(5).nil?
      raise "protected equipment label differs #{key.inspect}" if excluded && old != ROWS.fetch(key).fetch(4)
      proposed = normalize(old, key)
      raise "normalization not idempotent #{key.inspect}" unless normalize(proposed, key) == proposed
      status = excluded ? 'excluded' : old == proposed ? 'not-an-issue' : 'accepted'
      note = ENTITIES.find { |spec| spec.fetch(0) == entity }.fetch(5)
      note += if excluded
                ' Generated equipment-title hit excluded: preserve the complete atomic item label byte-for-byte; do not insert a nested card annotation.'
              elsif LOWERCASE_CARD_KEYS.include?(key)
                ' The lowercase English card name is confirmed by Japanese and Chinese card-title renderings; annotate only the reviewed Korean card-name span and preserve the source lowercase English casing in parentheses. Leave the other card names ordinary.'
              else
                ' Change only the approved Korean span; preserve particles, prose, tokens, line breaks and unrelated labels.'
              end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "English #{expected_en}; Japanese #{expected_ja}; Chinese #{expected_zh}. #{note}",
        'english' => expected_en, 'japanese' => expected_ja, 'chinese' => expected_zh,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions_for(glossary.headers)
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts "Prepared D-#{D}: three entities, eleven keys, six edits, five atomic equipment exclusions; no files written."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then RunningBrandD21451.prepare
  when 'apply' then RunningBrandD21451.apply
  else abort 'usage: review-running-brand-D21451.rb [prepare|apply]'
  end
end
