#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module FactionOrganizationContinuation
  M = ReviewedNameBatches
  AUDIT = __dir__
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  OUTPUT = File.join(AUDIT, 'proper-name-reviewed-factions-continuation.tsv')
  OPAQUE = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/

  SPECS = [
    {
      'entity_key' => 'faction:warsworn',
      'english_canonical' => 'Warsworn',
      'category' => 'faction',
      'korean_canonical' => '워스원(Warsworn)',
      'english_aliases' => '',
      'korean_variants' => '워스워른|전쟁맹세단|전쟁맹세자|전쟁서약단|전쟁맹약단|전쟁맹|전쟁의 맹세자|전쟁을 치르는 자들',
      'source_pattern' => /\bWarsworn\b/i,
      'korean_pattern' => /(?<![가-힣A-Za-z0-9_])(?<variant>워스워른|워스원|전쟁맹세단|전쟁맹세자|전쟁서약단|전쟁맹약단|전쟁맹|전쟁의[ \t]+맹세자|전쟁을[ \t]+치르는[ \t]+자들)(?<morph>족|들)?(?:[ \t]*\((?<label>[^()\r\n]*)\))?/i,
      'notes' => 'Official Korean manual names Warsworn as a faction and renders it 워스원 (PDF p. 7, printed pp. 13-14). Japanese ウォースウォーン and Chinese 誓战者 corroborate the faction. Normalize recurring 워스워른/전쟁맹세 translations while retaining full item/title labels and particles.'
    },
    {
      'entity_key' => 'faction:scholia-arcana',
      'english_canonical' => 'Scholia Arcana',
      'category' => 'faction',
      'korean_canonical' => '스콜리아 아르카나(Scholia Arcana)',
      'english_aliases' => 'The Scholia Arcana',
      'korean_variants' => '아르카나 학회|아르카나 대학|숄리아 아르카나|알카나 대학|슈콜리아 아르카나|스콜라 아르카나',
      'source_pattern' => /\bScholia[ \t]+Arcana\b/i,
      'korean_pattern' => /(?<![가-힣A-Za-z0-9_])(?<variant>스콜리아[ \t]+아르카나|숄리아[ \t]+아르카나|슈콜리아[ \t]+아르카나|스콜라[ \t]+아르카나|아르카나[ \t]+학회|아르카나[ \t]+대학|알카나[ \t]+대학)(?<morph>들)?(?:[ \t]*\((?<label>[^()\r\n]*)\))?/i,
      'notes' => 'Official Korean manual names Scholia Arcana as a faction and renders it 스콜리아 아르카나 (PDF p. 7, printed pp. 13-14). Japanese アルカナ大学 and Chinese 奥术学院 corroborate the organization. Preserve complete bilingual chapter, title, and location compounds without adding a nested component label.'
    },
    {
      'entity_key' => 'faction:travelers',
      'english_canonical' => 'Travelers',
      'category' => 'faction',
      'korean_canonical' => '트래블러(Travelers)',
      'english_aliases' => 'Traveler',
      'korean_variants' => '트래블러|트래블러스|트래블러즈|여행자|여행객',
      'source_pattern' => /\bTravelers?\b/i,
      'korean_pattern' => /(?<![가-힣A-Za-z0-9_])(?<variant>트래블러(?:스|즈)?|여행자|여행객)(?<morph>들)?(?:[ \t]*\((?<label>[^()\r\n]*)\))?/i,
      'notes' => 'Official Korean manual names Travelers as a faction and renders it 트래블러 (PDF p. 7, printed pp. 13-14). Japanese トラベラー/トラベラーズ distinguishes faction members from ordinary 旅人; Chinese 旅行者 is supporting but not by itself decisive. Exclude ordinary travelers and unrelated traveler-named item/book titles.'
    },
    {
      'entity_key' => 'people:mitharan',
      'english_canonical' => 'Mitharan',
      'category' => 'people',
      'korean_canonical' => '미타란(Mitharan)',
      'english_aliases' => 'Mitharans',
      'korean_variants' => '미사란|미사루|미타라|미타루|미타란족|미타란인|미타란어',
      'source_pattern' => /\bMitharans?\b/i,
      'korean_pattern' => /(?<![가-힣A-Za-z0-9_])(?<variant>미타란|미사란|미사루|미타라|미타루)(?<morph>족|인|어|[ \t]+사람|[ \t]+신자)?(?:[ \t]*\((?<label>[^()\r\n]*)\))?/i,
      'notes' => 'English Mitharan(s) identifies the people, adherents, or their adjective, distinct from deity:mitharu. The official manual context reference establishes 미타란 for the people/adjective. Japanese ミサール人/ミサール and Chinese 米萨鲁人/米萨鲁 corroborate the source referent; use the English distinction where those languages share the deity stem.'
    }
  ].freeze

  module_function

  def visible_text(text)
    text.gsub(OPAQUE, ' ')
  end

  def matches(text, pattern)
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
  end

  def assert_no_term_collisions!(glossary)
    proposed = SPECS.map do |spec|
      [spec.fetch('entity_key'),
       ([spec.fetch('english_canonical')] + spec.fetch('english_aliases').split('|')).reject(&:empty?)]
    end
    proposed_keys = proposed.map(&:first)
    existing = glossary.reject { |row| proposed_keys.include?(row['entity_key']) }.map do |row|
      terms = ([row['english_canonical']] + row['english_aliases'].to_s.split('|')).reject(&:empty?)
      [row.fetch('entity_key'), terms]
    end
    owners = Hash.new { |hash, term| hash[term] = [] }
    existing.each do |entity, terms|
      terms.each { |term| owners[term.downcase] << entity }
    end
    proposed.each do |entity, terms|
      terms.each do |term|
        normalized = term.downcase
        conflicts = owners[normalized].reject { |owner| owner == entity }.uniq
        raise "English glossary term collision: #{term.inspect} (#{conflicts.join(', ')}, #{entity})" unless
          conflicts.empty?
        owners[normalized] << entity
      end
    end
  end

  def spec_definitions(glossary_headers, glossary, inventory)
    assert_no_term_collisions!(glossary)
    SPECS.map do |spec|
      existing = glossary.select { |row| row['entity_key'] == spec['entity_key'] }
      raise "duplicate glossary entity: #{spec['entity_key']}" if existing.length > 1

      rows = inventory.values.select do |row|
        english = JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n")
        english.match?(spec.fetch('source_pattern'))
      end
      evidence_ids = rows.map do |row|
        [row.fetch('resource'), row.fetch('ID_Linha')].join(':')
      end.uniq.join('|')
      definition = glossary_headers.zip([
        spec.fetch('entity_key'),
        spec.fetch('english_canonical'),
        spec.fetch('category'),
        spec.fetch('korean_canonical'),
        spec.fetch('english_aliases'),
        spec.fetch('korean_variants'),
        evidence_ids,
        'confirmed',
        spec.fetch('notes')
      ]).to_h

      if existing.first
        %w[english_canonical category korean_canonical status].each do |field|
          unless existing.first[field] == definition[field]
            raise "conflicting glossary #{field}: #{spec['entity_key']}"
          end
        end
        existing.first
      else
        definition
      end
    end
  end

  def traveler_disposition(english, japanese)
    if english.match?(/\b(?:Traveler'?s (?:Band|Caravan|Satchel)|Travelers Tales)\b/i)
      return [
        'excluded',
        'The source is a traveler-derived book/equipment title, not a reference to the Travelers faction; Japanese title wording and Chinese item/title wording do not establish faction membership.'
      ]
    end

    japanese_faction = japanese.match?(/トラベラー/)
    japanese_ordinary = japanese.match?(/旅人/)
    organization_cue = english.match?(
      /\b(?:join(?:ed|ing)?\s+(?:the\s+)?Travelers?|members?\s+of\s+(?:the\s+)?Travelers?|belong(?:s|ed|ing)?\s+to\s+(?:the\s+)?Travelers?|(?:leave|left)\s+(?:the\s+)?Travelers?|(?:the\s+)?Travelers?\s+(?:faction|guild|order)|(?:faction|guild|order)\s+of\s+(?:the\s+)?Travelers?|(?:hierophant|leaders?|ranks?|rules?|recruits?|banned|organization|collective|vocation)\s+of\s+(?:the\s+)?Travelers?|(?:Traveler's|Travelers')\s+Camp|camp\s+of\s+(?:the\s+)?Travelers?|Travelers?\s+(?:in|at|of)\s+Star\s+Camp|Travelers?\s+(?:in|at)\s+(?:this|the|our)\s+camp|Travelers?\s+(?:could|can|would)\s+use|keeping\s+(?:the\s+)?Travelers?|the\s+Hierophant.{0,100}\bTravelers?|Travelers?[^.!?]{0,100}\bHierophant|worth\s+(?:to|for)\s+(?:the\s+)?Travelers?)\b/i
    )
    ordinary_cue = english.match?(
      /\b(?:ordinary traveler|wanderer|passing through|on (?:the )?(?:road|trail)|traveler[s]? passing|travelers? on the trail|good day,? traveler|greetings,? traveler|a Traveler staying|another Traveler)\b/i
    )

    return ['uncertain', 'The English cell mixes a possible faction use with an ordinary traveler context; row-level Korean spans cannot safely be assigned to one referent.'] if
      (japanese_faction && japanese_ordinary) || (organization_cue && ordinary_cue)
    return ['accepted', 'The aligned English names a specific Travelers membership, organization, or Traveler Camp relation; Japanese/Chinese wording is checked as corroboration, not used to override the explicit relation.'] if
      organization_cue
    return ['accepted', 'The source cell is the faction label itself; the official manual identifies Travelers as a faction and aligned Japanese uses トラベラーズ.'] if
      english.match?(/\A[ \t]*(?:The[ \t]+)?Travelers?[ \t]*[.!]?[ \t]*\z/i) && japanese_faction && !japanese_ordinary
    return ['excluded', 'Aligned Japanese uses ordinary 旅人, not faction-form トラベラー, and the English context describes an ordinary traveler.'] if
      japanese_ordinary && !japanese_faction && ordinary_cue
    return ['uncertain', 'Japanese uses ordinary 旅人 or faction-form トラベラー without explicit English membership/camp identity; Chinese 旅行者 is nondiagnostic, so no Korean span is changed.'] if
      japanese_ordinary || japanese_faction || !organization_cue

    ['uncertain', 'English has a Traveler(s) lexical hit, but aligned Japanese/Chinese and local context do not establish whether it denotes the faction or an ordinary traveler.']
  end

  def english_label(spec, source_hits)
    return 'Warsworn' if spec['entity_key'] == 'faction:warsworn'
    return 'Scholia Arcana' if spec['entity_key'] == 'faction:scholia-arcana'

    forms = source_hits.map { |hit| hit.downcase }.uniq
    if forms.length != 1
      return nil
    end
    case spec['entity_key']
    when 'faction:travelers'
      forms.first == 'traveler' ? 'Traveler' : 'Travelers'
    when 'people:mitharan'
      forms.first == 'mitharan' ? 'Mitharan' : 'Mitharans'
    end
  end

  def label_contains_entity?(label, spec)
    label.match?(spec.fetch('source_pattern'))
  end

  def inside_parentheses?(text, position)
    depth = 0
    text[0...position].each_char do |char|
      depth += 1 if char == '('
      depth -= 1 if char == ')' && depth.positive?
    end
    depth.positive?
  end

  def particle_for(particle, korean)
    final = (korean[-1].ord - 0xAC00) % 28
    pair = [%w[은 는], %w[이 가], %w[을 를], %w[과 와],
            %w[이여 여], %w[이라는 라는], %w[이라고 라고],
            %w[이라며 라며], %w[이라서 라서], %w[이라면 라면],
            %w[이라 라]].find { |values| values.include?(particle) }
    return pair[final.zero? ? 1 : 0] if pair
    return final.zero? || final == 8 ? '로' : '으로' if %w[으로 로].include?(particle)

    particle
  end

  def transform_korean(old, spec, label)
    pattern = spec.fetch('korean_pattern')
    found = matches(old, pattern)
    opaque_spans = matches(old, OPAQUE).map { |match| [match.begin(0), match.end(0)] }
    patches = []
    ambiguous = []

    found.each do |match|
      first = match.begin(0)
      last = match.end(0)
      next if opaque_spans.any? { |left, right| first < right && left < last }
      next if inside_parentheses?(old, first)

      current_label = match[:label]
      if current_label.nil? && old[last..].to_s.match?(/\A[ \t]*\(/)
        ambiguous << 'An adjacent parenthetical was not captured as a complete label; refuse to add a duplicate pair.'
        next
      end
      canonical = spec.fetch('korean_canonical').sub(/\([^()]*\)\z/, '')
      morph = match[:morph].to_s
      if spec['entity_key'] == 'people:mitharan' && morph.empty?
        suffix = old[last..].to_s[/\A(?:족|인|어)/]
        if suffix
          morph = suffix
          last += suffix.length
        end
      end
      lexical_suffix = spec['entity_key'] == 'people:mitharan' && %w[족 인 어].include?(morph)
      korean_name = lexical_suffix ? "#{canonical}#{morph}" : canonical
      trailing_morph = lexical_suffix ? '' : morph
      replacement = if current_label
                      if label_contains_entity?(current_label, spec)
                        "#{korean_name}(#{current_label})#{trailing_morph}"
                      else
                        ambiguous << "Existing adjacent parenthetical does not identify #{spec['english_canonical']}."
                        next
                      end
                    else
                      tail = old[last..].to_s
                      compound = tail.match(/\A(?<bridge>[\p{Hangul}\s,·'’\-]{0,60})\((?<full>[^()\r\n]*)\)/)
                      if compound && label_contains_entity?(compound[:full], spec)
                        "#{canonical}#{morph}"
                      else
                        "#{korean_name}(#{label})#{trailing_morph}"
                      end
                    end
      particle = old[last..].to_s[/\A(?:이라는|이라고|이라며|이라서|이라면|으로|이여|라는|라고|라며|라서|라면|이라|은|는|이|가|을|를|과|와|여|로|라)/]
      if particle
        ending = trailing_morph.empty? ? korean_name : "#{canonical}#{trailing_morph}".strip
        replacement += particle_for(particle, ending)
        last += particle.length
      end
      patches << [first, last, replacement]
    end

    return [old, 'uncertain', (ambiguous + ['No safely bounded Korean counterpart was found.']).join(' ')] if
      patches.empty?
    return [old, 'uncertain', ambiguous.join(' ')] unless ambiguous.empty?

    text = old.dup
    patches.sort_by(&:first).reverse_each do |first, last, replacement|
      text[first...last] = replacement
    end
    raise 'opaque Korean token changed' unless old.scan(OPAQUE) == text.scan(OPAQUE)
    raise 'line breaks changed' unless old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)

    [text, text == old ? 'not-an-issue' : 'accepted', nil]
  end

  def review_entity(text, spec, english, japanese, chinese)
    visible_english = visible_text(english)
    source_hits = matches(visible_english, spec.fetch('source_pattern')).map(&:to_s)
    if source_hits.empty?
      return [text, 'excluded', 'All source hits for this entity occur inside opaque runtime/markup spans; no Korean span was processed.']
    end

    if spec['entity_key'] == 'faction:travelers'
      status, reason = traveler_disposition(visible_english, japanese)
      return [text, status, reason] unless status == 'accepted'
    end

    if spec['entity_key'] == 'people:mitharan' && visible_english.match?(/\bMitharu\b/i)
      return [text, 'uncertain', 'The same English cell names both Mitharan(s) and Mitharu; preserve the established deity label and hold this cell until the distinct Korean spans can be aligned safely.']
    end

    label = english_label(spec, source_hits)
    return [text, 'uncertain', 'The cell contains singular and plural English forms with no safe per-mention label mapping; no Korean spans were changed.'] unless label

    proposed, status, reason = transform_korean(text, spec, label)
    [proposed, status, reason || "#{spec['entity_key']}: English meaning was checked against aligned Japanese and Chinese; normalize only bounded Korean equivalents to #{label}, preserving complete bilingual titles, opaque tokens, particles, and line breaks."]
  end

  def build_reviews(inventory, generated)
    inventory_by_key = inventory.to_h { |row| [M.key(row), row] }
    grouped = generated.group_by { |row| M.key(row) }

    grouped.map do |row_key, occurrences|
      source = inventory_by_key.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text').to_s
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []

      occurrences.group_by { |occurrence| occurrence.fetch('entity_key') }.each do |entity, _matches|
        spec = SPECS.find { |candidate| candidate['entity_key'] == entity }
        text, status, reason = review_entity(text, spec, english, japanese, chinese)
        dispositions[entity] = status
        evidence << reason
      end

      status = if text != old
                 'accepted'
               elsif dispositions.values.include?('uncertain')
                 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      raise "opaque token changed #{row_key.inspect}" unless old.scan(OPAQUE) == text.scan(OPAQUE)
      raise "line breaks changed #{row_key.inspect}" unless old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)

      {
        'resource' => row_key[0],
        'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => status,
        'old' => old,
        'new' => text,
        'evidence' => evidence.join(' '),
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
  end

  def register!(glossary_table, glossary, definitions, generated)
    entity_keys = SPECS.map { |spec| spec.fetch('entity_key') }
    index = M.table(M::INDEX)
    existing = index.select { |row| entity_keys.include?(row['entity_key']) }
    existing_by_key = existing.group_by do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end
    duplicate = existing_by_key.find { |_key, rows| rows.length > 1 }
    raise "duplicate existing occurrence key: #{duplicate[0].inspect}" if duplicate

    generated_keys = generated.map do |occurrence|
      [occurrence.fetch('entity_key'), *M.key(occurrence)]
    end
    stale = existing_by_key.keys - generated_keys
    raise "stale existing occurrence keys: #{stale.first(5).inspect}" unless stale.empty?

    generated.each do |occurrence|
      key = [occurrence.fetch('entity_key'), *M.key(occurrence)]
      current = existing_by_key[key]&.first
      next unless current

      %w[matched_english english_source].each do |field|
        raise "conflicting existing occurrence #{key.inspect}: #{field}" unless
          current[field] == occurrence[field]
      end
      raise "existing occurrence already reviewed #{key.inspect}: #{current['status']}" unless
        current['status'] == 'needs-context'
    end

    indexed_keys = existing_by_key.keys
    additions = generated.reject do |occurrence|
      indexed_keys.include?([occurrence.fetch('entity_key'), *M.key(occurrence)])
    end
    new_definitions = definitions.reject do |definition|
      glossary.any? { |row| row['entity_key'] == definition['entity_key'] }
    end

    glossary_headers = glossary_table.headers.dup
    glossary_rows = glossary.map(&:to_h)
    index_headers = index.headers.dup
    index_rows = index.map(&:to_h)

    M.write_table(GLOSSARY, glossary_headers, glossary_rows + new_definitions)
    M.write_table(M::INDEX, index_headers, index_rows + additions)
    additions.length
  end

  def run(argv)
    abort 'usage: review-proper-name-factions-continuation.rb START_D' unless
      argv.length == 1 && argv[0].match?(/\A\d+\z/)
    start_d = Integer(argv.fetch(0))

    inventory = M.refresh_inventory
    glossary_table = M.table(GLOSSARY)
    glossary_headers = glossary_table.headers.dup
    glossary = glossary_table.map(&:to_h)
    definitions = spec_definitions(glossary_headers, glossary, inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'duplicate generated occurrence key' unless
      generated.map { |row| [row['entity_key'], *M.key(row)] }.uniq.length == generated.length

    reviews = build_reviews(inventory.values, generated)
    reviewed_keys = reviews.flat_map do |review|
      entities = review.fetch('entity_key').split('|')
      dispositions = JSON.parse(review.fetch('entity_dispositions_json'))
      raise "missing entity disposition #{M.key(review).inspect}" unless entities.sort == dispositions.keys.sort
      entities.map { |entity| [entity, *M.key(review)] }
    end
    generated_keys = generated.map { |row| [row['entity_key'], *M.key(row)] }
    raise 'review manifest does not cover every generated occurrence key' unless
      reviewed_keys.sort == generated_keys.sort

    reviews.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end
    batch_count = (reviews.length + 49) / 50
    collision = (start_d...(start_d + batch_count)).find do |number|
      File.exist?(File.join(AUDIT, "named-scope-review-D#{number}-20261015.md"))
    end
    raise "review checkpoint already exists for D-#{collision}" if collision

    added_occurrences = register!(glossary_table, glossary, definitions, generated)
    M.write_table(OUTPUT, M::HEADERS, reviews)
    puts "Faction/organization rows=#{reviews.length}; generated matches=#{generated.length}; " \
         "new occurrence keys=#{added_occurrences}; Beckoned not registered as a faction."
    M.run(OUTPUT, start_d, 50)
  end
end

FactionOrganizationContinuation.run(ARGV) if $PROGRAM_NAME == __FILE__
