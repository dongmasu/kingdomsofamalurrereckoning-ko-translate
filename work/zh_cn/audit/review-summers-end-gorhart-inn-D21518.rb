#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module SummersEndGorhartInnD21518
  extend self

  M = ReviewedNameBatches
  D = 21_518
  SUMMER = 'place:summers-end'
  INN = 'place:gorhart-inn'
  STONE = 'item:summers-end-stone'
  TOWER = 'place:summers-end-bell-tower'
  CHANTRY = 'place:summers-end-chantry'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  SUMMER_IDS = %w[11937 11999 30469 32924 43647 44664 49413 54948 56050 63500 64294].freeze
  INN_IDS = %w[21764 24805 29968 32598 33999 42316 44661 48072].freeze
  NAMES = {
    SUMMER => ["Summer's End", "서머스 엔드(Summer's End)", 'place', '여름의 끝|서머스 엔드'],
    INN => ['Gorhart Inn', '고어하트 여관(Gorhart Inn)', 'place', '고어하트(Gorhart) 여관'],
    STONE => ["Summer's End Stone", "서머스 엔드의 돌(Summer's End Stone)", 'item', "서머스 엔드(Summer's End)의 돌"],
    TOWER => ["Summer's End - Bell Tower", "서머스 엔드 - 종탑(Summer's End - Bell Tower)", 'place', '서머스 엔드 - 종탑'],
    CHANTRY => ["Summer's End - Chantry", "서머스 엔드 - 성소(Summer's End - Chantry)", 'place', '여름의 끝 - 성소']
  }.freeze
  COMPOUNDS = {
    ['base', '3837', '11'] => STONE,
    ['default', '32924', ''] => TOWER,
    ['default', '43647', ''] => CHANTRY
  }.freeze
  COMMON = 'English is the meaning and identity anchor; Japanese and Chinese are supporting aligned evidence. Register only these complete names, without broad Summer, End or Gorhart aliases. Preserve all unrelated wording, names, tokens and exact line breaks. Earlier person/place dispositions and evidence are unchanged; no historical translation tally is recounted.'
  NOTES = {
    SUMMER => "English default:11999 identifies the village of Summer's End and default:56050 its village and forest. Japanese サマーズ・エンド and Chinese 夏之终焉 corroborate the place. Normalize 여름의 끝 to 서머스 엔드. Default:64294 changes 끝을 to 엔드를; default:63500 is already valid and its distinct poem translation remains byte-identical. At default:54948 Chinese renders the name literally as 夏天的结束; explicit English and Japanese establish the location, not an ordinary season-ending event. Exclude the nested place match in each separately registered complete stone/subplace label.",
    INN => 'English default:21764 identifies the famous Gorhart Inn and its proprietor; Japanese ゴーハートの宿/ゴーハートの宿屋 and Chinese 郭哈特旅馆 corroborate the venue. Replace component-only 고어하트(Gorhart) 여관 with the complete atomic pair. This inn is a separate scope from place:gorhart; preserve every existing parent-town disposition, including accepted/not-an-issue records.',
    STONE => 'English base:3837 gives the complete Summer\'s End Stone label; Japanese サマーズ・エンドの石 and Chinese 夏之终焉之石 confirm its modifier relationship. Preserve the existing 의 돌 wording and pair the whole title. The nested place match is excluded; no rarity or runtime mechanics are inferred.',
    TOWER => 'English default:32924 gives the complete Summer\'s End - Bell Tower label, Japanese サマーズ・エンド - 鐘楼 and Chinese 夏之终焉 - 钟楼. Preserve the existing 종탑 descriptor and separators; pair the whole place label and exclude its nested parent match.',
    CHANTRY => 'English default:43647 gives the complete Summer\'s End - Chantry label, Japanese サマーズ・エンド - 礼拝堂 and Chinese 夏之终焉 - 礼拜堂. Preserve the existing 성소 descriptor while normalizing the parent spelling and pairing the whole place label; do not introduce an unrelated descriptor rewrite. Exclude the nested parent match.'
  }.freeze

  def expected_pairs
    [[SUMMER, 'base', '3542', '11'], [SUMMER, 'base', '3837', '11']] +
      SUMMER_IDS.map { |id| [SUMMER, 'default', id, ''] } +
      [[INN, 'base', '2122', '11']] + INN_IDS.map { |id| [INN, 'default', id, ''] } +
      COMPOUNDS.map { |key, entity| [entity, *key] }
  end

  def definitions(headers)
    NAMES.map do |entity, (en, ko, category, variants)|
      evidence_keys = expected_pairs.select { |pair| pair.first == entity }.map { |pair| pair.drop(1).join(':') }
      fields = {
        'entity_key' => entity, 'english_canonical' => en, 'category' => category,
        'korean_canonical' => ko, 'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|#{evidence_keys.join('|')}",
        'status' => 'confirmed', 'notes' => "#{NOTES.fetch(entity)} #{COMMON}"
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def load_inventory
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    raise 'incomplete or duplicate aligned inventory' unless
      rows.length == 73_430 && rows.map { |row| M.key(row) }.uniq.length == rows.length

    rows.to_h { |row| [M.key(row), row] }
  end

  def validate_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Summer/Inn source scope differs' unless actual.sort == expected_pairs.sort
    raise 'Summer/Inn distinct-row count differs' unless generated.map { |row| M.key(row) }.uniq.length == 22
  end

  def review_source(source, entities)
    key = M.key(source)
    expected = expected_pairs.select { |pair| pair.drop(1) == key }.map(&:first).sort
    raise "unreviewed Summer/Inn scope #{key.inspect}" unless !expected.empty? && entities.sort == expected

    entity = COMPOUNDS.fetch(key, entities.fetch(0))
    en, canonical = NAMES.fetch(entity)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    pattern = /(?<![A-Za-z])#{Regexp.escape(en)}(?![A-Za-z])/
    raise "Summer/Inn English evidence differs #{key.inspect}" unless english.scan(pattern).length == 1
    ja_term = entity == INN ? 'ゴーハートの宿' : 'サマーズ・エンド'
    zh_term = entity == INN ? '郭哈特旅馆' : (key == ['default', '54948', ''] ? '夏天的结束' : '夏之终焉')
    raise "Summer/Inn aligned evidence differs #{key.inspect}" unless
      japanese.scan(ja_term).length == 1 && chinese.scan(zh_term).length == 1

    old = source.fetch('work_text')
    if COMPOUNDS.key?(key)
      ja_label, zh_label = {
        STONE => ['サマーズ・エンドの石', '夏之终焉之石'],
        TOWER => ['サマーズ・エンド - 鐘楼', '夏之终焉 - 钟楼'],
        CHANTRY => ['サマーズ・エンド - 礼拝堂', '夏之终焉 - 礼拜堂']
      }.fetch(entity)
      raise "compound label evidence differs #{key.inspect}" unless
        english == en && japanese == ja_label && chinese == zh_label
      raise "compound Korean label differs #{key.inspect}" unless
        [NAMES.fetch(entity).fetch(3), canonical].include?(old)
      new_text = canonical
    else
      from = if entity == INN
               '고어하트(Gorhart) 여관'
             elsif key == ['default', '64294', '']
               '여름의 끝을'
             elsif old.include?('여름의 끝')
               '여름의 끝'
             else
               '서머스 엔드'
             end
      target = key == ['default', '64294', ''] ? "#{canonical}를" : canonical
      # Accept a canonical span first, so a second pass cannot double-annotate it.
      span = Regexp.union(target, from)
      matches = old.to_enum(:scan, span).map { Regexp.last_match }
      raise "Summer/Inn Korean span differs #{key.inspect}" unless
        matches.length == 1 && old[matches.first.end(0)] != '('
      new_text = old.sub(span, target)
      raise 'invalid poem particle' if key == ['default', '64294', ''] && new_text.include?("#{canonical}을")
    end
    status = old == new_text ? 'not-an-issue' : 'accepted'
    dispositions = entities.to_h { |name| [name, name == entity ? status : 'excluded'] }
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => entities.sort.join('|'), 'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => "#{NOTES.fetch(entity)} #{COMMON}",
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(dispositions)
    }
  end

  def preflight!(reviews, inventory)
    reviews.each do |row|
      raise "stale Summer/Inn Korean #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('old')
    end
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row.fetch('resource') }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
  end

  def occurrence_snapshot
    M.table(M::INDEX).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.to_h.reject { |field, _| field == 'korean_current' }]
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared Summer/Inn outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    defs = definitions(glossary.headers)
    inventory = load_inventory
    generated = build_occurrences(inventory.values, defs).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    validate_scope!(generated)
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      review_source(inventory.fetch(key), occurrences.map { |row| row.fetch('entity_key') })
    end
    raise 'Summer/Inn edit counts differ' unless reviews.count { |row| row['old'] != row['new'] } == 17
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    preflight!(reviews, inventory)
    puts "D-#{D}: 22 keys; 25 entity matches; 17 edits; 5 unchanged; 3 nested exclusions; prepare only, no writes."
    [glossary.headers, defs, reviews]
  end

  def apply
    headers, defs, reviews = prepare
    previous = occurrence_snapshot
    previous_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    inventory = load_inventory
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    preflight!(reviews, inventory)
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    M.write_table(DEFINITIONS, headers, defs)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = occurrence_snapshot
    previous.each { |key, value| raise "prior occurrence changed #{key.inspect}" unless current[key] == value }
    raise 'Summer/Inn occurrence additions differ' unless (current.keys - previous.keys).sort == expected_pairs.sort
    raise 'prior glossary or new definitions changed' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == previous_glossary + defs
    active = load_inventory
    reviews.each do |row|
      raise "Summer/Inn postflight differs #{M.key(row).inspect}" unless
        active.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then SummersEndGorhartInnD21518.prepare
  when ['apply'] then SummersEndGorhartInnD21518.apply
  else abort 'usage: review-summers-end-gorhart-inn-D21518.rb [prepare|apply]'
  end
end
