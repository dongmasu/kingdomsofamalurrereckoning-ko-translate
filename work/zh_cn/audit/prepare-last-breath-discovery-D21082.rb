#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module LastBreathDiscoveryD21082
  M = ReviewedNameBatches
  D = ReviewedProperNameDiscovery
  BATCH = 'D-21082'
  SET = 'unique_item:last-breath'
  GENERIC_IDS = %w[31271 45505 49672 58096 62421 64638].freeze
  SET_DEFAULT_IDS = %w[
    21093 25118 28147 31271 32060 33138 35830 35853 35868 36179 36968
    40864 41482 44216 45157 45230 45505 46444 46765 47232 48448 49672
    51725 53856 56022 58096 59591 61534 62281 62421 64638
  ].freeze
  COMPONENTS = {
    'unique_item:last-breath-hood' => {
      english: 'Hood of Last Breath', aliases: 'Last Breath Hood',
      korean: '마지막 숨결의 두건',
      variants: %w[마지막\ 숨결의\ 두건 라스트\ 브레스의\ 두건],
      base_ids: %w[427], default_ids: %w[36968 44216 48448 53856],
      evidence: 'base:427:11|default:36968|default:48448',
      notes: 'The complete hood label is an item name; English Hood of Last Breath is the primary narrative order and Last Breath Hood is the base-label alias. Japanese ラストブレスのフード and Chinese 余息兜帽 corroborate.'
    },
    'unique_item:last-breath-boots' => {
      english: 'Boots of Last Breath', aliases: 'Last Breath Boots',
      korean: '마지막 숨결의 장화',
      variants: %w[마지막\ 숨결의\ 장화 라스트\ 브레스의\ 장화],
      base_ids: %w[906], default_ids: %w[25118 33138],
      evidence: 'base:906:11|default:25118|default:33138',
      notes: 'The complete boots label is an item name; English Boots of Last Breath is the narrative order and Last Breath Boots is the base-label alias. Japanese ラストブレスのブーツ and Chinese 余息长靴 corroborate.'
    },
    'unique_item:last-breath-leggings' => {
      english: 'Leggings of Last Breath', aliases: 'Last Breath Leggings',
      korean: '마지막 숨결의 각반',
      variants: %w[마지막\ 숨결의\ 각반 최후의\ 숨결\ 각반 최후의\ 숨결\ 레깅스],
      base_ids: %w[3736], default_ids: %w[35853 35868 36179 41482],
      evidence: 'base:3736:11|default:36179|default:41482',
      notes: 'The complete leggings label is an item name; English Leggings of Last Breath is the narrative order and Last Breath Leggings is the base-label alias. Normalize 레깅스 to the prevailing item term 각반. Japanese ラストブレスのレギンス and Chinese 余息护腿 corroborate.'
    },
    'unique_item:last-breath-armor' => {
      english: 'Armor of Last Breath', aliases: 'Last Breath Armor',
      korean: '마지막 숨결의 갑옷',
      variants: %w[마지막\ 숨결의\ 갑옷 마지막\ 숨결\ 갑옷 최후의\ 숨결\ 갑옷 최후의\ 숨결의\ 갑옷],
      base_ids: %w[3781], default_ids: %w[21093 28147 32060 40864 61534],
      evidence: 'base:3781:11|default:21093|default:32060|default:61534',
      notes: 'English Armor of Last Breath is the narrative item-title order; Last Breath Armor is the base-label alias. default:28147 says the whole Last Breath suit was rebuilt, so the set name is normalized there and this armor-piece disposition is excluded. Japanese ラストブレスの鎧 and Chinese 余息护甲 corroborate the item.'
    },
    'unique_item:last-breath-gloves' => {
      english: 'Gloves of Last Breath', aliases: 'Last Breath Gloves',
      korean: '마지막 숨결의 장갑',
      variants: %w[마지막\ 숨결의\ 장갑 마지막\ 숨결\ 장갑 최후의\ 숨결\ 장갑],
      base_ids: %w[4303], default_ids: %w[46444 56022 62281],
      evidence: 'base:4303:11|default:46444|default:56022|default:62281',
      notes: 'The complete gloves label is an item name; English Gloves of Last Breath is the narrative order and Last Breath Gloves is the base-label alias. Normalize 최후의 숨결 to the prevailing 마지막 숨결 form. Japanese ラストブレスのグローブ and Chinese 余息手套 corroborate.'
    },
    'unique_item:last-breath-ring' => {
      english: 'Last Breath Ring', aliases: '',
      korean: '마지막 숨결의 반지',
      variants: %w[라스트\ 브레스\ 반지 마지막\ 숨결의\ 반지],
      base_ids: [], default_ids: %w[45157],
      evidence: 'default:45157',
      notes: 'Last Breath Ring is supported only as its own complete English/Japanese/Chinese item label. It is registered independently; no membership in the Executioner suit or relation to its quest is inferred.'
    }
  }.freeze
  SET_VARIANTS = ['라스트 브레스', '마지막 숨결', '최후의 숨결', '마지막 숨'].freeze
  SCOPE_KEYS = (
    %w[427 906 3736 3781 4303].map { |id| ['base', id, '11'] } +
    SET_DEFAULT_IDS.map { |id| ['default', id, ''] }
  ).freeze
  SOURCE_TITLES = {
    'default:35830' => 'Last Breath',
    'default:45230' => 'Last Breath',
    'default:46765' => 'Last Breath',
    'default:47232' => 'Last Breath',
    'default:51725' => 'Last Breath',
    'default:59591' => 'Last Breath',
    'default:28147' => 'Last Breath'
  }.freeze
  GENERIC_CONTEXT = {
    '31271' => /until the last breath/i,
    '45505' => /in a last breath/i,
    '49672' => /take her last breath/i,
    '58096' => /my last breath/i,
    '62421' => /every last breath of reason/i,
    '64638' => /gasps his last breath/i
  }.freeze
  SET_NOTES = 'English identifies the named Executioner equipment set Last Breath; Japanese ラストブレス and Chinese 余息 corroborate the named-set uses. Use the prevailing Korean 마지막 숨결(Last Breath), preserving the surrounding grammar and complete item titles. Generic breath idioms are excluded. Component labels are reviewed as atomic full names rather than nested set-name substitutions. No relation between the separately labeled Ring and the Executioner suit is inferred.'
  OPAQUE = D::OPAQUE

  module_function

  def definitions
    rows = [{
      'entity_key' => SET, 'english_canonical' => 'Last Breath',
      'category' => 'unique item', 'korean_canonical' => '마지막 숨결(Last Breath)',
      'english_aliases' => '', 'korean_variants' => SET_VARIANTS.join('|'),
      'evidence_ids' => 'D-21082|default:35830|default:45230|default:59591',
      'status' => 'confirmed', 'notes' => SET_NOTES
    }]
    COMPONENTS.each do |entity, spec|
      rows << {
        'entity_key' => entity, 'english_canonical' => spec.fetch(:english),
        'category' => 'unique item',
        'korean_canonical' => "#{spec.fetch(:korean)}(#{spec.fetch(:english)})",
        'english_aliases' => spec.fetch(:aliases),
        'korean_variants' => spec.fetch(:variants).join('|'),
        'evidence_ids' => "D-21082|#{spec.fetch(:evidence)}",
        'status' => 'confirmed', 'notes' => spec.fetch(:notes)
      }
    end
    rows
  end

  def component_keys
    COMPONENTS.each_with_object({}) do |(entity, spec), result|
      (spec.fetch(:base_ids).map { |id| ['base', id, '11'] } +
        spec.fetch(:default_ids).map { |id| ['default', id, ''] }).each do |key|
        raise "duplicate component source key #{key.inspect}" if result.key?(key)
        result[key] = entity
      end
    end
  end

  def expected_matches
    set_matches = SCOPE_KEYS.map { |key| [SET, *key] }
    component_matches = component_keys.map { |key, entity| [entity, *key] }
    (set_matches + component_matches).sort
  end

  def validate_identity!(source, key)
    resource, id, = key
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "Last Breath English source changed #{key.inspect}" unless english.match?(/(?<![A-Za-z])last breath(?![A-Za-z])/i)
    if GENERIC_IDS.include?(id) && resource == 'default'
      raise "generic idiom exception changed #{key.inspect}" unless
        GENERIC_CONTEXT.fetch(id).match?(english) &&
        !japanese.include?('ラストブレス') && !chinese.include?('余息')
    else
      raise "Japanese item/set evidence missing #{key.inspect}" unless japanese.include?('ラストブレス')
      raise "Chinese item/set evidence missing #{key.inspect}" unless chinese.include?('余息')
    end
  end

  def outside_opaque(text)
    text.split(/(#{OPAQUE.source})/).each_with_index.map do |part, index|
      index.odd? ? part : yield(part)
    end.join
  end

  def edit_set(text)
    variants = (SET_VARIANTS - ['마지막 숨']).sort_by { |name| -name.length }
               .map { |name| Regexp.escape(name) }
    variants << '마지막 숨(?!결|[가-힣])'
    pattern = /(?:#{variants.join('|')})(?:\(Last Breath\))?/
    outside_opaque(text) { |part| part.gsub(pattern, '마지막 숨결(Last Breath)') }
  end

  def english_component_title(source, entity)
    spec = COMPONENTS.fetch(entity)
    titles = ([spec.fetch(:english)] + spec.fetch(:aliases).split('|')).uniq
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    found = titles.select do |title|
      english.match?(/(?<![A-Za-z])#{Regexp.escape(title)}(?![A-Za-z])/i)
    end
    raise "ambiguous English component title #{entity} #{M.key(source).inspect}" unless found.length == 1
    found.first
  end

  def edit_component(text, source, entity)
    spec = COMPONENTS.fetch(entity)
    title = english_component_title(source, entity)
    variants = spec.fetch(:variants).sort_by { |name| -name.length }.map { |name| Regexp.escape(name) }
    source_labels = ([spec.fetch(:english)] + spec.fetch(:aliases).split('|')).uniq
    labels = source_labels.sort_by { |name| -name.length }.map { |name| Regexp.escape(name) }
    pattern = /(?:#{variants.join('|')})(?:\((?:#{labels.join('|')})\))?/
    replacement = "#{spec.fetch(:korean)}(#{title})"
    outside_opaque(text) { |part| part.gsub(pattern, replacement) }
  end

  def decision_for(entity, key, source, text)
    component = component_keys[key]
    if entity == SET
      return ['excluded', text] if GENERIC_IDS.include?(key[1]) && key[0] == 'default'
      # Component labels are atomic; only the whole-suit sentence at 28147 is
      # a direct set-name target. The ring is independently named.
      return [key == ['default', '28147', ''] ? 'accepted' : 'excluded',
              key == ['default', '28147', ''] ? edit_set(text) : text] if component
      raise "unclassified Last Breath set key #{key.inspect}" unless SOURCE_TITLES.key?("#{key[0]}:#{key[1]}")
      ['accepted', edit_set(text)]
    else
      raise "unexpected Last Breath component #{entity} at #{key.inspect}" unless component == entity
      return ['excluded', text] if key == ['default', '28147', '']
      updated = edit_component(text, source, entity)
      [updated == text ? 'not-an-issue' : 'accepted', updated]
    end
  end

  def build_reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise 'D-21082 exact English source-key/entity coverage changed' unless actual == expected_matches
    raise 'D-21082 exact 36-key scope changed' unless
      generated.map { |row| M.key(row) }.uniq.sort == SCOPE_KEYS.sort

    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _matches|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      validate_identity!(source, key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      matches.each do |match|
        entity = match.fetch('entity_key')
        disposition, text = decision_for(entity, key, source, text)
        dispositions[entity] = disposition
      end
      status = if text != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => text,
        'evidence' => "#{SET_NOTES} Per-component English/Japanese/Chinese evidence and item-title alias decisions are recorded in the corresponding D-21082 definition.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    [reviews, generated]
  end

  # Read only: prepare and validate the proposed manifest in memory.
  def prepare(inventory = nil)
    inventory_rows = inventory || M.table(M::INVENTORY).map(&:to_h)
    indexed = inventory_rows.to_h { |row| [M.key(row), row] }
    raise 'duplicate aligned inventory key' unless indexed.length == inventory_rows.length
    SCOPE_KEYS.each { |key| indexed.fetch(key) }
    reviews, generated = build_reviews(indexed)
    glossary = M.table(D::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    D.validate!(definitions, reviews, generated, glossary, index)
    D.validate_sources!(reviews, indexed)
    [definitions, reviews, generated]
  end

  def run
    defs, reviews, generated = prepare
    counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    entity_counts = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
    puts "D-21082 prepare-only: #{reviews.length} row keys; #{generated.length} entity/key matches; #{counts.inspect}"
    puts "Entity matches: #{entity_counts.sort.to_h.inspect}; definitions=#{defs.length}; no files written."
  end
end

LastBreathDiscoveryD21082.run if $PROGRAM_NAME == __FILE__
