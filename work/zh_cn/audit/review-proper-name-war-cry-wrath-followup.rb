#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'
require 'set'

module WarCryWrathReview
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  SOURCE_FINGERPRINT =
    '2f0693e2eb9d7a815f6f3ba2d34b0e7bb07281b0ccaa0b544e60877a22e07d09'
  REVIEW_OUT = '/private/tmp/war-cry-wrath-reviewed.tsv'
  DEFINITIONS_OUT = '/private/tmp/war-cry-wrath-definitions.tsv'

  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  RESOURCE_ORDER = %w[affix base default].freeze

  WAR_CRY = 'skill:war-cry'
  WRATH = 'skill:wrath'

  WAR_CRY_EDIT_KEYS = [
    ['base', '2485', '11'],
    ['default', '9661', ''],
    ['default', '61182', '']
  ].freeze
  WAR_CRY_NOT_ISSUE_KEYS = [].freeze

  WRATH_EDIT_KEYS = [
    ['base', '3033', '11'],
    ['default', '41015', ''],
    ['default', '5661', ''],
    ['default', '7298', ''],
    ['default', '10263', ''],
    ['default', '17196', ''],
    ['default', '24470', ''],
    ['default', '57272', ''],
    ['default', '62610', '']
  ].freeze
  WRATH_NOT_ISSUE_KEYS = [['default', '7693', '']].freeze

  WRATH_COMPOUNDS = {
    ['base', '3120', '11'] =>
      "Wrath's Helm is a complete equipment label, not the Wrath ability; preserve the full compound.",
    ['default', '35147', ''] =>
      "Castor's Wrath is a complete named title; preserve it without treating Wrath as the ability.",
    ['default', '37517', ''] =>
      "The Widow's Wrath is a complete named title; preserve the full label.",
    ['default', '52534', ''] =>
      "Belen's Wrath is a complete named title with a source-supported Korean parenthetical; retain it atomically.",
    ['default', '63365', ''] =>
      "Wrath of the Storm is a distinct complete compound label, not the standalone Wrath ability."
  }.freeze

  ORDINARY_WRATH_REASONS = {
    '593' => 'First-person threat uses wrath as ordinary anger.',
    '1496' => "Vraekor's wrath is divine anger in the Aberrus story.",
    '2202' => 'The poem uses wrath for the Maid’s ordinary emotional anger.',
    '3330' => "Ethene's wrath is a story event, not the Wrath ability.",
    '6160' => 'The speaker contrasts personal wrath with true power.',
    '7404' => 'The poem uses wrath for the Maid’s ordinary emotional anger.',
    '7518' => 'The spirit’s wrath is ordinary creature anger in the poem.',
    '9234' => "Tirnoch's wrath is a threatened divine reaction in dialogue.",
    '10683' => "The wrath of Naros is a deity's anger in a religious text.",
    '13074' => 'The speaker threatens personal wrath in dialogue.',
    '13904' => 'This wrath means the House’s ordinary misfortune or anger.',
    '14873' => "Lyria's wrath is divine punishment in dialogue.",
    '17056' => 'The speaker threatens personal wrath in dialogue.',
    '17745' => "Hecatyr's wrath is a mythic consequence in the Selinia story.",
    '18309' => "The tempest's wrath is figurative battle rhetoric.",
    '19199' => 'The speaker uses wrath as ordinary anger toward the rats.',
    '24879' => "Tirnoch's wrath is a lore event, not the named ability.",
    '25915' => "Ethene's wrath is a story event, not the Wrath ability.",
    '26572' => "Cranwyn's wrath is ordinary threatening dialogue.",
    '28247' => 'The gods’ wrath is ordinary divine anger in the scene.',
    '30988' => 'The wrath of the gods describes a past catastrophe.',
    '31094' => "Akara's wrath is a spoken threat, not the ability.",
    '33667' => 'Their wrath means ordinary anger in a poem.',
    '34029' => 'Wrath is a generic description of the Marauders’ temperament.',
    '34452' => 'Their wrath means ordinary anger in a poem.',
    '37262' => "The storm's wrath is figurative weather imagery.",
    '39284' => 'The spirit’s wrath is ordinary creature anger in the poem.',
    '40462' => "Tirnoch's wrath is a spoken threat, not the ability.",
    '40478' => 'The speaker threatens personal wrath in dialogue.',
    '42635' => 'The wrath of the gods describes a past catastrophe.',
    '43145' => 'The queen’s wrath means her ordinary temper in a comic poem.',
    '44913' => "Lyria's wrath is a figurative force in a hymn.",
    '46371' => 'Darkvari wrath is ordinary threatening dialogue.',
    '48468' => "The King's wrath means ordinary punishment in a story.",
    '52236' => 'First-person threat uses wrath as ordinary anger.',
    '55208' => "Tirnoch's wrath is a lore event, not the named ability.",
    '59458' => "Tirnoch's wrath is a threatened divine reaction in dialogue.",
    '59851' => "The goddess's wrath is ordinary divine anger in a story.",
    '61478' => 'The speaker threatens personal wrath in dialogue.'
  }.freeze

  WRATH_EXPECTED_KOREAN = {
    ['base', '3033', '11'] => '격노',
    ['default', '41015', ''] => '분노',
    ['default', '5661', ''] => '격노(Wrath)',
    ['default', '7298', ''] => '진노',
    ['default', '7693', ''] => '분노(Wrath)',
    ['default', '10263', ''] => '진노',
    ['default', '17196', ''] => '분노',
    ['default', '24470', ''] => '격노',
    ['default', '57272', ''] => '격노',
    ['default', '62610', ''] => '분노'
  }.freeze

  ORDINARY_WRATH_KEYS = ORDINARY_WRATH_REASONS.keys.map do |id|
    ['default', id, '']
  end.freeze

  EXPECTED_KEYS = (
    WAR_CRY_EDIT_KEYS + WAR_CRY_NOT_ISSUE_KEYS +
    WRATH_EDIT_KEYS + WRATH_NOT_ISSUE_KEYS +
    WRATH_COMPOUNDS.keys + ORDINARY_WRATH_KEYS
  ).freeze

  PARTICLES = %w[
    에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
    에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
    로부터 로도 로는 로만 처럼 만큼 보다 행 였던 이었던 까지 부터
    이라며 이라는 이라서 이라고 이라 라고 라며 라 은 는 이 가 을 를 와 과 의
    에 로 도 만 들
  ].uniq.sort_by { |value| -value.length }
   .map { |value| Regexp.escape(value) }.join('|').freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def read_inventory
    table = CSV.read(INVENTORY, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
    missing = %w[
      resource ID_Linha Tipo_Variante en_texts_json ja_texts_json zh_text work_text
    ] - table.headers
    raise "inventory missing columns: #{missing.join(', ')}" unless missing.empty?

    rows = table.map(&:to_h)
    indexed = rows.to_h { |row| [key(row), row] }
    raise 'duplicate source keys in inventory' unless indexed.length == rows.length
    [rows, indexed]
  end

  def exact_count(texts, english)
    pattern = /(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i
    texts.sum { |text| text.to_s.scan(pattern).length }
  end

  def check_source_anchor!(sources, source_key, english, japanese, chinese)
    source = sources.fetch(source_key)
    english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
    japanese_texts = JSON.parse(source.fetch('ja_texts_json') || '[]').compact
    raise "English anchor mismatch at #{source_key.inspect}" unless english_texts.include?(english)
    raise "Japanese anchor mismatch at #{source_key.inspect}" unless
      japanese_texts.join("\n").include?(japanese)
    raise "Chinese anchor mismatch at #{source_key.inspect}" unless
      source.fetch('zh_text').to_s.include?(chinese)
  end

  def check_anchors!(sources)
    check_source_anchor!(sources, ['base', '2485', '11'],
                         'War Cry', 'ウォークライ', '战吼')
    check_source_anchor!(sources, ['default', '9661', ''],
                         'War Cry', 'ウォークライ', '战争嚎叫')
    upgrade_key = ['default', '61182', '']
    upgrade = sources.fetch(upgrade_key)
    english = JSON.parse(upgrade.fetch('en_texts_json') || '[]').compact.join("\n")
    japanese = JSON.parse(upgrade.fetch('ja_texts_json') || '[]').compact.join("\n")
    chinese = upgrade.fetch('zh_text').to_s
    raise "War Cry upgrade English anchor mismatch at #{upgrade_key.inspect}" unless
      english.include?('Your War Cry gains the ability to reduce enemy Armor')
    raise "War Cry upgrade Japanese anchor mismatch at #{upgrade_key.inspect}" unless
      japanese.include?('ウォークライ')
    raise "War Cry upgrade Chinese anchor mismatch at #{upgrade_key.inspect}" unless
      chinese.include?('你的战吼获得了降低敌人护甲的能力')
    check_source_anchor!(sources, ['base', '3033', '11'],
                         'Wrath', 'ラース', '怒意')
    check_source_anchor!(sources, ['default', '41015', ''],
                         'Wrath', 'ラース', '愤怒')

    WRATH_EDIT_KEYS.drop(2).each do |source_key|
      source = sources.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
      chinese = source.fetch('zh_text').to_s
      raise "Wrath mechanics anchor mismatch at #{source_key.inspect}" unless
        english.match?(/\bEach impulse of Wrath does\b/i) &&
        japanese.include?('ラース') &&
        chinese.include?('怒火')
    end
  end

  def exact_hits(rows)
    hits = {}
    rows.each do |row|
      english = JSON.parse(row.fetch('en_texts_json') || '[]').compact
      found = {}
      [[WAR_CRY, 'War Cry'], [WRATH, 'Wrath']].each do |entity, term|
        count = exact_count(english, term)
        found[entity] = count if count.positive?
      end
      next if found.empty?
      raise "multiple scoped names share source key #{key(row).inspect}" unless found.length == 1
      hits[key(row)] = [row, found]
    end
    hits
  end

  def source_fingerprint(hits)
    source_payload = hits.keys.sort.map do |source_key|
      source = hits.fetch(source_key).first
      [
        source_key,
        JSON.parse(source.fetch('en_texts_json') || '[]').compact,
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact,
        source.fetch('zh_text').to_s
      ]
    end
    Digest::SHA256.hexdigest(JSON.generate(source_payload))
  end

  def rewrite_wrath(old, source_count)
    variant_pattern = '(?:분노|격노|진노)'
    pattern = /(?<![가-힣])#{variant_pattern}(?:\s*\(Wrath\))?(?<particle>#{PARTICLES})?(?![가-힣])/
    matches = old.to_enum(:scan, pattern).map { Regexp.last_match.dup }
    raise 'Wrath English/Korean mention counts differ' unless matches.length == source_count

    rewritten = old.dup
    matches.reverse_each do |match|
      particle = match[:particle].to_s
      replacement = "분노(Wrath)#{particle}"
      rewritten[match.begin(0)...match.end(0)] = replacement
    end
    rewritten
  end

  def disposition_for(source_key, entity, old, english_count)
    if entity == WAR_CRY
      if WAR_CRY_EDIT_KEYS.include?(source_key)
        if source_key == ['default', '61182', '']
          old_variant = '전쟁 함성(War Cry)'
          raise 'War Cry upgrade old-span anchor mismatch' unless
            old.scan(old_variant).length == 1
          rewritten = old.sub(old_variant, '전투 함성(War Cry)')
          return ['accepted', rewritten,
                  'The aligned upgrade sentence explicitly names War Cry; normalize the single observed Korean label span 전쟁 함성(War Cry) to the requested canonical 전투 함성(War Cry), preserving the upgrade label, sentence, and particles. Retain 전쟁 함성 only as glossary provenance.']
        end
        raise "unexpected War Cry source text at #{source_key.inspect}" unless old == '전투 함성'
        return ['accepted', '전투 함성(War Cry)',
                'Exact War Cry menu label; Japanese ウォークライ and Chinese menu label corroborate the ability. Canonical Korean follows the menu form 전투 함성.']
      end
      if WAR_CRY_NOT_ISSUE_KEYS.include?(source_key)
        raise 'War Cry upgrade text lost its existing bilingual variant' unless
          old.include?('전쟁 함성(War Cry)')
        return ['not-an-issue', old,
                'The upgrade sentence explicitly names War Cry and already uses the observed source-supported variant 전쟁 함성(War Cry); retain it.']
      end
      raise "unclassified War Cry source key #{source_key.inspect}"
    end

    if WRATH_EDIT_KEYS.include?(source_key) || WRATH_NOT_ISSUE_KEYS.include?(source_key)
      expected = WRATH_EXPECTED_KOREAN.fetch(source_key)
      raise "Wrath Korean anchor mismatch at #{source_key.inspect}" unless old.include?(expected)
      rewritten = rewrite_wrath(old, english_count)
      expected_status = WRATH_NOT_ISSUE_KEYS.include?(source_key) ? 'not-an-issue' : 'accepted'
      raise "unexpected Wrath status at #{source_key.inspect}" unless
        (rewritten == old) == (expected_status == 'not-an-issue')
      reason = if expected_status == 'not-an-issue'
                 'The damage/cost row identifies the Wrath ability; its existing canonical bilingual form 분노(Wrath) is retained.'
               elsif source_key == ['base', '3033', '11'] ||
                     source_key == ['default', '41015', '']
                 'Exact Wrath ability-menu label; Japanese ラース and Chinese menu rendering corroborate it. Use the default-menu-supported canonical 분노(Wrath), recording 격노 as a variant.'
               else
                 'The exact Wrath impulse-damage/cost description identifies the named ability; Japanese ラース and Chinese 怒火 corroborate the aligned mechanic.'
               end
      return [expected_status, rewritten, reason]
    end

    if WRATH_COMPOUNDS.key?(source_key)
      return ['excluded', old, WRATH_COMPOUNDS.fetch(source_key)]
    end

    if entity == WRATH && source_key[0] == 'default' &&
       ORDINARY_WRATH_REASONS.key?(source_key[1])
      return ['excluded', old, ORDINARY_WRATH_REASONS.fetch(source_key[1])]
    end

    raise "unclassified exact source key #{source_key.inspect}"
  end

  def build_reviews(hits, sources)
    hits.map do |source_key, (source, found)|
      entity, english_count = found.first
      raise "unexpected repeated English hit at #{source_key.inspect}" unless english_count == 1

      english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
      japanese_texts = JSON.parse(source.fetch('ja_texts_json') || '[]').compact
      chinese = source.fetch('zh_text').to_s
      raise "missing aligned translation at #{source_key.inspect}" if
        japanese_texts.empty? || chinese.empty?

      old = source.fetch('work_text')
      status, new_text, rationale = disposition_for(source_key, entity, old, english_count)
      unless status == 'accepted'
        raise "unchanged disposition edited #{source_key.inspect}" unless old == new_text
      end
      if status == 'accepted'
        raise "accepted disposition made no edit #{source_key.inspect}" if old == new_text
      end
      raise "line breaks changed #{source_key.inspect}" unless
        old.count("\n") == new_text.count("\n")
      raise "placeholders changed #{source_key.inspect}" unless
        old.scan(/\{[^}]*\}/) == new_text.scan(/\{[^}]*\}/)

      english = english_texts.join("\n---\n")
      japanese = japanese_texts.join("\n---\n")
      evidence = "#{entity}: English source: #{english}. Japanese source: #{japanese}. " \
                 "Chinese source: #{chinese}. #{rationale} Korean left unchanged unless the row is accepted."
      {
        'resource' => source_key[0], 'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2], 'entity_key' => entity,
        'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence, 'english' => english,
        'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end.sort_by do |row|
      [RESOURCE_ORDER.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end
  end

  def build_definitions
    [
      [
        WAR_CRY, 'War Cry', 'skill', '전투 함성(War Cry)', '',
        '전쟁 함성',
        'base:2485:11|default:9661|default:61182', 'confirmed',
        'English ability-menu and upgrade rows are corroborated by Japanese ウォークライ and Chinese 战吼/战争嚎叫. Canonical Korean follows the menu majority 전투 함성. 전쟁 함성 is a previously observed, source-supported Korean form retained as glossary provenance only; the reviewed upgrade row is normalized to 전투 함성.'
      ],
      [
        WRATH, 'Wrath', 'skill', '분노(Wrath)', '',
        '격노|진노',
        'base:3033:11|default:41015|default:5661|default:7298|default:7693|default:10263|default:17196|default:24470|default:57272|default:62610',
        'confirmed',
        'The exact ability menu uses Korean 분노; base menu 격노 and aligned damage descriptions 진노 are recorded variants. Japanese ラース and Chinese 怒火 corroborate the damage/cost skill rows. Ordinary anger and complete compounds were reviewed separately and remain unchanged.'
      ]
    ].map { |values| DEFINITION_HEADERS.zip(values).to_h }
  end

  def write_tsv(path, headers, rows)
    raise "output path must remain under /private/tmp: #{path}" unless
      File.expand_path(path).start_with?('/private/tmp/')
    CSV.open(path, 'w:UTF-8', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << headers
      rows.each { |row| csv << headers.map { |header| row.fetch(header) } }
    end
  end

  def run!
    raise 'this bounded reviewer accepts no arguments' unless ARGV.empty?
    raise 'review and definition outputs must be distinct' if REVIEW_OUT == DEFINITIONS_OUT

    rows, sources = read_inventory
    check_anchors!(sources)
    hits = exact_hits(rows)
    actual_keys = hits.keys.to_set
    expected_keys = EXPECTED_KEYS.to_set
    raise "expected-key manifest has duplicates" unless EXPECTED_KEYS.length == expected_keys.length
    unless actual_keys == expected_keys
      missing = (expected_keys - actual_keys).to_a
      unexpected = (actual_keys - expected_keys).to_a
      raise "exact source scope changed; missing=#{missing.inspect}; unexpected=#{unexpected.inspect}"
    end
    actual_source_fingerprint = source_fingerprint(hits)
    unless actual_source_fingerprint == SOURCE_FINGERPRINT
      raise "scoped EN/JA/ZH fingerprint changed: #{actual_source_fingerprint}"
    end
    raise 'ordinary Wrath disposition map is incomplete' unless
      ORDINARY_WRATH_REASONS.keys.to_set == ORDINARY_WRATH_KEYS.map { |key| key[1] }.to_set

    reviews = build_reviews(hits, sources)
    raise 'review row count mismatch' unless reviews.length == 57
    expected_counts = { 'accepted' => 12, 'not-an-issue' => 1, 'excluded' => 44 }
    actual_counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise "unexpected review counts: #{actual_counts.inspect}" unless actual_counts == expected_counts

    definitions = build_definitions
    raise 'definition count mismatch' unless definitions.length == 2
    raise 'duplicate review keys' unless
      reviews.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == reviews.length

    write_tsv(REVIEW_OUT, REVIEW_HEADERS, reviews)
    write_tsv(DEFINITIONS_OUT, DEFINITION_HEADERS, definitions)
    puts "War Cry/Wrath exact hits: #{reviews.length} rows; #{actual_counts.inspect}; " \
         "definitions=#{definitions.length}; en_ja_zh_fingerprint=#{actual_source_fingerprint}; " \
         "outputs=#{REVIEW_OUT},#{DEFINITIONS_OUT}"
  end
end

WarCryWrathReview.run!
