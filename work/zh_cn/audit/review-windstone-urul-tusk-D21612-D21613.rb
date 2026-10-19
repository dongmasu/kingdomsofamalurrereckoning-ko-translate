#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewWindstoneUrulTuskD21612D21613
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  WINDSTONE = <<~TEXT.chomp
    English identifies the musical Windstone/Windstones used with a chime,
    to open the Urul-Tusk gate or to play the Ayten Circle sequence.
    Japanese 風音石 and Chinese 风石 corroborate the object terminology.
    Reuse established base:408/base:773 바람돌 rather than mixing 풍음석,
    풍석 and 윈드스톤. Pair the first mention per row, retaining source
    singular/plural English; normalize later Korean mentions without
    repeating parentheses. Preserve counts, activation order, blessings,
    uncertainty in the speaker's theory, tokens and line endings.
    The place Windstone Vale at 19931 is excluded from this object scope
    and its D-21611 pair is unchanged. The complete Windstone Circle
    label at 17460 is a separate place scope, not a second object.
    For that label use established contextual 바람돌 원형진 from 7380,
    preserving the exact source English Windstone Circle; Japanese 風音石の環
    and Chinese 风石环 corroborate its circle structure. Do not register
    the generic word Circle as an alias or infer identity with Ayten Circle.
    The Ancient Windstone qualifier remains 고대; no unique-item identity
    is inferred from the descriptive adjective. The official Korean manual
    extraction/reference gives no direct term entry. All affix/base/default
    source scopes were searched. Existing other-entity decisions remain
    unchanged. Full discovery/residual validation remains incomplete.
    Published release ZIP unchanged; no new in-game rendering claim.
  TEXT
  URUL_TUSK = <<~TEXT.chomp
    English explicitly identifies Urul-Tusk as the sealed ruin/tomb containing
    the Piercing Light, with gates and the Windstone quest. The space-only
    Urul Tusk spelling at base:4330/default:35462 refers to this same place:
    Japanese ウル・タスク and Chinese 乌鲁尔图斯克/乌卢尔-塔斯克 corroborate.
    Reuse base:2861 우룰 터스크(Urul-Tusk), normalizing 우룰터스크 and
    우룰투스크 and replacing the isolated literal 우룰(Urul)의 엄니 label.
    Keep the source-local English space-only spelling inside its pair;
    do not rewrite source files or merge an independently named Urul.
    Retain later same-row short place references without duplicate pairs.
    Preserve all D-21612 Windstone changes, other names, quest states,
    source typos, tokens, counts and line endings. The official Korean
    manual extraction/reference has no direct entry for this place.
    All affix/base/default sources were searched: 22 matching keys,
    two base and 20 default, no affix hits. These are new place/entity
    events, not a recount of past translation decisions.
    Full discovery/residual validation remains incomplete. Release ZIP unchanged.
  TEXT
  WINDSTONE_KEYS = {
    'base' => %w[408 773 3546],
    'default' => %w[1473 1769 7380 9496 9582 10885 11475 17460 19836 19931 20458 27735 27935 30307 33211 33461 34581 34940 35462 36565 38510 42382 43588 46750 47231 49385 49782 52254 53678 55632 58497 59627 60447 64579]
  }.freeze
  URUL_KEYS = {
    'base' => %w[2861 4330],
    'default' => %w[1050 8459 12284 16319 24083 31884 35462 36149 38510 41983 42322 42382 53678 55632 58121 59817 63628 64121 64661 64849]
  }.freeze

  def keys(groups)
    groups.flat_map do |resource, ids|
      ids.map { |id| [resource, id, resource == 'base' ? '11' : ''] }
    end.sort
  end

  def specs(d)
    if d == 21_612
      [
        ['resource:windstone', 'Windstone', '바람돌', 'resource',
         'Windstones', '바람돌|풍음석|풍석|윈드스톤', keys(WINDSTONE_KEYS)],
        ['place:windstone-circle', 'Windstone Circle', '바람돌 원형진', 'place',
         '', '바람돌의 서클|바람돌 원형진', [['default', '17460', '']]]
      ]
    else
      [['place:urul-tusk', 'Urul-Tusk', '우룰 터스크', 'place',
        'Urul Tusk', '우룰 터스크|우룰터스크|우룰투스크|우룰의 엄니', keys(URUL_KEYS)]]
    end
  end

  def replacement(entity, key, en, old)
    case entity
    when 'resource:windstone'
      return [old, 'excluded'] if %w[17460 19931].include?(key[1]) && key[0] == 'default'
      pattern = /(?:바람돌|풍음석|풍석|윈드스톤)(?:\(Windstones?\))?/
      raise "missing Windstone span #{key.inspect}" unless old.match?(pattern)
      local = en.match?(/\bWindstones\b/i) ? 'Windstones' : 'Windstone'
      first = true
      revised = old.gsub(pattern) do
        value = first ? "바람돌(#{local})" : '바람돌'
        first = false
        value
      end
      [revised, old == revised ? 'not-an-issue' : 'accepted']
    when 'place:windstone-circle'
      raise 'Windstone Circle Korean label changed' unless old == '바람돌의 서클'
      ['바람돌 원형진(Windstone Circle)', 'accepted']
    when 'place:urul-tusk'
      pattern = /우룰\(Urul\)의 엄니|우룰 ?[터투]스크(?:\(Urul(?:-| )Tusk\))?/
      raise "missing Urul-Tusk span #{key.inspect}" unless old.match?(pattern)
      local = en.match?(/\bUrul Tusk\b/) ? 'Urul Tusk' : 'Urul-Tusk'
      first = true
      revised = old.gsub(pattern) do
        value = first ? "우룰 터스크(#{local})" : '우룰 터스크'
        first = false
        value
      end
      [revised, old == revised ? 'not-an-issue' : 'accepted']
    else raise "unknown reviewed entity #{entity}"
    end
  end

  def prepare(d)
    raise 'unsupported batch' unless [21_612, 21_613].include?(d)
    R.ensure_unused_batch!(d)
    paths = %w[proper-name-discovery-definitions proper-name-discovery].map do |stem|
      File.join(__dir__, "#{stem}-D#{d}.tsv")
    end
    raise 'discovery artifacts already exist' if paths.any? { |path| File.exist?(path) }
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    inventory = M.refresh_inventory
    evidence = d == 21_612 ? WINDSTONE : URUL_TUSK
    definitions, generated_all, by_key = [], [], {}
    specs(d).each do |entity, english, korean, category, aliases, variants, expected|
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => (["D-#{d}"] + expected.map { |key| key.reject(&:empty?).join(':') }).join('|'),
        'status' => 'confirmed', 'notes' => evidence
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected #{entity} source scope" unless generated.map { |row| M.key(row) }.sort == expected
      definitions << definition
      generated_all.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        row = by_key[key] ||= {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'old' => source.fetch('work_text'), 'new' => source.fetch('work_text'),
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'), 'evidence' => evidence, 'dispositions' => {}
        }
        revised, status = replacement(entity, key, row['english'], row['new'])
        row['new'] = revised
        row['dispositions'][entity] = status
      end
    end
    reviews = by_key.values.map do |row|
      dispositions = row.delete('dispositions')
      row['entity_key'] = dispositions.keys.join('|')
      row['entity_dispositions_json'] = JSON.generate(dispositions)
      row['status'] = if row['old'] != row['new']
                        'accepted'
                      elsif dispositions.values.all? { |value| value == 'excluded' }
                        'excluded'
                      else
                        'not-an-issue'
                      end
      row
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    expected_count = d == 21_612 ? 37 : 22
    raise "unexpected distinct key count D-#{d}" unless reviews.length == expected_count
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)),
                                  rows.select { |row| row['old'] != row['new'] })
    end
    puts "D-#{d}: #{definitions.length} entities, #{generated_all.length} entity/row events, " \
         "#{reviews.length} distinct keys; #{reviews.count { |row| row['old'] != row['new'] }} Texto edits; prepare only."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new')) if row['old'] != row['new']
    end
    [paths, glossary.headers, definitions, reviews]
  end

  def apply(d)
    paths, headers, definitions, reviews = prepare(d)
    M.write_table(paths[0], headers, definitions)
    M.write_table(paths[1], M::HEADERS.take(12), reviews)
    R.run([paths[0], paths[1], d.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-windstone-urul-tusk-D21612-D21613.rb D [prepare|apply]' unless
    (1..2).cover?(ARGV.length) && %w[prepare apply].include?(ARGV[1] || 'prepare')
  ReviewWindstoneUrulTuskD21612D21613.public_send(ARGV[1] || 'prepare', Integer(ARGV[0]))
end
