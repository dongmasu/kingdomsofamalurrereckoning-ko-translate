#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ChaosMaterialsD21521
  extend self

  M = ReviewedNameBatches
  D = 21_521

  MATTER = 'resource:chaos-matter'
  DELIVERY = 'title:chaos-matter-delivery'
  FLAME = 'resource:chaos-flame'
  CORE = 'resource:chaos-core'
  WEAPON_CORE = 'resource:chaos-weapon-core'
  FLAME_ITEMS = {
    'item:chaos-flame-disc' => {
      en: 'Chaos Flame Disc', ko: '혼돈의 화염 원반(Chaos Flame Disc)',
      ja: '混沌のフレイムディスク', zh: '混乱烈焰战轮',
      old: '혼돈의 화염 원반'
    },
    'item:chaos-flame-rod' => {
      en: 'Chaos Flame Rod', ko: '혼돈의 화염 막대(Chaos Flame Rod)',
      ja: '混沌のフレイムロッド', zh: '混乱烈焰法杖',
      old: '혼돈의 화염 막대'
    },
    'item:chaos-flame-dowel' => {
      en: 'Chaos Flame Dowel', ko: '혼돈의 화염 다월(Chaos Flame Dowel)',
      ja: '混沌のフレイムダウエル', zh: '混乱烈焰权杖',
      old: '혼돈의 화염 막대'
    }
  }.freeze

  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  MATTER_IDS = %w[
    3138 11414 13857 15427 21383 22424 27503 40641 41708 42705
    50437 57186 63443
  ].freeze
  FLAME_AFFIX_IDS = %w[280].freeze
  FLAME_BASE_IDS = %w[2538 559 1036 1276].freeze
  FLAME_DEFAULT_IDS = %w[20211 21337 43683 46427 49092 56572].freeze
  CORE_IDS = %w[9945 12596 51825 56572].freeze
  WEAPON_CORE_IDS = %w[2295 3138 13857 22424 26266 31656 55085 63443].freeze

  ENGLISH_PATTERNS = {
    MATTER => /Chaos Matter(?![A-Za-z])/i,
    DELIVERY => /Chaos Matter Delivery(?![A-Za-z])/i,
    FLAME => /Chaos Flames?(?![A-Za-z])/i,
    CORE => /Chaos cores?\b/i,
    WEAPON_CORE => /Chaos Weapon Core(?:s| Component(?:s)?)?\b/i
  }.merge(FLAME_ITEMS.to_h do |entity, item|
    [entity, /#{Regexp.escape(item.fetch(:en))}(?![A-Za-z])/i]
  end).freeze
  CORE_MENTION_COUNTS = {
    '9945' => 3, '12596' => 1, '51825' => 1, '56572' => 1
  }.freeze

  SUPPORT = {
    [MATTER, 'base', '4653', '11'] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '3138', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '11414', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '13857', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '15427', ''] => ['混沌の物質の配達', '混乱物质货物'],
    [MATTER, 'default', '21383', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '22424', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '27503', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '40641', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '41708', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '42705', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '50437', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '57186', ''] => ['混沌の物質', '混乱物质'],
    [MATTER, 'default', '63443', ''] => ['混沌の物質', 'Chaos Matter'],
    [DELIVERY, 'default', '15427', ''] => ['混沌の物質の配達', '混乱物质货物'],
    [FLAME, 'affix', '280', '11'] => ['混沌の炎', '混乱烈焰'],
    [FLAME, 'base', '2538', '11'] => ['混沌の炎', '混乱烈焰'],
    [FLAME, 'base', '559', '11'] => ['混沌のフレイムディスク', '混乱烈焰战轮'],
    [FLAME, 'base', '1036', '11'] => ['混沌のフレイムロッド', '混乱烈焰法杖'],
    [FLAME, 'base', '1276', '11'] => ['混沌のフレイムダウエル', '混乱烈焰权杖'],
    ['item:chaos-flame-disc', 'base', '559', '11'] => ['混沌のフレイムディスク', '混乱烈焰战轮'],
    ['item:chaos-flame-rod', 'base', '1036', '11'] => ['混沌のフレイムロッド', '混乱烈焰法杖'],
    ['item:chaos-flame-dowel', 'base', '1276', '11'] => ['混沌のフレイムダウエル', '混乱烈焰权杖'],
    [FLAME, 'default', '20211', ''] => ['混沌の炎', '混乱烈焰'],
    [FLAME, 'default', '21337', ''] => ['混沌の炎', '混乱烈焰'],
    [FLAME, 'default', '43683', ''] => ['混沌の炎', '混乱烈焰'],
    [FLAME, 'default', '46427', ''] => ['混沌の炎', '混乱烈焰'],
    [FLAME, 'default', '49092', ''] => ['混沌の炎', '混乱烈焰'],
    [FLAME, 'default', '56572', ''] => ['混沌の炎', '混乱烈焰'],
    [CORE, 'default', '9945', ''] => ['混沌の核', '混乱核心'],
    [CORE, 'default', '12596', ''] => ['混沌の核', '混乱核心'],
    [CORE, 'default', '51825', ''] => ['混沌の核', 'Chaos core'],
    [CORE, 'default', '56572', ''] => ['混沌の核', '混乱核心'],
    [WEAPON_CORE, 'default', '2295', ''] => ['混沌の武器の核', '混乱武器核心'],
    [WEAPON_CORE, 'default', '3138', ''] => ['混沌の武器の主要部品', '混乱武器核心组件'],
    [WEAPON_CORE, 'default', '13857', ''] => ['混沌の武器の主要部品', '混乱武器核心组件'],
    [WEAPON_CORE, 'default', '22424', ''] => ['混沌の武器の核', '混乱武器的核心'],
    [WEAPON_CORE, 'default', '26266', ''] => ['混沌の武器の核', '混乱武器核心'],
    [WEAPON_CORE, 'default', '31656', ''] => ['混沌の武器の核', '混乱武器核心'],
    [WEAPON_CORE, 'default', '55085', ''] => ['混沌の武器の核となる部品', '混乱武器核心组件'],
    [WEAPON_CORE, 'default', '63443', ''] => ['混沌の武器の核', 'Chaos weapon cores']
  }.freeze

  NAME_DATA = {
    MATTER => {
      en: 'Chaos Matter', ko: '혼돈 물질(Chaos Matter)', category: 'resource',
      variants: '혼돈 물질|혼돈의 물질',
      aliases: '',
      evidence: 'base:4653:11|default:11414|default:27503|default:57186|default:63443',
      note: 'The complete resource name Chaos Matter is explicit in all 14 aligned source keys. Japanese 混沌の物質 and Chinese 混乱物质 corroborate, including the opaque Chaos Matter marker at default:63443. Reuse 혼돈 물질(Chaos Matter); preserve grammatical particles after the paired noun.'
    },
    DELIVERY => {
      en: 'Chaos Matter Delivery', ko: '혼돈 물질 배달(Chaos Matter Delivery)',
      category: 'title', variants: '혼돈 물질 배달', aliases: '',
      evidence: 'default:15427',
      note: 'Default:15427 is the complete title Chaos Matter Delivery, with Japanese 混沌の物質の配達 and Chinese 混乱物质货物. The source does not establish that this is a quest, so classify it neutrally as a title. Keep it atomic: exclude the nested Chaos Matter component on this same row and add no generic Delivery alias.'
    },
    FLAME => {
      en: 'Chaos Flame', ko: '혼돈의 불꽃(Chaos Flame)', category: 'resource',
      variants: '혼돈의 불꽃|혼돈 불꽃',
      aliases: 'Chaos Flames',
      evidence: 'affix:280:11|base:2538:11|default:20211|default:43683|default:56572',
      note: 'Chaos Flame is the named forge reagent/material; default:43683 uses the grammatical plural Chaos Flames. Japanese 混沌の炎 and Chinese 混乱烈焰 corroborate. Reuse 혼돈의 불꽃, preserving plural English in annotations. The three complete base item titles are atomic separate entries; exclude the component-only Flame match on those rows.'
    },
    CORE => {
      en: 'Chaos Core', ko: '혼돈 핵(Chaos Core)', category: 'resource',
      variants: '혼돈 핵|혼돈의 핵',
      aliases: 'Chaos cores',
      evidence: 'default:9945|default:12596|default:51825|default:56572',
      note: 'English describes Chaos Cores as the forgeable/salvaged cores of Chaos weapons; default:9945 contains three references. Japanese 混沌の核 and Chinese 混乱核心 corroborate, while default:51825 retains the source term inside an opaque English token. Use 혼돈 핵(Chaos Core), retaining source singular/plural in each parenthetical label.'
    },
    WEAPON_CORE => {
      en: 'Chaos Weapon Core', ko: '혼돈 무기 핵(Chaos Weapon Core)',
      category: 'resource', variants: '혼돈 무기 핵|혼돈 무기의 핵',
      aliases: 'Chaos Weapon Cores|Chaos Weapon Core Component|Chaos Weapon Core Components',
      evidence: 'default:2295|default:22424|default:26266|default:31656|default:63443',
      note: 'The complete compound Chaos Weapon Core is distinct from independent Chaos Core references. Japanese 混沌の武器の核 and Chinese 混乱武器核心 corroborate. At default:3138/13857/55085, source wording explicitly says core component(s); retain the full Korean component phrase and pair it atomically as Chaos Weapon Core Component(s), not as a nested Chaos Core. Preserve opaque labels at default:63443.'
    }
  }.freeze

  COMMON = 'English is the primary identity and meaning evidence; every aligned Japanese and Chinese source was checked. Change only the scoped Korean labels, preserve particles, quantities, markup, opaque markers, and line breaks, and keep distinct named entities atomic. Prior entity/row dispositions remain untouched and are not recounted. No PAK or derived resources are consulted.'
  DETAIL = <<~TEXT.chomp
    ### D-21521: Chaos Materials And Cores

    Reviewed 32 distinct source row keys, with 41 entity/key matches across
    Chaos Matter, the neutral title Chaos Matter Delivery, Chaos Flame, three
    complete Flame base-item titles, independent Chaos Core, and Chaos Weapon
    Core. Exact scopes: Matter 14, Flame 11 (including three atomic item
    titles), Core 4, Weapon Core 8, plus the same-row Delivery title and three
    separate item-title entity matches. Row-key overlaps are intentional:
    Matter/Weapon Core at default:3138, 13857, 22424 and 63443; Flame/Core at
    default:56572; Delivery/Matter at default:15427; and Flame/item titles at
    base:559, 1036 and 1276. Overlapping labels are represented in one review
    row with per-entity dispositions; no nested annotations are produced.

    Keep `{*1...}` tokens byte-identical and place English annotations after
    them. Chaos Flame Disc, Rod, and Dowel remain distinct; Dowel is rendered
    as 다월, not collapsed into Rod/막대. Chaos Matter Delivery is a neutral
    title, not presumed to be a quest. Core component descriptions remain
    complete atomic phrases. No prior Chaos Essence, Chaos Node, Skald, or
    unrelated row decision is reopened or recounted.
  TEXT

  def expected_pairs
    matter = [[MATTER, 'base', '4653', '11']] +
      MATTER_IDS.map { |id| [MATTER, 'default', id, ''] }
    flame = FLAME_AFFIX_IDS.map { |id| [FLAME, 'affix', id, '11'] } +
      FLAME_BASE_IDS.map { |id| [FLAME, 'base', id, '11'] } +
      FLAME_DEFAULT_IDS.map { |id| [FLAME, 'default', id, ''] }
    items = FLAME_ITEMS.map do |entity, item|
      id = { 'item:chaos-flame-disc' => '559',
             'item:chaos-flame-rod' => '1036',
             'item:chaos-flame-dowel' => '1276' }.fetch(entity)
      [entity, 'base', id, '11']
    end
    matter + [[DELIVERY, 'default', '15427', '']] + flame + items +
      CORE_IDS.map { |id| [CORE, 'default', id, ''] } +
      WEAPON_CORE_IDS.map { |id| [WEAPON_CORE, 'default', id, ''] }
  end

  def definitions(headers)
    names = {
      MATTER => NAME_DATA.fetch(MATTER),
      DELIVERY => NAME_DATA.fetch(DELIVERY),
      FLAME => NAME_DATA.fetch(FLAME)
    }.merge(
      FLAME_ITEMS.transform_values do |item|
        {
          en: item.fetch(:en), ko: item.fetch(:ko), category: 'item',
          variants: item.fetch(:old), aliases: '',
          evidence: "base:#{item.fetch(:en).split.last == 'Disc' ? '559' : item.fetch(:en).split.last == 'Rod' ? '1036' : '1276'}:11",
          note: 'This is a complete named base-item title, not a nested Chaos Flame label. Japanese and Chinese preserve the distinct Disc/Rod/Dowel item types. Keep all three atomic; Dowel is transliterated as 다월 because the aligned sources distinguish it from the Rod, while Korean currently collapses both to 막대.'
        }
      end,
    ).merge(CORE => NAME_DATA.fetch(CORE), WEAPON_CORE => NAME_DATA.fetch(WEAPON_CORE))
    names.map do |entity, name|
      fields = {
        'entity_key' => entity, 'english_canonical' => name.fetch(:en),
        'category' => name.fetch(:category), 'korean_canonical' => name.fetch(:ko),
        'english_aliases' => name.fetch(:aliases),
        'korean_variants' => name.fetch(:variants),
        'evidence_ids' => "D-#{D}|#{name.fetch(:evidence)}",
        'status' => 'confirmed',
        'notes' => "#{name.fetch(:note)} #{COMMON}"
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
    raise 'incomplete aligned inventory' unless rows.length == 73_430
    raise 'duplicate aligned inventory key' unless rows.map { |row| M.key(row) }.uniq.length == rows.length

    rows.to_h { |row| [M.key(row), row] }
  end

  def validate_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Chaos materials exact source scope differs' unless actual.sort == expected_pairs.sort
    raise 'Chaos materials row overlap count differs' unless
      generated.map { |row| M.key(row) }.uniq.length == 32
  end

  def validate_source_evidence!(source, entity)
    key = M.key(source)
    pattern = ENGLISH_PATTERNS.fetch(entity)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    expected = entity == CORE ? CORE_MENTION_COUNTS.fetch(key.fetch(1)) : 1
    raise "English name count differs for #{entity} #{key.inspect}" unless
      english.scan(pattern).length == expected

    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    ja_term, zh_term = SUPPORT.fetch([entity, *key])
    raise "Japanese support differs for #{entity} #{key.inspect}" unless japanese.include?(ja_term)
    raise "Chinese support differs for #{entity} #{key.inspect}" unless chinese.include?(zh_term)
  end

  def replace_one(text, pattern, target, key, count: 1)
    hits = text.scan(pattern).length
    target_hits = text.scan(Regexp.new(Regexp.escape(target))).length
    return text if hits.zero? && target_hits == count
    raise "Korean source span differs #{key.inspect}" unless hits == count

    text.gsub(pattern, target)
  end

  def annotate_marker(text, marker, english, key)
    paired = "#{marker}(#{english})"
    return text if text.scan(Regexp.new(Regexp.escape(paired))).length == 1
    raise "opaque marker differs #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(marker))).length == 1 &&
      !text.include?("#{marker}(")

    text.sub(marker, paired)
  end

  def normalize_core_passage(text, key)
    labels = [
      '혼돈 핵(Chaos cores)',
      '혼돈 핵(Chaos Core)',
      '혼돈 핵(Chaos Core)'
    ]
    pattern = /혼돈(?:의)? 핵(?:\(Chaos cores?\))?/i
    matches = text.scan(pattern).length
    target_counts = labels.group_by(&:itself).transform_values(&:length)
    already_normalized = target_counts.all? do |label, count|
      text.scan(Regexp.new(Regexp.escape(label))).length == count
    end
    return text if already_normalized
    raise 'Chaos Core passage span count differs' unless matches == labels.length

    index = 0
    text.gsub(pattern) do
      label = labels.fetch(index)
      index += 1
      label
    end
  end

  def normalize(text, key, entities)
    result = text.dup

    if entities.include?(DELIVERY)
      raise 'Delivery title key differs' unless key == ['default', '15427', '']
      result = replace_one(
        result, /혼돈 물질 배달(?:\(Chaos Matter Delivery\))?/,
        '혼돈 물질 배달(Chaos Matter Delivery)', key
      )
    end

    if entities.include?(MATTER) && key != ['default', '15427', '']
      if key == ['default', '63443', '']
        marker = '{*1혼돈 물질}'
        result = annotate_marker(result, marker, 'Chaos Matter', key)
      else
        result = replace_one(
          result, /혼돈(?:의)? 물질(?:\(Chaos Matter\))?/,
          NAME_DATA.fetch(MATTER).fetch(:ko), key
        )
      end
    end

    item_entity = entities.find { |entity| FLAME_ITEMS.key?(entity) }
    if item_entity
      item = FLAME_ITEMS.fetch(item_entity)
      result = replace_one(
        result,
        /#{Regexp.escape(item.fetch(:old))}(?:\(#{Regexp.escape(item.fetch(:en))}\))?/,
        item.fetch(:ko), key
      )
    elsif entities.include?(FLAME) && !FLAME_ITEMS.keys.any? { |entity| expected_pairs.include?([entity, *key]) }
      if key == ['default', '56572', '']
        marker = '{*1혼돈의 불꽃}'
        result = annotate_marker(result, marker, 'Chaos Flame', key)
      elsif key == ['default', '49092', '']
        result = replace_one(
          result, /혼돈 불꽃(?:\(Chaos Flame\))?/, '혼돈 불꽃(Chaos Flame)', key
        )
      else
        label = key == ['default', '43683', ''] ?
          '혼돈의 불꽃(Chaos Flames)' : NAME_DATA.fetch(FLAME).fetch(:ko)
        result = replace_one(
          result, /혼돈(?:의)? 불꽃(?:\(Chaos Flames?\))?/, label, key
        )
      end
    end

    if entities.include?(CORE)
      if key == ['default', '51825', ''] || key == ['default', '56572', '']
        marker = key.fetch(1) == '51825' ? '{*1혼돈의 핵}' : '{*1혼돈 핵}'
        english = key.fetch(1) == '51825' ? 'Chaos core' : 'Chaos cores'
        result = annotate_marker(result, marker, english, key)
      elsif key == ['default', '9945', '']
        result = normalize_core_passage(result, key)
      else
        label = '혼돈 핵(Chaos cores)'
        result = replace_one(
          result, /혼돈(?:의)? 핵(?:\(Chaos cores?\))?/i, label, key
        )
      end
    end

    if entities.include?(WEAPON_CORE)
      component_labels = {
        '3138' => ['혼돈 무기의 핵심 부품', '혼돈 무기의 핵심 부품(Chaos Weapon Core Component)'],
        '13857' => ['혼돈 무기의 새 핵심 부품', '혼돈 무기의 새 핵심 부품(Chaos Weapon Core Components)'],
        '55085' => ['혼돈 무기의 핵심 부품', '혼돈 무기의 핵심 부품(Chaos Weapon Core Components)']
      }
      if component_labels.key?(key.fetch(1))
        old, target = component_labels.fetch(key.fetch(1))
        result = replace_one(
          result, /#{Regexp.escape(old)}(?:\(Chaos Weapon Core Components?\))?/, target, key
        )
      elsif key == ['default', '63443', '']
        marker = '{*1혼돈 무기 핵}'
        result = annotate_marker(result, marker, 'Chaos Weapon Cores', key)
      else
        label = key == ['default', '31656', ''] ?
          '혼돈 무기 핵(Chaos Weapon Cores)' :
          NAME_DATA.fetch(WEAPON_CORE).fetch(:ko)
        result = replace_one(
          result, /혼돈 무기(?:의)? 핵(?:\(Chaos Weapon Cores?\))?/, label, key
        )
      end
    end

    raise 'Chaos materials changed opaque tokens or line breaks' unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        result.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      text.scan(/\r\n|\r|\n/) == result.scan(/\r\n|\r|\n/)
    raise 'Chaos materials created nested annotations' if result.match?(/\([^)]*\(/)
    result
  end

  def review_source(source, entities)
    key = M.key(source)
    entities.each { |entity| validate_source_evidence!(source, entity) }
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    old = source.fetch('work_text')
    new_text = normalize(old, key, entities)
    dispositions = entities.to_h do |entity|
      excluded = (entity == MATTER && key == ['default', '15427', '']) ||
        (entity == FLAME && FLAME_ITEMS.keys.any? { |item| expected_pairs.include?([item, *key]) })
      status = if excluded
                 'excluded'
               else
                 old == new_text ? 'not-an-issue' : 'accepted'
               end
      [entity, status]
    end
    status = if old != new_text
               'accepted'
             elsif dispositions.values.all? { |value| value == 'excluded' }
               'excluded'
             else
               'not-an-issue'
             end
    {
      'resource' => key.fetch(0), 'ID_Linha' => key.fetch(1),
      'Tipo_Variante' => key.fetch(2), 'entity_key' => entities.sort.join('|'),
      'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => COMMON,
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(dispositions)
    }
  end

  def expected_labels(key)
    labels = []
    labels << 'Chaos Matter' if expected_pairs.include?([MATTER, *key]) &&
      key != ['default', '15427', '']
    labels << 'Chaos Matter Delivery' if expected_pairs.include?([DELIVERY, *key])
    if FLAME_ITEMS.any? { |entity, _| expected_pairs.include?([entity, *key]) }
      item = FLAME_ITEMS.find { |entity, _| expected_pairs.include?([entity, *key]) }.last
      labels << item.fetch(:en)
    elsif expected_pairs.include?([FLAME, *key])
      labels << (key == ['default', '43683', ''] ? 'Chaos Flames' : 'Chaos Flame')
    end
    if expected_pairs.include?([CORE, *key])
      labels.concat(key.fetch(1) == '9945' ?
        ['Chaos cores', 'Chaos Core', 'Chaos Core'] :
        [key.fetch(1) == '51825' ? 'Chaos core' :
         key.fetch(1) == '56572' || key.fetch(1) == '12596' ? 'Chaos cores' : 'Chaos Core'])
    end
    if expected_pairs.include?([WEAPON_CORE, *key])
      weapon_label = case key.fetch(1)
                     when '3138' then 'Chaos Weapon Core Component'
                     when '13857', '55085' then 'Chaos Weapon Core Components'
                     when '31656', '63443' then 'Chaos Weapon Cores'
                     else 'Chaos Weapon Core'
                     end
      labels << weapon_label
    end
    labels
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    defs = definitions(glossary.headers)
    inventory = load_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    validate_scope!(generated)
    by_key = generated.group_by { |row| M.key(row) }
    reviews = by_key.sort_by do |key, _|
      [M::RESOURCES.index(key.fetch(0)), key.fetch(1).to_i, key.fetch(2)]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      review_source(source, occurrences.map { |row| row.fetch('entity_key') }.uniq)
    end
    raise 'D21521 review key count differs' unless reviews.length == 32
    raise 'D21521 changed-cell count differs' unless
      reviews.count { |row| row.fetch('old') != row.fetch('new') } == 31 &&
      reviews.select { |row| row.fetch('old') == row.fetch('new') }.map { |row| M.key(row) } ==
        [['default', '27503', '']]
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    preflight!(reviews, inventory)
    puts "D-#{D}: 32 distinct row keys; 41 entity/key matches; Matter 14, " \
         'Flame 11, Core 4, Weapon Core 8; prepare mode, no writes.'
    [glossary.headers, defs, reviews]
  end

  def preflight!(reviews, inventory)
    reviews.each do |row|
      raise "active source text differs #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('old')
    end
    reviews.select { |row| row.fetch('old') != row.fetch('new') }.group_by do |row|
      row.fetch('resource')
    end.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
  end

  def apply
    headers, defs, reviews = prepare
    previous_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    previous_index = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    marker = '<!-- current-proper-name-batch:end -->'
    M::DOCS.each do |path|
      raise "missing or duplicate checkpoint #{path}" unless File.read(path).scan(marker).length == 1
    end
    M.write_table(DEFINITIONS, headers, defs)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current_index = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    previous_index.each do |key, value|
      raise "prior occurrence changed #{key.inspect}" unless current_index[key] == value
    end
    expected = expected_pairs.map { |entity, *key| [entity, *key] }.sort
    raise 'D21521 occurrence additions differ' unless
      (current_index.keys - previous_index.keys).sort == expected
    raise 'prior glossary or new definitions changed' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == previous_glossary + defs

    M::DOCS.each do |path|
      text = File.read(path)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      raise "missing batch report #{path}" unless File.file?(path)
      File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'], ['--prepare'] then ChaosMaterialsD21521.prepare
  when ['apply'], ['--apply'] then ChaosMaterialsD21521.apply
  else abort 'usage: review-chaos-materials-D21521.rb [prepare|--prepare|apply|--apply]'
  end
end
