#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# Prepared only. Main supplies START_D when registration/application is approved.
module RelatedPlacesReview
  SPECS = {
    'place:caer-nyralim' => {
      english: 'Caer Nyralim', korean: '케어 니랄림',
      forms: '(?:케어[ \t]+(?:니랄림|니라림)|(?:니랄림|니라림)(?:[ \t]*\(Nyralim\))?의[ \t]+요새)',
      components: ['Nyralim'], variants: '케어 니라림|니랄림의 요새|니라림의 요새',
      count: 5, visible: 5, mentions: 5,
      sha256: '428818dbc42a76d8ca7745a66f11325023d87c46be5ac62db14b0f1f485ebc90',
      evidence_ids: 'default:9405|default:20933|default:23093|default:24743|default:28854',
      notes: 'The named site where Nyralim dwells: English at Caer Nyralim / dwells in Caer Nyralim, Japanese ケア・ニラリム, and Chinese 卡尔尼拉利姆 / 卡尔尼拉利 / 尼拉利姆之角 corroborate. The Aodh history uses the site/tree name metonymically for the enormous tree of the Ring of Keozai; this does not establish a second personal identity. Preserve standalone person:Nyralim separately. The isolated map label 니랄림의 요새 is a translated variant of this complete name, not an independent fortress entity.'
    },
    'place:akara-tor' => {
      english: 'Akara-Tor', korean: '아카라-토르',
      forms: '아카라(?:[ \t]*\(Akara\))?[- \t]*토르',
      components: ['Akara'], variants: '아카라 토르|아카라토르|아카라(Akara) 토르',
      count: 24, visible: 24, mentions: 24,
      sha256: '763dcc4240345e8ff0e5d27368be15c128cd76db954f2b3233e74814aadc9588',
      evidence_ids: 'base:3130|default:26319|default:36451|default:44737|default:53086|default:55239',
      notes: 'English explicitly identifies an ancient Erathi ruin, monument and underground complex on Gallows End, built to honor the god Akara. Japanese アカラ・トア and Chinese 阿卡拉托尔 corroborate the complete place name. Rows default:36451, 44737 and 59362 distinguish Akara-Tor from standalone Akara; do not annotate or respell the deity as part of this place pass. The hyphenated active base label supplies 아카라-토르.'
    },
    'place:castle-yolvan' => {
      english: 'Castle Yolvan', korean: '요르반 성',
      forms: '(?:요르반|욜반)(?:[ \t]*\(Yolvan\))?[ \t]+성',
      components: ['Yolvan'], variants: '욜반 성|욜반(Yolvan) 성',
      count: 32, visible: 32, mentions: 34,
      sha256: 'f33d4110aaa2eef9a457083146601000112faf232469bd6c178f36531a776889',
      evidence_ids: 'base:3046|default:5608|default:23338|default:27652|default:41559|default:45582',
      notes: 'English explicitly identifies the ancient Fae bastion Castle Yolvan near Canneroc, later abandoned and occupied by the Widow. Japanese ヨルヴァン城 and Chinese 尤凡城堡 corroborate. Retain the dominant active Korean 요르반 성; normalize 욜반 and the incomplete component pair 욜반(Yolvan) 성 as the complete place label. The Fall of Castle Yolvan is a complete book title in default:5608 and is paired atomically, not split into a component place annotation.'
    }
  }.freeze
  SOURCE_FIELDS = %w[resource ID_Linha Tipo_Variante en_texts_json ja_texts_json zh_text].freeze
  TOKEN = /\$[^$]*\$/
  OPAQUE = /\$[^$]*\$|<[^>]*>|\{[^{}]*\}/
  PARTICLES = %w[
    에서부터의 으로부터의 으로서의 으로써의 에게서부터 에게로부터
    에서부터는 에서부터도 에서부터 으로부터는 으로부터도 으로부터
    에서의 으로의 로부터의 로의 에의 에게서는 에게서 에게도 에게는
    에게 에서는 에까지는 에까지도 에까지 에서도 에라도 에서라도
    에는 에도 에서 에선 으로서는 으로서도 으로써는 으로써 으로까지
    으로만 으로는 으로도 으로 로부터 로서는 로서 로써 로도 로는 로만
    로까지 이라며 이라는 이라서 이라고 이라면 이라 라며 라는 라서 라고
    라면 라 께서는 께서도 께서 께도 께 처럼 만큼 보다 행 이었던 였던
    이야말로 야말로 이야 야 까지는 까지도 까지 부터 은 는 이 가 을 를 와 과 의 에 로 도 만
  ].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|').freeze

  module_function

  def word(value)
    Regexp.new("(?<![A-Za-z])#{Regexp.escape(value)}(?![A-Za-z])", Regexp::IGNORECASE)
  end

  def normalized_term(value)
    value.to_s.downcase.gsub(/[^a-z0-9]/, '')
  end

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json")).compact
  end

  def visible_english(source)
    texts(source, 'en').map { |text| text.gsub(TOKEN, ' ') }.join("\n")
  end

  def source_hit?(source, spec)
    name = spec.fetch(:english)
    texts(source, 'en').any? do |text|
      text.match?(word(name)) || text.scan(TOKEN).any? do |token|
        normalized_term(token).include?(normalized_term(name))
      end
    end
  end

  def source_fingerprint(rows)
    ordered = rows.sort_by do |row|
      [ReviewedNameBatches::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante'].to_s]
    end
    Digest::SHA256.hexdigest(JSON.generate(ordered.map do |row|
      SOURCE_FIELDS.map { |field| row[field].to_s }
    end))
  end

  def matches(text, pattern)
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
  end

  def protected_span?(text, first, last)
    prefix = text[0...first]
    prefix.count('(') > prefix.count(')') ||
      matches(text, OPAQUE).any? { |span| first < span.end(0) && span.begin(0) < last }
  end

  def supports_label?(english, label, name)
    normalized = label.to_s.strip.gsub(/[ \t\r\n]+/, ' ')
    !normalized.empty? && normalized.match?(word(name)) &&
      english.gsub(/[ \t\r\n]+/, ' ').match?(word(normalized))
  end

  def overlaps?(first, last, patch)
    first < patch[1] && patch[0] < last
  end

  def particle_for(particle, korean)
    final = (korean[-1].ord - 0xAC00) % 28
    pairs = [
      %w[은 는], %w[이 가], %w[을 를], %w[과 와],
      %w[이라는 라는], %w[이라며 라며], %w[이라서 라서],
      %w[이라고 라고], %w[이라면 라면], %w[이라 라],
      %w[이었던 였던], %w[이야 야], %w[이야말로 야말로]
    ]
    pair = pairs.find { |values| values.include?(particle) }
    return pair[final.zero? ? 1 : 0] if pair
    return particle.sub(/\A(?:으로|로)/, final.zero? || final == 8 ? '로' : '으로') if
      particle.match?(/\A(?:으로|로)/)

    particle
  end

  def annotation_for(match, english, name, components)
    annotation = match[:annotation]
    return "(#{name})" unless annotation

    label = match[:label]
    return annotation if supports_label?(english, label, name)
    return "(#{name})" if components.any? { |component| label.casecmp?(component) }

    nil
  end

  def transform(original, source, entity)
    spec = SPECS.fetch(entity)
    english = visible_english(source)
    name = spec.fetch(:english)
    unless english.match?(word(name))
      return [original, 'excluded',
              'The full name occurs only inside an opaque English runtime token. Retain its source key in the index and leave Korean unchanged.']
    end
    if texts(source, 'ja').empty? || source.fetch('zh_text').empty?
      return [original, 'uncertain', 'Aligned Japanese or Chinese evidence is missing; retain the entire entity text unchanged.']
    end

    patches = []
    covered = []
    problems = []
    recognized = 0
    if entity == 'place:castle-yolvan'
      title = 'The Fall of Castle Yolvan'
      title_pattern = /
        (?<![가-힣A-Za-z0-9_])
        #{spec.fetch(:forms)}(?:[ \t]*\(Castle[ ]Yolvan\))?의[ \t]+함락
        (?<annotation>[ \t]*\((?<label>[^()\r\n]*)\))?
        (?<particle>#{PARTICLES})?(?![가-힣A-Za-z0-9_])
      /ix
      title_matches = matches(original, title_pattern).reject do |match|
        protected_span?(original, match.begin(0), match.end(0))
      end
      if title_matches.length != english.scan(word(title)).length
        problems << 'The complete Castle Yolvan book-title counts differ.'
      end
      title_matches.each do |match|
        annotation = annotation_for(match, english, title, [])
        if annotation.nil? || original[match.end(0)..].to_s.match?(/\A[ \t]*\(/)
          problems << 'The complete book title has an unrelated, adjacent or nested annotation.'
          next
        end
        covered << [match.begin(0), match.end(0)]
        recognized += 1
        replacement = "#{spec.fetch(:korean)}의 함락#{annotation}#{particle_for(match[:particle].to_s, '함락')}"
        patches << [match.begin(0), match.end(0), replacement]
      end
    end

    pattern = /
      (?<![가-힣A-Za-z0-9_])#{spec.fetch(:forms)}
      (?<annotation>[ \t]*\((?<label>[^()\r\n]*)\))?
      (?<particle>#{PARTICLES})?(?![가-힣A-Za-z0-9_])
    /ix
    matches(original, pattern).each do |match|
      next if covered.any? { |span| overlaps?(match.begin(0), match.end(0), span) }
      next if protected_span?(original, match.begin(0), match.end(0))

      recognized += 1
      tail = original[match.end(0)..].to_s
      if tail.match?(/\A[ \t]*\(/)
        problems << 'An adjacent or nested parenthetical annotation needs focused review.'
        next
      end
      full_tail = tail.match(
        /\A[ \t]+[\p{Hangul}][\p{Hangul}\s·'’\-]{0,99}?\s*\((?<label>[^()\r\n]*)\)/
      )
      if full_tail && full_tail[:label].match?(word(name))
        problems << 'A following compound annotation is not supported by the English source.' unless
          supports_label?(english, full_tail[:label], name)
        next
      end
      annotation = annotation_for(match, english, name, spec.fetch(:components))
      if annotation.nil?
        problems << 'The full Korean name has an unrelated or unsupported annotation.'
        next
      end
      replacement = "#{spec.fetch(:korean)}#{annotation}#{particle_for(match[:particle].to_s, spec.fetch(:korean))}"
      patches << [match.begin(0), match.end(0), replacement]
    end
    problems << 'English and safely bounded Korean complete-name mention counts differ.' unless
      recognized == english.scan(word(name)).length
    return [original, 'uncertain', problems.uniq.join(' ')] unless problems.empty?

    ordered_patches = patches.sort_by(&:first)
    raise 'overlapping related-place transformations' if
      ordered_patches.each_cons(2).any? { |left, right| left[1] > right[0] }
    text = original.dup
    ordered_patches.reverse_each do |first, last, replacement|
      text[first...last] = replacement
    end
    raise 'related-place edit changed opaque tokens' unless original.scan(OPAQUE) == text.scan(OPAQUE)
    raise 'related-place edit changed line breaks' unless original.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)
    detail = case entity
             when 'place:caer-nyralim'
               'The site name stays separate from standalone Nyralim; the map-only 니랄림의 요새 rendering is the same complete name. The historical tree/site metonym does not create another person.'
             when 'place:akara-tor'
               'The Erathi ruin stays distinct from the deity Akara, including rows containing both names.'
             else
               'The named Fae stronghold is paired in full; The Fall of Castle Yolvan remains one complete book-title label.'
             end
    evidence = "English anchors the complete #{name} identity; every scoped aligned Japanese/Chinese source row was reviewed and is fingerprint-guarded. #{detail} Preserve source-supported full labels, particles, tokens, line breaks and unrelated text."
    [text, text == original ? 'not-an-issue' : 'accepted', evidence]
  end

  def definition(entity, spec)
    {
      'entity_key' => entity, 'english_canonical' => spec.fetch(:english),
      'category' => 'place', 'korean_canonical' => "#{spec.fetch(:korean)}(#{spec.fetch(:english)})",
      'english_aliases' => '', 'korean_variants' => spec.fetch(:variants),
      'evidence_ids' => spec.fetch(:evidence_ids), 'status' => 'confirmed',
      'notes' => spec.fetch(:notes)
    }
  end

  def run(argv)
    abort 'usage: review-proper-name-related-places-continuation.rb START_D' unless argv.length == 1
    start_d = Integer(argv.fetch(0))
    raise 'START_D must be positive' unless start_d.positive?
    m = ReviewedNameBatches
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_table = m.table(glossary_path)
    glossary_headers = glossary_table.headers
    glossary = glossary_table.map(&:to_h)
    definitions = SPECS.map { |entity, spec| definition(entity, spec) }
    definitions.each do |entry|
      existing = glossary.select { |row| row['entity_key'] == entry['entity_key'] }
      raise "duplicate glossary key #{entry['entity_key']}" if existing.length > 1
      %w[english_canonical category korean_canonical status].each do |field|
        raise "conflicting glossary #{field}: #{entry['entity_key']}" if
          existing.first && existing.first[field] != entry[field]
      end
      owners = glossary.select do |row|
        row['entity_key'] != entry['entity_key'] &&
          ([row['english_canonical']] + row['english_aliases'].to_s.split('|')).any? do |term|
            normalized_term(term) == normalized_term(entry['english_canonical'])
          end
      end
      raise "full-name glossary collision: #{entry['english_canonical']}" unless owners.empty?
    end

    inventory = m.refresh_inventory
    scopes = SPECS.to_h do |entity, spec|
      rows = inventory.values.select { |source| source_hit?(source, spec) }
      raise "source-key scope changed: #{entity}" unless rows.length == spec.fetch(:count)
      raise "aligned EN/JA/ZH scope changed: #{entity}" unless
        source_fingerprint(rows) == spec.fetch(:sha256)
      visible = rows.count { |source| visible_english(source).match?(word(spec.fetch(:english))) }
      mentions = rows.sum { |source| visible_english(source).scan(word(spec.fetch(:english))).length }
      raise "visible scope changed: #{entity}" unless
        visible == spec.fetch(:visible) && mentions == spec.fetch(:mentions)
      [entity, rows]
    end
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    # Phrase matching cannot see underscore-separated names inside runtime tokens.
    scopes.each do |entity, sources|
      sources.each do |source|
        next if generated.any? { |row| row['entity_key'] == entity && m.key(row) == m.key(source) }
        generated << {
          'entity_key' => entity, 'resource' => source['resource'],
          'ID_Linha' => source['ID_Linha'], 'Tipo_Variante' => source['Tipo_Variante'].to_s,
          'matched_english' => SPECS.fetch(entity).fetch(:english),
          'english_source' => texts(source, 'en').join("\n---\n"),
          'korean_current' => source.fetch('work_text'), 'status' => 'needs-context',
          'evidence' => 'Full compound name occurs in an opaque English runtime token; retain this source key for explicit exclusion.'
        }
      end
    end
    expected_keys = scopes.flat_map { |entity, rows| rows.map { |row| [entity, *m.key(row)] } }.sort
    generated_keys = generated.map { |row| [row['entity_key'], *m.key(row)] }.sort
    raise 'generated source keys are incomplete or duplicated' unless generated_keys == expected_keys

    index_table = m.table(m::INDEX)
    index_headers = index_table.headers
    index = index_table.map(&:to_h)
    indexed = index.select { |row| SPECS.key?(row['entity_key']) }
    indexed_keys = indexed.map { |row| [row['entity_key'], *m.key(row)] }
    raise 'duplicate indexed entity/source key' unless indexed_keys.uniq == indexed_keys
    raise 'indexed full-name keys no longer have source support' unless (indexed_keys - expected_keys).empty?
    lookup = indexed.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
    additions = generated.reject { |row| lookup.key?([row['entity_key'], *m.key(row)]) }
    reviews = generated.group_by { |row| m.key(row) }.map do |source_key, occurrences|
      pending = occurrences.select do |row|
        current = lookup[[row['entity_key'], *source_key]]
        !current || current['status'] == 'needs-context'
      end
      next if pending.empty?
      source = inventory.fetch(source_key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []
      pending.each do |row|
        entity = row.fetch('entity_key')
        candidate, status, reason = transform(text, source, entity)
        text = candidate if %w[accepted not-an-issue].include?(status)
        dispositions[entity] = status
        evidence << "#{entity}: #{reason}"
      end
      status = if text != old
                 'accepted'
               elsif dispositions.value?('uncertain')
                 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => source_key[0], 'ID_Linha' => source_key[1], 'Tipo_Variante' => source_key[2],
        'entity_key' => pending.map { |row| row['entity_key'] }.sort.join('|'),
        'status' => status, 'old' => old, 'new' => text, 'evidence' => evidence.join(' '),
        'english' => texts(source, 'en').join("\n"), 'japanese' => texts(source, 'ja').join("\n---\n"),
        'chinese' => source.fetch('zh_text'), 'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.compact.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    expected_pending = expected_keys.select do |key|
      !lookup[key] || lookup[key]['status'] == 'needs-context'
    end
    reviewed_keys = reviews.flat_map do |row|
      row['entity_key'].split('|').map { |entity| [entity, *m.key(row)] }
    end.sort
    raise 'pending source keys were dropped during review' unless reviewed_keys == expected_pending
    raise 'non-accepted review changed Korean' unless
      reviews.all? { |row| row['status'] == 'accepted' || row['old'] == row['new'] }
    reviews.each_slice(50).with_index do |_batch, ordinal|
      d = start_d + ordinal
      raise "D-#{d} already recorded; nothing registered" if
        File.exist?(File.join(__dir__, "named-scope-review-D#{d}-20261015.md"))
    end
    updated_index = index + additions
    retained_keys = updated_index.map { |row| [row['entity_key'], *m.key(row)] }
    raise 'registration would omit generated source keys' unless (expected_keys - retained_keys).empty?

    new_definitions = definitions.reject { |entry| glossary.any? { |row| row['entity_key'] == entry['entity_key'] } }
    m.write_table(glossary_path, glossary_headers, glossary + new_definitions)
    m.write_table(m::INDEX, index_headers, updated_index)
    out = File.join(__dir__, 'proper-name-reviewed-related-places-continuation.tsv')
    m.write_table(out, m::HEADERS, reviews)
    puts "Related places: #{generated.length} complete source keys; #{reviews.length} pending grouped rows; #{new_definitions.length} glossary additions."
    puts "Grouped dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    SPECS.each_key do |entity|
      decisions = reviews.map do |row|
        JSON.parse(row['entity_dispositions_json'])[entity]
      end.compact
      puts "#{entity}: source_keys=#{scopes.fetch(entity).length}; pending_dispositions=#{decisions.group_by(&:itself).transform_values(&:length).inspect}"
    end
    reviews.each do |row|
      next unless JSON.parse(row['entity_dispositions_json']).value?('uncertain')
      puts "UNRESOLVED #{m.key(row).join(':')}: #{row['evidence']}"
    end
    m.run(out, start_d, 50)
  end
end

RelatedPlacesReview.run(ARGV) if $PROGRAM_NAME == __FILE__
