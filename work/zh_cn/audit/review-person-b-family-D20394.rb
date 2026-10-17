#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'optparse'
require_relative 'build-proper-name-candidates'

module PersonBReview
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  BAYALA_SPRING = ['default', '45445', ''].freeze
  FULL_NAME_KEYS = %w[
    person:bayala-tirin person:bardan-tam person:breid-brurek
    person:bronwen-senn person:burdick-nareen person:colm-bardan
    person:florian-brennac person:grian-brighthelm person:nuer-bedlym
    person:rhose-badon
  ].freeze
  NON_NAME_PREFIXES = %w[
    apparently confront defeat find high ignore kill killing like locate
    old prophetess return save speak steward squire talk with first sword
    priestess unlike why
  ].freeze

  module_function

  def english_terms(entity)
    [entity.fetch('english_canonical'), *entity['english_aliases'].to_s.split('|')]
      .reject(&:empty?).uniq
  end

  def source_hits(texts, terms)
    terms.any? do |term|
      pattern = Regexp.new("(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])", Regexp::IGNORECASE)
      texts.any? { |text| text && text.match?(pattern) }
    end
  end

  def korean_forms(entity)
    canonical = entity.fetch('korean_canonical').split('(').first
    variants = entity['korean_variants'].to_s.split('|')
    ([canonical] + variants).map { |value| value.sub(/\?\z/, '') }
      .select { |value| value.match?(/\p{Hangul}/) }
      .uniq.sort_by { |value| -value.length }
  end

  def replace_form(text, form, korean, english, exclusions: [])
    escaped = Regexp.escape(form)
    negative = exclusions.map { |term| Regexp.escape(term) }.join('|')
    lookahead = negative.empty? ? '' : "(?![ \\t]+(?:#{negative}))"
    pattern = Regexp.new(
      "(?<name>#{escaped})#{lookahead}(?<annotation>[ \\t]*\\([^()]*\\))?(?<question>\\?)?"
    )
    text.gsub(pattern) do
      match = Regexp.last_match
      annotation = match[:annotation].to_s
      if annotation.match?(/\A[ \t]*\(\s*[A-Za-z]/)
        if english_terms_for_parenthetical(annotation, english)
          "#{korean}#{annotation}#{match[:question]}"
        else
          "#{korean}(#{english})#{match[:question]}"
        end
      else
        "#{korean}(#{english})#{match[:question]}"
      end
    end
  end

  def english_terms_for_parenthetical(annotation, english)
    annotation.match?(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i)
  end

  def english_compounds(source_texts, english)
    return [] unless english.match?(/\A[A-Z][a-z]+\z/)

    term = Regexp.escape(english)
    capitalized = '[A-Z][a-z]+(?:[ \t]+[A-Z][a-z]+)*'
    pattern = Regexp.new(
      "(?<![A-Za-z])(?:(?<prefix>#{capitalized})[ \t]+)?#{term}" \
      "(?:[ \t]+(?<suffix>#{capitalized}))?(?![A-Za-z])"
    )
    source_texts.compact.flat_map do |source|
      source.to_enum(:scan, pattern).map do
        match = Regexp.last_match
        prefix = match[:prefix]
        prefix = nil if prefix && prefix.split.all? { |word| NON_NAME_PREFIXES.include?(word.downcase) }
        [prefix, english, match[:suffix]].compact.join(' ')
      end
    end.uniq.reject { |compound| compound.casecmp?(english) }
  end

  def annotated_compound?(text, compounds)
    annotations = text.scan(/\(([^()]*)\)/).flatten
    compounds.any? do |compound|
      annotations.any? do |annotation|
        annotation.match?(/(?<![A-Za-z])#{Regexp.escape(compound)}(?![A-Za-z])/i)
      end
    end
  end

  def covered_by_full_name_entity?(entity, entities, source_texts)
    english = entity.fetch('english_canonical')
    entities.any? do |candidate|
      FULL_NAME_KEYS.include?(candidate['entity_key']) &&
        candidate['entity_key'] != entity['entity_key'] &&
        !candidate['english_canonical'].to_s.casecmp?(english) &&
        candidate['english_canonical'].to_s.match?(
          /(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i
        ) &&
        source_hits(source_texts, english_terms(candidate))
    end
  end

  def canonicalize(text, entities, source_texts)
    result = text.dup
    unresolved = []
    compound_holds = []
    entities.each do |entity|
      key = entity.fetch('entity_key')
      english = entity.fetch('english_canonical')
      forms = korean_forms(entity)
      recognized = forms.any? { |form| result.include?(form) }

      next if covered_by_full_name_entity?(entity, entities, source_texts)

      compounds = english_compounds(source_texts, english)
      compounds = [] if key == 'person:bruten' && source_hits(source_texts, ['Decanus Bruten'])
      unless compounds.empty?
        if annotated_compound?(result, compounds)
          next
        end

        compound_holds.concat(compounds.map { |compound| "#{key}:#{compound}" })
        next
      end

      if key == 'person:bayala-tirin'
        full_forms = ['바야라 티린', '바얄라 티린']
        full_forms.each do |form|
          result = replace_form(result, form, '바얄라 티린', english)
        end
        recognized ||= full_forms.any? { |form| text.include?(form) }
        next
      end

      if key == 'person:bayala'
        forms.each do |form|
          result = replace_form(result, form, '바얄라', english, exclusions: ['티린'])
        end
        recognized ||= forms.any? { |form| text.include?(form) }
        next
      end

      if key == 'person:brun' && source_hits(source_texts, ['Brun the Bard'])
        ['음유시인 브런', '음유시인 브룬'].each do |form|
          result = replace_form(result, form, '음유시인 브룬', 'Brun the Bard')
        end
        recognized ||= ['음유시인 브런', '음유시인 브룬'].any? { |form| text.include?(form) }
      end

      if key == 'person:bruten' && source_hits(source_texts, ['Decanus Bruten'])
        ['데카누스 브루텐', '데카누스 브루턴', '데카누스 브루튼'].each do |form|
          result = replace_form(result, form, '데카누스 브루튼', 'Decanus Bruten')
        end
        recognized ||= ['데카누스 브루텐', '데카누스 브루턴', '데카누스 브루튼']
                      .any? { |form| text.include?(form) }
      end

      forms.each do |form|
        next if key == 'person:brun' && %w[음유시인 브런 음유시인 브룬].include?(form)
        next if key == 'person:bruten' && %w[데카누스 브루텐 데카누스 브루턴 데카누스 브루튼].include?(form)

        result = replace_form(result, form, entity.fetch('korean_canonical').split('(').first, english)
      end
      recognized ||= forms.any? { |form| text.include?(form) }
      unresolved << key unless recognized
    end
    [result, unresolved, compound_holds]
  end

  def build(inventory, glossary)
    people = glossary.select do |entity|
      entity['category'] == 'person' &&
        (entity['english_canonical'].match?(/\AB/i) || FULL_NAME_KEYS.include?(entity['entity_key']))
    end
    by_key = people.to_h { |entity| [entity['entity_key'], entity] }
    rows = {}

    inventory.each do |source|
      english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
      hits = people.select { |entity| source_hits(english_texts, english_terms(entity)) }
      next if hits.empty?

      key = [source.fetch('resource'), source.fetch('ID_Linha'), source['Tipo_Variante'].to_s]
      old = source.fetch('work_text')
      if key == BAYALA_SPRING
        rows[key] = [
          *key, 'person:bayala', 'excluded', old, old,
          'D-20394: Bayala personal-name match excluded pending separate classification of the titled source "Bayala\'s Spring".',
          english_texts.join("\n---\n"), JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
          source.fetch('zh_text').to_s
        ]
        next
      end

      # Keep short-name and full-name decisions attached to the same source cell.
      source_texts = english_texts
      new_text, unresolved, compound_holds = canonicalize(old, hits, source_texts)
      unresolved.concat(compound_holds)
      status = unresolved.empty? ? (new_text == old ? 'not-an-issue' : 'accepted') : 'uncertain'
      new_text = old unless unresolved.empty?
      evidence = 'English name context; Japanese pronunciation and Chinese spelling cross-checked; '
      evidence += "source entities #{hits.map { |entity| entity['entity_key'] }.join('|')}"
      evidence += "; no safe whole-name mapping for #{compound_holds.join('|')}" unless compound_holds.empty?
      unresolved -= compound_holds
      evidence += "; no recognized Korean counterpart for #{unresolved.join('|')}" unless unresolved.empty?
      entity_keys = hits.map { |entity| entity['entity_key'] }.join('|')
      row = [
        *key, entity_keys, status, old, new_text, evidence,
        english_texts.join("\n---\n"),
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text').to_s
      ]
      if rows.key?(key)
        prior = rows.fetch(key)
        raise "conflicting duplicate source key #{key.inspect}" unless prior[5..6] == row[5..6]
        prior[3] = (prior[3].split('|') | row[3].split('|')).join('|')
      else
        rows[key] = row
      end
    rescue JSON::ParserError => error
      raise "invalid source locale JSON at #{key.inspect}: #{error.message}"
    end

    rows.values.sort_by { |row| [row[0], row[1].to_i, row[2]] }
  end

  def run(argv)
    options = {}
    OptionParser.new do |parser|
      parser.on('--inventory PATH') { |path| options[:inventory] = path }
      parser.on('--glossary PATH') { |path| options[:glossary] = path }
      parser.on('--out PATH') { |path| options[:out] = path }
    end.parse!(argv)
    raise 'need --inventory, --glossary, and --out' unless
      %i[inventory glossary out].all? { |key| options[key] } && argv.empty?
    out = ProperNameCandidates.safe_output(options[:out], [options[:inventory], options[:glossary]])
    inventory = ProperNameCandidates.read_tsv(
      options[:inventory],
      %w[resource ID_Linha Tipo_Variante en_texts_json ja_texts_json zh_text work_text]
    )
    glossary = ProperNameCandidates.read_tsv(options[:glossary], %w[entity_key english_canonical category])
    rows = build(inventory, glossary)
    CSV.open(out, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "review rows=#{rows.length}; #{rows.group_by { |row| row[4] }.transform_values(&:length)}"
    rows.select { |row| row[4] == 'uncertain' }.each do |row|
      puts "#{row[0]}:#{row[1]} #{row[9].gsub(/\s+/, ' ')[0, 180]} | #{row[6].gsub(/\s+/, ' ')[0, 180]}"
    end
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    PersonBReview.run(ARGV)
  rescue CSV::MalformedCSVError, OptionParser::ParseError, SystemCallError, RuntimeError => error
    warn error.message
    exit 1
  end
end
