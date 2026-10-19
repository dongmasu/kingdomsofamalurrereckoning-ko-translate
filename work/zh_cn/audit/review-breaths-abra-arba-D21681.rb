#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module BreathsAbraArbaD21681
  extend self

  D = 21_681
  ABRA = 'item:breath-of-abra'
  ARBA = 'item:breath-of-arba'
  ABRA_TITLE = 'Breath of Abra'
  ARBA_TITLE = 'Breath of Arba'
  ABRA_CANONICAL = '아브라의 숨결(Breath of Abra)'
  ARBA_CANONICAL = '아르바의 숨결(Breath of Arba)'
  ABRA_KEYS = [
    ['base', '2579', '11'],
    ['default', '52465', '']
  ].freeze
  ARBA_KEYS = [
    ['base', '4016', '11'],
    *%w[2849 10455 17782 20287 21369 33403 36264 39363 60211].map do |id|
      ['default', id, '']
    end
  ].freeze
  KEYS = (ABRA_KEYS + ARBA_KEYS).freeze
  ENTITY_BY_KEY = ABRA_KEYS.to_h { |key| [key, ABRA] }
                           .merge(ARBA_KEYS.to_h { |key| [key, ARBA] })
                           .freeze
  OLD_SPANS = {
    ['base', '2579', '11'] => '아브라(Abra)의 숨결',
    ['default', '52465', ''] => ABRA_CANONICAL,
    ['base', '4016', '11'] => '아르바(Arba)의 숨결',
    ['default', '2849', ''] => '아르바(Arba)의 숨결(Breath of Arba)',
    ['default', '10455', ''] => '아르바의 숨결',
    ['default', '17782', ''] => '아르바(Arba)의 숨결',
    ['default', '20287', ''] => '아르바의 숨결',
    ['default', '21369', ''] => '아르바의 숨결',
    ['default', '33403', ''] => '아르바의 숨결',
    ['default', '36264', ''] => '아르바의 숨결',
    ['default', '39363', ''] => '아르바의 숨결',
    ['default', '60211', ''] => ARBA_CANONICAL
  }.freeze
  JA_EVIDENCE = {
    ['base', '2579', '11'] => 'アーバの息吹',
    ['default', '52465', ''] => 'アーバの息',
    ['base', '4016', '11'] => 'アーバの息吹',
    ['default', '2849', ''] => 'アーバの息吹',
    ['default', '10455', ''] => 'アーバの息吹',
    ['default', '17782', ''] => 'アーバの息吹',
    ['default', '20287', ''] => 'アーバの息吹',
    ['default', '21369', ''] => 'アーバの息吹',
    ['default', '33403', ''] => 'アーバの息吹',
    ['default', '36264', ''] => 'アーバの息吹',
    ['default', '39363', ''] => 'アーバの息吹',
    ['default', '60211', ''] => 'アーバの息吹'
  }.freeze
  ZH_EVIDENCE = {
    ['base', '2579', '11'] => '亚尔巴之息',
    ['default', '52465', ''] => '阿尔巴之息',
    ['base', '4016', '11'] => '阿尔巴之息',
    ['default', '2849', ''] => '阿尔巴之息',
    ['default', '10455', ''] => '阿尔巴之息',
    ['default', '17782', ''] => '阿尔巴之息',
    ['default', '20287', ''] => '阿尔巴之息',
    ['default', '21369', ''] => '阿尔巴之息',
    ['default', '33403', ''] => '阿尔巴之息',
    ['default', '36264', ''] => '阿尔巴之息',
    ['default', '39363', ''] => '阿尔巴之息',
    ['default', '60211', ''] => '阿尔巴之息'
  }.freeze
  ABRA_SPAN = /(?:아브라(?:\(Abra\))?의 숨결)(?:\(Breath of Abra\))?/
  ARBA_SPAN = /(?:아르바(?:\(Arba\))?의 숨결)(?:\(Breath of Arba\))?/
  ENGLISH_SPANS = {
    ABRA => /(?<![A-Za-z])Breath of Abra(?![A-Za-z])/,
    ARBA => /(?<![A-Za-z])Breath of Arba(?![A-Za-z])/
  }.freeze

  COMMON_NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Register Breath of Abra and Breath of Arba as two distinct named items.
    English supplies the two separate exact titles; Japanese アーバの息吹/
    アーバの息 and Chinese 亚尔巴之息/阿尔巴之息 corroborate the aligned
    item names. Reuse the Korean title roots already present in the source,
    using atomic pairs 아브라의 숨결(Breath of Abra) and
    아르바의 숨결(Breath of Arba). Do not merge the two items, create a
    person:abra owner, infer a person identity from Arba in either item name,
    or infer rarity or item mechanics. At default:33403, annotate only the
    Breath of Arba span; leave the separate Arba's staff wording and the
    relationship between the title and staff unresolved. Preserve all
    person:arba exclusions from D-20434 and the historical D-10815 and
    D-19809 records at default:33403, without reopening or rewriting them.
    D-6293's broader uncertainty at default:20287 and D-6610's sentence
    finding at default:21369 also remain unchanged. These are new item-name
    scopes only: no other wording, particles, pronouns, punctuation, line
    breaks, placeholders, owner dispositions, or historical findings change.
    Exact source coverage is two Abra keys and ten Arba keys across base and
    default; no affix hits exist.
  TEXT
  ABRA_NOTE = "#{COMMON_NOTE} Abra scope: base:2579:11 and default:52465."
  ARBA_NOTE = "#{COMMON_NOTE} Arba scope: base:4016:11 and default:2849, " \
              '10455, 17782, 20287, 21369, 33403, 36264, 39363, and 60211.'
  SPECS = [
    {
      key: ABRA, english: ABRA_TITLE, category: 'item',
      korean: ABRA_CANONICAL, variants: '아브라(Abra)의 숨결|아브라의 숨결',
      count: ABRA_KEYS.length, notes: ABRA_NOTE
    }.freeze,
    {
      key: ARBA, english: ARBA_TITLE, category: 'item',
      korean: ARBA_CANONICAL, variants: '아르바(Arba)의 숨결|아르바의 숨결',
      count: ARBA_KEYS.length, notes: ARBA_NOTE
    }.freeze
  ].freeze

  def validate_source!(key, source)
    entity = ENTITY_BY_KEY.fetch(key) do
      raise "unreviewed Breath item key #{key.inspect}"
    end
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English item title differs at #{key.inspect}" unless
      english.scan(ENGLISH_SPANS.fetch(entity)).length == 1
    raise "Japanese item evidence differs at #{key.inspect}" unless
      japanese.scan(JA_EVIDENCE.fetch(key)).length == 1
    raise "Chinese item evidence differs at #{key.inspect}" unless
      chinese.include?(ZH_EVIDENCE.fetch(key))
    if key == ['default', '33403', '']
      raise 'default:33403 no longer distinguishes staff from item title' unless
        english.include?("Arba's staff, the Breath of Arba") &&
        japanese.include?('アーバの杖がある') &&
        chinese.include?('阿尔巴的法杖阿尔巴之息')
    end
    true
  end

  def transform(spec, key, text, source)
    entity = ENTITY_BY_KEY.fetch(key) do
      raise "unreviewed Breath item key #{key.inspect}"
    end
    raise "wrong item definition at #{key.inspect}" unless spec.fetch(:key) == entity
    validate_source!(key, source)

    canonical = entity == ABRA ? ABRA_CANONICAL : ARBA_CANONICAL
    pattern = entity == ABRA ? ABRA_SPAN : ARBA_SPAN
    if text.scan(canonical).length == 1
      remaining = text.sub(canonical, '')
      raise "additional unpaired item span at #{key.inspect}" if remaining.match?(pattern)
      return [text, false]
    end

    old = OLD_SPANS.fetch(key)
    raise "expected one exact item-name span at #{key.inspect}" unless
      text.scan(pattern) == [old]
    [text.sub(old, canonical), false]
  end

  def definitions
    headers = ReviewedNameBatches.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    SPECS.map do |spec|
      headers.zip([
        spec.fetch(:key), spec.fetch(:english), spec.fetch(:category),
        spec.fetch(:korean), '', spec.fetch(:variants), "D-#{D}",
        'confirmed', spec.fetch(:notes)
      ]).to_h
    end
  end

  def current_inventory
    m = ReviewedNameBatches
    m::RESOURCES.flat_map do |resource|
      aligned = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(m::ROOT, locale, resource))
      end
      build_inventory(resource, *aligned).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end.to_h { |row| [ReviewedNameBatches.key(row), row] }
  end

  def dry_run
    m = ReviewedNameBatches
    r = ReviewedProperNameDiscovery
    r.ensure_unused_batch!(D)
    inventory = current_inventory
    raise 'incomplete aligned inventory' unless inventory.length == 73_430
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.map { |row| [row['entity_key'], *m.key(row)] }.sort
    expected_keys = ENTITY_BY_KEY.map { |key, entity| [entity, *key] }.sort
    raise "Breath item source scope differs: #{generated_keys.inspect}" unless
      generated_keys == expected_keys

    index = m.table(m::INDEX)
    prior_arba = index.select do |row|
      row['entity_key'] == 'person:arba' && ARBA_KEYS.include?(m.key(row))
    end
    prior_arba_keys = prior_arba.map { |row| m.key(row) }.sort
    raise "person:arba exclusions changed: #{prior_arba_keys.inspect}" unless
      prior_arba_keys == ARBA_KEYS.sort &&
      prior_arba.all? { |row| row['status'] == 'excluded' }

    specs_by_key = SPECS.to_h { |spec| [spec.fetch(:key), spec] }
    reviews = generated.map do |occurrence|
      key = m.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      revised, excluded = transform(
        specs_by_key.fetch(occurrence.fetch('entity_key')), key, old, source
      )
      status = excluded ? 'excluded' : (old == revised ? 'not-an-issue' : 'accepted')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => occurrence.fetch('entity_key'), 'status' => status,
        'old' => old, 'new' => revised, 'evidence' => COMMON_NOTE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(
          occurrence.fetch('entity_key') => status
        )
      }
    end
    glossary = m.table(r::GLOSSARY)
    r.validate!(definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    r.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    edits.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(m.csv_path(resource)), rows)
    end
    puts "D-#{D} read-only dry run: #{generated.length} exact item matches " \
         "(Abra 2, Arba 10), #{edits.length} Texto edits; byte-preserving " \
         'validation passed; all person:arba exclusions retained; no files changed.'
    reviews.each do |row|
      key = [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      entity = row.fetch('entity_key')
      canonical = entity == ABRA ? ABRA_CANONICAL : ARBA_CANONICAL
      puts "#{key.join(':')} #{OLD_SPANS.fetch(key)} => #{canonical}" \
           "#{row['old'] == row['new'] ? ' (already canonical)' : ''}"
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Breath Of Abra And Breath Of Arba Named Items', SPECS, COMMON_NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then BreathsAbraArbaD21681.dry_run
  when ['apply'] then BreathsAbraArbaD21681.apply
  else abort 'usage: review-breaths-abra-arba-D21681.rb dry-run|apply'
  end
end
