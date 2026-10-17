#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module LazPrimeCircleD21516
  extend self

  M = ReviewedNameBatches
  D = 21_516
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  LAZ_SOURCE_KEYS = (
    [%w[base 977 11], %w[base 3440 11]] +
    %w[
      180 3454 5017 9663 10066 11360 16944 17285 19210 22723 33506 34807
      35430 35667 35979 39038 40016 41862 44124 45901 46617 48407 48942
      51962 53314 55189 58648 60198 61903 62160 62424 63456 63766
    ].map { |id| ['default', id, ''] }
  ).map(&:freeze).freeze

  LAZ_CREATURE_KEYS = LAZ_SOURCE_KEYS
  LAZ_NESTED_EXCLUSIONS = (
    %w[180 35430 35667 41862 44124 45901 46617 55189 60198 62160 51962 10066]
      .map { |id| ['default', id, ''] } +
    [%w[base 977 11], %w[base 3440 11]]
  ).freeze
  LAZ_JA_OMISSION_KEYS = [['default', '48407', '']].freeze
  SONS_KEYS = %w[
    180 35430 35667 35979 41862 44124 45901 46617 55189 60198 62160 62424
  ].map { |id| ['default', id, ''] }.freeze
  REMAINS_KEYS = [
    %w[base 977 11], %w[base 3440 11], ['default', '51962', '']
  ].freeze
  KISS_KEYS = [['default', '10066', '']].freeze
  PRIME_CIRCLE_KEYS = %w[31593 55159].map { |id| ['default', id, ''] }.freeze

  ENTITY_KEYS = {
    'creature:laz' => LAZ_CREATURE_KEYS,
    'creature:sons-of-laz' => SONS_KEYS,
    'item:laz-remains' => REMAINS_KEYS,
    'title:lazs-kiss' => KISS_KEYS,
    'organization:prime-circle' => PRIME_CIRCLE_KEYS
  }.freeze
  POEM_EXCLUSIONS = [['default', '35979', ''], ['default', '63456', '']].freeze
  UNCERTAIN = {
    'creature:sons-of-laz' => [['default', '35979', '']]
  }.freeze

  LAZ_SPANS = {
    ['default', '3454', ''] => ['라즈(Laz)', '라즈(Laz)'],
    ['default', '5017', ''] => ['라즈', '라즈(Laz)'],
    ['default', '9663', ''] => ['라즈', '라즈(Laz)'],
    ['default', '11360', ''] => ['라즈', '라즈(Laz)'],
    ['default', '16944', ''] => ['라즈', '라즈(Laz)'],
    ['default', '17285', ''] => ['라즈', '라즈(Laz)'],
    ['default', '19210', ''] => ['라즈(Laz)', '라즈(Laz)'],
    ['default', '22723', ''] => ['레이즈(Laz)', '라즈(Laz)'],
    ['default', '33506', ''] => ['라즈', '라즈(Laz)'],
    ['default', '34807', ''] => ['라즈', '라즈(Laz)'],
    ['default', '39038', ''] => ['라즈', '라즈(Laz)'],
    ['default', '40016', ''] => ['라즈', '라즈(Laz)'],
    ['default', '48407', ''] => ['라즈들', '라즈(Laz)들'],
    ['default', '48942', ''] => ['라즈', '라즈(Laz)'],
    ['default', '53314', ''] => ['라즈(Laz)', '라즈(Laz)'],
    ['default', '58648', ''] => ['라즈들', '라즈(Laz)들'],
    ['default', '61903', ''] => ['라즈(Laz)', '라즈(Laz)'],
    ['default', '62424', ''] => ['라즈가', '라즈(Laz)가'],
    ['default', '63766', ''] => ['라즈(Laz)', '라즈(Laz)']
  }.freeze

  SONS_SPANS = {
    ['default', '180', ''] => ['라즈의 자손(Sons of Laz)', '라즈의 자손(Sons of Laz)'],
    ['default', '35430', ''] => ['라즈의 아들들', '라즈의 자손(Sons of Laz)'],
    ['default', '35667', ''] => ['라즈의 아들들', '라즈의 자손(Sons of Laz)'],
    ['default', '35979', ''] => ['라즈(Laz)의 아들들', '라즈(Laz)의 아들들'],
    ['default', '41862', ''] => ['라즈의 아들들', '라즈의 자손(Sons of Laz)'],
    ['default', '44124', ''] => ['라즈의 자손', '라즈의 자손(Sons of Laz)'],
    ['default', '45901', ''] => ['라즈의 아들들', '라즈의 자손(Sons of Laz)'],
    ['default', '46617', ''] => ['라즈의 아들들', '라즈의 자손(Sons of Laz)'],
    ['default', '55189', ''] => ['라즈의 아들들(Sons of Laz)', '라즈의 자손(Sons of Laz)'],
    ['default', '60198', ''] => ['라즈의 자손(Sons of Laz)', '라즈의 자손(Sons of Laz)'],
    ['default', '62160', ''] => ['라즈의 아들', '라즈의 자손(Son of Laz)'],
    ['default', '62424', ''] => ['라즈의 아들들(Sons of Laz)', '라즈의 자손(Sons of Laz)']
  }.freeze
  REMAINS_SPAN = ['라즈(Laz)의 유해', '라즈의 유해(Laz Remains)'].freeze
  KISS_SPAN = ['라즈의 입맞춤', "라즈의 입맞춤(Laz's Kiss)"].freeze
  PRIME_SPANS = {
    ['default', '31593', ''] => ['프라임 서클', '프라임 서클(Prime Circle)'],
    ['default', '55159', ''] => ['프라임 서클(Prime Circle)', '프라임 서클(Prime Circle)']
  }.freeze

  LAZ_PATTERN = /(?<![A-Za-z])Laz(?![A-Za-z])/i
  SONS_PATTERN = /(?<![A-Za-z])(?:Sons|Son) of Laz(?![A-Za-z])/i
  NOTES = {
    'creature:laz' => 'English uses Laz for the half-dead enemy group; Japanese ラズ and Chinese 拉兹 corroborate. Reuse 라즈(Laz) only for bounded creature references. Keep the complete lexical matcher coverage and record nested-only parent matches as excluded with no text change; do not treat the Laz/Raz brothers in the poem as this creature.',
    'creature:sons-of-laz' => 'English names Sons of Laz as the half-dead ex-soldier creature group; Japanese ラズ・ソルジャー and Chinese 拉兹之子 corroborate. Register the plural canonical 라즈의 자손(Sons of Laz) and the single source-attested Son of Laz alias only. The old-rhyme occurrence at default:35979 remains uncertain and unchanged.',
    'item:laz-remains' => 'The three complete Laz Remains labels are source-local item names; Japanese ラズの亡骸 and Chinese 拉兹残骸/拉兹遗骸 corroborate. Pair the complete label atomically as 라즈의 유해(Laz Remains), without nesting a separate Laz annotation or inferring an owner.',
    'title:lazs-kiss' => "default:10066 is the complete standalone Laz's Kiss label; Japanese ラズのキス and Chinese 拉兹之吻 corroborate. Pair only this complete label as 라즈의 입맞춤(Laz's Kiss). The schema category title is neutral: identity and medium are unknown; there is no evidence here for a unique item, mechanics, bearer, function, or rarity. The historical D-2889 disposition is not rewritten or recounted.",
    'organization:prime-circle' => 'Fomorous Hugues identifies Prime Circle in default:31593/55159; Japanese プライム・サークル and Chinese 起始之环 corroborate the same organization. Reuse 프라임 서클(Prime Circle); this registration is not a faction claim and does not decide the Scholar of Vivification title syntax.'
  }.freeze
  COMMON_NOTE = 'English is primary; aligned Japanese and Chinese were checked for every exact key. Preserve unrelated names, grammar/particles, opaque tokens and line breaks. New entity-specific scope only: do not rewrite prior row rulings, terminal dispositions, or historical tallies. No PAK or PAK-derived evidence.'
  ROW_NOTES = {
    ['default', '180', ''] => 'D-19571 closed the Faer Gorta spelling only and accepted the existing Sons wording; retain that historical row decision.',
    ['default', '35430', ''] => 'D-19829 closed the objective wording; this is a separate exact-name scope, not a rejudgment of that row.',
    ['default', '35979', ''] => 'The Grumble Brothers poem uses Laz and Raz as named brothers and embeds Sons of Laz in the rhyme. Exclude Laz from the creature scope and retain the Sons identity as uncertain; change no poem text.',
    ['default', '45901', ''] => 'Preserve the existing narrative hold; this row only receives the bounded creature-name normalization.',
    ['default', '46617', ''] => 'Preserve the existing faction-identity hold; the creature-name registration does not classify a faction.',
    ['default', '55159', ''] => 'Preserve the existing title-hierarchy hold; register only the explicit Prime Circle organization name.',
    ['default', '62160', ''] => 'Preserve the existing narrative hold; this exact singular source label is covered by the source-attested Son of Laz alias.',
    ['default', '62424', ''] => 'The first clause independently names the Laz creature; the later Sons of Laz compound is a separate span. Review both, without blanket exclusion of the bare Laz.',
    ['default', '63456', ''] => 'Laz and Raz are the poem’s brothers, not the creature; exclude this row from creature normalization and preserve both existing name forms.',
    ['default', '10066', ''] => 'Record only the complete bilingual label; identity and medium remain unknown.'
  }.freeze
  EXPECTED_EDIT_KEYS = (
    %w[9663 11360 16944 17285 22723 33506 34807 39038 40016
       48407 48942 58648 62424
       35430 35667 41862 44124 45901 46617 55189 62160
       51962 10066 31593].map { |id| ['default', id, ''] } +
    [%w[base 977 11], %w[base 3440 11]]
  ).map(&:freeze).freeze

  def key(resource, id, variant = '')
    [resource, id, variant.to_s]
  end

  def all_source_keys
    (LAZ_SOURCE_KEYS + PRIME_CIRCLE_KEYS).uniq.sort
  end

  def expected_pairs
    ENTITY_KEYS.flat_map do |entity, keys|
      keys.map { |source_key| [entity, *source_key] }
    end
  end

  def definitions_for(headers)
    specs = [
      ['creature:laz', 'Laz', 'creature', '라즈(Laz)', '',
       '라즈|라즈(Laz)|레이즈(Laz)|라즈들|라즈(Laz)들'],
      ['creature:sons-of-laz', 'Sons of Laz', 'creature',
       '라즈의 자손(Sons of Laz)', 'Son of Laz',
       '라즈의 자손|라즈의 자손(Sons of Laz)|라즈의 아들들|라즈의 아들들(Sons of Laz)|라즈(Laz)의 아들들|라즈의 아들'],
      ['item:laz-remains', 'Laz Remains', 'item',
       '라즈의 유해(Laz Remains)', '', '라즈(Laz)의 유해|라즈의 유해(Laz Remains)'],
      ['title:lazs-kiss', "Laz's Kiss", 'title',
       "라즈의 입맞춤(Laz's Kiss)", '', "라즈의 입맞춤|라즈의 입맞춤(Laz's Kiss)"],
      ['organization:prime-circle', 'Prime Circle', 'organization',
       '프라임 서클(Prime Circle)', '', '프라임 서클|프라임 서클(Prime Circle)']
    ]
    specs.map do |entity, english, category, korean, aliases, variants|
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|" +
          ENTITY_KEYS.fetch(entity).map { |source_key| source_key.join(':') }.join('|'),
        'status' => 'confirmed',
        'notes' => "#{NOTES.fetch(entity)} #{COMMON_NOTE}"
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def active_inventory
    rows = RESOURCES.flat_map do |resource|
      sources = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *sources).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end
    raise 'incomplete aligned inventory' unless rows.length == 73_430

    keyed = rows.to_h { |row| [M.key(row), row] }
    raise 'duplicate aligned inventory key' unless keyed.length == rows.length
    keyed
  end

  def rows_for_entity(inventory, definition)
    build_occurrences(inventory, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def source_occurrences(inventory, definitions)
    definitions_by_entity = definitions.to_h { |row| [row.fetch('entity_key'), row] }
    laz_hits = rows_for_entity(inventory, definitions_by_entity.fetch('creature:laz'))
    raise 'bare Laz all-resource source coverage differs' unless
      laz_hits.map { |row| M.key(row) }.sort == LAZ_SOURCE_KEYS.sort

    generated = definitions.flat_map do |definition|
      entity = definition.fetch('entity_key')
      expected = ENTITY_KEYS.fetch(entity)
      hits = entity == 'creature:laz' ? laz_hits : rows_for_entity(inventory, definition)
      actual_keys = hits.map { |row| M.key(row) }
      raise "exact source scope differs for #{entity}" unless actual_keys.sort == expected.sort
      hits
    end
    validate_scope!(generated)
    generated.sort_by do |row|
      source_key = M.key(row)
      [M::RESOURCES.index(source_key[0]), source_key[1].to_i,
       source_key[2], row.fetch('entity_key')]
    end
  end

  def validate_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'D21516 entity/source scope differs' unless actual.sort == expected_pairs.sort
    raise 'D21516 distinct source-key count differs' unless
      generated.map { |row| M.key(row) }.uniq.sort == all_source_keys
    raise 'D21516 expected distinct source-key count is not 37' unless all_source_keys.length == 37
  end

  def evidence(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      source.fetch('zh_text')
    ]
  end

  def validate_language_support!(entity, source, english, japanese, chinese)
    source_key = M.key(source)
    case entity
    when 'creature:laz'
      raise "Laz English evidence missing #{source_key.inspect}" unless english.match?(LAZ_PATTERN)
      unless LAZ_NESTED_EXCLUSIONS.include?(source_key) ||
             LAZ_JA_OMISSION_KEYS.include?(source_key)
        raise "Laz Japanese evidence missing #{source_key.inspect}" unless japanese.include?('ラズ')
      end
      raise "Laz Chinese evidence missing #{source_key.inspect}" unless chinese.include?('拉兹')
    when 'creature:sons-of-laz'
      expected = source_key == key('default', '62160') ? 'Son of Laz' : 'Sons of Laz'
      raise "Sons English evidence differs #{source_key.inspect}" unless
        english.scan(Regexp.new("(?<![A-Za-z])#{Regexp.escape(expected)}(?![A-Za-z])", Regexp::IGNORECASE)).length == 1
      japanese_anchor = source_key == key('default', '35979') ? 'ラズの息子たち' : 'ラズ'
      raise "Sons Japanese evidence missing #{source_key.inspect}" unless japanese.include?(japanese_anchor)
      raise "Sons Chinese evidence missing #{source_key.inspect}" unless chinese.include?('拉兹')
    when 'item:laz-remains'
      raise "Laz Remains English evidence differs #{source_key.inspect}" unless english == 'Laz Remains'
      raise "Laz Remains Japanese evidence missing #{source_key.inspect}" unless japanese.include?('ラズの亡骸')
      raise "Laz Remains Chinese evidence missing #{source_key.inspect}" unless chinese.match?(/拉兹(?:残骸|遗骸)/)
    when 'title:lazs-kiss'
      raise "Laz's Kiss English evidence differs #{source_key.inspect}" unless english == "Laz's Kiss"
      raise "Laz's Kiss Japanese evidence missing #{source_key.inspect}" unless japanese.include?('ラズのキス')
      raise "Laz's Kiss Chinese evidence missing #{source_key.inspect}" unless chinese.include?('拉兹之吻')
    when 'organization:prime-circle'
      raise "Prime Circle English evidence differs #{source_key.inspect}" unless
        english.scan(/(?<![A-Za-z])Prime Circle(?![A-Za-z])/).length == 1
      raise "Prime Circle Japanese evidence missing #{source_key.inspect}" unless japanese.include?('プライム・サークル')
      raise "Prime Circle Chinese evidence missing #{source_key.inspect}" unless chinese.include?('起始之环')
    else
      raise "unreviewed D21516 entity #{entity.inspect}"
    end
  end

  def replace_once(text, old_span, new_span, source_key, entity)
    old_count = text.scan(Regexp.new(Regexp.escape(old_span))).length
    new_count = text.scan(Regexp.new(Regexp.escape(new_span))).length
    if old_span == new_span
      raise "canonical Korean span differs #{entity} #{source_key.inspect}" unless new_count == 1
      text
    elsif new_count == 1 && text.sub(new_span, '').scan(Regexp.new(Regexp.escape(old_span))).empty?
      text
    elsif old_count == 1 && new_count.zero?
      text.sub(old_span, new_span)
    else
      raise "Korean span count differs #{entity} #{source_key.inspect}: " \
            "#{old_span.inspect}=#{old_count}, #{new_span.inspect}=#{new_count}"
    end
  end

  def disposition_for(entity, source_key, old, proposed)
    return 'excluded' if entity == 'creature:laz' && POEM_EXCLUSIONS.include?(source_key)
    return 'excluded' if entity == 'creature:laz' && LAZ_NESTED_EXCLUSIONS.include?(source_key)
    return 'uncertain' if UNCERTAIN.fetch(entity, []).include?(source_key)
    old == proposed ? 'not-an-issue' : 'accepted'
  end

  def transform_entity(entity, source_key, text)
    case entity
    when 'creature:laz'
      return [text, 'excluded'] if POEM_EXCLUSIONS.include?(source_key) ||
                                   LAZ_NESTED_EXCLUSIONS.include?(source_key)
      span = LAZ_SPANS.fetch(source_key) do
        raise "missing scoped Laz Korean span #{source_key.inspect}"
      end
      proposed = replace_once(text, *span, source_key, entity)
    when 'creature:sons-of-laz'
      span = SONS_SPANS.fetch(source_key) do
        raise "missing scoped Sons Korean span #{source_key.inspect}"
      end
      proposed = replace_once(text, *span, source_key, entity)
    when 'item:laz-remains'
      proposed = replace_once(text, *REMAINS_SPAN, source_key, entity)
    when 'title:lazs-kiss'
      proposed = replace_once(text, *KISS_SPAN, source_key, entity)
    when 'organization:prime-circle'
      span = PRIME_SPANS.fetch(source_key) do
        raise "missing scoped Prime Circle Korean span #{source_key.inspect}"
      end
      proposed = replace_once(text, *span, source_key, entity)
    else
      raise "unreviewed D21516 entity #{entity.inspect}"
    end
    [proposed, disposition_for(entity, source_key, text, proposed)]
  end

  def aggregate_status(dispositions, old, proposed)
    return 'accepted' if old != proposed
    return 'uncertain' if dispositions.value?('uncertain')
    return 'excluded' if dispositions.values.all? { |status| status == 'excluded' }
    'not-an-issue'
  end

  def skeleton(text, source_key, entities)
    entities.reduce(text) do |result, entity|
      next result if entity == 'creature:laz' &&
                     (POEM_EXCLUSIONS.include?(source_key) ||
                      LAZ_NESTED_EXCLUSIONS.include?(source_key))
      spans = case entity
              when 'creature:laz' then LAZ_SPANS.fetch(source_key)
              when 'creature:sons-of-laz' then SONS_SPANS.fetch(source_key)
              when 'item:laz-remains' then REMAINS_SPAN
              when 'title:lazs-kiss' then KISS_SPAN
              when 'organization:prime-circle' then PRIME_SPANS.fetch(source_key)
              else raise "unreviewed skeleton entity #{entity.inspect}"
              end
      pattern = Regexp.union(spans.uniq.sort_by { |span| -span.length })
      raise "skeleton span count differs #{source_key.inspect}" unless result.scan(pattern).length == 1
      result.sub(pattern, "<#{entity}>")
    end
  end

  def reviews_for(inventory, generated)
    validate_scope!(generated)
    generated.group_by { |row| M.key(row) }.map do |source_key, occurrences|
      source = inventory.fetch(source_key)
      english, japanese, chinese = evidence(source)
      entities = occurrences.map { |row| row.fetch('entity_key') }.uniq.sort
      entities.each do |entity|
        validate_language_support!(entity, source, english, japanese, chinese)
      end

      old = source.fetch('work_text')
      proposed = old
      dispositions = {}
      entities.each do |entity|
        proposed, dispositions[entity] = transform_entity(entity, source_key, proposed)
      end
      raise "D21516 changed opaque tokens #{source_key.inspect}" unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
          proposed.scan(ReviewedProperNameDiscovery::OPAQUE)
      raise "D21516 changed line breaks #{source_key.inspect}" unless
        old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
      raise "D21516 changed text outside name spans #{source_key.inspect}" unless
        skeleton(old, source_key, entities) == skeleton(proposed, source_key, entities)
      status = aggregate_status(dispositions, old, proposed)
      row_notes = ROW_NOTES[source_key]
      notes = entities.map { |entity| NOTES.fetch(entity) }.uniq
      evidence_note = (notes + [row_notes, COMMON_NOTE]).compact.join(' ')
      {
        'resource' => source_key[0], 'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2], 'entity_key' => entities.join('|'),
        'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence_note, 'english' => english,
        'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h)
      }
    end.sort_by do |row|
      source_key = M.key(row)
      [M::RESOURCES.index(source_key[0]), source_key[1].to_i, source_key[2]]
    end
  end

  def expected_edit_keys
    EXPECTED_EDIT_KEYS
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, records|
      record_key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate prior occurrence #{record_key.inspect}" if records.key?(record_key)
      records[record_key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, rows, expected_additions = expected_pairs)
    after = prior_records(rows)
    before.each do |record_key, record|
      raise "prior occurrence changed #{record_key.inspect}" unless after[record_key] == record
    end
    additions = (after.keys - before.keys).sort
    raise 'unexpected D21516 occurrence additions' unless additions == expected_additions.sort
  end

  def verify_dispositions!(reviews, rows)
    actual = prior_records(rows)
    reviews.each do |review|
      dispositions = JSON.parse(review.fetch('entity_dispositions_json'))
      dispositions.each do |entity, status|
        record_key = [entity, *M.key(review)]
        record = actual.fetch(record_key) { raise "missing D21516 disposition #{record_key.inspect}" }
        raise "D21516 disposition changed #{record_key.inspect}" unless
          record.fetch('status') == status &&
          record.fetch('evidence') == "D-#{D}: #{review.fetch('evidence')}"
      end
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'D21516 prepared outputs already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    definitions = definitions_for(glossary.headers)
    inventory = active_inventory
    generated = source_occurrences(inventory.values, definitions)
    reviews = reviews_for(inventory, generated)
    raise 'D21516 distinct review rows differ' unless reviews.length == 37
    changed_keys = reviews.select { |row| row['old'] != row['new'] }.map { |row| M.key(row) }
    raise 'D21516 edited-cell scope differs' unless changed_keys.sort == expected_edit_keys.sort
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }.group_by do |row|
      row.fetch('resource')
    end.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end

    puts "Prepared D-#{D}: 37 distinct row keys; #{generated.length} entity keys; " \
         "#{changed_keys.length} changed cells; #{reviews.count { |row| row['status'] == 'not-an-issue' }} unchanged; " \
         "#{reviews.count { |row| row['status'] == 'uncertain' }} uncertain; " \
         "#{reviews.count { |row| row['status'] == 'excluded' }} excluded. One 50-row batch; prepare only."
    [glossary.headers, definitions, reviews, generated]
  end

  def apply
    headers, definitions, reviews, generated = prepare
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    glossary = M.table(glossary_path)
    index = M.table(M::INDEX)
    before = prior_records(index.map(&:to_h))
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    reviews.select { |row| row['old'] != row['new'] }.group_by do |row|
      row.fetch('resource')
    end.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end

    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    M.run(REVIEWS, D, 1)

    final_index = M.table(M::INDEX).map(&:to_h)
    verify_prior_records!(before, final_index)
    verify_dispositions!(reviews, final_index)
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary changed' unless
      final_glossary == glossary.map(&:to_h) + definitions
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-laz-prime-circle-D21516.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then LazPrimeCircleD21516.prepare
  when 'apply' then LazPrimeCircleD21516.apply
  else abort 'usage: review-laz-prime-circle-D21516.rb [prepare|apply]'
  end
end
