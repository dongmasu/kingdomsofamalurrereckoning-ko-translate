#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module IngressShroudEverGlenD21433
  extend self

  M = ReviewedNameBatches
  D = 21_433
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")

  ENTITIES = [
    {
      key: 'place:caverns-of-ingress',
      english: 'Caverns of Ingress',
      category: 'place',
      korean: '잉그레스 동굴',
      japanese: %w[イングレス洞窟 イングレスの洞窟],
      chinese: %w[入口洞穴 英格雷斯洞穴],
      aliases: '',
      note: 'English repeatedly identifies the same named cave; Japanese イングレス洞窟 and Chinese 入口洞穴 corroborate it. Reuse 잉그레스 from the separately registered Oasis of Ingress. Do not add a global Ingress alias or merge the oasis with the cave.'
    },
    {
      key: 'unique_item:shroud-of-omission',
      english: 'Shroud of Omission',
      category: 'unique item',
      korean: '망각의 장막',
      japanese: %w[隠れ蓑],
      chinese: %w[遗忘尸布 遗忘的尸布 遗忘帷幕 遗忘的帷幕],
      aliases: 'Shroud of Omnission',
      note: 'English identifies a named magical cloth used to conceal the Missives and make covered objects forgotten; Japanese 隠れ蓑 and Chinese 遗忘尸布 corroborate its concealment/forgetting role. Reuse the already accepted Korean form 망각의 장막 (D-18076). The source typo Shroud of Omnission occurs once at default:13824 and is kept as a scoped source-form alias; no runtime rarity or separate Shadowskin identity is inferred.'
    },
    {
      key: 'place:ever-glen',
      english: 'Ever Glen',
      category: 'place',
      korean: '영원한 숲',
      japanese: %w[永久の峡谷],
      chinese: %w[长青幽谷],
      aliases: '',
      note: 'English explicitly describes Ever Glen as a beautiful magic wood granted to Lir; Japanese 永久の峡谷 and Chinese 长青幽谷 corroborate the named setting. The existing Korean 영원한 숲(Ever Glen) is already complete and remains unchanged.'
    }
  ].freeze

  TARGETS = {
    'place:caverns-of-ingress' => {
      ['default', '6862', ''] => ['인그레스 동굴(Caverns of Ingress)', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '17943', ''] => [nil, nil],
      ['default', '26828', ''] => ['진입 동굴', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '28985', ''] => ['진입 동굴(Caverns of Ingress)', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '34203', ''] => ['잉그레스 동굴', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '36158', ''] => ['인그레스 동굴', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '36206', ''] => ['인그레스 동굴', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '37473', ''] => ['진입 동굴', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '39537', ''] => ['인그레스 동굴', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '45374', ''] => ['진입의 동굴', '잉그레스 동굴(Caverns of Ingress)의'],
      ['default', '52839', ''] => ['진입 동굴(Caverns of Ingress)', '잉그레스 동굴(Caverns of Ingress)'],
      ['default', '60732', ''] => ['이그레스 동굴(Caverns of Ingress)', '잉그레스 동굴(Caverns of Ingress)']
    },
    'unique_item:shroud-of-omission' => {
      ['base', '4114', '11'] => ['망각의 장막', '망각의 장막(Shroud of Omission)'],
      ['default', '13824', ''] => ['망각의 수의(Shroud of Omnission)', '망각의 장막(Shroud of Omission)'],
      ['default', '18433', ''] => ['망각의 수의(Shroud of Omission)가', '망각의 장막(Shroud of Omission)이'],
      ['default', '21322', ''] => ['누락의 장막', '망각의 장막(Shroud of Omission)'],
      ['default', '27874', ''] => ['망각의 수의(Shroud of Omission)', '망각의 장막(Shroud of Omission)'],
      ['default', '31521', ''] => ['망각의 장막', '망각의 장막(Shroud of Omission)'],
      ['default', '41008', ''] => ['망각의 장막', '망각의 장막(Shroud of Omission)'],
      ['default', '54687', ''] => ['망각의 수의(Shroud of Omission)로', '망각의 장막(Shroud of Omission)으로'],
      ['default', '59307', ''] => ['망각의 수의', '망각의 장막(Shroud of Omission)'],
      ['default', '59473', ''] => ['망각의 수의로', '망각의 장막(Shroud of Omission)으로'],
      ['default', '60787', ''] => ['망각의 장막(Shroud of Omission)'],
      ['default', '61153', ''] => ['망각의 장막(Shroud of Omission)'],
      ['default', '61580', ''] => ['망각의 장막(Shroud of Omission)'],
      ['default', '61596', ''] => ['망각의 장막(Shroud of Omission)'],
      ['default', '63499', ''] => ['생략의 장막(Shroud of Omission)', '망각의 장막(Shroud of Omission)'],
      ['default', '63600', ''] => ['망각의 장막(Shroud of Omission)']
    },
    'place:ever-glen' => {
      ['default', '11821', ''] => ['영원한 숲(Ever Glen)']
    }
  }.freeze

  module_function

  def row_key(row)
    M.key(row)
  end

  def expected_pairs
    TARGETS.flat_map do |entity, rows|
      rows.keys.map { |key| [entity, *key] }
    end
  end

  def definitions_for(headers)
    ENTITIES.map do |item|
      fields = {
        'entity_key' => item.fetch(:key),
        'english_canonical' => item.fetch(:english),
        'category' => item.fetch(:category),
        'korean_canonical' => "#{item.fetch(:korean)}(#{item.fetch(:english)})",
        'english_aliases' => item.fetch(:aliases),
        'korean_variants' => item.fetch(:korean),
        'evidence_ids' => "D-#{D}",
        'status' => 'confirmed',
        'notes' => item.fetch(:note)
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def source_text(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact.join("\n")
  end

  def canonicalize(entity, key, old)
    target = TARGETS.fetch(entity).fetch(key)
    return old if target.length == 1

    old_span, new_span = target
    return old if old_span.nil?

    count = old.scan(Regexp.new(Regexp.escape(old_span))).length
    raise "expected one Korean label at #{key.inspect}, found #{count}" unless count == 1

    old.sub(old_span, new_span)
  end

  def validate_cross_locale!(entity, key, source)
    item = ENTITIES.find { |definition| definition.fetch(:key) == entity }
    english = source_text(source, 'en')
    japanese = source_text(source, 'ja')
    chinese = source.fetch('zh_text')
    aliases = item.fetch(:aliases).split('|')
    english_terms = [item.fetch(:english), *aliases]
    unless english_terms.any? { |term| english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) }
      raise "English anchor missing for #{entity} at #{key.inspect}"
    end
    raise "Japanese corroboration missing for #{entity} at #{key.inspect}" unless
      item.fetch(:japanese).any? { |variant| japanese.include?(variant) }
    raise "Chinese corroboration missing for #{entity} at #{key.inspect}" unless
      item.fetch(:chinese).any? { |variant| chinese.include?(variant) }
  end

  def reviews_for(inventory, generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *row_key(row)] }
    raise 'English-source occurrence scope differs from reviewed manifest' unless
      actual.sort == expected_pairs.sort

    generated.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante').to_s, row.fetch('entity_key')]
    end.map do |occurrence|
      entity = occurrence.fetch('entity_key')
      key = row_key(occurrence)
      source = inventory.fetch(key)
      validate_cross_locale!(entity, key, source)
      old = source.fetch('work_text')
      new_text = canonicalize(entity, key, old)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      item = ENTITIES.find { |definition| definition.fetch(:key) == entity }
      note = item.fetch(:note)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{note} English: #{source_text(source, 'en').gsub(/\s+/, ' ')[0, 260]} Japanese: #{source_text(source, 'ja').gsub(/\s+/, ' ')[0, 180]} Chinese: #{source.fetch('zh_text').gsub(/\s+/, ' ')[0, 180]}",
        'english' => source_text(source, 'en'),
        'japanese' => JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    inventory = M.refresh_inventory
    definitions = definitions_for(glossary.headers)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    reviews = reviews_for(inventory, generated)

    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edit_targets(reviews).group_by { |row| row.fetch('resource') }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts "Prepared D-#{D}: #{ENTITIES.length} entities, #{reviews.length} exact source keys; #{reviews.count { |row| row['status'] == 'accepted' }} edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'old', 'new'))
    end
    [definitions, reviews]
  end

  def edit_targets(reviews)
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
  end

  def append_findings
    findings = <<~TEXT

      ## Candidate Findings

      Screened unregistered-person scout ranks 306-325 against all 73,430
      aligned source rows and the current glossary. Three complete named
      entities were confirmed: Caverns of Ingress (12 exact keys), Shroud
      of Omission (16 exact keys, including the source typo at default:13824),
      and Ever Glen (one exact key). The other candidates were already
      represented by a registered full name/title/place/item, were only a
      component or context-bound short form, or were ordinary role/resource
      words. In particular, no global aliases were inferred for Ingress,
      Shaw, Ferrin, Carth, Byrn, Jayck, Vonn, Cranwyn, Marus, Glen, Maid,
      City, Essence, or Adept.

      English anchored identity and meaning; aligned Japanese and Chinese
      corroborated the three new entries. The cave uses the established
      잉그레스 spelling from Oasis of Ingress, not a literal translation of
      “ingress.” The Shroud uses the accepted 망각의 장막 form and does not
      imply runtime rarity. Ever Glen's existing bilingual Korean label was
      already correct. Prior sequential row dispositions and translation
      totals were not reopened or recounted.
    TEXT
    [REPORT, ADDENDUM].each do |path|
      text = File.read(path)
      text << findings
      File.write(path, text)
    end
  end

  def apply
    definitions, reviews = prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    append_findings
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then IngressShroudEverGlenD21433.prepare
  when 'apply' then IngressShroudEverGlenD21433.apply
  else abort 'usage: review-ingress-shroud-everglen-D21433.rb [prepare|apply]'
  end
end
