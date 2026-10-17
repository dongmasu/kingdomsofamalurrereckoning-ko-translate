#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# This file is prepared only; running it registers and applies reviewed batches.
module YsaContinuation
  SOURCE_SHA256 = 'd0b90a2db7ee4f830cab0915aa897f24fb2a26806dbb6de04d07e5cf83d2afea'.freeze
  ALL_SOURCE_SHA256 = '2c1e5c4a7fa88f2203fb77d3aac8b3e351d7086c80b99c049c7242156e124151'.freeze
  ENTITY = 'place:ysa'.freeze
  WORD = /(?<![A-Za-z])Ysa(?![A-Za-z])/i
  HISTORICAL_DEFAULT_IDS = %w[
    495 1833 3873 4017 6347 6688 8814 11199 11236 11427 12219 12727
    13160 16719 18471 19105 22216 25425 26156 29102 32256 34404
    37187 37830 38513 39204 39481 39910 40183 40618 41210 46334
    47094 52389 53321 54436 56873 57472 58722 61425 61844
  ].freeze
  HISTORICAL_BASE_IDS = %w[1823 2234 4420].freeze
  # Zero-based Ysa mentions in Korean. All other mentions in these rows are people.
  MIXED_CITY_ORDINALS = {
    '9405' => [3, [1, 2]],
    '18032' => [3, [1]],
    '27627' => [2, [0]],
    '31067' => [8, [7]],
    '57013' => [2, [0]]
  }.freeze
  HOLDS = {
    '5300' => 'Daughter of Ysa is a purchased heraldic honorific. English Daughter, Japanese 娘 and Chinese 之女 do not establish literal ancestry from the founder versus figurative affiliation with the city.',
    '61515' => 'Son of Ysa is a purchased heraldic honorific. English Son, Japanese 息子 and Chinese 之子 do not establish literal ancestry from the founder versus figurative affiliation with the city.',
    '57728' => 'The first two Ysa mentions locate the contemporary court and its policy in the city. The final greatest of the Ysa\'s children / イーサの子供 / 伊萨最伟大的孩子 may invoke the founder of the House of Ballads or figuratively the city. Hold the entire cell unchanged rather than silently classify the final mention.',
    '64930' => 'Clan of Ysa / イーサの一族 / 伊萨一族 supports a named affiliation, but does not settle the founder\'s clan versus an institution associated with the city. Hold unchanged.'
  }.freeze
  PARTICLES = %w[
    에서부터의 으로부터의 으로서의 으로써의 에게서부터 에게로부터
    에서부터는 에서부터도 에서부터 으로부터는 으로부터도 으로부터
    에서의 으로의 로부터의 로의 에의 에게서는 에게서 에게도 에게는
    에게 에서는 에까지는 에까지도 에까지 에서도 에라도 에서라도
    에는 에도 에서 에선 으로서는 으로서도 으로써는 으로써 으로까지
    으로만 으로는 으로도 으로 로부터 로서는 로서 로써 로도 로는 로만
    로까지 라며 라는 라서 라고 라면 라 처럼 만큼 보다 행 였던 까지는
    까지도 까지 부터 는 가 를 와 의 에 로 도 만
  ].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|').freeze
  NAME = /
    (?<![가-힣A-Za-z0-9_])이사
    (?:
      (?<misplaced>의)[ \t]*\(Ysa\) |
      (?:[ \t]*\((?<label>[^()\r\n]*)\))?
    )
    (?<particle>#{PARTICLES})?
    (?![가-힣A-Za-z0-9_])
  /x
  COMPOUNDS = [
    {
      english: /\b(?:The )?Gardens of Ysa\b/i,
      korean: /(?<![가-힣A-Za-z0-9_])이사(?:[ \t]*\(Ysa\))?(?:의)?[ \t]*정원(?:[ \t]*\((?:The )?Gardens of Ysa\))?(?![A-Za-z])/i,
      canonical: '이사의 정원', label: 'Gardens of Ysa',
      corroboration: 'Japanese イーサの庭園 and Chinese 伊萨花园 identify the complete Gardens label, including the book title when used as such.'
    },
    {
      english: /\bYsa's Breath\b/i,
      korean: /(?<![가-힣A-Za-z0-9_])이사(?:[ \t]*\(Ysa\))?의[ \t]+숨결(?:[ \t]*\(Ysa's Breath\))?(?![A-Za-z])/i,
      canonical: '이사의 숨결', label: "Ysa's Breath",
      corroboration: 'Japanese イーサブレス and Chinese 伊萨之息 identify the complete reagent label, not an independent city mention.'
    }
  ].freeze
  HONOR_PARTS = {
    'bindings' => '결속구', 'grip' => '손잡이',
    'fulcrum' => '지렛목', 'Blades' => '칼날'
  }.freeze

  module_function

  def matches(text, pattern)
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
  end

  def protected_span?(text, first, last)
    opaque = matches(text, /\$[^$]*\$|<[^>]*>|\{[^{}]*\}/)
    return true if opaque.any? { |match| first < match.end(0) && match.begin(0) < last }

    prefix = text[0...first]
    prefix.count('(') > prefix.count(')')
  end

  def overlaps?(first, last, patch)
    first < patch[1] && patch[0] < last
  end

  def add_patch(patches, first, last, replacement)
    raise 'overlapping Ysa transformations' if patches.any? { |patch| overlaps?(first, last, patch) }
    patches << [first, last, replacement]
  end

  def transform(old, english, mixed)
    raw_mentions = matches(old, /(?<![가-힣A-Za-z0-9_])이사/)
    source_count = english.scan(WORD).length
    return [old, ['English/Korean Ysa mention counts differ.']] unless raw_mentions.length == source_count
    if mixed && (source_count != mixed[0] || raw_mentions.length != mixed[0])
      return [old, ['The reviewed mixed person/city mention layout changed.']]
    end

    city_starts = raw_mentions.each_with_index.select { |_match, ordinal| !mixed || mixed[1].include?(ordinal) }
      .map { |match, _ordinal| match.begin(0) }
    patches = []
    covered = []
    problems = []
    COMPOUNDS.each do |spec|
      source_labels = matches(english, spec.fetch(:english))
      next if source_labels.empty?
      korean_labels = matches(old, spec.fetch(:korean))
      if korean_labels.length != source_labels.length
        problems << "Complete #{spec.fetch(:label)} source/Korean label counts differ."
        next
      end
      korean_labels.each do |match|
        unless city_starts.include?(match.begin(0)) && !protected_span?(old, match.begin(0), match.end(0))
          problems << "Unsafe or non-city complete #{spec.fetch(:label)} span."
          next
        end
        following = old[match.end(0)..].to_s
        if following.match?(/\A[ \t]*\([^()\r\n]*[A-Za-zァ-ヶ一-龯]/)
          problems << "Unreviewed annotation after #{spec.fetch(:label)}."
          next
        end
        label = match[0][/\(((?:The )?Gardens of Ysa|Ysa's Breath)\)\z/i, 1]
        # Keep an already complete English pair and its valid Korean wording.
        replacement = if label && !match[0].include?('(Ysa)')
                        match[0]
                      else
                        "#{spec.fetch(:canonical)}(#{label || spec.fetch(:label)})"
                      end
        add_patch(patches, match.begin(0), match.end(0), replacement)
        covered << match.begin(0)
      end
    end

    honor_labels = matches(english, /\bYsa Honor Brands?(?: (?:bindings|grip|fulcrum|Blades))?\b/)
    honor_labels.each do |source_match|
      label = source_match[0]
      component = HONOR_PARTS.keys.find { |part| label.end_with?(" #{part}") }
      suffix = component ? "(?:의)?[ \\t]+#{HONOR_PARTS.fetch(component)}" : ''
      pattern = Regexp.new(
        '(?<![가-힣A-Za-z0-9_])이사(?:[ \t]*\(Ysa\))?(?:의)?[ \t]+' \
        '명예[ \t]+(?:낙인|문장|표장)(?:[ \t]*\(Ysa Honor Brands?\))?' \
        "#{suffix}(?:[ \\t]*\\(#{Regexp.escape(label)}\\))?(?![가-힣A-Za-z0-9_])"
      )
      found = matches(old, pattern)
      if found.length != 1 || honor_labels.length != 1
        problems << "No unique complete Korean span for #{label}."
        next
      end
      match = found.first
      if protected_span?(old, match.begin(0), match.end(0))
        problems << "Protected complete #{label} span."
        next
      end
      if old[match.end(0)..].to_s.match?(/\A[ \t]*\([^()\r\n]*[A-Za-zァ-ヶ一-龯]/)
        problems << "Unreviewed annotation after #{label}."
        next
      end
      # Move only related annotations. Do not normalize 낙인/문장/표장 or reach
      # backward into another reagent/item on the preceding line.
      korean = match[0].gsub(/[ \t]*\((?:Ysa|Ysa Honor Brands?(?: (?:bindings|grip|fulcrum|Blades))?)\)/, '')
      add_patch(patches, match.begin(0), match.end(0), "#{korean}(#{label})")
      covered << match.begin(0)
    end

    matches(old, NAME).each do |match|
      next unless city_starts.include?(match.begin(0))
      next if patches.any? { |patch| overlaps?(match.begin(0), match.end(0), patch) }
      if protected_span?(old, match.begin(0), match.end(0))
        problems << 'A city mention lies in an opaque token or another annotation.'
        next
      end
      tail = old[match.end(0)..].to_s
      full_label = tail.match(/\A[ \t]+(?<body>[^()\r\n.!?;]{1,80})\((?<label>[^()\r\n]*)\)/)
      label = match[:label]
      if label && label != 'Ysa'
        if label.match?(WORD) || label.match?(/イーサ|伊萨/)
          covered << match.begin(0)
        else
          problems << 'A bounded Ysa span has an unrelated existing annotation.'
        end
        next
      end
      if full_label && full_label[:label].match?(WORD) && !full_label[:body].include?('이사')
        covered << match.begin(0)
        next
      end
      if tail.match?(/\A[ \t]*\([^()\r\n]*[A-Za-zァ-ヶ一-龯]/)
        problems << 'A bounded Ysa span is followed by an unreviewed annotation.'
        next
      end
      particle = match[:misplaced].to_s + match[:particle].to_s
      add_patch(patches, match.begin(0), match.end(0), "이사(Ysa)#{particle}")
      covered << match.begin(0)
    end
    problems << 'At least one city mention lacks a safely bounded reviewed span.' unless
      (city_starts - covered).empty?
    return [old, problems.uniq] unless problems.empty?

    text = old.dup
    patches.sort_by(&:first).reverse_each { |first, last, replacement| text[first...last] = replacement }
    tokens = /\$[^$]*\$|<[^>]*>|\{[^{}]*\}/
    raise 'Ysa edit changed opaque tokens' unless old.scan(tokens) == text.scan(tokens)
    raise 'Ysa edit changed line endings' unless old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)
    [text, []]
  end

  def run(argv)
    abort 'usage: review-proper-name-ysa-continuation.rb START_D' unless argv.length == 1
    start_d = Integer(argv.fetch(0))
    m = ReviewedNameBatches
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = m.table(glossary_path)
    definition = glossary.headers.zip([
      ENTITY, 'Ysa', 'place', '이사(Ysa)', '', '이사',
      'base:2249|base:1806|default:1440|default:31067|default:60247', 'confirmed',
      'English city Ysa, Japanese イーサ, Chinese 伊萨. Historical King/Lord Ysa is a different person: Japanese イーサ王/イーサ卿 and Chinese 伊萨国王/伊萨领主. Exclude historical references and person-derived statue/muffin labels from this city pass. Complete Gardens, Breath and Honor Brand labels are paired in full without asserting their etymology or treating reagents/items as cities. Keep Korean item terms, existing valid complete annotations and all particles. No manual pronunciation claim.'
    ]).to_h
    existing = glossary.select { |row| row['entity_key'] == ENTITY }
    raise 'duplicate Ysa glossary entity' if existing.length > 1
    if existing.first
      %w[english_canonical category korean_canonical status].each do |field|
        raise "conflicting Ysa glossary #{field}" unless existing.first[field] == definition[field]
      end
    end

    # Always rebuild all three resources from live source and active CSVs.
    inventory = m.refresh_inventory
    generated = build_occurrences(inventory.values, [definition]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
      .sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    sources = generated.map { |row| inventory.fetch(m.key(row)) }
    fingerprint = lambda do |rows|
      rows.map do |row|
        row.values_at('resource', 'ID_Linha', 'Tipo_Variante', 'en_texts_json', 'ja_texts_json', 'zh_text')
      end
    end
    visible_source = lambda do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? do |text|
        text.gsub(/\$[^$]*\$/, ' ').match?(WORD)
      end
    end
    visible_sources = sources.select { |row| visible_source.call(row) }
    raise 'Ysa generated EN/JA/ZH inventory changed; focused review required' unless
      sources.length == 345 &&
      Digest::SHA256.hexdigest(JSON.generate(fingerprint.call(sources))) == ALL_SOURCE_SHA256
    raise 'Ysa visible EN/JA/ZH scope changed; focused review required before any registration' unless
      visible_sources.length == 330 &&
      Digest::SHA256.hexdigest(JSON.generate(fingerprint.call(visible_sources))) == SOURCE_SHA256

    reviews = sources.map do |source|
      key = m.key(source)
      id = key[1]
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      visible_english = english.gsub(/\$[^$]*\$/, ' ')
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      text = old
      reason = nil
      historical = key[0] == 'base' ? HISTORICAL_BASE_IDS.include?(id) : HISTORICAL_DEFAULT_IDS.include?(id)
      mixed = key[0] == 'default' && MIXED_CITY_ORDINALS[id]
      hold = key[0] == 'default' && HOLDS[id]

      if !visible_source.call(source)
        status = 'excluded'
        reason = 'Ysa occurs only inside an opaque English runtime variable after $...$ spans are removed. Excluded from player-visible translation review; preserve the Korean cell unchanged while retaining this generated source key in the occurrence index.'
      elsif historical
        status = 'excluded'
        reason = 'English identifies the historical Fae ruler or his personal deeds/associates, not the city. Aligned Japanese and Chinese corroborate the person; King/Lord titles are イーサ王/イーサ卿 and 伊萨王/伊萨国王/伊萨领主. Bare person mentions, the personal invocation Praise Ysa, statues and King Ysa\'s Muffin remain untouched. No person entity is registered by this city script.'
      elsif key[0] == 'default' && id == '27122'
        status = 'excluded'
        reason = 'Standalone Ysa\'s Summer / イーサの盛夏 / 伊萨之夏 is a complete separate title, not an independently established city reference. Preserve 이사의 여름; do not guess its category or annotate its Ysa component as the city.'
      elsif hold
        status = 'uncertain'
        reason = hold
      else
        text, problems = transform(old, visible_english, mixed)
        status = problems.empty? ? (old == text ? 'not-an-issue' : 'accepted') : 'uncertain'
        reason = if problems.empty?
                   'English is the identity anchor; the complete aligned Japanese and Chinese evidence fields corroborate this city/complete named-label occurrence. The usual city forms are イーサ and 伊萨; default:286 retains literal Ysa in both sources. Pair only bounded 이사 spans, never generic 이자. Correct malformed 이사의(Ysa) to 이사(Ysa)의. Preserve existing valid complete English/Japanese annotations, item wording, particles, tokens, and line breaks.'
                 else
                   "The live Korean cell needs focused re-review; no partial edit applied: #{problems.join(' ')}"
                 end
        COMPOUNDS.each { |spec| reason += " #{spec.fetch(:corroboration)}" if visible_english.match?(spec.fetch(:english)) }
        if visible_english.match?(/\bYsa Honor Brands?\b/)
          reason += ' Japanese オナーブランド and the aligned Chinese weapon/component/forging labels corroborate the complete named ceremonial weapon. Pair each whole source label, retaining 낙인/문장/표장 and component wording; this pass does not settle their independent terminology differences.'
        end
        if mixed
          reason += " Mixed historical/city cell: only zero-based mentions #{mixed[1].inspect} are city labels; the other #{mixed[0] - mixed[1].length} person mentions and all their titles remain byte-for-byte unchanged."
        end
      end
      {
        'resource' => key[0], 'ID_Linha' => id, 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => text,
        'evidence' => reason, 'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end

    raise 'duplicate Ysa source keys' unless reviews.map { |row| m.key(row) }.uniq.length == reviews.length
    raise 'non-accepted Ysa edit' unless reviews.all? { |row| row['status'] == 'accepted' || row['old'] == row['new'] }
    index = m.table(m::INDEX)
    indexed_keys = index.select { |row| row['entity_key'] == ENTITY }.map { |row| m.key(row) }
    raise 'duplicate existing Ysa keys' unless indexed_keys.uniq.length == indexed_keys.length
    additions = generated.reject { |row| indexed_keys.include?(m.key(row)) }
    m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + (existing.empty? ? [definition] : []))
    m.write_table(m::INDEX, index.headers, index.map(&:to_h) + additions)
    out = File.join(__dir__, 'proper-name-reviewed-ysa-continuation.tsv')
    m.write_table(out, m::HEADERS, reviews)
    puts "Ysa: #{reviews.length} row keys; resources=#{reviews.group_by { |row| row['resource'] }.transform_values(&:length).inspect}"
    puts "Ysa dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    puts 'Reviewed groups: city/complete label=276; historical person excluded=44; mixed=5; separate title excluded=1; referent holds=4.'
    reviews.select { |row| row['status'] == 'uncertain' }.each do |row|
      puts "UNRESOLVED #{m.key(row).join(':')}: #{row.fetch('evidence')}"
    end
    m.run(out, start_d, 50)
  end
end

YsaContinuation.run(ARGV) if $PROGRAM_NAME == __FILE__
