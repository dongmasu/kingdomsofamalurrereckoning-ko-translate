#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'proper-name-cell-editor'

module NamedTitlesFollowup
  M = ReviewedNameBatches
  ROOT = File.expand_path('../../..', __dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  CONFIRMED = '/private/tmp/proper-name-named-titles-confirmed-20261015.tsv'
  HOLDS = '/private/tmp/proper-name-named-titles-holds-20261015.tsv'
  DEFINITIONS = '/private/tmp/proper-name-named-titles-definitions-confirmed-20261015.tsv'

  TOME_EN = /(?<![A-Za-z])(?<article>The[ \t]+)?Tome of Contrition(?![A-Za-z])/
  BOOK_EN = /(?<![A-Za-z])The Book of Gentle Beasts(?![A-Za-z])/
  MANTLE_EN = /(?<![A-Za-z])The Mantle Passes(?![A-Za-z])/
  BALLAD_EN = /(?<![A-Za-z])Two Knights and a Troll(?<part>, Part [IVX]+)?(?![A-Za-z])/

  PARTICLE = '(?:이라는|이라며|이라서|이라면|이라고|이란|이여|으로|에서|에게|까지|부터|이라|라며|라서|라면|라고|란|여|은|는|이|가|을|를|과|와|의|에|도|만|로)'
  PARTICLE_BOUNDARY = '(?=[ \t\r\n.,!?;:…。，！？、)\\]»’\\x27"]|\\z)'

  TOME_KO = Regexp.new(
    "(?<name>참회의[ \\t]+고서|참회의[ \\t]+서|회개의[ \\t]+서|회개서)" \
    "(?:(?<before_particle>#{PARTICLE})(?=[ \\t]*\\())?" \
    "(?:[ \\t]*\\((?<label>[^()\\r\\n]*)\\))?" \
    "(?:(?<after_particle>#{PARTICLE})#{PARTICLE_BOUNDARY})?"
  )
  BOOK_KO = /
    (?<name>온순한[ \t]+야수들의[ \t]+책|온순한[ \t]+야수의[ \t]+책)
    (?:[ \t]*\((?<label>[^()\r\n]*)\))?
  /x
  BALLAD_KO = Regexp.new(
    "(?<name>기사[ \\t]*2명과[ \\t]*트롤[ \\t]*하나|두[ \\t]+기사와[ \\t]+트롤)" \
    "(?<part>[ \\t]*,?[ \\t]*제(?:[0-9]+|[IVX]+)부)?" \
    "(?:(?<before_particle>#{PARTICLE})(?=[ \\t]*\\())?" \
    "(?:[ \\t]*\\((?<label>[^()\\r\\n]*)\\))?" \
    "(?:(?<after_particle>#{PARTICLE})#{PARTICLE_BOUNDARY})?"
  )

  SPECS = [
    {
      key: 'unique_item:tome-of-contrition',
      english: 'Tome of Contrition',
      canonical: '참회의 서',
      category: 'unique item',
      aliases: 'The Tome of Contrition',
      variants: '참회의 고서|회개의 서|회개서',
      source: TOME_EN,
      korean: TOME_KO,
      expected: 18,
      evidence: 'The source identifies this as a rare book, artifact, record, and relic. Japanese 悔恨の書 and Chinese 悔罪之书 support 참회의 서. Retain source-initial capitalized The in the bilingual label; otherwise use Tome of Contrition. Normalize the Korean particle allomorph and keep it after the complete pair.'
    },
    {
      key: 'unique_item:book-of-gentle-beasts',
      english: 'The Book of Gentle Beasts',
      canonical: '온순한 야수들의 책',
      category: 'unique item',
      aliases: '',
      variants: '온순한 야수의 책',
      source: BOOK_EN,
      korean: BOOK_KO,
      expected: 3,
      evidence: 'These aligned rows are the named book title. Japanese 優しき獣たちの書 and Chinese 温和野兽之书 support the plural possessive sense. Keep the complete title as one bilingual unit.'
    },
    {
      key: 'candidate:the-mantle-passes',
      english: 'The Mantle Passes',
      canonical: nil,
      category: 'unresolved title',
      aliases: '',
      variants: '',
      source: MANTLE_EN,
      expected: 2,
      evidence: 'Hold unchanged: Japanese 渡されたマント suggests a mantle/cloak being passed or handed over, while Chinese 帷幔通路 suggests a curtain/mantle passage. The title-only rows do not establish whether this is a place, item, or other title.'
    },
    {
      key: 'work:two-knights-and-a-troll',
      english: 'Two Knights and a Troll',
      canonical: '두 기사와 트롤',
      category: 'named work',
      aliases: '',
      variants: '기사 2명과 트롤 하나',
      source: BALLAD_EN,
      korean: BALLAD_KO,
      expected: 24,
      evidence: 'English context explicitly calls the named work a ballad, song, or story; Japanese 2人の騎士とトロール and Chinese 两骑士与巨魔 corroborate the title. Pair the entire title including each Part I-V label exactly once.'
    }
  ].freeze

  module_function

  def read_rows(path)
    CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
  end

  def source_key(resource, row)
    [row.fetch('ID_Linha'), %w[affix base].include?(resource) ? row.fetch('Tipo_Variante') : '']
  end

  def source_tables
    result = {}
    %w[en_us ja_jp zh_cn].each do |locale|
      %w[affix base default].each do |resource|
        path = File.join(ROOT, 'src', 'csv', locale, "locatexts_#{locale}.koalocatext_#{resource}.csv")
        rows = read_rows(path)
        result[[locale, resource]] = {
          by_id: rows.group_by { |row| row.fetch('ID_Linha') },
          by_key: rows.group_by { |row| source_key(resource, row) }
        }
      end
    end
    result
  end

  def source_texts(tables, locale, resource, key)
    table = tables.fetch([locale, resource])
    rows =
      if locale == 'en_us' || resource == 'default'
        table.fetch(:by_id).fetch(key[0], [])
      else
        table.fetch(:by_key).fetch(key, [])
      end
    rows.map { |row| row.fetch('Texto') }
  end

  def verify_source!(tables, source, key)
    resource, id, variant = key
    en = source_texts(tables, 'en_us', resource, [id, variant])
    ja = source_texts(tables, 'ja_jp', resource, [id, variant])
    zh = source_texts(tables, 'zh_cn', resource, [id, variant])
    raise "source row missing #{key.inspect}" if en.empty? || ja.empty? || zh.empty?
    raise "inventory/source EN mismatch #{key.inspect}" unless JSON.parse(source.fetch('en_texts_json')) == en
    raise "inventory/source JA mismatch #{key.inspect}" unless JSON.parse(source.fetch('ja_texts_json')) == ja
    raise "inventory/source ZH mismatch #{key.inspect}" unless source.fetch('zh_text') == zh.first
    [en.join("\n"), ja.join("\n"), zh.join("\n")]
  end

  def field_value(bytes, span)
    raw = bytes.byteslice(span)
    CSV.parse_line(raw.force_encoding('UTF-8'), col_sep: ';').first.to_s
  end

  # Read only selected logical records, tolerating unrelated invalid bytes elsewhere.
  def current_work_texts(keys)
    by_resource = keys.group_by(&:first)
    result = {}
    by_resource.each do |resource, resource_keys|
      path = File.join(ROOT, 'work', 'zh_cn', "locatexts_zh_cn.koalocatext_#{resource}.csv")
      bytes = File.binread(path)
      targets = resource_keys.to_h { |key| [key, true] }
      rows = ProperNameCellEditor.records(bytes)
      rows.drop(1).each do |fields|
        id = field_value(bytes, fields.fetch(0))
        variant = %w[affix base].include?(resource) ? field_value(bytes, fields.fetch(1)) : ''
        key = [resource, id, variant]
        next unless targets.key?(key)

        row_span = fields.first.begin...fields.last.end
        values = CSV.parse(bytes.byteslice(row_span).force_encoding('UTF-8'), col_sep: ';').first
        text_index = %w[affix base].include?(resource) ? 2 : 1
        result[key] = values.fetch(text_index)
      end
      missing = resource_keys - result.keys
      raise "current work row missing #{missing.first.inspect}" unless missing.empty?
    end
    result
  end

  def source_mentions(english, spec)
    english.to_enum(:scan, spec.fetch(:source)).map { Regexp.last_match.dup }
  end

  def particle_pair(particle, korean)
    pairs = [
      %w[은 는], %w[이 가], %w[을 를], %w[과 와],
      %w[이라는 라는], %w[이라고 라고], %w[이라며 라며],
      %w[이라서 라서], %w[이라면 라면], %w[이란 란], %w[이여 여],
      %w[으로 로]
    ]
    pairs.find { |pair| pair.include?(particle) }
  end

  def normalize_particle(particle, korean)
    return '' if particle.nil? || particle.empty?
    pair = particle_pair(particle, korean)
    return particle unless pair

    final = (korean[-1].ord - 0xAC00) % 28
    if pair == %w[으로 로]
      return final.zero? || final == 8 ? '로' : '으로'
    end
    pair[final.zero? ? 1 : 0]
  end

  def roman_to_integer(value)
    { 'I' => 1, 'II' => 2, 'III' => 3, 'IV' => 4, 'V' => 5 }.fetch(value)
  end

  def existing_label_matches?(label, expected)
    label.nil? || label.empty? || label.casecmp(expected).zero?
  end

  def transform_tome(text, spec, english)
    english_mentions = source_mentions(english, spec)
    korean_matches = text.to_enum(:scan, spec.fetch(:korean)).map { Regexp.last_match.dup }
    return [text, 'uncertain', 'English/Korean title occurrence counts differ; leave this cell unchanged.'] unless
      english_mentions.length == korean_matches.length && !korean_matches.empty?

    patches = []
    korean_matches.each_with_index do |match, index|
      source_mention = english_mentions.fetch(index)
      label = source_mention[:article] ? 'The Tome of Contrition' : 'Tome of Contrition'
      next unless existing_label_matches?(match[:label], label) ||
        existing_label_matches?(match[:label], 'Tome of Contrition') ||
        existing_label_matches?(match[:label], 'The Tome of Contrition')
      before_particle = match[:before_particle]
      after_particle = match[:after_particle]
      return [text, 'uncertain', 'Multiple adjacent particle spans; no change made.'] if before_particle && after_particle
      particle = normalize_particle(before_particle || after_particle, spec.fetch(:canonical))
      replacement = "#{spec.fetch(:canonical)}(#{label})#{particle}"
      patches << [match.begin(0), match.end(0), replacement]
    end
    return [text, 'uncertain', 'An adjacent parenthetical does not identify the Tome title; no change made.'] unless
      patches.length == korean_matches.length

    apply_patches(text, patches)
  end

  def transform_simple_title(text, spec, english)
    mentions = source_mentions(english, spec)
    matches = text.to_enum(:scan, spec.fetch(:korean)).map { Regexp.last_match.dup }
    return [text, 'uncertain', 'English/Korean title occurrence counts differ; leave this cell unchanged.'] unless
      mentions.length == matches.length && !matches.empty?

    patches = []
    matches.each_with_index do |match, index|
      expected = mentions.fetch(index).to_s
      next unless existing_label_matches?(match[:label], expected)
      patches << [match.begin(0), match.end(0), "#{spec.fetch(:canonical)}(#{expected})"]
    end
    return [text, 'uncertain', 'An adjacent parenthetical does not identify the book title; no change made.'] unless
      patches.length == matches.length

    apply_patches(text, patches)
  end

  def transform_named_work(text, spec, english)
    mentions = source_mentions(english, spec)
    matches = text.to_enum(:scan, spec.fetch(:korean)).map { Regexp.last_match.dup }
    return [text, 'uncertain', 'English/Korean title occurrence counts differ; leave this cell unchanged.'] unless
      mentions.length == matches.length && !matches.empty?

    patches = []
    matches.each_with_index do |match, index|
      source_mention = mentions.fetch(index)
      part = source_mention[:part]
      english_label = "Two Knights and a Troll#{part}"
      korean_part = match[:part]
      if part
        english_roman = part[/Part ([IVX]+)/, 1]
        expected_korean_part = roman_to_integer(english_roman)
        if korean_part
          korean_roman_or_number = korean_part[/제([0-9]+|[IVX]+)부/, 1]
          actual_korean_part = korean_roman_or_number.match?(/\A[0-9]+\z/) ?
            korean_roman_or_number.to_i : roman_to_integer(korean_roman_or_number)
          next unless actual_korean_part == expected_korean_part
        else
          next
        end
        korean_name = "#{spec.fetch(:canonical)}, 제#{expected_korean_part}부"
      else
        next if korean_part
        korean_name = spec.fetch(:canonical)
      end
      next unless existing_label_matches?(match[:label], english_label)
      before_particle = match[:before_particle]
      after_particle = match[:after_particle]
      return [text, 'uncertain', 'Multiple adjacent particle spans; no change made.'] if before_particle && after_particle
      particle = normalize_particle(before_particle || after_particle, korean_name)
      patches << [match.begin(0), match.end(0), "#{korean_name}(#{english_label})#{particle}"]
    end
    return [text, 'uncertain', 'A Part label or adjacent parenthetical is not source-aligned; no change made.'] unless
      patches.length == matches.length

    apply_patches(text, patches)
  end

  def apply_patches(text, patches)
    proposed = text.dup
    patches.reverse_each { |first, last, replacement| proposed[first...last] = replacement }
    [proposed, proposed == text ? 'not-an-issue' : 'accepted', nil]
  end

  def transform(text, spec, english)
    case spec.fetch(:key)
    when 'unique_item:tome-of-contrition'
      transform_tome(text, spec, english)
    when 'unique_item:book-of-gentle-beasts'
      transform_simple_title(text, spec, english)
    when 'work:two-knights-and-a-troll'
      transform_named_work(text, spec, english)
    else
      [text, 'uncertain', 'No confirmed transformation is defined for this candidate.']
    end
  end

  def definition_rows(glossary, specs, groups)
    headers = glossary.headers
    entries = glossary.map do |row|
      [row['entity_key'], row['english_canonical'], *row['english_aliases'].to_s.split('|')]
    end
    specs.reject { |spec| spec[:canonical].nil? }.map do |spec|
      raise "glossary key already exists: #{spec[:key]}" if entries.any? { |entry| entry[0] == spec[:key] }
      terms = [spec[:english], *spec[:aliases].to_s.split('|')].reject(&:empty?)
      collision = entries.find { |entry| (terms & entry[1..-1].compact).any? }
      raise "glossary English term collision: #{collision.inspect}" if collision

      evidence_ids = groups.fetch(spec[:key]).map do |entry|
        resource, id, = entry.fetch(:key)
        "#{resource}:#{id}"
      end.uniq.join('|')
      headers.zip([
        spec[:key], spec[:english], spec[:category],
        "#{spec[:canonical]}(#{spec[:english]})", spec[:aliases], spec[:variants],
        evidence_ids, 'confirmed', spec[:evidence]
      ]).to_h
    end
  end

  def run
    [CONFIRMED, HOLDS, DEFINITIONS].each do |path|
      raise "refusing to overwrite existing output: #{path}" if File.exist?(path)
    end

    inventory = M.table(INVENTORY)
    raise "unexpected aligned inventory size: #{inventory.length}" unless inventory.length == 73_430
    glossary = M.table(GLOSSARY)
    tables = source_tables
    grouped = Hash.new { |hash, key| hash[key] = [] }

    inventory.each do |source|
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      spec = SPECS.find { |candidate| english.match?(candidate.fetch(:source)) }
      next unless spec
      key = [source.fetch('resource'), source.fetch('ID_Linha'), source['Tipo_Variante'].to_s]
      en, ja, zh = verify_source!(tables, source, key)
      grouped[spec.fetch(:key)] << {
        source: source, key: key, english: en, japanese: ja, chinese: zh
      }
    end

    SPECS.each do |spec|
      count = grouped.fetch(spec.fetch(:key), []).length
      raise "source scope count changed for #{spec[:key]}: #{count}" unless count == spec.fetch(:expected)
    end
    all_entries = SPECS.flat_map { |spec| grouped.fetch(spec.fetch(:key)) }
    current_texts = current_work_texts(all_entries.map { |entry| entry.fetch(:key) })

    confirmed_specs = SPECS.reject { |spec| spec.fetch(:canonical).nil? }
    confirmed_reviews = []
    hold_reviews = []
    SPECS.each do |spec|
      grouped.fetch(spec.fetch(:key)).each do |entry|
        old = current_texts.fetch(entry.fetch(:key))
        if spec.fetch(:canonical).nil?
          proposed, status, detail = old, 'uncertain',
            'Classification remains unresolved; candidate row is hold-only and excluded from the confirmed application manifest.'
        else
          proposed, status, detail = transform(old, spec, entry.fetch(:english))
        end
        raise "line breaks changed #{entry.fetch(:key).inspect}" unless
          old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
        raise "runtime token changed #{entry.fetch(:key).inspect}" unless
          ProperNameCellEditor.tokens(old) == ProperNameCellEditor.tokens(proposed)

        evidence = "#{spec.fetch(:evidence)} EN=#{entry.fetch(:english).inspect}; JA=#{entry.fetch(:japanese).inspect}; ZH=#{entry.fetch(:chinese).inspect}."
        evidence += " #{detail}" if detail
        dispositions = { spec.fetch(:key) => status }
        row = {
          'resource' => entry.fetch(:key)[0],
          'ID_Linha' => entry.fetch(:key)[1],
          'Tipo_Variante' => entry.fetch(:key)[2],
          'entity_key' => spec.fetch(:key),
          'status' => status,
          'old' => old,
          'new' => proposed,
          'evidence' => evidence,
          'english' => entry.fetch(:english),
          'japanese' => entry.fetch(:japanese),
          'chinese' => entry.fetch(:chinese),
          'entity_dispositions_json' => JSON.generate(dispositions),
          'previous_status' => '',
          'previous_evidence' => ''
        }
        spec.fetch(:canonical).nil? ? hold_reviews << row : confirmed_reviews << row
      end
    end

    [confirmed_reviews, hold_reviews].each do |reviews|
      keys = reviews.map { |row| M.key(row) }
      raise 'duplicate resource/ID/variant proposal row' unless keys.uniq.length == keys.length
      reviews.sort_by! do |row|
        [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
      end
    end

    definitions = definition_rows(glossary, confirmed_specs, grouped)
    M.write_table(CONFIRMED, M::HEADERS, confirmed_reviews)
    M.write_table(HOLDS, M::HEADERS, hold_reviews)
    M.write_table(DEFINITIONS, glossary.headers, definitions)

    puts "scope=#{all_entries.length}; confirmed=#{confirmed_reviews.length}; candidate_holds=#{hold_reviews.length}; definitions=#{definitions.length}"
    puts "confirmed statuses=#{confirmed_reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    puts "confirmed=#{CONFIRMED}"
    puts "holds=#{HOLDS}"
    puts "definitions=#{DEFINITIONS}"
  end
end

NamedTitlesFollowup.run if $PROGRAM_NAME == __FILE__
