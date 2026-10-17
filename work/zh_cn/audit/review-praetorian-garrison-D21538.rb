#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module PraetorianGarrisonD21538
  extend self

  M = ReviewedNameBatches
  START = 21_538
  ENTITY = 'place:praetorian-garrison'
  ENGLISH = 'Praetorian Garrison'
  CANONICAL = '프레토리안 주둔지(Praetorian Garrison)'
  SOURCE_NAME = /(?<![A-Za-z])Praetorian[[:space:]]+Garrison(?![A-Za-z])/i
  ALL_KEYS = [
    ['base', '948', '11'],
    ['default', '4814', ''],
    ['default', '8769', ''],
    ['default', '10838', ''],
    ['default', '12167', ''],
    ['default', '18798', ''],
    ['default', '41188', ''],
    ['default', '46191', ''],
    ['default', '58091', ''],
    ['default', '58738', '']
  ].freeze
  FULL_KOREAN_SPANS = {
    'base:948:11' => ['근위대 주둔지', CANONICAL],
    'default:4814:' => ['프레토리안 주둔군', CANONICAL],
    'default:8769:' => ['프라이토리안 주둔군', CANONICAL],
    'default:10838:' => ['프라이토리안 주둔군', CANONICAL],
    'default:12167:' => [CANONICAL, CANONICAL],
    'default:18798:' => ['근위대 주둔지', CANONICAL],
    'default:41188:' => ['프라이토리아 주둔지', CANONICAL],
    'default:46191:' => ['친위대 주둔지', CANONICAL],
    'default:58091:' => ['근위대 주둔지', CANONICAL],
    'default:58738:' => ['프레토리아 수비대', CANONICAL]
  }.freeze
  SHORT_REFERENCE_SPANS = {
    'default:4814:' => [
      ['주둔군은', '주둔군(Garrison)은'],
      ['주둔군 작업', '주둔지(Garrison) 작업']
    ]
  }.freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")

  JA_SUPPORT = {
    'base:948:11' => '軍団兵詰所',
    'default:4814:' => '軍団兵詰所',
    'default:8769:' => '軍団兵詰所',
    'default:10838:' => '詰所',
    'default:12167:' => '詰所',
    'default:18798:' => '軍団兵詰所',
    'default:41188:' => '軍団兵詰所',
    'default:46191:' => '軍団兵詰所',
    'default:58091:' => '軍団兵詰所',
    'default:58738:' => '軍団兵の詰所'
  }.freeze
  ZH_SUPPORT = {
    'base:948:11' => '禁卫军卫戍要塞',
    'default:4814:' => '卫戍要塞',
    'default:8769:' => '禁卫军卫戍要塞',
    'default:10838:' => '禁卫军卫戍要塞',
    'default:12167:' => '禁卫军卫戍要塞',
    'default:18798:' => '禁卫军卫戍要塞',
    'default:41188:' => '禁卫军卫戍要塞',
    'default:46191:' => '禁卫军驻地',
    'default:58091:' => '禁卫军卫戍要塞',
    'default:58738:' => '禁卫军的驻防历史'
  }.freeze
  ROW_NOTES = {
    'base:948:11' => 'Standalone Adessa location label for the Praetorian installation.',
    'default:4814:' => 'The paragraph names the Praetorian Garrison, then uses two same-row Garrison references: retain the organization-like 주둔군 wording in the first and the construction-site sense in the second, annotating only those local spans.',
    'default:8769:' => 'Galenun Hegem’s memoir explicitly directs the player to search this named Adessa location.',
    'default:10838:' => 'The memoir recounts the Garrison construction after the Livrarium; the later short Japanese wording does not create a separate entity.',
    'default:12167:' => 'Already carries the proposed full bilingual name; training-room context confirms this is the named facility.',
    'default:18798:' => 'English frames consulting with the named Garrison; Japanese and Chinese render the same military station, not generic Praetorians.',
    'default:41188:' => 'The second memoir chapter is found in this named location.',
    'default:46191:' => 'Sparring facilities identify the Adessa training location; retain the source-local possessive.',
    'default:58091:' => 'The aligned base:948 and default:58091 labels identify the same named facility. Add this new entity-key spelling annotation, but preserve the prior D-17526 translation verdict and tally unchanged; this is not a verdict revision or historical recount.',
    'default:58738:' => 'A memoir describes the history of the named Garrison; the surrounding source distinguishes it from the Laboratories.'
  }.freeze
  NOTE = 'The exact full English name denotes the Adessa Praetorian installation: its standalone label, construction history, memoir location, and training facilities are direct context. Japanese 軍団兵詰所/詰所 and Chinese 禁卫军卫戍要塞/驻地 support a military station or fortified garrison. The source also uses Praetorian for the gnomish order and for individual guards; those generic or rank uses are not aliases and are not swept into this place. Crownhold Garrison is a distinct location. The official-korean-manual-extracted.md was checked for Adessa/Praetorian coverage; it contains no direct name or competing spelling, so it contributes only broad setting background.'
  COMMON = 'Register only the exact phrase Praetorian Garrison, with the two justified Garrison short references confined to default:4814. No global Praetorian, Praetorians, Garrison, or Guard alias. English is the identity/meaning anchor; aligned Japanese and Chinese are supporting evidence. Preserve every prior entity/key disposition and historical tally unchanged, including the D-17526 translation verdict for default:58091; this new entity-key annotation records the place identity and consistent bilingual spelling without revising that verdict. Preserve particles, unrelated wording, opaque tokens, and exact line breaks; use only Texto-cell replacements. The reviewed apply helper performs the three-resource backup and byte validation.'

  def key_tag(key)
    key.join(':')
  end

  def expected_pairs
    ALL_KEYS.map { |key| [ENTITY, *key] }
  end

  def definition(headers)
    fields = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'place',
      'korean_canonical' => CANONICAL,
      'english_aliases' => '',
      'korean_variants' => [
        '근위대 주둔지', '프레토리안 주둔군', '프라이토리안 주둔군',
        '프라이토리안 주둔지', '프라이토리아 주둔지', '친위대 주둔지',
        '프레토리아 수비대'
      ].join('|'),
      'evidence_ids' => (['D-21538'] + ALL_KEYS.map { |key| key.join(':') }).join('|'),
      'status' => 'confirmed',
      'notes' => "#{NOTE} #{COMMON}"
    }
    headers.to_h { |header| [header, fields.fetch(header, '')] }
  end

  def load_inventory
    # Align the live CSVs in memory; never refresh or write the shared inventory.
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end
    raise 'incomplete aligned inventory' unless rows.length == 73_430
    raise 'duplicate aligned inventory key' unless
      rows.map { |row| M.key(row) }.uniq.length == rows.length

    rows.to_h { |row| [M.key(row), row] }
  end

  def validate_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Praetorian Garrison exact-source scope differs' unless
      actual.sort == expected_pairs.sort
    generated
  end

  def replace_once(text, old_span, new_span, key)
    count = text.scan(Regexp.new(Regexp.escape(old_span))).length
    raise "Praetorian Garrison Korean span count differs #{key.inspect}" unless count == 1

    text.sub(old_span, new_span)
  end

  def review_source(source)
    key = M.key(source)
    tag = key_tag(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise "Praetorian Garrison English match count differs #{key.inspect}" unless
      english.scan(SOURCE_NAME).length == 1
    raise "Praetorian Garrison Japanese support differs #{key.inspect}" unless
      japanese.include?(JA_SUPPORT.fetch(tag))
    raise "Praetorian Garrison Chinese support differs #{key.inspect}" unless
      chinese.include?(ZH_SUPPORT.fetch(tag))

    old = source.fetch('work_text')
    full_old, full_new = FULL_KOREAN_SPANS.fetch(tag)
    new_text = replace_once(old, full_old, full_new, key)
    SHORT_REFERENCE_SPANS.fetch(tag, []).each do |short_old, short_new|
      new_text = replace_once(new_text, short_old, short_new, key)
    end
    disposition = old == new_text ? 'not-an-issue' : 'accepted'
    row_note = ROW_NOTES.fetch(tag)
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => ENTITY, 'status' => disposition,
      'old' => old, 'new' => new_text,
      'evidence' => [NOTE, row_note, COMMON].join(' '),
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => disposition)
    }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(START)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = [definition(glossary.headers)]
    inventory = load_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    validate_scope!(generated)
    reviews = generated.sort_by do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map { |row| review_source(inventory.fetch(M.key(row))) }
    raise 'Praetorian Garrison changed-cell count differs' unless
      reviews.count { |row| row.fetch('old') != row.fetch('new') } == 9
    raise 'Praetorian Garrison dispositions differ' unless
      reviews.count { |row| row.fetch('status') == 'not-an-issue' } == 1 &&
      reviews.count { |row| row.fetch('status') == 'accepted' } == 9
    raise 'Praetorian Garrison source-key count differs' unless reviews.length == 10
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts 'D-21538: 10 exact source keys; 9 changed cells; 1 unchanged; ' \
         '0 excluded; one batch; prepare mode, no writes.'
    [glossary.headers, definitions, reviews]
  end

  def apply
    paths = [DEFINITIONS, REVIEWS]
    raise 'D-21538 prepared outputs already exist' if paths.any? { |path| File.exist?(path) }

    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PraetorianGarrisonD21538.prepare
  when ['apply'] then PraetorianGarrisonD21538.apply
  else abort 'usage: review-praetorian-garrison-D21538.rb [prepare|apply]'
  end
end
