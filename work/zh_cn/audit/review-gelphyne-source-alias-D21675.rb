#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewGelphyneSourceAliasD21675
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_675
  ENTITY = 'person:nargyfier'
  ALIAS = 'Gelphyne'
  CANONICAL = '겔파인(Gelphyne)'
  FULL_NAME = '겔파인 나르지피어(Gelphyne Nargyfier)'
  ALIAS_PATH = File.join(__dir__, "proper-name-source-alias-D#{D}.tsv")

  TARGETS = {
    ['default', '6817', ''] => {
      old: '겔핀(Gelphyne)', new: CANONICAL,
      en: /buy Rose-of-Shadows from Gelphyne in the Wending/,
      ja: /ウェンディングのジェルファインからシャドウローズ/,
      zh: /前行之地.*格尔菲尼.*暗影玫瑰/
    },
    ['default', '12350', ''] => {
      old: '젤파인(Gelphyne)', new: CANONICAL,
      en: /why Gelphyne sells it/,
      ja: /なぜジェルファインが売っている/,
      zh: /格尔菲尼会出售/
    },
    ['default', '17692', ''] => {
      old: CANONICAL, new: CANONICAL,
      en: /find Gelphyne in the Wending and ask for some Rose-of-Shadows/,
      ja: /ウェンディングにいるジェルファイン.*シャドウローズ/,
      zh: /前行之地.*格尔菲尼.*暗影玫瑰/
    },
    ['default', '36774', ''] => {
      old: '겔파인', new: CANONICAL,
      en: /Rose-of-Shadows from Gelphyne in the Wending/,
      ja: /ウェンディングにいるジェルファインからシャドウローズ/,
      zh: /前行之地.*格尔菲尼.*暗影玫瑰/
    },
    ['default', '55456', ''] => {
      old: '젤파인(Gelphyne)', new: CANONICAL,
      en: /Gelphyne buys and sells/,
      ja: /売り買いならジェルファイン/,
      zh: /格尔菲尼买你想卖的东西/
    },
    ['default', '59918', ''] => {
      old: '젤파인(Gelphyne)', new: CANONICAL,
      en: /\AGelphyne\z/,
      ja: /\AGelphyne\z/,
      zh: /\AGelphyne\z/
    }
  }.freeze
  FULL_NAME_KEYS = [
    ['default', '17353', ''],
    ['default', '36421', '']
  ].freeze
  SURNAME_KEY = ['default', '63745', ''].freeze
  EXISTING_KEYS = (FULL_NAME_KEYS + [SURNAME_KEY]).freeze
  EXPECTED_OWNER_KEYS = (EXISTING_KEYS + TARGETS.keys).sort.freeze

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:17353 and default:36421 explicitly give the complete
    personal name Gelphyne Nargyfier; Japanese ジェルファイン・ナージファイアー
    and Chinese 格尔菲尼·那吉菲尔 corroborate both name components.
    The existing person:nargyfier owner also has the standalone surname
    at default:63745. Across the six exact given-name occurrences, the
    Wending/Rose-of-Shadows quest rows identify the same Gelphyne who
    provides or sells the rose; default:12350 says Gelphyne sells the
    poison, default:55456 identifies Gelphyne as the local buyer/seller,
    and default:59918 is a standalone label. Japanese ジェルファイン and
    Chinese 格尔菲尼 support the contextual occurrences; at 59918 all
    three source locales retain the English label. No other Gelphyne
    candidate appears in the aligned inventory. This repeated exact given
    name, unique full-name pairing, and consistent named-merchant context
    support Gelphyne as a source alias of the existing person, not a new
    person or identity merger. Keep person:nargyfier's English/Korean
    canonical fields and all three existing dispositions unchanged; append
    only the Gelphyne alias and provenance. Use the established short form
    겔파인(Gelphyne) for these six new person/entity matches. Leave both
    complete Gelphyne Nargyfier labels byte-for-byte unchanged. Exact
    source scope is default:6817, 12350, 17692, 36774, 55456, and 59918;
    no affix/base additions. Preserve prior Walen, Wending, Daltan, and
    Kest decisions on overlapping rows; this adds a new owner-specific match,
    not a recount or reclassification of those terminal findings.
  TEXT

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def current_inventory
    root = M::ROOT
    RESOURCES.flat_map do |resource|
      aligned_sources = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(root, locale, resource))
      end
      build_inventory(resource, *aligned_sources).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end.to_h { |row| [key(row), row] }
  end

  def validate_source!(source_key, source)
    target = TARGETS.fetch(source_key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English Gelphyne context differs at #{source_key.inspect}" unless
      english.match?(target.fetch(:en))
    raise "Japanese Gelphyne context differs at #{source_key.inspect}" unless
      japanese.match?(target.fetch(:ja))
    raise "Chinese Gelphyne context differs at #{source_key.inspect}" unless
      chinese.match?(target.fetch(:zh))
    true
  end

  def replacement(source_key, text)
    target = TARGETS.fetch(source_key)
    old = target.fetch(:old)
    revised = target.fetch(:new)
    if old == revised
      raise "expected canonical Gelphyne pair missing at #{source_key.inspect}" unless
        text.scan(revised).length == 1
      return text
    end
    if text.scan(revised).length == 1
      without_canonical = text.sub(revised, '')
      return text if without_canonical.scan(old).empty?
    end
    raise "expected one Gelphyne span at #{source_key.inspect}" unless
      text.scan(old).length == 1
    raise "unexpected canonical Gelphyne span at #{source_key.inspect}" unless
      text.scan(revised).empty?
    text.sub(old, revised)
  end

  def add_alias(owner, glossary)
    raise 'missing confirmed person:nargyfier owner' unless
      owner && owner['entity_key'] == ENTITY && owner['status'] == 'confirmed'
    raise 'Nargyfier canonical metadata changed' unless
      owner['english_canonical'] == 'Nargyfier' &&
      owner['category'] == 'person' &&
      owner['korean_canonical'] == '나르지피어(Nargyfier)'
    collision = glossary.any? do |row|
      next false if row['entity_key'] == ENTITY
      [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
        .any? { |term| term.casecmp?(ALIAS) }
    end
    raise 'Gelphyne alias already owned by another entity' if collision
    aliases = owner['english_aliases'].to_s.split('|').reject(&:empty?)
    raise 'Gelphyne alias already registered' if aliases.any? { |term| term.casecmp?(ALIAS) }

    updated = owner.dup
    updated['english_aliases'] = (aliases + [ALIAS]).join('|')
    updated['evidence_ids'] = (
      owner['evidence_ids'].to_s.split('|') +
      ["D-#{D}", *TARGETS.keys.map { |resource, id, variant|
        variant.empty? ? "#{resource}:#{id}" : "#{resource}:#{id}:#{variant}"
      }]
    ).uniq.join('|')
    updated['notes'] = [owner['notes'], NOTE].reject(&:empty?).join("\n")
    %w[entity_key english_canonical category korean_canonical korean_variants status].each do |field|
      raise "canonical owner field changed: #{field}" unless updated[field] == owner[field]
    end
    updated
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'source-alias manifest already exists' if File.exist?(ALIAS_PATH)
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    owner_row = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'person:nargyfier owner missing' unless owner_row
    owner = add_alias(owner_row.to_h, glossary.map(&:to_h))

    inventory = current_inventory
    raise 'incomplete aligned inventory' unless inventory.length == 73_430
    old_owner_rows = index.select { |row| row['entity_key'] == ENTITY }
    old_keys = old_owner_rows.map { |row| key(row) }.sort
    raise "existing Nargyfier keys differ: #{old_keys.inspect}" unless
      old_keys == EXISTING_KEYS.sort
    raise 'existing Nargyfier rows are not terminal' if
      old_owner_rows.any? { |row| row['status'] == 'needs-context' }

    generated = build_occurrences(inventory.values, [owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    all_keys = generated.map { |row| key(row) }.sort
    raise "Gelphyne owner source scope differs: #{all_keys.inspect}" unless
      all_keys == EXPECTED_OWNER_KEYS
    known = index.map { |row| [row['entity_key'], *key(row)] }.to_set
    fresh = generated.reject { |row| known.include?([ENTITY, *key(row)]) }
    raise 'new Gelphyne alias scope differs' unless
      fresh.map { |row| key(row) }.sort == TARGETS.keys.sort

    validate_full_name_anchors!(inventory, old_owner_rows)
    reviews = fresh.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      validate_source!(source_key, source)
      old = source.fetch('work_text')
      revised = replacement(source_key, old)
      {
        'resource' => source_key[0], 'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2], 'entity_key' => ENTITY,
        'status' => revised == old ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => revised, 'evidence' => NOTE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(
          ENTITY => (revised == old ? 'not-an-issue' : 'accepted')
        )
      }
    end
    R.validate_sources!(reviews, inventory)
    changed_reviews = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(
      File.binread(M.csv_path('default')), changed_reviews
    ) unless changed_reviews.empty?
    puts "D-#{D} read-only prepare: existing #{ENTITY}; six new alias matches; " \
         "#{changed_reviews.length} Texto edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('ID_Linha', 'status', 'old', 'new'))
    end
    [glossary, index, owner, fresh, reviews]
  end

  def validate_full_name_anchors!(inventory, old_owner_rows)
    raise 'expected exactly three existing owner rows' unless old_owner_rows.length == 3
    FULL_NAME_KEYS.each do |source_key|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact
      raise "full-name English anchor changed at #{source_key.inspect}" unless
        english == ['Gelphyne Nargyfier']
      raise "full-name Japanese anchor changed at #{source_key.inspect}" unless
        japanese.join("\n").include?('ジェルファイン・ナージファイアー')
      raise "full-name Chinese anchor changed at #{source_key.inspect}" unless
        source.fetch('zh_text') == '格尔菲尼·那吉菲尔'
      raise "full-name Korean anchor changed at #{source_key.inspect}" unless
        source.fetch('work_text') == FULL_NAME
    end
    surname = inventory.fetch(SURNAME_KEY)
    raise 'standalone Nargyfier owner anchor changed' unless
      JSON.parse(surname.fetch('en_texts_json')).compact == ['Nargyfier'] &&
      surname.fetch('work_text') == '나르지피어(Nargyfier)'
  end

  def apply
    glossary, index, owner, fresh, reviews = prepare
    M.write_table(R::GLOSSARY, glossary.headers,
                  glossary.map { |row| row['entity_key'] == ENTITY ? owner : row.to_h })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + fresh)
    M.write_table(ALIAS_PATH, M::HEADERS.take(12), reviews)
    M.run(ALIAS_PATH, D, 1)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewGelphyneSourceAliasD21675.prepare
  when ['apply'] then ReviewGelphyneSourceAliasD21675.apply
  else abort 'usage: review-gelphyne-source-alias-D21675.rb [prepare|apply]'
  end
end
