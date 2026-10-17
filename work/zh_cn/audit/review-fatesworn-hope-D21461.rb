#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module HopeOfTheFateswornD21461
  extend self

  M = ReviewedNameBatches
  D = 21_461
  ENTITY = 'unique_item:hope-of-the-fatesworn'
  ENGLISH = 'Hope of the Fatesworn'
  KOREAN = '운명에 맹세한 자들의 희망'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  JAPANESE = 'フェイトスウォーンの希望'
  CHINESE = '誓命者的希望'

  # Key => [full English title/source phrase, old Korean name span, replacement]
  ROWS = {
    ['base', '1338', '11'] => [
      'Hope of the Fatesworn Greaves', '맹세의 운명(Fatesworn)의 희망 각반',
      '운명에 맹세한 자들의 희망 각반(Hope of the Fatesworn Greaves)'
    ],
    ['base', '2088', '11'] => [
      'Hope of the Fatesworn Helm', '페이트스원(Fatesworn)의 희망 투구',
      '운명에 맹세한 자들의 희망 투구(Hope of the Fatesworn Helm)'
    ],
    ['base', '2741', '11'] => [
      'Hope of the Fatesworn Cuirass', '페이트스원(Fatesworn)의 희망 흉갑',
      '운명에 맹세한 자들의 희망 흉갑(Hope of the Fatesworn Cuirass)'
    ],
    ['base', '3405', '11'] => [
      'Hope of the Fatesworn Chausses', '페이트스원(Fatesworn)의 희망 각반',
      '운명에 맹세한 자들의 희망 각반(Hope of the Fatesworn Chausses)'
    ],
    ['base', '3564', '11'] => [
      'Hope of the Fatesworn Gauntlets', '페이트스원(Fatesworn)의 희망 건틀릿',
      '운명에 맹세한 자들의 희망 건틀릿(Hope of the Fatesworn Gauntlets)'
    ],
    ['default', '505', ''] => [
      ENGLISH, '운명맹세자의 희망', CANONICAL
    ],
    ['default', '649', ''] => [
      ENGLISH, '운명맹세자의 희망(Hope of the Fatesworn)', CANONICAL
    ],
    ['default', '1288', ''] => [
      ENGLISH, '운명맹세자의 희망(Hope of the Fatesworn)', CANONICAL
    ],
    ['default', '7559', ''] => [
      ENGLISH, '운명결사단의 희망(Hope of the Fatesworn)', CANONICAL
    ],
    ['default', '8089', ''] => [
      ENGLISH, CANONICAL, CANONICAL
    ],
    ['default', '9966', ''] => [
      ENGLISH, '페이트스원드의 희망', CANONICAL
    ],
    ['default', '15634', ''] => [
      ENGLISH, '운명에 맹세한 자의 희망(Hope of the Fatesworn)', CANONICAL
    ],
    ['default', '18681', ''] => [
      ENGLISH, '운명에 충실한 자의 희망(Hope of the Fatesworn)', CANONICAL
    ],
    ['default', '35769', ''] => [
      ENGLISH, '페이트스원 희망', CANONICAL
    ],
    ['default', '40120', ''] => [
      'Hope of the Fatesworn Ring', '페이트스원 반지가 품은 희망',
      '운명에 맹세한 자들의 희망 반지(Hope of the Fatesworn Ring)'
    ],
    ['default', '41974', ''] => [
      ENGLISH, '운명맹세단의 희망', CANONICAL
    ],
    ['default', '59401', ''] => [
      ENGLISH, KOREAN, CANONICAL
    ],
    ['default', '59909', ''] => [
      ENGLISH, CANONICAL, CANONICAL
    ]
  }.transform_values(&:freeze).freeze
  SOURCE_KEYS = ROWS.keys.freeze
  UNCERTAIN_KEYS = [['default', '8089', '']].freeze

  NOTE = 'English identifies Hope of the Fatesworn as the named armor set; the five base rows are its complete atomic equipment-piece titles. Japanese フェイトスウォーンの希望 and Chinese 誓命者的希望 corroborate the set name. Use the established Korean Fatesworn root 운명에 맹세한 자들, but register only the unique armor set: no Fatesworn faction/person identity, global Hope alias, rarity, or bearer is inferred. Replace the nested Fatesworn component annotations in the five piece labels with complete atomic bilingual item titles. Default:8089 describes taking the role of another hero and does not establish that this occurrence denotes the armor; retain its existing Korean and hold that item-identity link as uncertain. Earlier people:erathi, person:skald-atlas, deity:telogrus and other per-row decisions remain historical, separate entity dispositions; this pass does not reopen or recount them.'

  def literal_count(text, span)
    text.scan(Regexp.new(Regexp.escape(span))).length
  end

  def unannotated_count(text, span)
    text.scan(Regexp.new("#{Regexp.escape(span)}(?!\\(#{Regexp.escape(ENGLISH)}\\))")).length
  end

  def definitions_for(headers)
    variants = ROWS.values.flat_map { |_en, old, replacement| [old, replacement] }
    variants.concat([KOREAN, CANONICAL])
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => ENGLISH,
      'category' => 'unique item', 'korean_canonical' => CANONICAL,
      'english_aliases' => '', 'korean_variants' => variants.uniq.join('|'),
      'evidence_ids' => "D-#{D}|" + SOURCE_KEYS.map { |key| key.reject(&:empty?).join(':') }.join('|'),
      'status' => 'confirmed', 'notes' => NOTE
    }
    [headers.to_h { |header| [header, fields.fetch(header, '')] }]
  end

  def normalize(text, key)
    english_title, old_span, replacement = ROWS.fetch(key) do
      raise "unreviewed Hope of the Fatesworn key #{key.inspect}"
    end
    raise "replacement is not a complete source title #{key.inspect}" unless
      replacement.end_with?("(#{english_title})")
    return text if old_span == replacement && literal_count(text, replacement) == 1

    old_count = old_span == replacement ? 0 : unannotated_count(text, old_span)
    new_count = literal_count(text, replacement)
    if old_count == 1 && new_count.zero?
      proposed = text.sub(old_span, replacement)
    elsif old_count.zero? && new_count == 1
      proposed = text
    else
      raise "Korean title span count differs #{key.inspect}: " \
            "#{old_span.inspect}=#{old_count}, #{replacement.inspect}=#{new_count}"
    end
    raise "normalization is not idempotent #{key.inspect}" unless
      normalize_done?(proposed, key)
    raise "opaque token changed #{key.inspect}" unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        proposed.scan(ReviewedProperNameDiscovery::OPAQUE)
    raise "line breaks changed #{key.inspect}" unless
      text.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    proposed
  end

  def normalize_done?(text, key)
    _english_title, _old_span, replacement = ROWS.fetch(key)
    literal_count(text, replacement) == 1
  end

  def assert_scope!(generated)
    expected = SOURCE_KEYS.map { |key| [ENTITY, *key] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    return if actual == expected

    raise "Hope of the Fatesworn source scope differs: " \
          "missing=#{(expected - actual).inspect}; extra=#{(actual - expected).inspect}"
  end

  def reviews_for(inventory, generated)
    assert_scope!(generated)
    generated.map do |occurrence|
      key = M.key(occurrence)
      english_title, old_span, replacement = ROWS.fetch(key)
      source = inventory.fetch(key)
      english_parts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_parts = JSON.parse(source.fetch('ja_texts_json')).compact
      english = english_parts.join("\n")
      japanese = japanese_parts.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English title mismatch #{key.inspect}" unless
        english.include?(english_title) && literal_count(english, ENGLISH) == 1
      raise "Japanese set-name corroboration missing #{key.inspect}" unless
        japanese.include?(JAPANESE)
      raise "Chinese set-name corroboration missing #{key.inspect}" unless
        chinese.include?(CHINESE)
      if UNCERTAIN_KEYS.include?(key)
        raise 'default:8089 is no longer the hero-role context' unless
          english.include?('take the role of one more hero') &&
          japanese.include?('担うべき英雄の役割') &&
          chinese.include?('扮演另一个英雄角色')
      end

      old = source.fetch('work_text')
      korean_count = old_span == replacement ? literal_count(old, replacement) :
        unannotated_count(old, old_span)
      raise "Korean source span count differs #{key.inspect}" unless korean_count == 1
      proposed = normalize(old, key)
      raise "normalization not idempotent #{key.inspect}" unless normalize(proposed, key) == proposed
      raise "atomic bilingual label missing #{key.inspect}" unless
        proposed.scan("(#{english_title})").length == 1
      status = if UNCERTAIN_KEYS.include?(key)
                 'uncertain'
               else
                 old == proposed ? 'not-an-issue' : 'accepted'
               end
      evidence = "#{NOTE} Exact English title: #{english_title}. " \
        "Normalize only this complete set/item name; preserve surrounding prose, particles, " \
        'punctuation, tokens, line breaks, and all other entity decisions.'
      evidence += ' The existing bilingual Korean title is unchanged; this row is held because its English/Japanese/Chinese context assigns the phrase to a hero role, not explicitly to armor.' if
        UNCERTAIN_KEYS.include?(key)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  # Align source and active Korean CSVs without updating the shared /private/tmp inventory.
  def active_inventory
    rows = RESOURCES.flat_map do |resource|
      aligned = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *aligned).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end
    inventory = rows.to_h { |row| [M.key(row), row] }
    raise 'duplicate aligned inventory key' unless inventory.length == rows.length
    inventory
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions_for(glossary.headers)
    inventory = active_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = reviews_for(inventory, generated)
    index = M.table(M::INDEX).map(&:to_h)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edits = reviews.count { |row| row['old'] != row['new'] }
    raise 'unexpected edited/unchanged key count' unless edits == 16 && reviews.length - edits == 2
    puts "Prepared D-#{D}: #{reviews.length} exact keys; #{edits} edits; " \
         "#{reviews.length - edits} already canonical."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'status', 'old', 'new'))
    end
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
  when 'prepare' then HopeOfTheFateswornD21461.prepare
  when 'apply' then HopeOfTheFateswornD21461.apply
  else abort 'usage: review-fatesworn-hope-D21461.rb [prepare|apply]'
  end
end
