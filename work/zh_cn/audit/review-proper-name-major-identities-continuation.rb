#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module MajorIdentityReview
  ENTITIES = {
    'person:nyralim' => {
      english: 'Nyralim', category: 'person', korean: '니랄림',
      variants: %w[니랄림 니라림], count: 80,
      ids: 'default:1499|default:2922|default:53848|default:58604|base:856|base:1932',
      notes: 'A named, mortal, male-presenting tree-being: English calls Nyralim a wise tree, the ancient one, oldest living mortal, and uses he/him; aligned Japanese ニラリム and Chinese 尼拉利姆 corroborate. Canonical 니랄림 follows the dominant existing form; normalize 니라림. Caer Nyralim is a separate full place label and is excluded when it is the only hit.'
    },
    'deity:akara' => {
      english: 'Akara', category: 'deity', korean: '아카라',
      variants: %w[아카라], count: 339,
      ids: 'default:8464|default:1824|default:22504|default:23210|default:4760|default:58880',
      notes: 'Akara is explicitly a god worshipped as father and protector; English calls Akara an ancient being, while aligned Japanese アカラ and Chinese 阿卡拉 corroborate. Akara-Tor is a separate place name: exclude rows where that compound is the only match, and never rewrite its component as the deity.'
    },
    'person:saturnyn' => {
      english: 'Saturnyn', category: 'person', korean: '사투르닌',
      variants: %w[사투르닌 새터닌 사터닌], count: 100,
      ids: 'default:2577|default:32496|default:38008|default:4647|default:1922',
      notes: 'A named individual and assumed identity, not a people/species: the House of Sorrows believes Saturnyn is one of its members; English explicitly reveals Bisarane is Saturnyn, and aligned Japanese サタンニン / Chinese 萨图恩宁 corroborate. Normalize 사투르닌, 새터닌, and 사터닌 to the dominant 사투르닌.'
    },
    'place:culn' => {
      english: 'Culn', category: 'place', korean: '컬른',
      variants: %w[컬른 쿨른], count: 73,
      ids: 'default:3533|default:42289|default:57417|default:54216|default:45709',
      notes: 'Culn is repeatedly identified as a village/town, ruin, and refugees’ home; Japanese カルン / クルン and Chinese 考伦 corroborate. Canonical 컬른 follows the slightly more frequent existing form; normalize 쿨른. Keep New Culn and Treasures of Culn as complete labels, not blind component substitutions.'
    }
  }.freeze
  EXPECTED_COUNTS = ENTITIES.transform_values { |entity| entity.fetch(:count) }.freeze
  TOKEN = /\$[^$]*\$/
  OPAQUE = /\$[^$]*\$|<[^>]*>|\{[^{}]*\}/
  WORD = lambda do |name|
    Regexp.new("(?<![A-Za-z])#{Regexp.escape(name)}(?![A-Za-z])", Regexp::IGNORECASE)
  end
  PARTICLES = %w[
    에서부터의 으로부터의 으로서의 으로써의 에게서부터 에게로부터
    에게서는 에게서 에게도 에게는 에게 에서부터는 에서부터도
    에서부터 으로부터는 으로부터도 으로부터 에서는 에서도 에까지
    에라도 에는 에도 에서 에선 으로서는 으로서도 으로써는 으로써
    으로는 으로도 으로만 으로 로부터 로서는 로서 로써 로도 로는 로만
    이라며 이라는 이라서 이라고 이라면 라는 라며 라서 라고 라면
    께서는 께서도 께서 께도 께 처럼 만큼 보다 행 이었던 였던
    까지도 까지 부터 은 는 이 가 을 를 와 과 의 에 로 도 만
  ].uniq.sort_by { |particle| -particle.length }
    .map { |particle| Regexp.escape(particle) }.join('|').freeze

  module_function

  def matches(text, pattern)
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
  end

  def visible_english(source)
    JSON.parse(source.fetch('en_texts_json')).compact.map { |text| text.gsub(TOKEN, ' ') }.join("\n")
  end

  def source_mentions?(text, name)
    text.match?(WORD.call(name))
  end

  def source_supports_label?(english, label, source_name)
    normalized_label = label.to_s.strip.gsub(/[ \t\r\n]+/, ' ')
    normalized_english = english.gsub(/[ \t\r\n]+/, ' ')
    !normalized_label.empty? &&
      normalized_label.match?(WORD.call(source_name)) &&
      normalized_english.match?(WORD.call(normalized_label))
  end

  def protected_span?(text, first, last)
    prefix = text[0...first]
    return true if prefix.count('(') > prefix.count(')')

    matches(text, OPAQUE).any? do |opaque|
      first < opaque.end(0) && opaque.begin(0) < last
    end
  end

  def glossary_definition(headers, entity_key, entity)
    headers.zip([
      entity_key, entity.fetch(:english), entity.fetch(:category),
      "#{entity.fetch(:korean)}(#{entity.fetch(:english)})", '',
      (entity.fetch(:variants) - [entity.fetch(:korean)]).join('|'),
      entity.fetch(:ids), 'confirmed', entity.fetch(:notes)
    ]).to_h
  end

  def replace_person_name(text, entity, source_name, english)
    original = text.dup
    canonical = entity.fetch(:korean)
    variants = entity.fetch(:variants).sort_by { |name| -name.length }
      .map { |name| Regexp.escape(name) }.join('|')
    pattern = /
      (?<![가-힣])
      (?<name>#{variants})
      (?<label>[ \t]*\((?<label_text>[^()\r\n]*)\))?
      (?<particle>#{PARTICLES})?
      (?![가-힣])
    /x
    found = false
    unsafe = false
    changed = false
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      prefix = text[0...match.begin(0)]
      tail = text[match.end(0)..].to_s
      label = match[:label_text].to_s
      next if protected_span?(text, match.begin(0), match.end(0))
      next if source_name == 'Nyralim' &&
        (prefix.match?(/케어[ \t]*\z/) || label.match?(/\bCaer Nyralim\b/i))
      if source_name == 'Akara' &&
          (tail.match?(/\A[ \t-]*토르/) || label.match?(/\bAkara-Tor\b/i))
        next
      end

      found = true
      if !label.empty? && !source_supports_label?(english, label, source_name)
        unsafe = true
        next
      end
      atomic_tail = tail.match(
        /\A[ \t]+[\p{Hangul}][\p{Hangul}\s·'’\-]{0,99}?\s*\((?<full_label>[^()\r\n]*)\)/
      )
      if atomic_tail
        if source_supports_label?(english, atomic_tail[:full_label], source_name)
          next
        end
        unsafe = true
        next
      end

      preserved_label = label.empty? ? source_name : label
      replacement = "#{canonical}(#{preserved_label})#{match[:particle]}"
      next if replacement == match[0]
      text[match.begin(0)...match.end(0)] = replacement
      changed = true
    end
    return [original, 'uncertain', 'Unrelated or unsupported parenthetical annotation; left this entity unchanged.'] if unsafe
    return [original, 'uncertain', 'English identifies this entity, but no safe bounded Korean name span was found.'] unless found

    evidence = if changed
                 "English identifies #{source_name}; Japanese and Chinese source rows are retained in full for corroboration. Standardized only bounded Korean name spans, preserved any exact source-supported full English label, and retained particles and complete compound labels."
               else
                 "English identifies #{source_name}; the bounded Korean name or complete source-supported bilingual label is already valid. Japanese and Chinese source rows are retained in full; no edit is needed."
               end
    [text, changed ? 'accepted' : 'not-an-issue', evidence]
  end

  def replace_culn(text, english)
    canonical = ENTITIES.fetch('place:culn').fetch(:korean)
    problems = []
    changed = false
    new_labels = matches(english, /\bNew Culn\b/i)
    new_korean = matches(text, /
      (?<![가-힣])(?:뉴|새)[ \t]+(?:컬른|쿨른)
      (?:[ \t]*\((?<label>New Culn)\))?
      (?<particle>#{PARTICLES})?
      (?![가-힣])
    /ix)
    if new_labels.length != new_korean.length
      problems << 'New Culn source/Korean complete-label counts differ.'
    else
      new_korean.reverse_each do |match|
        label = match[:label]
        if label && !label.casecmp?('New Culn')
          problems << 'Unrelated annotation on New Culn.'
          next
        end
        replacement = "뉴 #{canonical}(New Culn)#{match[:particle]}"
        changed ||= replacement != match[0]
        text[match.begin(0)...match.end(0)] = replacement
      end
    end

    treasure_labels = matches(english, /\b(?:The )?Treasures of Culn\b/i)
    treasure_korean = matches(text, /
      (?<![가-힣])(?:컬른|쿨른)(?:[ \t]*\(Culn\))?
      (?:의[ \t]*)?보물
      (?:[ \t]*\((?<label>(?:The )?Treasures of Culn)\))?
      (?<particle>#{PARTICLES})?
      (?![가-힣])
    /ix)
    if treasure_labels.length != treasure_korean.length
      problems << 'Treasures of Culn source/Korean complete-label counts differ.'
    else
      treasure_korean.reverse_each do |match|
        label = match[:label]
        expected = treasure_labels.find { |source| source[0].casecmp?(label.to_s) }
        if label && !expected
          problems << 'Unrelated annotation on Treasures of Culn.'
          next
        end
        source_label = expected ? expected[0] : 'Treasures of Culn'
        replacement = "#{canonical}의 보물(#{source_label})#{match[:particle]}"
        changed ||= replacement != match[0]
        text[match.begin(0)...match.end(0)] = replacement
      end
    end

    # Remove complete labels before considering standalone city mentions.
    bare_english = english.gsub(/\bNew Culn\b|\b(?:The )?Treasures of Culn\b/i, ' ')
    if source_mentions?(bare_english, 'Culn')
      pattern = /
        (?<![가-힣])
        (?<name>컬른|쿨른)
        (?<label>[ \t]*\((?<label_text>[^()\r\n]*)\))?
        (?<particle>#{PARTICLES})?
        (?![가-힣])
      /x
      found = false
      unsafe = false
      text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
        label = match[:label_text].to_s
        next if label.match?(/\b(?:New Culn|Treasures of Culn)\b/i)
        found = true
        if !label.empty? && !label.match?(WORD.call('Culn'))
          unsafe = true
          next
        end
        replacement = "#{canonical}(Culn)#{match[:particle]}"
        changed ||= replacement != match[0]
        text[match.begin(0)...match.end(0)] = replacement
      end
      problems << 'English has a standalone Culn reference but no safe Korean counterpart.' unless found
      problems << 'Standalone Culn has an unrelated Korean annotation.' if unsafe
    end

    return [text, 'uncertain', problems.uniq.join(' ')] unless problems.empty?
    evidence = 'English identifies the village/place Culn; Japanese カルン / クルン and Chinese 考伦 corroborate. Standardized only bounded Korean forms to 컬른(Culn), preserved grammatical particles, and paired New Culn and Treasures of Culn as complete labels without rewriting their components in surrounding phrases.'
    [text, changed ? 'accepted' : 'not-an-issue', evidence]
  end

  def review_entity(text, english, entity_key)
    entity = ENTITIES.fetch(entity_key)
    english_name = entity.fetch(:english)
    return [text, 'excluded', "#{english_name} occurs only inside an opaque English runtime variable; preserve Korean unchanged."] unless
      source_mentions?(english, english_name)

    if entity_key == 'deity:akara'
      bare_source = english.gsub(/\bAkara[- \t]+Tor\b/i, ' ')
      return [text, 'excluded', 'The only Akara match is part of the distinct place Akara-Tor; preserve the complete place label and do not infer the deity.'] unless
        source_mentions?(bare_source, 'Akara')
      return [text, 'uncertain', 'Akara the Exile is an ancient Ring of Keozai member, but aligned EN/JA/ZH do not establish whether this is the worshipped deity or a distinct person.'] if
        english.match?(/\bAkara the Exile\b/i)
    end
    if entity_key == 'person:nyralim'
      personal_source = english.gsub(/\bCaer Nyralim\b/i, ' ')
      return [text, 'excluded', 'Nyralim occurs only inside the distinct full place name Caer Nyralim; preserve that complete label.'] unless
        source_mentions?(personal_source, 'Nyralim')
    end

    if entity_key == 'place:culn'
      replace_culn(text, english)
    else
      replace_person_name(text, entity, english_name, english)
    end
  end

  def run(argv)
    abort 'usage: review-proper-name-major-identities-continuation.rb START_D' unless argv.length == 1
    start_d = Integer(argv.fetch(0))
    m = ReviewedNameBatches
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_table = m.table(glossary_path)
    glossary_headers = glossary_table.headers
    glossary = glossary_table.map(&:to_h)
    definitions = ENTITIES.map do |key, entity|
      glossary_definition(glossary_headers, key, entity)
    end
    definitions.each do |definition|
      existing = glossary.select { |row| row['entity_key'] == definition['entity_key'] }
      raise "duplicate glossary key #{definition['entity_key']}" if existing.length > 1
      next if existing.empty?
      %w[english_canonical category korean_canonical status].each do |field|
        raise "conflicting glossary #{field}: #{definition['entity_key']}" unless
          existing.first[field] == definition[field]
      end
    end

    existing_glossary_keys = glossary.map { |row| row['entity_key'] }.to_h { |key| [key, true] }
    glossary.concat(definitions.reject { |definition| existing_glossary_keys[definition['entity_key']] })

    inventory = m.refresh_inventory
    generated = build_occurrences(inventory.values, definitions)
      .sort_by { |row| [m::RESOURCES.index(row[1]), row[2].to_i, row[3], row[0]] }
    actual_counts = generated.group_by(&:first).transform_values(&:length)
    raise "source-key scope changed: #{actual_counts.inspect}" unless actual_counts == EXPECTED_COUNTS

    by_key = inventory
    generated_by_source = generated.group_by { |values| [values[1], values[2], values[3]] }
    raise 'duplicate entity/source occurrence' unless generated.length ==
      generated.map { |row| [[row[1], row[2], row[3]], row[0]] }.uniq.length
    index = m.table(m::INDEX)
    existing_index = index.select { |row| ENTITIES.key?(row['entity_key']) }
    indexed_keys = existing_index.map { |row| [[row['resource'], row['ID_Linha'], row['Tipo_Variante']], row['entity_key']] }
    raise 'duplicate indexed entity/source occurrence' unless indexed_keys.uniq.length == indexed_keys.length
    existing_lookup = existing_index.to_h do |row|
      [[row['resource'], row['ID_Linha'], row['Tipo_Variante'], row['entity_key']], row]
    end
    additions = generated.reject do |row|
      existing_lookup.key?([row[1], row[2], row[3], row[0]])
    end
    additions.each do |values|
      values[6] = by_key.fetch([values[1], values[2], values[3]]).fetch('work_text')
    end

    reviews = generated_by_source.each_with_object([]) do |(source_key, occurrences), result|
      pending = occurrences.select do |values|
        row = existing_lookup[[values[1], values[2], values[3], values[0]]]
        !row || row['status'] == 'needs-context'
      end
      next if pending.empty?

      source = by_key.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      visible = visible_english(source)
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []
      if japanese.empty? || chinese.empty?
        pending.each do |occurrence|
          entity_key = occurrence[0]
          dispositions[entity_key] = 'uncertain'
          evidence << "#{entity_key}: aligned Japanese or Chinese source is empty; left Korean unchanged."
        end
      else
        pending.each do |occurrence|
          entity_key = occurrence[0]
          new_text, status, reason = review_entity(text, visible, entity_key)
          text = new_text if status == 'accepted' || status == 'not-an-issue'
          dispositions[entity_key] = status
          evidence << "#{entity_key}: #{reason}"
        end
      end
      aggregate = if dispositions.values.include?('accepted') || text != old
                    'accepted'
                  elsif dispositions.values.include?('uncertain')
                    'uncertain'
                  elsif dispositions.values.all? { |status| status == 'excluded' }
                    'excluded'
                  else
                    'not-an-issue'
                  end
      result << {
        'resource' => source_key[0], 'ID_Linha' => source_key[1], 'Tipo_Variante' => source_key[2],
        'entity_key' => pending.map(&:first).uniq.sort.join('|'),
        'status' => aggregate, 'old' => old, 'new' => text,
        'evidence' => evidence.join(' '), 'english' => english,
        'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by do |row|
      [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end

    review_keys = reviews.flat_map do |row|
      row['entity_key'].split('|').map do |entity|
        [entity, row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      end
    end.sort
    expected_pending_keys = generated.map do |values|
      current = existing_lookup[[values[1], values[2], values[3], values[0]]]
      [values[0], values[1], values[2], values[3]] unless current && current['status'] != 'needs-context'
    end.compact.sort
    raise 'review did not retain every pending generated entity/source key' unless
      review_keys == expected_pending_keys
    raise 'non-accepted review changed text' unless reviews.all? do |row|
      row['status'] == 'accepted' || row['old'] == row['new']
    end

    m.write_table(glossary_path, glossary_headers, glossary)
    m.write_table(m::INDEX, index.headers, index.map(&:to_h) + additions)
    out = File.join(__dir__, 'proper-name-reviewed-major-identities-continuation.tsv')
    m.write_table(out, m::HEADERS, reviews)
    counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    puts "Major names: generated source keys=#{actual_counts.inspect}; reviewed grouped rows=#{reviews.length}; dispositions=#{counts.inspect}"
    reviews.select { |row| row['status'] == 'uncertain' }.each do |row|
      puts "UNRESOLVED #{m.key(row).join(':')}: #{row.fetch('evidence')}"
    end
    m.run(out, start_d, 50)
  end
end

MajorIdentityReview.run(ARGV) if $PROGRAM_NAME == __FILE__
