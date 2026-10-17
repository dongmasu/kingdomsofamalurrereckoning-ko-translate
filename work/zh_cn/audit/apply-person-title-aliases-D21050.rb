#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PersonTitleAliasesD21050
  M = ReviewedNameBatches
  GLOSSARY_PATH = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21050.tsv'
  BACKUP_ROOT = '/private/tmp/ko-translate-backups/20261015'
  REVIEW_STATES = %w[needs-context accepted not-an-issue uncertain].freeze
  ENTRIES = [
    {
      'entity_key' => 'person:aethan-engar',
      'english_aliases' => ['Savant Engar'],
      'korean_variants' => ['사반트 엔가르', '사반트 엥가르', '현자 엔가르',
                            '학자 엔가르', '석학 엔가르', '엔가르 석학'],
      'notes' => 'D-21050 reuses the established formal rank 사반트 and the D-19512 canonical Engar spelling 엥가르. Aethan Engar remains a distinct full-name display form.'
    },
    {
      'entity_key' => 'person:egan',
      'english_aliases' => ['Brother Egan'],
      'korean_variants' => ['에간 형제', '형제 에간', '에간 수사',
                            '에간 수도사', '브라더 에간'],
      'notes' => "D-21050 identifies Brother Egan as the named monk in the mission context; Japanese ブラザー・イーガン and Chinese 伊根修士 corroborate the identity. Use 에간 수사(Brother Egan)."
    },
    {
      'entity_key' => 'person:fallon',
      'english_aliases' => ['Brother Fallon'],
      'korean_variants' => ['팰런 형제', '브라더 팰런', '팰런 수사',
                            '팰런 수도사', '수사 팰런', '수도사 팰런'],
      'notes' => "D-21050 identifies Brother Fallon as the named monk; Japanese ブラザー・ファロン and Chinese 法伦修士/法伦和尚 corroborate. Use 팰런 수사(Brother Fallon)."
    },
    {
      'entity_key' => 'person:canwen',
      'english_aliases' => ['Captain Canwen'],
      'korean_variants' => ['캔웬 선장', '캡틴 캔웬', '캔웬 대장', '캔웬 대위'],
      'notes' => 'D-21050 verified Captain Canwen as the military commander of Camp Moondown; Japanese 隊長 and Chinese 队长 support the Korean command title 대장, not the naval 선장.'
    }
  ].freeze
  TIL = {
    'entity_key' => 'person:til',
    'english_canonical' => 'Til',
    'category' => 'person',
    'korean_canonical' => '틸(Til)',
    'english_aliases' => 'Brother Til',
    'korean_variants' => '틸|티르|틸 형제|틸 수사|틸 수도사|브라더 틸',
    'evidence_ids' => 'D-21050|base:2294:11|default:11145|default:54166',
    'status' => 'confirmed',
    'notes' => "English identifies Til as the deceased Scripture Master of St. Odwig's Perpetual Mission. Japanese ティル and Chinese 蒂尔 corroborate; full references use 틸 수사(Brother Til), while short references use 틸(Til). The isolated bilingual label at default:53142 is recorded as the name label without inferring extra biography. Apostrophe-prefixed 'Til/'til contractions at default:20906 and default:52775 mean until, not the person. No PAK-derived evidence."
  }.freeze
  GROUPS = [
    {
      'entity_key' => 'person:aethan-engar',
      'personal_pattern' => /(?<![A-Za-z])Aethan Engar(?![A-Za-z])/,
      'full_pattern' => /(?<![A-Za-z])Savant Engar(?![A-Za-z])/,
      'name_pattern' => /(?<![가-힣])(?:(?:사반트|현자|학자|석학)\s+)?(?:에이선|에이던|에단|이선)\s+(?:엔가르|엥가르)(?:\((?:Savant )?Aethan Engar\))?|(?<![가-힣])(?:(?:사반트|현자|학자|석학)\s*)?(?:엔가르|엥가르|엔가)(?:\s*(?:석학|현자|학자))?(?:\((?:Savant Engar|Engar)\))?/,
      'personal_name_pattern' => /(?<![가-힣])(?:(?:사반트|현자|학자|석학)\s+)?(?:에이선|에이던|에단|이선)\s+(?:엔가르|엥가르)(?:\((?:Savant )?Aethan Engar\))?/,
      'short_pattern' => /(?<![A-Za-z])Engar(?![A-Za-z])/,
      'title' => '사반트 엥가르(Savant Engar)',
      'short' => '엥가르(Engar)',
      'evidence' => ENTRIES[0]['notes']
    },
    {
      'entity_key' => 'person:egan',
      'full_pattern' => /(?<![A-Za-z])Brother Egan(?![A-Za-z])/,
      'name_pattern' => /(?<![가-힣])(?:브라더\s+)?(?:에간|에건|이건(?=\(Egan\)))(?:\((?:Brother Egan|Egan)\))?(?:\s*(?:형제|수사|수도사)(?:\((?:Brother Egan|Egan)\))?님?)?|(?<![가-힣])(?:형제|수사|수도사)\s+(?:에간|에건)(?:\((?:Brother Egan|Egan)\))?/,
      'short_pattern' => /(?<![A-Za-z])Egan(?![A-Za-z])/,
      'title' => '에간 수사(Brother Egan)',
      'short' => '에간(Egan)',
      'row_overrides' => {
        ['default', '41033', ''] => {
          'pattern' => /이건 에간\(Egan\) 수사를/,
          'replacement' => '에간 수사(Brother Egan)를',
          'note' => 'The leading Korean 이건 is an accidental duplicated rendering, not a second English name; English, Japanese, and Chinese identify one Brother Egan.'
        },
        ['default', '44623', ''] => {
          'pattern' => /에간\(Egan\) 형제를 걱정하고 있다\. 에간\(Egan\)은/,
          'replacement' => '에간 수사(Brother Egan)를 걱정하고 있다. 그는',
          'note' => 'English names Brother Egan once, then refers to him as “The monk”; Japanese and Chinese likewise use a pronoun/description on the second clause. Remove the redundant Korean name repetition.'
        }
      },
      'evidence' => ENTRIES[1]['notes']
    },
    {
      'entity_key' => 'person:fallon',
      'full_pattern' => /(?<![A-Za-z])Brother Fallon(?![A-Za-z])/,
      'name_pattern' => /(?<![가-힣])(?:브라더\s+)?(?:팰런|팔론|파론|패런|팔런|폴런|폴론)(?:\((?:Brother Fallon|Fallon)\))?(?:\s*(?:형제|수사|수도사)(?:\((?:Brother Fallon|Fallon)\))?님?)?|(?<![가-힣])(?:형제|수사|수도사)\s+(?:팰런|팔론|파론|패런|팔런|폴런|폴론)(?:\((?:Brother Fallon|Fallon)\))?/,
      'short_pattern' => /(?<![A-Za-z])Fallon(?![A-Za-z])/,
      'title' => '팰런 수사(Brother Fallon)',
      'short' => '팰런(Fallon)',
      'evidence' => ENTRIES[2]['notes']
    },
    {
      'entity_key' => 'person:canwen',
      'full_pattern' => /(?<![A-Za-z])Captain Canwen(?![A-Za-z])/,
      'name_pattern' => /(?<![가-힣])(?:캡틴\s+)?캔웬(?:\((?:Captain Canwen|Canwen)\))?(?:\s*(?:대장|대위|선장)(?:\((?:Captain Canwen|Canwen)\))?)?/,
      'short_pattern' => /(?<![A-Za-z])Canwen(?![A-Za-z])/,
      'title' => '캔웬 대장(Captain Canwen)',
      'short' => '캔웬(Canwen)',
      'evidence' => ENTRIES[3]['notes']
    },
    {
      'entity_key' => 'person:til',
      'full_pattern' => /(?<![A-Za-z'])Brother Til(?![A-Za-z])/,
      'name_pattern' => /(?<![가-힣])(?:브라더\s+)?(?:틸|티르)(?:\((?:Brother Til|Til)\))?(?:\s*(?:형제|수사|수도사)(?:\((?:Brother Til|Til)\))?님?)?/,
      'short_pattern' => /(?<![A-Za-z'])Til(?![A-Za-z])/,
      'title' => '틸 수사(Brother Til)',
      'short' => '틸(Til)',
      'evidence' => TIL['notes']
    }
  ].freeze

  module_function

  def append_terms(old, values)
    (old.to_s.split('|').reject(&:empty?) + values).uniq.join('|')
  end

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def source_sequence(text, group)
    personal = group['personal_pattern']
    full = group.fetch('full_pattern')
    short = group.fetch('short_pattern')
    alternatives = [personal, full, short].compact.map { |candidate| "(?:#{candidate})" }
    pattern = Regexp.new(alternatives.join('|'))
    text.to_enum(:scan, pattern).map do
      match = Regexp.last_match[0]
      if personal && personal.match?(match)
        :personal
      elsif full.match?(match)
        :title
      else
        :short
      end
    end
  end

  def korean_matches(text, pattern)
    text.to_enum(:scan, pattern).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0), match[0]]
    end
  end

  def replacements_for(source, group)
    english = texts(source, 'en').join("\n")
    source_types = source_sequence(english, group)
    current = source.fetch('work_text')
    override = group.fetch('row_overrides', {})[M.key(source)]
    if override
      raise "override source mismatch at #{M.key(source).inspect}" unless
        english.match?(group.fetch('full_pattern'))
      raise "override Korean mismatch at #{M.key(source).inspect}" unless
        current.scan(override.fetch('pattern')).length == 1
      return current.sub(override.fetch('pattern'), override.fetch('replacement'))
    end
    matches = korean_matches(current, group.fetch('name_pattern'))
    if group['personal_name_pattern']
      matches = korean_matches(current, Regexp.union(
        group.fetch('personal_name_pattern'), group.fetch('name_pattern')
      ))
    end
    if source_types.length != matches.length
      raise "#{group['entity_key']} source/name count mismatch at #{M.key(source).inspect}: English=#{source_types.inspect} Korean=#{matches.map(&:last).inspect}"
    end
    edits = matches.zip(source_types).map do |(_from, to, korean), source_type|
      value = case source_type
              when :personal then korean
              when :title then group.fetch('title')
              else group.fetch('short')
              end
      value += '님' if source_type != :personal && korean.end_with?('님')
      next_to = to
      unless korean.end_with?('님')
        suffix = current[next_to..]
        particle = %w[으로 로 은 는 이 가 을 를 과 와 아 야].find do |candidate|
          next false unless suffix.start_with?(candidate)
          following = suffix[candidate.length]
          following.nil? || !following.match?(/[가-힣]/)
        end
        if particle
          value += compatible_particle(particle, value)
          next_to += particle.length
        end
      end
      [value, next_to]
    end
    result = current.dup
    matches.zip(edits).reverse_each do |(from, _to, _old), (replacement, to)|
      result[from...to] = replacement
    end
    result
  end

  def compatible_particle(particle, korean_display)
    korean = korean_display[/[가-힣]+(?=\()/]
    last = korean&.chars&.last
    has_final = last && ((last.ord - 0xAC00) % 28).positive?
    case particle
    when '은', '는' then has_final ? '은' : '는'
    when '이', '가' then has_final ? '이' : '가'
    when '을', '를' then has_final ? '을' : '를'
    when '과', '와' then has_final ? '과' : '와'
    when '으로', '로'
      has_final && (last.ord - 0xAC00) % 28 != 8 ? '으로' : '로'
    when '아', '야' then has_final ? '아' : '야'
    else particle
    end
  end

  def add_definition!(glossary, definition)
    row = glossary.find { |entry| entry['entity_key'] == definition.fetch('entity_key') }
    raise "missing glossary entity #{definition['entity_key']}" unless row
    row['english_aliases'] = append_terms(row['english_aliases'], definition.fetch('english_aliases'))
    row['korean_variants'] = append_terms(row['korean_variants'], definition.fetch('korean_variants'))
    row['evidence_ids'] = append_terms(row['evidence_ids'], ["D-21050:#{definition['entity_key']}"])
    row['notes'] = [row['notes'], definition.fetch('notes')].reject(&:empty?).join(' ')
  end

  def validate_glossary!(glossary)
    raise 'duplicate glossary entity key' unless glossary.map { |row| row.fetch('entity_key') }.uniq.length == glossary.length
    introduced_entities = ENTRIES.map { |entry| entry.fetch('entity_key') } + [TIL.fetch('entity_key')]
    owners = Hash.new { |hash, term| hash[term] = [] }
    glossary.each do |row|
      ([row.fetch('english_canonical')] + row['english_aliases'].to_s.split('|')).reject(&:empty?).each do |term|
        owners[term.downcase] << row.fetch('entity_key')
      end
    end
    collision = owners.find do |_term, entities|
      entities.uniq.length > 1 && (entities & introduced_entities).any?
    end
    raise "glossary English collision #{collision.inspect}" if collision
  end

  def run
    raise "output already exists: #{REVIEW_PATH}" if File.exist?(REVIEW_PATH)
    [21050, 21051, 21052, 21053, 21054].each do |d|
      raise "D-#{d} artifacts already exist" if File.exist?(File.join(M::AUDIT, "named-scope-review-D#{d}-20261015.md"))
    end

    inventory = M.refresh_inventory
    glossary_table = M.table(GLOSSARY_PATH)
    glossary = glossary_table.map(&:to_h)
    ENTRIES.each { |entry| add_definition!(glossary, entry) }
    raise 'Til entity already exists' if glossary.any? { |row| row['entity_key'] == TIL['entity_key'] }
    glossary << TIL.dup
    validate_glossary!(glossary)

    generated = build_occurrences(inventory.values, glossary).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index_table = M.table(M::INDEX)
    index_headers = index_table.headers
    index = index_table.map(&:to_h)
    indexed = index.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    generated_by_key = generated.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    raise 'duplicate generated occurrence key' unless generated_by_key.length == generated.length

    changed_terms = ENTRIES.flat_map { |entry| entry.fetch('english_aliases') }
    reviews_by_row = {}
    GROUPS.each do |group|
      inventory.each_value do |source|
        english = texts(source, 'en').join("\n")
        has_title = group.fetch('full_pattern').match?(english)
        is_til_key = group['entity_key'] == 'person:til' &&
          english.match?(/(?<![A-Za-z'])Til(?![A-Za-z])/)
        next unless has_title || is_til_key

        row_key = M.key(source)
        entity_key = group.fetch('entity_key')
        index_key = [entity_key, *row_key]
        raise "missing generated title occurrence #{index_key.inspect}" unless generated_by_key.key?(index_key)

        slot = reviews_by_row[row_key] ||= {
          'source' => source,
          'entities' => {},
          'new' => source.fetch('work_text')
        }
        raise "conflicting source row #{row_key.inspect}" unless slot['source'].equal?(source)
        slot['entities'][entity_key] = group
      end
    end

    # The case-insensitive single-token index also sees apostrophe-prefixed "'til"/"'Til".
    generated.select { |row| row['entity_key'] == 'person:til' }.each do |row|
      source = inventory.fetch(M.key(row))
      english = texts(source, 'en').join("\n")
      next if english.match?(/(?<![A-Za-z'])Til(?![A-Za-z])/)

      slot = reviews_by_row[M.key(source)] ||= {
        'source' => source,
        'entities' => {},
        'new' => source.fetch('work_text')
      }
      slot['entities']['person:til'] = :excluded_lowercase_til
    end

    reviews = reviews_by_row.keys.sort_by do |resource, id, variant|
      [M::RESOURCES.index(resource), id.to_i, variant.to_s]
    end.map do |row_key|
      slot = reviews_by_row.fetch(row_key)
      source = slot.fetch('source')
      old = source.fetch('work_text')
      entities = slot.fetch('entities')
      new_text = old
      dispositions = {}
      evidence = []
      entities.each do |entity_key, group|
        if group == :excluded_lowercase_til
          dispositions[entity_key] = 'excluded'
          evidence << "English apostrophe-prefixed 'Til/'til at #{row_key.join(':')} is a contraction meaning until, not the person Til."
          next
        end
        proposed = replacements_for(source, group)
        # Each title group is validated against the same original cell, then
        # merged only when its replacement spans do not overlap.
        new_text = M.rebase_review(old, proposed, new_text)
        dispositions[entity_key] = proposed == old ? 'not-an-issue' : 'accepted'
        evidence << group.fetch('evidence')
        row_note = group.fetch('row_overrides', {})[row_key]
        evidence << row_note.fetch('note') if row_note
      end
      status = if new_text != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               elsif dispositions.values.include?('uncertain')
                 'uncertain'
               else
                 'not-an-issue'
               end
      {
        'resource' => row_key[0],
        'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2].to_s,
        'entity_key' => entities.keys.join('|'),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence.uniq.join(' '),
        'english' => texts(source, 'en').join("\n"),
        'japanese' => texts(source, 'ja').join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    raise 'duplicate reviewed resource/ID/variant key' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'missing source comparison evidence' if reviews.any? do |row|
      %w[english japanese chinese].any? { |field| row.fetch(field).strip.empty? }
    end
    new_pairs = generated_by_key.keys - indexed.to_a
    missing_reviews = generated.select do |row|
      new_pairs.include?([row['entity_key'], *M.key(row)])
    end - generated.select do |row|
      reviews_by_row.key?(M.key(row)) &&
        reviews_by_row.fetch(M.key(row))['entities'].key?(row['entity_key'])
    end
    raise "unreviewed new title occurrences: #{missing_reviews.map { |row| [row['entity_key'], *M.key(row)] }.first(20).inspect}" unless
      missing_reviews.empty?

    # Carry aliases into existing rows without repeatedly scanning the full index.
    index_by_key = index.to_h do |row|
      [[row['entity_key'], *M.key(row)], row]
    end
    generated.each do |row|
      key = [row['entity_key'], *M.key(row)]
      existing = index_by_key[key]
      if existing
        terms = (existing['matched_english'].to_s.split('|') + row['matched_english'].to_s.split('|')).uniq
        existing['matched_english'] = terms.join('|')
      else
        index << row
        index_by_key[key] = row
      end
    end
    index.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante'].to_s, row['entity_key']]
    end

    M.write_table(GLOSSARY_PATH, glossary_table.headers, glossary)
    M.write_table(M::INDEX, index_headers, index)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    allowed_states = (REVIEW_STATES + ['excluded']).uniq
    M.run(REVIEW_PATH, 21050, nil, review_states: allowed_states)
    puts "Title alias rows reviewed: #{reviews.length}; groups=#{ENTRIES.map { |entry| entry['entity_key'] } + [TIL['entity_key']]}"
  end
end

PersonTitleAliasesD21050.run if $PROGRAM_NAME == __FILE__
