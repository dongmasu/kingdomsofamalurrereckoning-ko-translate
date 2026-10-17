#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ChaosMagicWeaponsD21522
  extend self

  M = ReviewedNameBatches
  D = 21_522
  MAGIC = 'lore_term:chaos-magic'
  WEAPON = 'item:chaos-weapon'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  MAGIC_IDS = %w[
    350 376 2712 3417 7912 9188 9966 13514 25148 26230 27609 28806
    31656 35898 37903 39309 43912 48476 48626 48918 49685 50487 50552
    51854 52470 55546 58200 59182 59485 61754 63990 64195 64290
  ].freeze
  WEAPON_IDS = %w[
    144 2295 3138 5255 6549 9515 9945 9966 11314 11574 12596 12654
    13857 17669 18507 21383 22424 22924 25542 26266 27165 29837 30035
    31656 32925 32966 34509 35736 35745 38304 38663 40080 40641 43683
    46217 47188 48007 48085 49092 50227 50838 51825 52188 54389 55085
    56572 56769 58848 58931 59599 59768 60494 61394 62289 63443 64393
  ].freeze
  CORE_ONLY_IDS = %w[2295 3138 13857 22424 31656 55085].freeze
  WEAPON_TOKEN_IDS = %w[9945 56572 61394].freeze
  MAGIC_SOURCE = /(?<![A-Za-z])Chaos Magic(?![A-Za-z])/i
  WEAPON_SOURCE = /(?<![A-Za-z])Chaos Weapons?(?![A-Za-z])/i
  INDEPENDENT_WEAPON = /(?<![A-Za-z])Chaos Weapons?(?![A-Za-z])(?!(?:\s+cores?\b))/i
  INITIAL_EVIDENCE = 'Candidate hit from the English source; verify this occurrence in context.'
  # Full EN/JA/ZH cells for all 87 reviewed keys, not Korean cells or shared inventory.
  SOURCE_SHA256 = '5735a0d8fe81ac9ca56e5a0f495304f549f1681925bd2e6c2ee8ec8af00f30ff'
  MAGIC_NOTE = 'English Chaos Magic names a recurring magical force/field of knowledge, ' \
               'not one skill: default:376 discusses its oldest reports, default:37903 ' \
               'links it to Niskaru summoning, and default:61754 describes experiments. ' \
               'Japanese 混沌の魔法 and Chinese 混乱魔法/混沌魔法 support this meaning. ' \
               'Register lore_term:chaos-magic as 혼돈 마법(Chaos Magic), without a bare ' \
               'Magic alias or ownership of Chaos Sight, artifacts, or other Chaos terms.'
  WEAPON_NOTE = 'English default:9945 defines Chaos Weapons as a weapon type that deals ' \
                'Chaos Damage and breaks Chaos Armor; default:25542 contrasts it with ' \
                'non-Chaos weapons. Japanese 混沌の武器 and Chinese 混乱武器/混沌武器 ' \
                'corroborate. Register item:chaos-weapon as the technical class ' \
                '혼돈 무기(Chaos Weapon), not a unique item or person. The only alias ' \
                'is the grammatical plural Chaos Weapons. Preserve source-local ' \
                'singular/plural labels and complete negated labels at default:25542. ' \
                'Chaos Weapon Core(s)/core components belong separately to D-21521; ' \
                'six core-only parent matcher hits are excluded, not duplicate core ' \
                'objects. At default:26266/63443 annotate only independent weapons.'
  COMMON_NOTE = 'Name/annotation scope only. Preserve unrelated wording, particles, ' \
                'opaque marker contents, exact line breaks, other entity decisions, ' \
                'and historical narrative dispositions. Append annotations outside ' \
                'opaque Korean name markers. Do not resolve default:43683 salvation. ' \
                'No source edits, PAK evidence, or historical recount.'
  SPECS = {
    MAGIC => {
      english: 'Chaos Magic', korean: '혼돈 마법(Chaos Magic)', category: 'lore term',
      aliases: '', variants: '혼돈 마법', note: MAGIC_NOTE
    },
    WEAPON => {
      english: 'Chaos Weapon', korean: '혼돈 무기(Chaos Weapon)', category: 'item',
      aliases: 'Chaos Weapons', variants: '혼돈 무기|혼돈의 무기', note: WEAPON_NOTE
    }
  }.freeze
  SPECIAL_SPANS = {
    '25542' => [
      ['혼돈 무기로', '혼돈 무기(Chaos Weapons)로'],
      ['혼돈 무기가 아닌 다른 무기', '혼돈 무기가 아닌 다른 무기(non-Chaos Weapons)'],
      ['혼돈 무기를,', '혼돈 무기(Chaos Weapon)를,'],
      ['비혼돈 무기를 장착하는', '비혼돈 무기(non-Chaos weapon)를 장착하는']
    ],
    '26266' => [['혼돈 무기를', '혼돈 무기(Chaos Weapon)를']]
  }.transform_values { |spans| spans.map(&:freeze).freeze }.freeze

  def expected_pairs
    MAGIC_IDS.map { |id| [MAGIC, 'default', id, ''] } +
      WEAPON_IDS.map { |id| [WEAPON, 'default', id, ''] }
  end

  def expected_keys
    expected_pairs.map { |pair| pair.drop(1) }.uniq.sort_by { |key| key[1].to_i }
  end

  def definitions_for(headers)
    SPECS.map do |entity, spec|
      values = {
        'entity_key' => entity, 'english_canonical' => spec.fetch(:english),
        'korean_canonical' => spec.fetch(:korean), 'category' => spec.fetch(:category),
        'english_aliases' => spec.fetch(:aliases), 'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => "D-#{D}|D-#{D + 1}", 'status' => 'confirmed',
        'notes' => "#{spec.fetch(:note)} #{COMMON_NOTE}"
      }
      headers.to_h { |header| [header, values.fetch(header, '')] }
    end
  end

  def source_inventory
    M::RESOURCES.flat_map do |resource|
      rows = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *rows).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end.each_with_object({}) do |row, inventory|
      key = M.key(row)
      raise "duplicate aligned source key #{key.inspect}" if inventory.key?(key)

      inventory[key] = row
    end
  end

  def generated_for(inventory, definitions)
    build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def validate_scope!(inventory, generated)
    pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Chaos exact 33+56 lexical source coverage differs' unless
      pairs.sort == expected_pairs.sort && pairs.uniq == pairs
    facts = expected_keys.sort.map do |key|
      source = inventory.fetch(key)
      [key, source.fetch('en_texts_json'), source.fetch('ja_texts_json'), source.fetch('zh_text')]
    end
    raise 'reviewed Chaos EN/JA/ZH source cells differ' unless
      Digest::SHA256.hexdigest(JSON.generate(facts)) == SOURCE_SHA256
    true
  end

  def english_for(source)
    parts = JSON.parse(source.fetch('en_texts_json')).compact
    raise "multiple English alignments #{M.key(source).inspect}" unless parts.one?

    parts.first
  end

  def weapon_labels(id, english)
    labels = english.scan(INDEPENDENT_WEAPON).map do |term|
      term.downcase.end_with?('weapons') ? 'Chaos Weapons' : 'Chaos Weapon'
    end
    # The existing Korean tutorial omits "Chaos" on its last high-quality weapon
    # mention; do not invent a seventh Korean name or rewrite the sentence.
    labels = labels.take(6) if id == '9945'
    labels *= 2 if id == '59599'
    labels
  end

  def replace_span(text, old_span, new_span, key)
    new_count = text.scan(Regexp.new(Regexp.escape(new_span))).length
    rest = text.gsub(new_span, '')
    return text if new_count == 1 && !rest.include?(old_span)

    raise "reviewed Korean span differs #{key.inspect}: #{old_span}" unless
      new_count.zero? && text.scan(Regexp.new(Regexp.escape(old_span))).length == 1
    text.gsub(old_span, new_span)
  end

  def normalize_entity(entity, text, source)
    key = M.key(source)
    id = key[1]
    raise "unreviewed Chaos entity/key #{[entity, *key].inspect}" unless
      expected_pairs.include?([entity, *key])
    return text if entity == WEAPON && CORE_ONLY_IDS.include?(id)

    english = english_for(source)
    if entity == WEAPON && SPECIAL_SPANS.key?(id)
      return SPECIAL_SPANS.fetch(id).reduce(text) do |proposed, (old_span, new_span)|
        replace_span(proposed, old_span, new_span, key)
      end
    end

    labels = entity == MAGIC ?
      Array.new(english.scan(MAGIC_SOURCE).length, 'Chaos Magic') :
      weapon_labels(id, english)
    korean = entity == MAGIC ? '혼돈 마법' : '혼돈 무기'
    name_pattern = entity == MAGIC ?
      /(?<![가-힣A-Za-z])혼돈 마법(?:\(Chaos Magic\))?(?!\()/ :
      /(?<![가-힣A-Za-z])혼돈(?:의)? 무기(?:\(Chaos Weapons?\))?(?!\()/
    # Match whole opaque spans first, so no interior token byte is rewritten.
    pattern = Regexp.new(
      "(?:#{ReviewedProperNameDiscovery::OPAQUE.source})(?:\\([^()\\r\\n]*\\))?|" \
      "(?:#{name_pattern.source})"
    )
    slot = 0
    proposed = text.gsub(pattern) do |match|
      if match.match?(/\A(?:#{ReviewedProperNameDiscovery::OPAQUE.source})/)
        next match unless entity == WEAPON && WEAPON_TOKEN_IDS.include?(id) &&
                          match.start_with?('{*1혼돈 무기}')
        raise "unreviewed Chaos token annotation #{key.inspect}" unless
          match.match?(/\A\{\*1혼돈 무기\}(?:\(Chaos Weapons?\))?\z/)

        label = labels.fetch(slot) { raise "extra Chaos token name #{key.inspect}" }
        slot += 1
        "{*1혼돈 무기}(#{label})"
      else
        label = labels.fetch(slot) { raise "extra Chaos Korean name #{key.inspect}" }
        slot += 1
        "#{korean}(#{label})"
      end
    end
    raise "missing Chaos Korean names #{key.inspect}" unless slot == labels.length
    proposed
  end

  def normalize(text, source, entities)
    proposed = entities.reduce(text) { |value, entity| normalize_entity(entity, value, source) }
    raise "Chaos transform changed opaque bytes/line breaks #{M.key(source).inspect}" unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        proposed.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      text.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    proposed
  end

  def context_note(id)
    case id
    when *CORE_ONLY_IDS
      'Weapon substring is solely a complete core/core-component name: exclude the ' \
        'parent Weapon occurrence and preserve D-21521 ownership. At 31656 only Magic changes; ' \
        'the Chinese extra weapon wording does not broaden English scope.'
    when '26266', '63443'
      'A complete core name and an independent weapon coexist; leave the complete ' \
        'core label intact and annotate only the independent weapon. At 63443 Japanese ' \
        'uses generic 武器 for the latter, while English/Chinese explicitly name the class.'
    when '25542'
      'Two positive and two negated weapon labels; attach non-Chaos labels to the ' \
        'complete Korean negations, never label the negative prefix as positive Chaos.'
    when '9945'
      'Seven English full-class mentions, six Korean name spans including the opaque ' \
        'title; retain the existing final high-quality weapon paraphrase without adding prose.'
    when '59599'
      'One English full-class mention; Korean repeats its explicit referent in the ' \
        'second sentence. Pair both existing Korean names with the source plural.'
    when '43683'
      'Prior D-13412 salvation/reclaim/repair nuance remains uncertain; change only ' \
        'the weapon annotation, not 회수하고 or the historical narrative decision.'
    when '56572', '61394'
      'Keep the Korean name token byte-identical and place its plural English label outside.'
    when '37903', '61754'
      'Pair both existing Korean Magic mentions; do not stop after the first bilingual label.'
    when '51825'
      'Three weapon mentions use source-local plural/singular/plural in order.'
    else
      'English explicitly names the magical field or weapon class in this aligned row.'
    end
  end

  def review_source(source, entities)
    key = M.key(source)
    id = key[1]
    english = english_for(source)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    entities.each do |entity|
      ja_anchor = entity == MAGIC ? '混沌の魔法' : '混沌の武器'
      zh_anchor = entity == MAGIC ? /混[乱沌]魔法/ : /混[乱沌]武器|Chaos weapon/i
      raise "Chaos locale support differs #{[entity, *key].inspect}" unless
        japanese.include?(ja_anchor) && chinese.match?(zh_anchor)
    end
    old = source.fetch('work_text')
    new_text = normalize(old, source, entities)
    dispositions = entities.to_h do |entity|
      status = if entity == WEAPON && CORE_ONLY_IDS.include?(id)
                 'excluded'
               elsif normalize_entity(entity, old, source) == old
                 'not-an-issue'
               else
                 'accepted'
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
      'resource' => key[0], 'ID_Linha' => id, 'Tipo_Variante' => key[2],
      'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => "#{key.join(':')}: #{context_note(id)} " \
                    "English local Magic labels=#{english.scan(MAGIC_SOURCE).inspect}; " \
                    "Weapon lexical labels=#{english.scan(WEAPON_SOURCE).inspect}; " \
                    "independent weapon labels=#{english.scan(INDEPENDENT_WEAPON).inspect}. " \
                    "#{entities.map { |entity| SPECS.fetch(entity).fetch(:note) }.join(' ')} " \
                    "#{COMMON_NOTE}",
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(dispositions)
    }
  end

  def reviews_for(inventory, generated)
    validate_scope!(inventory, generated)
    grouped = generated.group_by { |row| M.key(row) }
    expected_keys.map do |key|
      entities = grouped.fetch(key).map { |row| row.fetch('entity_key') }.sort
      source = inventory.fetch(key)
      review = review_source(source, entities)
      raise "non-idempotent Chaos transform #{key.inspect}" unless
        normalize(review.fetch('new'), source, entities) == review.fetch('new')
      review
    end
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, result|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate occurrence #{key.inspect}" if result.key?(key)

      result[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, current_rows)
    after = prior_records(current_rows)
    before.each do |key, record|
      raise "prior Chaos-unrelated occurrence changed #{key.inspect}" unless after[key] == record
    end
    raise 'Chaos occurrence additions differ' unless
      (after.keys - before.keys).sort == expected_pairs.sort
    true
  end

  def verify_snapshot!(row)
    statuses = JSON.parse(row.fetch('previous_status'))
    evidence = JSON.parse(row.fetch('previous_evidence'))
    own = row.fetch('entity_key').split('|')
    raise "Chaos prior snapshot keys differ #{M.key(row).inspect}" unless
      statuses.keys.sort == own.sort && evidence.keys.sort == own.sort
    raise "Chaos initial candidate snapshots differ #{M.key(row).inspect}" unless
      own.all? { |entity| statuses[entity] == 'needs-context' && evidence[entity] == INITIAL_EVIDENCE }
    true
  end

  def validate_saved_manifest!
    definitions = M.table(DEFINITIONS).map(&:to_h)
    reviews = M.table(REVIEWS).map(&:to_h)
    raise 'saved Chaos definitions differ' unless
      definitions == definitions_for(M.table(DEFINITIONS).headers)
    inventory = source_inventory
    generated = generated_for(inventory, definitions)
    validate_scope!(inventory, generated)
    raise 'saved Chaos row order/coverage differs' unless reviews.map { |row| M.key(row) } == expected_keys
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'saved Chaos edit/disposition counts differ' unless
      reviews.count { |row| row.fetch('old') != row.fetch('new') } == 82 &&
      reviews.count { |row| row.fetch('status') == 'excluded' } == 5
    index = prior_records(M.table(M::INDEX).map(&:to_h))
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    SPECS.each_key do |entity|
      raise "saved Chaos glossary record differs #{entity}" unless
        glossary.select { |row| row.fetch('entity_key') == entity } ==
          definitions.select { |row| row.fetch('entity_key') == entity }
    end
    actual_pairs = index.keys.select { |key| SPECS.key?(key.first) }
    raise 'saved Chaos index coverage differs' unless actual_pairs.sort == expected_pairs.sort
    edits = [D, D + 1].each_with_index.flat_map do |batch, ordinal|
      rows = M.table(File.join(__dir__, "proper-name-edits-D#{batch}.tsv")).map(&:to_h)
      expected = reviews.each_slice(50).to_a.fetch(ordinal)
      raise "saved Chaos batch coverage differs D#{batch}" unless
        rows.map { |row| M.key(row) } == expected.map { |row| M.key(row) }
      rows.each do |row|
        verify_snapshot!(row)
        raise "saved Chaos applied manifest differs #{M.key(row).inspect}" unless
          M::HEADERS.take(12).all? { |field| row[field] == expected.find { |r| M.key(r) == M.key(row) }[field] }
      end
      rows
    end
    edits.each_with_index do |review, ordinal|
      source = inventory.fetch(M.key(review))
      entities = review.fetch('entity_key').split('|')
      replay = review_source(source.merge('work_text' => review.fetch('old')), entities)
      raise "saved Chaos transformation differs #{M.key(review).inspect}" unless
        M::HEADERS.take(12).all? { |field| replay[field] == review[field] }
      # Later unrelated-name edits are allowed; reviewed Chaos spans must stay complete.
      raise "live Chaos labels differ #{M.key(review).inspect}" unless
        normalize(source.fetch('work_text'), source, entities) == source.fetch('work_text')
      JSON.parse(review.fetch('entity_dispositions_json')).each do |entity, status|
        row = index.fetch([entity, *M.key(review)])
        batch = D + ordinal / 50
        raise "saved Chaos index decision differs #{[entity, *M.key(review)].inspect}" unless
          row.fetch('status') == status &&
          row.fetch('evidence') == "D-#{batch}: #{review.fetch('evidence')}"
      end
    end
    true
  end

  def prepare
    [D, D + 1].each { |batch| ReviewedProperNameDiscovery.ensure_unused_batch!(batch) }
    raise 'Chaos discovery outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    inventory = source_inventory
    definitions = definitions_for(glossary.headers)
    generated = generated_for(inventory, definitions)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'Chaos expected 87 keys/82 changes/5 excluded rows' unless
      reviews.length == 87 && reviews.count { |row| row['old'] != row['new'] } == 82 &&
      reviews.count { |row| row['status'] == 'excluded' } == 5
    reviews.select { |row| row['old'] != row['new'] }
      .group_by { |row| row.fetch('resource') }.each do |resource, targets|
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
      end
    puts "D-#{D}/#{D + 1}: 33 Magic + 56 Weapon lexical references; " \
         '50 independent Weapon refs + 6 core-only exclusions; ' \
         '87 distinct keys (50/37); 82 edits, 5 unchanged excluded rows. No writes.'
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'old', 'new'))
    end
    [glossary.headers, definitions, reviews]
  end

  def apply
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    before = prior_records(M.table(M::INDEX).map(&:to_h))
    headers, definitions, reviews = prepare
    raise 'Chaos glossary changed during preparation' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == glossary.map(&:to_h)
    raise 'Chaos occurrence decisions changed during preparation' unless
      prior_records(M.table(M::INDEX).map(&:to_h)) == before
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    verify_prior_records!(before, M.table(M::INDEX).map(&:to_h))
    raise 'Chaos altered prior glossary records' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == glossary.map(&:to_h) + definitions
    validate_saved_manifest!
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ChaosMagicWeaponsD21522.prepare
  when ['apply'] then ChaosMagicWeaponsD21522.apply
  when ['verify'] then puts ChaosMagicWeaponsD21522.validate_saved_manifest!
  else abort 'usage: review-chaos-magic-weapons-D21522.rb [prepare|apply|verify]'
  end
end
