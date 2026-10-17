#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module PraetoriansOrderD21541
  extend self

  M = ReviewedNameBatches
  START = 21_541

  PRAETORIANS = 'organization:praetorians'
  WATCH = 'organization:praetorian-watch'
  GUARD = 'organization:praetorian-guard'
  KEYMASTER = 'title:praetorian-keymaster'

  PRAETORIANS_EN = 'Praetorians'
  PRAETORIANS_KO = '프레토리안 근위대(Praetorians)'
  MEMBER_KO = '프레토리안(Praetorian)'
  MEMBER_ROLE_KO = '프레토리안 근위병(Praetorian)'
  WATCH_KO = '프레토리안 감시대(Praetorian Watch)'
  GUARD_KO = '프레토리안 근위대(Praetorian Guard)'
  KEYMASTER_KO = '프레토리안 열쇠 관리자(Praetorian Keymaster)'

  PRAETORIAN_SOURCE = /(?<![A-Za-z])Praetorian(?:s)?(?:[[:space:]]+order)?(?![A-Za-z])/i
  FULL_NAME_SOURCE = {
    WATCH => /(?<![A-Za-z])Praetorian[[:space:]]+Watch(?![A-Za-z])/i,
    GUARD => /(?<![A-Za-z])Praetorian[[:space:]]+Guard(?![A-Za-z])/i,
    KEYMASTER => /(?<![A-Za-z])Praetorian[[:space:]]+Keymaster(?![A-Za-z])/i
  }.freeze

  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")

  DEFAULT_IDS = %w[
    412 1553 2080 3672 4814 5577 5766 7080 7653 8433 8769 9459 9670
    9705 10838 12167 17914 18174 18798 18902 19497 19797 20249 20386
    21322 22220 22986 25477 25959 27098 27411 27874 28142 30694 31430
    31710 32147 32211 34505 36188 38994 40829 41070 41188 42297 42554
    44259 46191 47066 49623 50204 50993 51840 52529 52634 54477 54560
    54583 55311 56025 58091 58238 58738 62486 62921 64316
  ].freeze
  ALL_KEYS = [
    ['base', '948', '11'],
    *DEFAULT_IDS.map { |id| ['default', id, ''] }
  ].freeze

  GARRISON_IDS = %w[
    4814 8769 10838 12167 18798 41188 46191 58091 58738
  ].freeze
  GARRISON_KEYS = [
    ['base', '948', '11'],
    *GARRISON_IDS.map { |id| ['default', id, ''] }
  ].freeze
  FULL_PAIGE_IDS = %w[412 19797].freeze
  UNRESOLVED_PAIGE_IDS = %w[18902 28142].freeze
  EXISTING_HOLDS = %w[42297 42554 50204 54560 54583].freeze
  MEMBER_IDS = %w[5577 9705 25477 25959 36188 44259 49623 50204 54477].freeze

  WATCH_IDS = %w[7653 41070].freeze
  GUARD_IDS = %w[50993].freeze
  KEYMASTER_IDS = %w[62921].freeze
  SEPARATE_LABEL_IDS = (WATCH_IDS + GUARD_IDS + KEYMASTER_IDS).freeze

  KOREAN_TERM = /
    (?<![가-힣])
    (?<base>
      근위대원|
      프레토리안[[:space:]]+(?:근위대|근위병)|
      프라이토리아[[:space:]]+기사단|
      프라이토리안[[:space:]]+(?:근위대|근위병)|
      프레토리아[[:space:]]+(?:근위대|근위병)|
      프레토리안|프라이토리안|프라이토리아|프레토리아|
      친위병|친위대|근위병|근위대|기사단
    )
    (?:\((?:Praetorians?|Praetorian[[:space:]]+order)\))?
    (?<plural>들)?
  /x.freeze

  NOTE = 'English establishes the Praetorians as one of the three gnomish castes (default:1553, default:62486) and as a named military order (default:40829); Decanus references at default:8433/default:9670 place the rank within that body. Japanese 兵士/軍団兵/近衛兵 and Chinese 禁卫军 corroborate a military organization, not a species; 詰所 supports the separately scoped Garrison context. The official Korean manual extraction has no direct Praetorian or gnomish-caste entry and supplies no competing Korean name.'
  COMMON = 'Register the organization as 프레토리안 근위대(Praetorians), with source-attested singular Praetorian and Praetorian order aliases only. Singular member mentions use 프레토리안(Praetorian), or 프레토리안 근위병(Praetorian) when the Korean role head is present. Keep Praetorian Garrison, Praetorian Watch, Praetorian Guard, and Praetorian Keymaster as separate complete labels; do not infer a Paige identity from short Praetorian Paige rows. Preserve every prior entity/key disposition and all other text, role heads, particles, number, opaque tokens, and exact line breaks. English is primary; Japanese/Chinese support is recorded per source row. No PAK evidence, source edits, or historical tally recount.'

  ROW_NOTES = {
    'base:948:11' => 'The complete Praetorian Garrison place label is already bilingual and registered by D-21538; exclude only its nested organization match.',
    'default:4814:' => 'The two complete Garrison short references were reviewed under the place scope in D-21538; preserve them and exclude the nested organization match.',
    'default:58091:' => 'The bilingual Praetorian Garrison label is a new entity-specific spelling key under D-21538; preserve that prior verdict and exclude the nested organization match.',
    'default:412:' => 'Praetorian Orsinian Paige is already a complete bilingual person annotation; do not reinterpret the title as a separate organization reference.',
    'default:19797:' => 'Praetorian Orsinian Paige is already a complete bilingual person annotation; preserve person:orsinian-paige and exclude the nested organization match.',
    'default:18902:' => 'Praetorian Paige is a short person-like phrase without confirmed identity linkage; retain the existing wording and hold only this organization relation as uncertain.',
    'default:28142:' => 'Praetorian Paige is a short person-like phrase without confirmed identity linkage; retain the existing wording and hold only this organization relation as uncertain.',
    'default:40829:' => 'The source explicitly says Praetorian order; the caste and rank context supports the organization identity. This new term disposition does not revise the earlier rank/display judgment.',
    'default:2080:' => 'The sentence predicates membership in the Praetorian caste; retain the topic particle selected for the Korean canonical ending.',
    'default:31430:' => 'The speaker uses Praetorians as the collective subject; adjust the Korean subject particle to agree with the canonical 근위대 head.',
    'default:38994:' => 'The note is sent by the named Praetorian body; adjust the Korean subject particle to agree with the canonical 근위대 head.',
    'default:7653:' => 'Praetorian Watch is a separate complete named body; exclude its nested Praetorian match from the parent organization.',
    'default:41070:' => 'Praetorian Watch is a separate complete source-form label; exclude its nested Praetorian match from the parent organization.',
    'default:42297:' => 'Retain the prior D-13000 uncertainty for this exact referent; do not change the Korean cell.',
    'default:42554:' => 'Retain the prior D-13041 uncertainty for the gnomish Praetorian reference; do not change the Korean cell.',
    'default:50204:' => 'Retain the prior D-15262 rank/display uncertainty; do not infer a formal office or change the Korean cell.',
    'default:50993:' => 'Praetorian Guard is a separate named historical body; exclude its nested parent-organization match.',
    'default:54560:' => 'Retain the prior D-16519-D-16523 uncertainty for Praetorian/Centurion terminology in the mining log.',
    'default:54583:' => 'Retain the prior D-16519-D-16523 uncertainty for Praetorian/Centurion terminology in the mining log.',
    'default:62921:' => 'Praetorian Keymaster is registered as a neutral role/title, not as a unique person; exclude its nested parent-organization match.'
  }.freeze
  PARTICLE_FIXES = {
    'default:2080:' => ['프레토리안 근위대(Praetorians)은', '프레토리안 근위대(Praetorians)는'],
    'default:31430:' => ['프레토리안 근위대(Praetorians)이', '프레토리안 근위대(Praetorians)가'],
    'default:38994:' => ['프레토리안 근위대(Praetorians)이', '프레토리안 근위대(Praetorians)가']
  }.freeze

  def key_tag(key)
    key.join(':')
  end

  def expected_pairs
    ALL_KEYS.map { |key| [PRAETORIANS, *key] } +
      WATCH_IDS.map { |id| [WATCH, 'default', id, ''] } +
      GUARD_IDS.map { |id| [GUARD, 'default', id, ''] } +
      KEYMASTER_IDS.map { |id| [KEYMASTER, 'default', id, ''] }
  end

  def definitions(headers)
    fields = [
      {
        'entity_key' => PRAETORIANS,
        'english_canonical' => PRAETORIANS_EN,
        'category' => 'organization',
        'korean_canonical' => PRAETORIANS_KO,
        'english_aliases' => 'Praetorian|Praetorian order',
        'korean_variants' => '프레토리안|프라이토리안|프라이토리아|프레토리아|근위대|근위병|친위대|친위병|기사단',
        'evidence_ids' => "D-#{START}-#{START + 1}|default:1553|default:8433|default:9670|default:40829|default:62486",
        'status' => 'confirmed',
        'notes' => "#{NOTE} #{COMMON}"
      },
      {
        'entity_key' => WATCH,
        'english_canonical' => 'Praetorian Watch',
        'category' => 'organization',
        'korean_canonical' => WATCH_KO,
        'english_aliases' => '',
        'korean_variants' => '근위 감시대|프라이토리아 감시대',
        'evidence_ids' => "D-#{START}|default:7653|default:41070",
        'status' => 'confirmed',
        'notes' => "#{NOTE} Complete Watch form is a separate named organization, not an alias of the Praetorians caste."
      },
      {
        'entity_key' => GUARD,
        'english_canonical' => 'Praetorian Guard',
        'category' => 'organization',
        'korean_canonical' => GUARD_KO,
        'english_aliases' => '',
        'korean_variants' => '',
        'evidence_ids' => "D-#{START}|default:50993",
        'status' => 'confirmed',
        'notes' => "#{NOTE} The source's historical Praetorian Guard is a distinct complete military body; do not merge it into Praetorians or people in the narrative."
      },
      {
        'entity_key' => KEYMASTER,
        'english_canonical' => 'Praetorian Keymaster',
        'category' => 'title',
        'korean_canonical' => KEYMASTER_KO,
        'english_aliases' => '',
        'korean_variants' => '근위대 열쇠 관리자',
        'evidence_ids' => "D-#{START}|default:62921",
        'status' => 'confirmed',
        'notes' => "#{NOTE} The complete label is a neutral Praetorian role/title, not evidence for a unique person."
      }
    ]
    fields.map { |row| headers.to_h { |header| [header, row.fetch(header, '')] } }
  end

  def expected_entity_pairs
    {
      PRAETORIANS => ALL_KEYS.map { |key| [PRAETORIANS, *key] },
      WATCH => WATCH_IDS.map { |id| [WATCH, 'default', id, ''] },
      GUARD => GUARD_IDS.map { |id| [GUARD, 'default', id, ''] },
      KEYMASTER => KEYMASTER_IDS.map { |id| [KEYMASTER, 'default', id, ''] }
    }
  end

  def load_inventory
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

  def verify_generated_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Praetorians generated source/entity scope differs' unless
      actual.sort == expected_pairs.sort
    raise 'Praetorians occurrence count differs' unless generated.length == 71
    raise 'Praetorians exact source-key count differs' unless
      generated.map { |row| M.key(row) }.uniq.length == 67
    generated
  end

  def replace_once(text, old_span, new_span, tag)
    count = text.scan(Regexp.new(Regexp.escape(old_span))).length
    raise "Praetorian Korean span multiplicity differs #{tag}" unless count == 1

    text.sub(old_span, new_span)
  end

  def transform_organization(text, english, tag)
    english_hits = english.scan(PRAETORIAN_SOURCE)
    matches = text.to_enum(:scan, KOREAN_TERM).map { Regexp.last_match }
    return [text, 'uncertain', 'Korean source-span count does not map one-to-one to the English Praetorian references.'] unless
      !english_hits.empty? && matches.length == english_hits.length

    new_text = text.dup
    matches.reverse_each do |match|
      base = match[:base]
      english_term = if english_hits.length == 1 && english_hits.first.match?(/order/i)
                       'Praetorian order'
                     elsif MEMBER_IDS.include?(tag.split(':')[1]) ||
                           english_hits.all? { |term| term.match?(/\APraetorian\z/i) }
                       'Praetorian'
                     else
                       'Praetorians'
                     end
      suffix = match[:plural].to_s
      replacement = if base.match?(/근위병|친위병/)
                      "프레토리안 근위병(#{english_term})#{suffix}"
                    elsif base == '근위대원'
                      "프레토리안 근위대원(#{english_term})#{suffix}"
                    elsif english_term == 'Praetorian'
                      "#{MEMBER_KO}#{suffix}"
                    else
                      "#{PRAETORIANS_KO}#{suffix}"
                    end
      new_text[match.begin(0)...match.end(0)] = replacement
    end
    [new_text, new_text == text ? 'not-an-issue' : 'accepted', '']
  end

  def classification(entity, key, old, english)
    tag = key_tag(key)
    id = key[1]
    if entity == PRAETORIANS
      return [old, 'excluded', ''] if GARRISON_KEYS.include?(key)
      return [old, 'excluded', ''] if FULL_PAIGE_IDS.include?(id) && key[0] == 'default'
      return [old, 'excluded', ''] if SEPARATE_LABEL_IDS.include?(id) && key[0] == 'default'
      return [old, 'uncertain', ''] if
        (UNRESOLVED_PAIGE_IDS + EXISTING_HOLDS).include?(id) && key[0] == 'default'

      if id == '40829' && key[0] == 'default'
        new_text = replace_once(old, '프라이토리아 기사단', '프레토리안 근위대(Praetorian order)', tag)
        return [new_text, new_text == old ? 'not-an-issue' : 'accepted', '']
      end

      return transform_organization(old, english, tag)
    end

    case entity
    when WATCH
      span = id == '7653' ? '근위 감시대(Praetorian Watch)' : '프라이토리아 감시대'
      text = replace_once(old, span, WATCH_KO, tag)
      [text, 'accepted', '']
    when GUARD
      span = '프레토리안 근위대(Praetorian Guard)'
      text = replace_once(old, span, GUARD_KO, tag)
      [text, text == old ? 'not-an-issue' : 'accepted', '']
    when KEYMASTER
      text = replace_once(old, '근위대 열쇠 관리자', KEYMASTER_KO, tag)
      [text, text == old ? 'not-an-issue' : 'accepted', '']
    else
      raise "unexpected Praetorian entity #{entity.inspect}"
    end
  end

  def source_texts(source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise "Praetorian English evidence missing #{M.key(source).inspect}" unless
      english.match?(PRAETORIAN_SOURCE)
    raise "Praetorian Japanese support differs #{M.key(source).inspect}" unless
      japanese.match?(/軍団兵|近衛兵|軍団警備兵|兵士|詰所/)
    raise "Praetorian Chinese support differs #{M.key(source).inspect}" unless
      chinese.match?(/禁卫军|军团兵|哨兵/)

    [english, japanese, chinese]
  end

  def review_source(source, occurrences)
    key = M.key(source)
    tag = key_tag(key)
    english, japanese, chinese = source_texts(source)
    old = source.fetch('work_text')
    new_text = old.dup
    dispositions = {}
    row_notes = []
    transform_notes = []

    occurrences.each do |occurrence|
      entity = occurrence.fetch('entity_key')
      new_text, disposition, transform_note = classification(entity, key, new_text, english)
      transform_notes << transform_note unless transform_note.empty?
      dispositions[entity] = disposition
      row_notes << ROW_NOTES[tag] if ROW_NOTES.key?(tag)
    end
    if (particle_fix = PARTICLE_FIXES[tag])
      new_text = replace_once(new_text, particle_fix.fetch(0), particle_fix.fetch(1), tag)
      transform_notes << 'Adjusted only the source-local Korean particle to agree with the canonical 근위대 head.'
    end

    status = if old != new_text
               'accepted'
             elsif dispositions.value?('uncertain')
               'uncertain'
             elsif dispositions.values.all? { |value| value == 'excluded' }
               'excluded'
             else
               'not-an-issue'
             end
    evidence = [NOTE, row_notes.uniq, transform_notes.uniq, COMMON].flatten.reject(&:empty?).join(' ')
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
      'old' => old, 'new' => new_text, 'evidence' => evidence,
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h)
    }
  end

  def prepare
    [START, START + 1].each { |batch| ReviewedProperNameDiscovery.ensure_unused_batch!(batch) }
    raise 'Praetorian discovery proposal already exists' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    defs = definitions(glossary.headers)
    inventory = load_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    verify_generated_scope!(generated)
    grouped = generated.group_by { |row| M.key(row) }
    reviews = grouped.keys.sort_by do |key|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key|
      review_source(inventory.fetch(key), grouped.fetch(key))
    end
    raise 'Praetorians distinct row-key count differs' unless reviews.length == 67
    raise 'Praetorians review batch sizes differ' unless
      reviews.each_slice(50).map(&:length) == [50, 17]
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts 'D-21541-D-21542: 67 distinct source keys; 71 entity matches; ' \
         'batches 50/17; prepare mode, no writes.'
    [glossary.headers, defs, reviews]
  end

  def apply
    headers, defs, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, defs)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    previous.each do |key, value|
      raise "prior occurrence changed #{key.inspect}" unless current[key] == value
    end
    raise 'Praetorians additions differ' unless
      (current.keys - previous.keys).sort == expected_pairs.sort
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PraetoriansOrderD21541.prepare
  when ['apply'] then PraetoriansOrderD21541.apply
  else abort 'usage: review-praetorians-order-D21541.rb [prepare|apply]'
  end
end
