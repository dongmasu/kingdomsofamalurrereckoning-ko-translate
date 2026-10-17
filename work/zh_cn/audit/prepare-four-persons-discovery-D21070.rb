#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module FourPersonsDiscoveryD21070
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21070.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21070.tsv')
  NAMES = {
    'person:anker-edmure' => {
      en: 'Anker Edmure', ko: '앵커 에드뮤어',
      variants: ['앵커 에드뮤어', '앵커 에드무어', '앤커 에드뮤어', '앵커 에드머'],
      ja: /アンカー・エドミュア/, zh: '安科·艾德莫尔',
      ids: %w[937 11948 14834 16363 20942 23334 24490 25885 29718 30152
              31080 32306 33908 37566 39351 44822 44982 45401 47107 55297 63508],
      evidence: 'default:20942|default:11948|default:44822|default:45401',
      notes: 'English identifies the Emaire scholar and novice sagecrafter investigating Shardfall. Japanese アンカー・エドミュア and Chinese 安科·艾德莫尔 corroborate. Unify all four reviewed Korean full-name spellings to 앵커 에드뮤어, the prevailing form (16/21 full-name cells; alternatives 3/1/1), including existing English pairs. Do not preserve minority spellings. Leave short Anker and Edmure references unchanged in this full-name-only batch.'
    },
    'person:luca-soren' => {
      en: 'Luca Soren', ko: '루카 소렌', variants: ['루카 소렌'],
      ja: /ルカ・ソレン/, zh: '卢卡·索伦',
      ids: %w[10212 10781 14921 22434 25890 28536 28795 35838 37705 40287
              44918 46892 46910 51777 58173 60584 62865 64804],
      evidence: 'default:46910|default:25890|default:10212|base:3301:11',
      notes: 'English identifies the woman wounded by a thresh and healed by Arhaus Vorm using Searstalk. Japanese ルカ・ソレン and Chinese 卢卡·索伦 corroborate. Use 루카 소렌(Luca Soren). Leave short Luca references unchanged; default:48762 is connected treatment dialogue, but the daughter Luca in default:57507 is not independently resolved here. Soren also belongs to Jera Soren and is not a global alias.'
    },
    'person:phasmer-humm' => {
      en: 'Phasmer Humm', ko: '파스머 험', variants: ['파스머 험', '패스머 험'],
      ja: /ファズマー・ヒュム|ファスマー/, zh: '法斯玛·胡姆',
      ids: %w[864 5649 8466 8706 10702 13755 24498 30297 32402 32728 34607
              36399 40098 42521 50551 52074 56410 57865],
      evidence: 'default:24498|default:32402|default:42521|default:8466',
      notes: 'English identifies the Moon Camp Traveler partnered with the player at Rithen, later cursed and helped by Grim. Japanese ファズマー・ヒュム (short ファスマー at default:8466) and Chinese 法斯玛·胡姆 corroborate. Normalize full names, including 패스머 험, to 파스머 험(Phasmer Humm). Connected short Phasmer references are reported but deferred. Humm at default:12209 is an interjection, not a person; Phasmer’s Curse at default:13525 is a separate complete title.'
    },
    'person:ferrin-shaw' => {
      en: 'Ferrin Shaw', ko: '페린 쇼', variants: ['페린 쇼'],
      ja: /フェリン・ショー/, zh: '费林·肖',
      ids: %w[525 2072 8946 11955 14500 15491 25118 30875 32060 35119 36179
              36968 41482 45230 48448 56022],
      evidence: 'default:35119|default:36179|default:45230|default:48448',
      notes: 'English identifies the trader of lost things and son of the Executioner, involved with the Last Breath equipment. Japanese フェリン・ショー and Chinese 费林·肖 corroborate. Use 페린 쇼(Ferrin Shaw), including the possessive reference at default:48448 missed by the scout phrase queue. No standalone Ferrin alias is needed. Cayden Shaw at default:15928 and default:46614 is a distinct person, so Shaw is not a global alias.'
    }
  }.freeze
  TITLES = {
    ['default', '31080', ''] => ['person:anker-edmure', 'Notes of Anker Edmure'],
    ['default', '46892', ''] => ['person:luca-soren', 'The Journal of Luca Soren'],
    ['base', '3301', '11'] => ['person:luca-soren', "Luca Soren's Journal"]
  }.freeze
  SCOPE_NOTE = 'D-21070 full personal names only; no short aliases or global surnames are registered. Standalone complete notes/journal titles are excluded for separate title review. English is primary; the exact aligned Japanese and Chinese are retained. Every replacement changes only an attested full-name string and its English pair; particles, short names, other names, titles, punctuation, tokens, line breaks and all unrelated text remain unchanged. No earlier entity dispositions are reopened.'

  module_function

  def definitions
    NAMES.map do |entity, spec|
      {
        'entity_key' => entity, 'english_canonical' => spec.fetch(:en),
        'category' => 'person',
        'korean_canonical' => "#{spec.fetch(:ko)}(#{spec.fetch(:en)})",
        'english_aliases' => '', 'korean_variants' => spec.fetch(:variants).join('|'),
        'evidence_ids' => "D-21070|#{spec.fetch(:evidence)}",
        'status' => 'confirmed', 'notes' => "#{spec.fetch(:notes)} #{SCOPE_NOTE}"
      }
    end
  end

  def name_pattern(entity)
    spec = NAMES.fetch(entity)
    variants = spec.fetch(:variants).sort_by { |name| -name.length }.map { |name| Regexp.escape(name) }
    /(?<![가-힣A-Za-z])(?:#{variants.join('|')})(?:\(#{Regexp.escape(spec.fetch(:en))}\))?(?![A-Za-z])/
  end

  def outside_tokens(text)
    text.split(/(#{ReviewedProperNameDiscovery::OPAQUE.source})/).each_with_index.map do |part, index|
      index.odd? ? part : yield(part)
    end.join
  end

  def edit_name(text, entity)
    spec = NAMES.fetch(entity)
    outside_tokens(text) do |part|
      part.gsub(name_pattern(entity), "#{spec.fetch(:ko)}(#{spec.fetch(:en)})")
    end
  end

  def expected_keys(entity)
    keys = NAMES.fetch(entity).fetch(:ids).map { |id| ['default', id, ''] }
    keys << ['base', '3301', '11'] if entity == 'person:luca-soren'
    keys
  end

  def excluded?(source)
    TITLES.key?(M.key(source))
  end

  def validate_scope!(generated)
    expected = NAMES.keys.flat_map { |entity| expected_keys(entity).map { |key| [entity, *key] } }
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'D-21070 full-name scope changed; independently review missing/new keys' unless actual.sort == expected.sort
  end

  def validate_identity!(source, entity)
    spec = NAMES.fetch(entity)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise "D-21070 identity evidence changed #{M.key(source).inspect}" unless
      candidate_matches([english], build_matchers(definitions)).key?(entity) &&
      japanese.match?(spec.fetch(:ja)) && source.fetch('zh_text').include?(spec.fetch(:zh))
    title = TITLES[M.key(source)]
    raise 'D-21070 complete title changed' if title && (title[0] != entity || title[1] != english)
  end

  # The shared gate checks full terms; also guard pre-existing given-name identities.
  def validate_components!(glossary)
    NAMES.each_value do |spec|
      given = spec.fetch(:en).split.first
      collision = glossary.find do |row|
        next false unless row['category'] == 'person' || row.fetch('entity_key').start_with?('person:')
        terms = [row.fetch('english_canonical')] + row['english_aliases'].to_s.split('|')
        terms.any? { |term| term.match?(/(?<![A-Za-z])#{given}(?![A-Za-z])/i) } ||
          row.fetch('entity_key') == "person:#{given.downcase}"
      end
      raise "D-21070 identity already represented: #{given} / #{collision['entity_key']}" if collision
    end
  end

  def build_reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    validate_scope!(generated)
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      notes = []
      matches.each do |match|
        entity = match.fetch('entity_key')
        validate_identity!(source, entity)
        if excluded?(source)
          dispositions[entity] = 'excluded'
        else
          pattern = name_pattern(entity)
          masked = outside_tokens(text) { |part| part.gsub(pattern, '') }
          raise "D-21070 unrecognized Korean full name #{key.inspect}" if masked == text
          new_text = edit_name(text, entity)
          raise 'D-21070 replacement changed non-name text' unless
            masked == outside_tokens(new_text) { |part| part.gsub(pattern, '') }
          dispositions[entity] = text == new_text ? 'not-an-issue' : 'accepted'
          text = new_text
        end
        notes << NAMES.fetch(entity).fetch(:notes)
      end
      status = text != old ? 'accepted' : dispositions.values.all? { |value| value == 'excluded' } ? 'excluded' : 'not-an-issue'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => text, 'evidence' => "#{notes.join(' ')} #{SCOPE_NOTE}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    [reviews, generated]
  end

  def alias_report(inventory)
    NAMES.to_h do |entity, spec|
      matcher = build_matchers([definitions.find { |row| row['entity_key'] == entity }])
      full = /(?<![A-Za-z])#{Regexp.escape(spec.fetch(:en))}(?![A-Za-z])/i
      components = spec.fetch(:en).split.to_h do |term|
        short_only = []
        same_row = []
        inventory.each_value do |source|
          texts = JSON.parse(source.fetch('en_texts_json')).compact
          next unless texts.any? { |text| text.gsub(full, '').match?(/(?<![A-Za-z])#{term}(?![A-Za-z])/i) }
          target = candidate_matches(texts, matcher).key?(entity) ? same_row : short_only
          target << M.key(source)
        end
        [term, { short_only: short_only, same_row: same_row }]
      end
      [entity, components]
    end
  end

  # Read alignment in memory only. Never refresh or write the shared inventory.
  def current_inventory
    M::RESOURCES.flat_map do |resource|
      rows = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *rows).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end.to_h { |row| [M.key(row), row] }
  end

  def validate_fresh!(inventory, current)
    NAMES.each_key do |entity|
      expected_keys(entity).each do |key|
        raise "D-21070 stale inventory #{key.inspect}" unless inventory.fetch(key) == current.fetch(key)
      end
    end
    current_matches = build_occurrences(current.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    validate_scope!(current_matches)
    raise 'D-21070 stale alias inventory' unless alias_report(inventory) == alias_report(current)
  end

  def run(argv = ARGV)
    raise 'usage: prepare-four-persons-discovery-D21070.rb [FRESH_INVENTORY.tsv]' if argv.length > 1
    rows = M.table(argv.first || M::INVENTORY).map(&:to_h)
    inventory = rows.to_h { |row| [M.key(row), row] }
    raise 'D-21070 duplicate inventory key' unless rows.length == inventory.length
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    validate_components!(glossary.map(&:to_h))
    validate_fresh!(inventory, current_inventory)
    reviews, generated = build_reviews(inventory)
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared four people: #{reviews.length} rows: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
    reviews.group_by { |row| row['entity_key'] }.each do |entity, matches|
      puts "#{entity}: #{matches.group_by { |row| row['status'] }.transform_values(&:length)}"
    end
    alias_report(inventory).each do |entity, terms|
      puts "#{entity} deferred aliases (short-only / same-full-row): " \
           "#{terms.map { |term, groups| "#{term}=#{groups[:short_only].length}/#{groups[:same_row].length}" }.join(', ')}"
    end
  end
end

FourPersonsDiscoveryD21070.run if $PROGRAM_NAME == __FILE__
