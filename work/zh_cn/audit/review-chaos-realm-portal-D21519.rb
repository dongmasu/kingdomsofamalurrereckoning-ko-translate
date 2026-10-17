#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ChaosRealmPortalD21519
  extend self

  M = ReviewedNameBatches
  START = 21_519
  REALM = 'place:chaos-realm'
  PORTAL = 'place:chaos-portal'
  REALM_EN = 'Chaos Realm'
  PORTAL_EN = 'Chaos Portal'
  REALM_KO = '혼돈의 영역(Chaos Realm)'
  PORTAL_KO = '혼돈 차원문(Chaos Portal)'
  PORTAL_PLURAL_KO = '혼돈 차원문(Chaos Portals)'
  REALM_SOURCE = /(?<![A-Za-z])Chaos Realm(?![A-Za-z])/i
  PORTAL_SOURCE = /(?<![A-Za-z])Chaos Portals?(?![A-Za-z])/i
  REALM_KOREAN = /혼돈(?:의)?\s*(?:영역|세계)(?:\(Chaos Realm\))?/
  PORTAL_KOREAN = /혼돈(?:의)?\s*(?:차원문|포털|포탈)(?:\(Chaos Portals?\))?/
  BATCH_SIZES = [50, 21].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")
  REALM_IDS = %w[
    6687 11104 12596 12924 13306 13857 14012 16239 18287 19736 20075
    20513 20956 21383 25426 28787 32334 33234 36924 41708 41759 41775
    45567 52731 55085 56572 59907 61754 63247
  ].freeze
  REALM_BASE_IDS = %w[339 802 1079 2192 2351 2657 3140 3511 4034].freeze
  PORTAL_IDS = %w[
    2628 3102 7823 9900 12176 12307 12596 13270 16239 18072 18507
    18790 22442 25426 28344 29837 39819 40015 42452 47547 48089
    48368 48541 50227 50838 52731 54996 57110 57186 58276 58574
    59489 62134 63316 63772 64450
  ].freeze
  PORTAL_BASE_IDS = %w[2256].freeze
  SHARED_KEYS = %w[12596 16239 25426 52731].freeze
  SHORT_PORTAL_REFERENCES = {
    ['default', '16239', ''] => ['차원문을', '차원문(Portals)을', 2],
    ['default', '52731', ''] => ['열린 차원문으로 들어가', '열린 차원문(Portal)으로 들어가', 1],
    ['default', '59489', ''] => ['차원문에 들어가', '차원문(Portal)에 들어가', 1],
    ['default', '63316', ''] => ['차원문을 열려면', '차원문(Portal)을 열려면', 1],
    ['default', '64450', ''] => ['차원문을 보거나', '차원문(Portals)을 보거나', 1]
  }.freeze
  OPAQUE_LABELS = {
    ['default', '12596', ''].freeze => {
      'entity' => REALM, 'korean' => '{*1혼돈의 영역}',
      'english' => '{*1Chaos Realm}', 'japanese' => '{*1混沌の領域}',
      'chinese' => '{*1混乱世界}', 'annotation' => 'Chaos Realm'
    }.freeze,
    ['default', '56572', ''].freeze => {
      'entity' => REALM, 'korean' => '{*1혼돈 영역 던전}',
      'english' => '{*1Chaos realm dungeons}',
      'japanese' => '{*1混沌の領域ダンジョン}',
      'chinese' => '{*1混乱世界地牢}', 'annotation' => 'Chaos realm dungeons'
    }.freeze,
    ['default', '63316', ''].freeze => {
      'entity' => PORTAL, 'korean' => '{*1혼돈 차원문}',
      'english' => '{*1Chaos Portal}', 'japanese' => '{*1混沌のポータル}',
      'chinese' => '{*1Chaos Portal}', 'annotation' => 'Chaos Portal'
    }.freeze
  }.freeze
  REALM_NOTE = 'English identifies Chaos Realm as the broader extradimensional realm/dimension. It is not each particular Chaos Realm dungeon, an individual site, or Esharra. Japanese 混沌の領域 corroborates. Chinese supports the realm generally; default:41708 instead says 混乱王国, while Japanese confirms the aligned meaning. Reuse 혼돈의 영역(Chaos Realm) without assigning a unique-dungeon identity.'
  PORTAL_NOTE = 'English identifies the Chaos Portal/Chaos Portals as a portal class; it is distinct from Chaos Rift(s). Japanese 混沌のポータル and Chinese 混乱传送门 corroborate. Chinese retains the English Portal runtime token at default:63316; preserve the Korean token and pair its exact English label outside it. Reuse 혼돈 차원문(Chaos Portal), retaining the source plural alias where present. Individual portals are not asserted to be one physical instance.'
  COMMON = 'Only exact English Chaos Realm and Chaos Portal(s) matches are in scope. Source-short Portal references are annotated only where the same row explicitly identifies the Chaos Portal; no global Portal or Rift alias is added. Preserve opaque token bytes; only the three explicitly mapped bilingual tags receive an English annotation outside the token. Preserve status/counter attributes, particles, line breaks and all other wording. New entity dispositions do not reopen existing row/entity decisions. No PAK evidence, source edits or historical tally recount.'
  DETAIL = <<~TEXT
    ### D-21519-D-21520: Chaos Realm And Chaos Portals

    Register `place:chaos-realm` as `혼돈의 영역(Chaos Realm)` and
    `place:chaos-portal` as `혼돈 차원문(Chaos Portal)`, with the exact
    source plural `Chaos Portals` as the Portal alias. The active source
    alignment contains 38 Realm and 37 Portal matches across 71 unique
    CSV row keys; four rows carry both entity dispositions. Reviewed in
    50/21-key batches.

    Realm denotes the broader dimension, not each dungeon, one particular
    place, or Esharra. Portals are distinct from Rifts and remain a class;
    individual portals are not merged. Same-row short Portal references
    are local only. Opaque token contents remain byte-for-byte unchanged;
    the aligned Chaos Realm, Chaos-realm-dungeons and Chaos Portal labels
    at default:12596/56572/63316 receive exact English annotations outside
    the closing token delimiter. Open/Closed and status/counter attributes
    are retained. Existing entity/key decisions remain immutable.
  TEXT

  def expected_pairs
    [[REALM, 'base', '339', '11']] +
      REALM_BASE_IDS.drop(1).map { |id| [REALM, 'base', id, '11'] } +
      REALM_IDS.map { |id| [REALM, 'default', id, ''] } +
      [[PORTAL, 'base', '2256', '11']] +
      PORTAL_IDS.map { |id| [PORTAL, 'default', id, ''] }
  end

  def definitions(headers)
    specs = [
      {
        'entity_key' => REALM, 'english_canonical' => REALM_EN,
        'category' => 'place', 'korean_canonical' => REALM_KO,
        'english_aliases' => '', 'korean_variants' => '혼돈 영역|혼돈의 영역',
        'evidence_ids' => "D-#{START}-D-#{START + 1}|base:339:11|default:13306|default:61754",
        'status' => 'confirmed', 'notes' => "#{REALM_NOTE} #{COMMON}"
      },
      {
        'entity_key' => PORTAL, 'english_canonical' => PORTAL_EN,
        'category' => 'place', 'korean_canonical' => PORTAL_KO,
        'english_aliases' => 'Chaos Portals',
        'korean_variants' => '혼돈의 차원문|혼돈 차원문|혼돈 포털',
        'evidence_ids' => "D-#{START}-D-#{START + 1}|base:2256:11|default:12176|default:16239|default:64450",
        'status' => 'confirmed', 'notes' => "#{PORTAL_NOTE} #{COMMON}"
      }
    ]
    specs.map { |fields| headers.to_h { |header| [header, fields.fetch(header, '')] } }
  end

  def load_inventory
    # Align the active CSVs in memory; do not refresh or write the shared TSV.
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

  def expected_pairs_for_entity(entity)
    case entity
    when REALM
      [[REALM, 'base', '339', '11']] +
        REALM_BASE_IDS.drop(1).map { |id| [REALM, 'base', id, '11'] } +
        REALM_IDS.map { |id| [REALM, 'default', id, ''] }
    when PORTAL
      [[PORTAL, 'base', '2256', '11']] +
        PORTAL_IDS.map { |id| [PORTAL, 'default', id, ''] }
    else
      raise "unknown Chaos entity #{entity}"
    end
  end

  def opaque_ranges(text)
    ranges = []
    text.to_enum(:scan, ReviewedProperNameDiscovery::OPAQUE).each do
      match = Regexp.last_match
      ranges << (match.begin(0)...match.end(0))
    end
    ranges
  end

  def opaque_name_tokens(text, pattern)
    ranges = opaque_ranges(text)
    tokens = []
    text.to_enum(:scan, pattern).each do
      match = Regexp.last_match
      range = ranges.find do |candidate|
        candidate.begin <= match.begin(0) && match.end(0) <= candidate.end
      end
      tokens << text[range] if range
    end
    tokens
  end

  def replace_outside_opaque(text, pattern, replacement, key)
    spans = []
    text.to_enum(:scan, pattern).each do
      match = Regexp.last_match
      spans << [match.begin(0), match.end(0)]
    end
    raise "missing Korean name span #{key.inspect}" if spans.empty?
    protected = opaque_ranges(text)
    editable = spans.reject { |first, last| protected.any? { |range| range.begin <= first && last <= range.end } }
    result = text.dup
    editable.reverse_each { |first, last| result[first...last] = replacement }
    [result, spans.length, editable.length]
  end

  def validate_language_support!(entity, english, japanese, chinese, key)
    if entity == REALM
      raise "Chaos Realm English support differs #{key.inspect}" unless english.match?(REALM_SOURCE)
      raise "Chaos Realm Japanese support differs #{key.inspect}" unless japanese.match?(/混沌の領域|混沌領域/)
      raise "Chaos Realm Chinese support differs #{key.inspect}" unless
        chinese.match?(/混乱世界|混乱领域|混乱区域|混乱王国|Chaos Realm/i)
    else
      raise "Chaos Portal English support differs #{key.inspect}" unless english.match?(PORTAL_SOURCE)
      raise "Chaos Portal Japanese support differs #{key.inspect}" unless japanese.match?(/混沌のポータル|混沌ポータル/)
      raise "Chaos Portal Chinese support differs #{key.inspect}" unless
        chinese.match?(/混乱传送门|混乱门户|Chaos Portals?/i)
    end
  end

  def annotate_opaque_label!(key, entity, english, japanese, chinese, old, text)
    label = OPAQUE_LABELS.fetch(key)
    raise "opaque label entity differs #{key.inspect}" unless label.fetch('entity') == entity

    {
      'English' => [english, label.fetch('english')],
      'Japanese' => [japanese, label.fetch('japanese')],
      'Chinese' => [chinese, label.fetch('chinese')]
    }.each do |language, (source, expected)|
      expected_pattern = Regexp.new(Regexp.escape(expected))
      raise "#{language} opaque label differs #{key.inspect}" unless
        source.scan(expected_pattern).length == 1
    end

    token = label.fetch('korean')
    token_pattern = Regexp.new(Regexp.escape(token))
    raise "Korean opaque label differs #{key.inspect}" unless old.scan(token_pattern).length == 1
    token_start = old.index(token)
    token_range = token_start...(token_start + token.length)
    unless opaque_ranges(old).any? do |range|
             range.begin <= token_range.begin && token_range.end <= range.end
           end
      raise "Korean label is not an opaque token #{key.inspect}"
    end
    raise "opaque label disappeared before annotation #{key.inspect}" unless
      text.scan(token_pattern).length == 1

    suffix = "(#{label.fetch('annotation')})"
    annotated = "#{token}#{suffix}"
    if text.include?(annotated)
      [text, nil, false]
    else
      [text.sub(token, annotated),
       "Preserve #{token} byte-for-byte and append the exact aligned English label #{suffix} outside its closing delimiter.",
       true]
    end
  end

  def review_source(source, occurrences)
    key = M.key(source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    old = source.fetch('work_text')
    new_text = old
    dispositions = {}
    evidence = []

    occurrences.group_by { |row| row.fetch('entity_key') }.each do |entity, matches|
      validate_language_support!(entity, english, japanese, chinese, key)
      source_pattern = entity == REALM ? REALM_SOURCE : PORTAL_SOURCE
      opaque_names = opaque_name_tokens(english, source_pattern)
      if opaque_names.any?
        label = OPAQUE_LABELS[key]
        unless label && label.fetch('entity') == entity &&
               opaque_names == [label.fetch('english')]
          raise "unmapped opaque English name token #{key.inspect}"
        end
      end
      if entity == REALM
        before_entity = new_text
        new_text, _total, _edited =
          replace_outside_opaque(new_text, REALM_KOREAN, REALM_KO, key)
        dispositions[REALM] = new_text == before_entity ? 'not-an-issue' : 'accepted'
        evidence << REALM_NOTE
      else
        before_entity = new_text
        terms = matches.flat_map { |row| row.fetch('matched_english').split('|') }.uniq
        raise "unexpected Chaos Portal term #{key.inspect}" unless
          (terms - [PORTAL_EN, 'Chaos Portals']).empty?
        raise "ambiguous singular/plural Portal source #{key.inspect}" if
          terms.include?(PORTAL_EN) && terms.include?('Chaos Portals')
        label = terms.include?('Chaos Portals') ? PORTAL_PLURAL_KO : PORTAL_KO
        new_text, _total, _edited =
          replace_outside_opaque(new_text, PORTAL_KOREAN, label, key)
        if (short_reference = SHORT_PORTAL_REFERENCES[key])
          from, to, count = short_reference
          english_without_full_names = english.gsub(PORTAL_SOURCE, '')
          raise "missing source-short Portal context #{key.inspect}" unless
            english_without_full_names.match?(/(?<![A-Za-z])Portals?(?![A-Za-z])/i)
          raise "short Portal Korean span differs #{key.inspect}" unless
            new_text.scan(Regexp.new(Regexp.escape(from))).length == count
          new_text = new_text.gsub(from, to)
          evidence << 'Explicit same-row short Portal references are annotated locally only; no English alias or occurrence key is added.'
        end
        dispositions[PORTAL] = new_text == before_entity ? 'not-an-issue' : 'accepted'
        evidence << PORTAL_NOTE
      end
    end

    if (opaque_label = OPAQUE_LABELS[key])
      entity = opaque_label.fetch('entity')
      raise "opaque label lacks its entity occurrence #{key.inspect}" unless dispositions.key?(entity)
      new_text, opaque_note, opaque_changed =
        annotate_opaque_label!(key, entity, english, japanese, chinese, old, new_text)
      dispositions[entity] = 'accepted' if opaque_changed
      evidence << opaque_note if opaque_note
    end

    row_note = case key
               when ['default', '12596', '']
                 'The aligned Realm heading tokens in English/Japanese/Chinese pair with the Korean token; annotate only outside the unchanged Korean token.'
               when ['default', '56572', '']
                 'The only Realm match is the complete Chaos-realm-dungeons runtime label; retain its Korean token and append the exact source phrase outside it. Other tagged Chaos labels are not in this scope.'
               when ['default', '63316', '']
                 'The full Portal token is preserved and paired outside its closing delimiter; the linked ordinary-text short Portal reference is annotated locally.'
               when ['default', '29837', '']
                 'Retain the earlier D-19773 Chaos Portal terminology correction; this adds only its bilingual entity annotation.'
               when ['default', '57110', '']
                 'Retain the earlier D-19503 portal-versus-Rift contextual correction; this adds only bilingual name annotations.'
               else
                 ''
               end
    evidence << row_note unless row_note.empty?
    raise "Chaos normalization changed line breaks #{key.inspect}" unless
      old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
    raise "Chaos normalization changed opaque tokens #{key.inspect}" unless
      old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        new_text.scan(ReviewedProperNameDiscovery::OPAQUE)
    status = new_text == old ? 'not-an-issue' : 'accepted'
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
      'old' => old, 'new' => new_text,
      'evidence' => (evidence + [COMMON]).join(' '),
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(dispositions)
    }
  end

  def batches(reviews)
    reviews.each_slice(50).to_a
  end

  def detail(reviews)
    edits = reviews.count { |row| row.fetch('old') != row.fetch('new') }
    unchanged = reviews.length - edits
    <<~TEXT
      ### D-21519-D-21520: Chaos Realm And Chaos Portals

      Registered `place:chaos-realm` as `혼돈의 영역(Chaos Realm)` and
      `place:chaos-portal` as `혼돈 차원문(Chaos Portal)`, with the source
      plural `Chaos Portals` as the Portal alias. Reviewed 71 unique CSV row
      keys (75 entity matches) in 50/21-key batches: #{edits} changed cells,
      #{unchanged} unchanged.

      Realm denotes the broader dimension, not each dungeon, one particular
      place, or Esharra. Portals are distinct from Rifts and remain a class;
      individual portals are not merged. Same-row short Portal references
      are local only. Opaque tagged terms remain unchanged. Open/Closed and
      status/counter attributes are retained. Existing entity/key decisions
      remain immutable.
    TEXT
  end

  def prepare
    BATCH_SIZES.each_index { |ordinal| ReviewedProperNameDiscovery.ensure_unused_batch!(START + ordinal) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions(glossary.headers)
    inventory = load_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = expected_pairs
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Chaos Realm/Portal source scope differs' unless actual.sort == expected.sort
    raise 'Chaos Realm/Portal match count differs' unless generated.length == 75
    grouped = generated.group_by { |row| M.key(row) }
    raise 'Chaos Realm/Portal unique row count differs' unless grouped.length == 71
    raise 'Chaos Realm/Portal shared-key set differs' unless
      grouped.select { |_key, rows| rows.length == 2 }.keys.sort ==
        SHARED_KEYS.map { |id| ['default', id, ''] }.sort
    reviews = grouped.sort_by do |key, _rows|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      review_source(inventory.fetch(key), occurrences)
    end
    raise 'Chaos Realm/Portal batch sizes differ' unless batches(reviews).map(&:length) == BATCH_SIZES
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edits = reviews.count { |row| row.fetch('old') != row.fetch('new') }
    puts "D-#{START}-D-#{START + 1}: #{reviews.length} row keys; #{generated.length} entity matches; " \
         "#{edits} changed cells; #{reviews.length - edits} unchanged; batches 50/21; prepare only."
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    previous.each do |key, value|
      raise "prior occurrence changed #{key.inspect}" unless current[key] == value
    end
    raise 'unexpected Chaos Realm/Portal occurrence additions' unless
      (current.keys - previous.keys).sort == expected_pairs.sort
    checkpoint_detail = detail(reviews)
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{checkpoint_detail}"))
    end
    BATCH_SIZES.each_index do |ordinal|
      d = START + ordinal
      %w[review edit-addendum].each do |kind|
        path = File.join(__dir__, "named-scope-#{kind}-D#{d}-#{M::RUN_DATE_COMPACT}.md")
        File.open(path, 'a') { |file| file.write("\n\n#{checkpoint_detail}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ChaosRealmPortalD21519.prepare
  when ['apply'] then ChaosRealmPortalD21519.apply
  else abort 'usage: review-chaos-realm-portal-D21519.rb [prepare|apply]'
  end
end
