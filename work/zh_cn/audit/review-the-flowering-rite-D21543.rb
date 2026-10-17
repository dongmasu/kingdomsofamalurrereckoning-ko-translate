#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module TheFloweringRiteD21543
  extend self

  M = ReviewedNameBatches
  D = 21_543
  ENTITY = 'event:the-flowering'
  CANONICAL = '개화 의식(The Flowering)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")

  RITE_IDS = %w[
    410 2188 3954 5139 9287 11245 16997 17629 19840 21090 24310
    27492 27677 30327 39976 52104 52164 56790 59107 59859 61196
    62137 62899
  ].freeze
  EXCLUDED_IDS = %w[2138 8742 36939 42419 56044].freeze
  EXPECTED_KEYS = (RITE_IDS + EXCLUDED_IDS).map { |id| ['default', id, ''] }.freeze
  ENGLISH_COUNTS = {
    '410' => 2, '2188' => 1, '3954' => 1, '5139' => 2, '9287' => 1,
    '11245' => 1, '16997' => 1, '17629' => 1, '19840' => 1, '21090' => 1,
    '24310' => 1, '27492' => 1, '27677' => 1, '30327' => 1, '39976' => 1,
    '52104' => 1, '52164' => 1, '56790' => 1, '59107' => 1, '59859' => 1,
    '61196' => 1, '62137' => 1, '62899' => 1, '2138' => 1, '8742' => 1,
    '36939' => 1, '42419' => 1, '56044' => 1
  }.freeze

  # Each pair is an exact, reviewed Korean phrase and its rite-only replacement.
  ROW_REPLACEMENTS = {
    '410' => [
      ['‘개화’ 의식에서', '‘개화 의식(The Flowering)’에서'],
      ['‘개화’에서', '‘개화 의식(The Flowering)’에서']
    ],
    '2188' => [['개화(Flowering)', '개화 의식(The Flowering)']],
    '3954' => [['개화 의식(Flowering)', '개화 의식(The Flowering)']],
    '5139' => [
      ['개화의 때', '개화 의식(The Flowering)의 때'],
      ['개화도', '개화 의식(Flowering)도']
    ],
    '9287' => [['개화의 선물', '개화 의식(The Flowering)의 선물']],
    '11245' => [["'개화(The Flowering)' 의식을", "'개화 의식(The Flowering)'을"]],
    '16997' => [['개화', CANONICAL]],
    '17629' => [['개화 의식', CANONICAL]],
    '19840' => [['의식인 ‘개화’가', '‘개화 의식(The Flowering)’이']],
    '21090' => [['개화 의식을', '개화 의식(The Flowering)을']],
    '24310' => [['개화 의식만큼', '개화 의식(The Flowering)만큼']],
    '27492' => [["'개화 의식'", "'개화 의식(The Flowering)'"]],
    '27677' => [
      ["의식인 '개화(The Flowering)'를", "'개화 의식(The Flowering)'을"]
    ],
    '30327' => [['개화란', '개화 의식(The Flowering)이란']],
    '39976' => [['개화', CANONICAL]],
    '52104' => [['개화(Flowering)도', '개화 의식(The Flowering)도']],
    '52164' => [['개화(Flowering)는', '개화 의식(The Flowering)은']],
    '56790' => [['개화제에', '개화 의식(The Flowering)에']],
    '59107' => [["'개화' 의식은", "'개화 의식(The Flowering)'은"]],
    '61196' => [['개화기(Flowering)가', '개화 의식(The Flowering)이']],
    '62137' => [['개화기(Flowering)에', '개화 의식(The Flowering)에']],
    '62899' => [['개화 의식에', '개화 의식(The Flowering)에']]
  }.freeze

  ANNOTATION_COUNTS = {
    '410' => { 'The Flowering' => 2 },
    '2188' => { 'The Flowering' => 1 },
    '3954' => { 'The Flowering' => 1 },
    '5139' => { 'The Flowering' => 1, 'Flowering' => 1 },
    '9287' => { 'The Flowering' => 1 },
    '11245' => { 'The Flowering' => 1 },
    '16997' => { 'The Flowering' => 1 },
    '17629' => { 'The Flowering' => 1 },
    '19840' => { 'The Flowering' => 1 },
    '21090' => { 'The Flowering' => 1 },
    '24310' => { 'The Flowering' => 1 },
    '27492' => { 'The Flowering' => 1 },
    '27677' => { 'The Flowering' => 1 },
    '30327' => { 'The Flowering' => 1 },
    '39976' => { 'The Flowering' => 1 },
    '52104' => { 'The Flowering' => 1 },
    '52164' => { 'The Flowering' => 1 },
    '56790' => { 'The Flowering' => 1 },
    '59107' => { 'The Flowering' => 1 },
    '59859' => { 'The Flowering' => 1 },
    '61196' => { 'The Flowering' => 1 },
    '62137' => { 'The Flowering' => 1 },
    '62899' => { 'The Flowering' => 1 }
  }.freeze

  RITE_EVIDENCE = 'The English-aligned contexts identify the recurring Fae ceremony and its seasonal role; Japanese 開花の儀/開花 and Chinese 花期/开花 corroborate without adding lore claims. Register event:the-flowering as the named rite, not a book or a generic blooming process. Use 개화 의식(The Flowering), preserving article-bearing The Flowering and the one bare Flowering in default:5139. Default:52164 calls it a Ballad, but still refers to this same ceremony; do not create a separate work. Preserve all unrelated entity labels, particles, opaque tokens, quotes, line breaks, and prior dispositions.'

  EXCLUSION_EVIDENCE = {
    '2138' => 'Exclude the ordinary phrase “flowering of human magic”; it describes a historical flourishing, not the named Fae rite.',
    '8742' => 'Exclude the Crymbil race’s “flowering” in Martenshire; English describes cultural development, not the named Fae rite.',
    '36939' => 'Exclude the “flowering vine” simile for Rathir; this is ordinary descriptive language.',
    '42419' => 'Exclude “flowering hand”; it describes decorative handwriting.',
    '56044' => 'Exclude “their flowering”; the aligned context describes literal blossoms.'
  }.freeze

  def source_inventory
    M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
  end

  def definition(headers)
    fields = {
      'entity_key' => ENTITY,
      'english_canonical' => 'The Flowering',
      'category' => 'named event',
      'korean_canonical' => CANONICAL,
      'english_aliases' => 'Flowering',
      'korean_variants' => '개화|개화기|개화 의식|개화제',
      'evidence_ids' => "D-#{D}|default:17629|default:27492|default:52164|default:59107|default:59859",
      'status' => 'confirmed',
      'notes' => RITE_EVIDENCE
    }
    headers.to_h { |header| [header, fields.fetch(header, '')] }
  end

  def expected_keys
    EXPECTED_KEYS
  end

  def exact_replace(text, from, to, key)
    old_count = text.scan(Regexp.new(Regexp.escape(from))).length
    new_count = text.scan(Regexp.new(Regexp.escape(to))).length
    if new_count.positive?
      residue = text.gsub(Regexp.new(Regexp.escape(to)), '')
      return text if residue.scan(Regexp.new(Regexp.escape(from))).empty?
    end
    raise "Flowering span count differs for #{key.inspect}: #{from.inspect} (#{old_count})" unless old_count == 1

    text.sub(from, to)
  end

  def normalize(text, key)
    replacements = ROW_REPLACEMENTS.fetch(key.fetch(1), [])
    replacements.reduce(text) do |result, (from, to)|
      exact_replace(result, from, to, key)
    end
  end

  def reviews(inventory, glossary_headers)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    entity_definition = definition(glossary_headers)
    generated = build_occurrences(inventory.values, [entity_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.map { |row| M.key(row) }
    raise 'Flowering exact 28-key source coverage differs' unless
      generated_keys.sort == expected_keys.sort
    raise 'Flowering candidate keys are duplicated' unless generated_keys.uniq.length == 28

    generated.sort_by do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      id = key.fetch(1)
      english_count = english.scan(/(?<![A-Za-z])flowering(?![A-Za-z])/i).length
      raise "Flowering English occurrence count differs for #{key.inspect}" unless
        english_count == ENGLISH_COUNTS.fetch(id)

      if RITE_IDS.include?(id)
        new_text = normalize(old, key)
        expected_annotations = ANNOTATION_COUNTS.fetch(id)
        actual_annotations = new_text.scan(/\((?:The )?Flowering\)/).map do |label|
          label == '(The Flowering)' ? 'The Flowering' : 'Flowering'
        end.each_with_object(Hash.new(0)) { |label, counts| counts[label] += 1 }.to_h
        raise "Flowering Korean annotation count differs for #{key.inspect}" unless
          actual_annotations == expected_annotations
        status = new_text == old ? 'not-an-issue' : 'accepted'
        evidence = RITE_EVIDENCE
      else
        new_text = old
        status = 'excluded'
        evidence = EXCLUSION_EVIDENCE.fetch(id)
      end

      raise "Flowering opaque token or line-break change #{key.inspect}" unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
          new_text.scan(ReviewedProperNameDiscovery::OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)

      occurrence.merge(
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{evidence} Exact English, Japanese, and Chinese source texts are attached; Korean edits are confined to the explicit row-scoped rite spans.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      )
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'Flowering discovery proposal already exists' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    inventory = source_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    entity_definition = definition(glossary.headers)
    raise 'Flowering entity is already registered' if
      glossary.any? { |row| row['entity_key'] == ENTITY }

    reviews = reviews(inventory, glossary.headers)
    generated = build_occurrences(inventory.values, [entity_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    ReviewedProperNameDiscovery.validate!(
      [entity_definition], reviews, generated,
      glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'Flowering edit count differs' unless
      reviews.count { |row| row['old'] != row['new'] } == 22

    [glossary.headers, entity_definition, reviews]
  end

  def apply
    headers, entity_definition, reviewed = prepare
    M.write_table(DEFINITIONS, headers, [entity_definition])
    M.write_table(REVIEWS, M::HEADERS, reviewed)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare']
    _headers, _definition, rows = TheFloweringRiteD21543.prepare
    puts "D-#{TheFloweringRiteD21543::D}: #{rows.length} keys; " \
         "#{rows.count { |row| row['old'] != row['new'] }} edits; in-memory only."
  when ['apply']
    TheFloweringRiteD21543.apply
  else
    abort 'usage: review-the-flowering-rite-D21543.rb [prepare|apply]'
  end
end
