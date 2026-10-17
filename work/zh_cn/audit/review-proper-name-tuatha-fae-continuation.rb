#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module TuathaReview
  M = ReviewedNameBatches
  AUDIT = __dir__
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  OUTPUT = File.join(AUDIT, 'proper-name-reviewed-tuatha-continuation.tsv')

  TUATHA = {
    'entity_key' => 'faction:tuatha',
    'english_canonical' => 'Tuatha',
    'category' => 'faction',
    'korean_canonical' => '투아사(Tuatha)',
    'english_aliases' => '',
    'korean_variants' => '투아타|투아사족|투아타족|투아사인|투아타인',
    'evidence_ids' => '',
    'status' => 'confirmed',
    'notes' => 'English names the Tuatha faction/people; aligned Japanese ツアサ and Chinese 图阿撒/phonetic variants corroborate. Normalize 투아타 to 투아사. Keep the distinct full-name record Tuatha Deohn atomic. The official manual lists four playable peoples but omits Tuatha; its list is not exhaustive.'
  }.freeze

  TUATHA_DEOHN = {
    'entity_key' => 'faction:tuatha-deohn',
    'english_canonical' => 'Tuatha Deohn',
    'category' => 'faction',
    'korean_canonical' => '투아사 데온(Tuatha Deohn)',
    'english_aliases' => '',
    'korean_variants' => '투아타 데온|투아사 데온',
    'evidence_ids' => '',
    'status' => 'confirmed',
    'notes' => 'Complete faction name, distinct from the shorter Tuatha entity. Japanese ツアサ・デオン and Chinese 图阿撒德奥/phonetic variants corroborate. Never split into nested Tuatha and Deohn labels.'
  }.freeze

  DEFINITIONS = [TUATHA, TUATHA_DEOHN].freeze
  GENERIC_ENTITY = TUATHA.fetch('entity_key')
  FULL_ENTITY = TUATHA_DEOHN.fetch('entity_key')
  TOKEN = /(투아사|투아타)(?:\(Tuatha\))?(족|인|어)?/i
  FULL_KOREAN = /(?:투아사|투아타)(?:\(Tuatha\))?[ \t]+데온[ \t]*(?:\(Tuatha Deohn\))?/i
  FULL_ENGLISH = /\bTuatha[ \t]+Deohn\b/i
  GENERIC_ENGLISH = /(?<![A-Za-z])Tuatha(?![A-Za-z])/i
  OPAQUE = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/

  module_function

  def texts(row)
    english = JSON.parse(row.fetch('en_texts_json') || '[]').compact
    japanese = JSON.parse(row.fetch('ja_texts_json') || '[]').compact
    [english, japanese, row.fetch('zh_text').to_s]
  end

  def english_has_generic?(english)
    english.gsub(FULL_ENGLISH, ' ').match?(GENERIC_ENGLISH)
  end

  def visible_text(text)
    text.gsub(OPAQUE, ' ')
  end

  def glossary_entries(glossary, start_d)
    definitions = DEFINITIONS.map do |definition|
      matches = glossary.select { |entry| entry['entity_key'] == definition['entity_key'] }
      raise "duplicate glossary entity: #{definition['entity_key']}" if matches.length > 1
      current = matches.first
      if current
        %w[english_canonical category korean_canonical status].each do |field|
          raise "conflicting glossary definition: #{definition['entity_key']}" unless current[field] == definition[field]
        end
        current
      else
        definition.merge('evidence_ids' => "D-#{start_d}|aligned-source-inventory:all")
      end
    end
    definitions
  end

  def protected_spans(text)
    spans = []
    text.to_enum(:scan, /\(([^()\r\n]*)\)/).each do
      parens = Regexp.last_match
      next if parens[1].casecmp('Tuatha').zero?
      next unless parens[1].match?(GENERIC_ENGLISH)

      opening = parens.begin(0)
      prefix = text[0...opening]
      start = prefix.rindex(/투아사|투아타/)
      next unless start
      next if opening - start > 44

      between = prefix[(start + prefix[start..].match(/\A(?:투아사|투아타)/)[0].length)...]
      next unless between.match?(/\A[\p{Hangul}\s,·'’\-]*\z/)
      next if between.match?(/[.!?;:\r\n()]/)

      token = TOKEN.match(text[start..])
      next unless token

      finish = start + token[0].length
      spans << [start, finish]
    end
    spans.uniq
  end

  def normalize_korean(old, english, normalize_generic:)
    text = old.dup
    full_in_source = english.match?(FULL_ENGLISH)
    full_in_korean = visible_text(text).match?(FULL_KOREAN)

    if full_in_source
      opaque_spans = text.to_enum(:scan, OPAQUE).map do
        match = Regexp.last_match
        [match.begin(0), match.end(0)]
      end
      text.gsub!(FULL_KOREAN) do |matched|
        first = Regexp.last_match.begin(0)
        last = Regexp.last_match.end(0)
        opaque = opaque_spans.any? { |left, right| first < right && left < last }
        opaque ? matched : '투아사 데온(Tuatha Deohn)'
      end
    end
    full_changed = text != old

    generic_changed = false
    if normalize_generic
      full_spans = text.to_enum(:scan, FULL_KOREAN).map do
        match = Regexp.last_match
        [match.begin(0), match.end(0)]
      end
      protected = protected_spans(text) + full_spans
      opaque_spans = text.to_enum(:scan, OPAQUE).map do
        match = Regexp.last_match
        [match.begin(0), match.end(0)]
      end
      text.gsub!(TOKEN) do |matched|
        start = Regexp.last_match.begin(0)
        finish = Regexp.last_match.end(0)
        suffix = Regexp.last_match[2].to_s
        opaque = opaque_spans.any? { |left, right| start < right && left < finish }
        replacement = if opaque || protected.any? { |left, right| left <= start && start < right }
                        matched
                      else
                        "투아사(Tuatha)#{suffix}"
                      end
        generic_changed = true if replacement != matched
        replacement
      end
    end

    [text, full_in_source, full_in_korean, full_changed, generic_changed]
  end

  def source_support(english, japanese, chinese)
    ja_support = japanese.match?(/ツアサ|Tuatha/i)
    zh_support = chinese.match?(/图阿(?:撒|萨|塔)|阿撒|Tuatha/i)
    [ja_support, zh_support]
  end

  def build_reviews(inventory, generated)
    inventory_by_key = inventory.to_h { |row| [M.key(row), row] }
    grouped = generated.group_by { |row| M.key(row) }

    reviews = grouped.map do |row_key, occurrences|
      source = inventory_by_key.fetch(row_key)
      english_parts, japanese_parts, chinese = texts(source)
      english = english_parts.join("\n---\n")
      visible_english = visible_text(english)
      japanese = japanese_parts.join("\n---\n")
      old = source.fetch('work_text')
      generic_candidate = occurrences.any? { |row| row['entity_key'] == GENERIC_ENTITY }
      raw_generic = english_has_generic?(english)
      generic = generic_candidate && english_has_generic?(visible_english)
      full_candidate = occurrences.any? { |row| row['entity_key'] == FULL_ENTITY }
      full = full_candidate && visible_english.match?(FULL_ENGLISH)
      new_text, full_in_source, full_in_korean, full_changed, generic_changed =
        normalize_korean(old, visible_english, normalize_generic: generic)
      korean_generic_text = visible_text(old)
      korean_generic_text.gsub!(FULL_KOREAN, ' ')
      korean_has_term = korean_generic_text.match?(TOKEN)
      ja_support, zh_support = source_support(english, japanese, chinese)
      dispositions = {}

      if generic_candidate && !generic
        dispositions[GENERIC_ENTITY] = 'excluded'
      elsif generic
        dispositions[GENERIC_ENTITY] =
          if korean_has_term
            generic_changed ? 'accepted' : 'not-an-issue'
          else
            'uncertain'
          end
      end
      if full_candidate && !full
        dispositions[FULL_ENTITY] = 'excluded'
      elsif full
        dispositions[FULL_ENTITY] =
          if full_in_source && full_in_korean
            full_changed ? 'accepted' : 'not-an-issue'
          else
            'uncertain'
          end
      end

      # No edit is guessed where the English names Tuatha but Korean omits it.
      if !korean_has_term && generic
        dispositions[GENERIC_ENTITY] = 'uncertain'
      end

      changed = new_text != old
      status = if changed
                 'accepted'
               elsif dispositions.values.include?('uncertain')
                 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end

      evidence = [
        'English is the identity anchor; this exact row was compared with its aligned Japanese, Chinese, and full Korean text.',
        'Normalize plain Tuatha variants 투아사/투아타 to 투아사 with the English label, preserving grammatical 족/인/어 endings and following particles.',
        'Keep Tuatha Deohn as one atomic label 투아사 데온(Tuatha Deohn); existing compound English parentheticals are protected from component insertion.',
        "Aligned Japanese Tuatha support=#{ja_support}; aligned Chinese Tuatha support=#{zh_support}.",
        'The official Korean manual names four playable peoples but does not list Tuatha; that non-exhaustive list is context, not contrary evidence.'
      ]
      if generic_candidate && !generic
        reason = if raw_generic
                   'English Tuatha occurs only inside an opaque runtime variable; exclude it before Korean span processing.'
                 else
                   'English contains Tuatha only as the component of the atomic full name Tuatha Deohn; exclude that component and review the full-name entity separately.'
                 end
        evidence << "Excluded Tuatha component: #{reason}"
      elsif !korean_has_term && generic
        evidence << 'Uncertain: English explicitly names Tuatha, but Korean paraphrases/omits the name; no text was inserted.'
      end
      if full_candidate && !full
        evidence << 'Excluded full-name hit: Tuatha Deohn occurs only inside an opaque runtime variable; no Korean span was processed.'
      end
      if full && !full_in_korean
        evidence << 'Uncertain: English explicitly names the full Tuatha Deohn faction, but Korean has no identifiable full-name span; no text was inserted.'
      end

      raise "opaque token changed #{row_key.inspect}" unless old.scan(OPAQUE) == new_text.scan(OPAQUE)
      raise "line breaks changed #{row_key.inspect}" unless old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      raise "nested full-name annotation #{row_key.inspect}" if
        new_text.match?(/투아[사타]\(Tuatha\)[ \t]+데온\(Tuatha Deohn\)/)
      raise "duplicated Tuatha labels #{row_key.inspect}" if
        new_text.match?(/\(Tuatha\)[ \t]*\(Tuatha(?: Deohn)?\)/i)

      {
        'resource' => row_key[0],
        'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence.join(' '),
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end

    raise 'duplicate Tuatha review row key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    reviews
  end

  def register!(glossary_table, glossary, definitions, generated)
    entity_keys = definitions.map { |definition| definition.fetch('entity_key') }
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
        unless current[field] == occurrence[field]
          raise "conflicting existing occurrence #{key.inspect}: #{field}"
        end
      end
      unless current['status'] == 'needs-context'
        raise "existing occurrence already reviewed #{key.inspect}: #{current['status']}"
      end
    end

    indexed_keys = existing_by_key.keys
    additions = generated.reject do |occurrence|
      indexed_keys.include?([occurrence.fetch('entity_key'), *M.key(occurrence)])
    end
    new_definitions = definitions.reject do |definition|
      glossary.any? { |row| row['entity_key'] == definition['entity_key'] }
    end

    M.write_table(GLOSSARY, glossary_table.headers, glossary + new_definitions)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + additions)
    additions.length
  end

  def run(argv)
    abort 'usage: ruby review-proper-name-tuatha-fae-continuation.rb START_D' unless argv.length == 1 && argv[0].match?(/\A\d+\z/)
    start_d = Integer(argv.fetch(0))

    inventory = M.refresh_inventory.values
    glossary_table = M.table(GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    definitions = glossary_entries(glossary, start_d)

    generated = build_occurrences(inventory, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    source_rows = inventory.select do |row|
      english, = texts(row)
      english.join("\n").match?(GENERIC_ENGLISH)
    end
    raise 'Tuatha source discovery did not cover every exact source row' unless
      generated.map { |row| M.key(row) }.uniq.sort == source_rows.map { |row| M.key(row) }.uniq.sort

    reviews = build_reviews(inventory, generated)
    raise 'empty Tuatha proposal manifest' if reviews.empty?
    raise 'duplicate generated occurrence key' unless
      generated.map { |row| [row['entity_key'], *M.key(row)] }.uniq.length == generated.length
    reviewed_keys = reviews.flat_map do |review|
      entities = review.fetch('entity_key').split('|')
      dispositions = JSON.parse(review.fetch('entity_dispositions_json'))
      raise "missing entity disposition #{M.key(review).inspect}" unless entities.sort == dispositions.keys.sort
      entities.map { |entity| [entity, *M.key(review)] }
    end
    raise 'review manifest does not cover every generated occurrence key' unless
      reviewed_keys.sort == generated.map { |row| [row['entity_key'], *M.key(row)] }.sort
    reviews.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end

    dispositions = reviews.each_with_object(Hash.new(0)) do |review, counts|
      JSON.parse(review.fetch('entity_dispositions_json')).each do |entity, status|
        counts[[entity, status]] += 1
      end
    end
    batch_count = (reviews.length + 49) / 50
    collision = (start_d...(start_d + batch_count)).find do |number|
      File.exist?(File.join(AUDIT, "named-scope-review-D#{number}-20261015.md"))
    end
    raise "review checkpoint already exists for D-#{collision}" if collision

    added_occurrences = register!(glossary_table, glossary, definitions, generated)
    M.write_table(OUTPUT, M::HEADERS, reviews)
    puts "Tuatha rows=#{reviews.length}; entity dispositions=#{dispositions.inspect}; " \
         "new occurrence keys=#{added_occurrences}; Fae deferred."
    M.run(OUTPUT, start_d, 50)
  end
end

TuathaReview.run(ARGV) if $PROGRAM_NAME == __FILE__
