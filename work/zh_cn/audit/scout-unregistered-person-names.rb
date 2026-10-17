#!/usr/bin/env ruby
# encoding: UTF-8

require 'csv'
require 'json'
require 'optparse'
require 'set'
require_relative 'build-proper-name-candidates'

# This produces a review queue, not confirmed person entities or edits.
module UnregisteredPersonNameScout
  HEADERS = %w[
    rank english_candidate lexical_crosslinks distinct_source_rows korean_labels
    evidence_ids source_context_keys examples status
  ].freeze
  STOPWORDS = %w[
    a about above after again against all almost along already also although
    always am among an and another any are around as at away back be because
    been before being below between both but by can cannot could did do does
    doing down during each either else enough even ever every few first for
    from further get give go got had has have he her here hers herself him
    himself his how however i if in into is it its itself just keep kind last
    least less let like likely little long made make many may me might more
    most much must my myself near neither never no nor not now of off often
    on once one only onto or other our ours ourselves out over own perhaps
    quite rather really same she should since so some still such than that
    the their theirs them themselves then there these they this those through
    to too under until up upon us very was we were what whatever when where
    whether which while who whom whose why will with within without would you
    your yours yourself yourselves
  ].to_set.freeze
  TITLES = %w[
    brother captain dame father king lady lord master mistress priestess
    queen sister sir warden
  ].to_set.freeze
  EXAMPLE_LIMIT = 3
  EXAMPLE_CHARS = 500

  module_function

  def read_tsv(path, required)
    table = CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
    missing = required - (table.headers || [])
    raise ProperNameCandidates::Error, "#{path}: missing columns: #{missing.join(', ')}" unless missing.empty?

    table.map(&:to_h)
  rescue CSV::MalformedCSVError => e
    raise ProperNameCandidates::Error, "#{path}: malformed TSV: #{e.message}"
  end

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def evidence_key(value)
    resource, id = value.split(':', 2)
    [resource, id]
  end

  def known_entity_terms(glossary)
    glossary.flat_map do |row|
      [row.fetch('english_canonical'), *row['english_aliases'].to_s.split('|')]
    end.compact.flat_map do |term|
      normalized = term.downcase.gsub(/[^a-z0-9]+/, ' ').strip.gsub(/\s+/, ' ')
      next [] if normalized.empty?

      [normalized, normalized.sub(/\A(?:the|a|an)\s+/, '')]
    end.to_set
  end

  def normalized_name(name)
    name.downcase.gsub(/[^a-z0-9]+/, ' ').strip.gsub(/\s+/, ' ')
  end

  def meaningful_words(name)
    name.scan(/[A-Za-z]+/).map(&:downcase).reject do |word|
      STOPWORDS.include?(word) || TITLES.include?(word)
    end
  end

  def person_candidate?(name, known_terms)
    words = name.scan(/[A-Za-z]+(?:['-][A-Za-z]+)*/)
    return false unless (1..4).cover?(words.length)
    return false unless words.all? { |word| word.match?(/\A[A-Z]/) }

    meaningful = meaningful_words(name)
    return false if meaningful.empty? || meaningful.any? { |word| word.length < 4 }
    return false if known_terms.include?(normalized_name(name))

    true
  end

  def english_hit?(text, name)
    text.match?(/(?<![A-Za-z0-9_])#{Regexp.escape(name)}(?![A-Za-z0-9_])/i)
  end

  def korean_labels(text, english_candidate)
    text.scan(/([\p{Hangul}][\p{Hangul} \t]{0,50})\(([^()\r\n]{1,120})\)/).each_with_object([]) do |(korean, label), found|
      found << "#{korean.strip}(#{label.strip})" if english_hit?(label, english_candidate)
    end
  end

  def source_texts(row)
    [
      JSON.parse(row.fetch('en_texts_json') || '[]').compact,
      JSON.parse(row.fetch('ja_texts_json') || '[]').compact,
      row.fetch('zh_text').to_s,
      row.fetch('work_text').to_s
    ]
  end

  def name_token_index(names)
    names.each_with_object(Hash.new { |hash, key| hash[key] = Set.new }) do |name, index|
      name.downcase.split(/[^a-z]+/).reject(&:empty?).uniq.each do |token|
        index[token] << name
      end
    end
  end

  def lexical_crosslinks(name, names_by_token)
    parts = name.downcase.split(/[^a-z]+/).reject(&:empty?)
    linked = parts.each_with_object(Set.new) do |token, result|
      result.merge(names_by_token.fetch(token, []))
    end.to_a
    linked.reject { |other| other == name }
      .sort_by { |other| [other.split.size, other.downcase, other] }
      .first(24).join('|')
  end

  def build(inventory, glossary, limit, offset: 0)
    known = known_entity_terms(glossary)
    by_resource_id = Hash.new { |hash, key| hash[key] = [] }
    inventory.each { |row| by_resource_id[[row.fetch('resource'), row.fetch('ID_Linha')]] << row }

    candidate_rows = ProperNameCandidates.build(inventory, glossary).map do |values|
      ProperNameCandidates::HEADERS.zip(values).to_h
    end
    candidates = candidate_rows.select do |row|
      person_candidate?(row.fetch('english_candidate'), known)
    end
    known_names = glossary.select { |row| row['category'] == 'person' }.flat_map do |row|
      [row.fetch('english_canonical'), *row['english_aliases'].to_s.split('|')]
    end
    names = (candidates.map { |row| row.fetch('english_candidate') } + known_names).uniq
    names_by_token = name_token_index(names)
    rows = candidates.map do |candidate|
      name = candidate.fetch('english_candidate')
      source_ids = candidate.fetch('evidence_ids').to_s.split('|').reject(&:empty?).uniq
      contexts = candidate.fetch('source_context_keys').to_s.split('|').reject(&:empty?).uniq
      labels = Set.new
      examples = []
      source_ids.each do |source_id|
        by_resource_id[evidence_key(source_id)].each do |source|
          english, japanese, chinese, korean = source_texts(source)
          next unless english.any? { |text| english_hit?(text, name) }

          labels.merge(korean_labels(korean, name))
          if examples.length < EXAMPLE_LIMIT
            examples << {
              'source' => row_key(source).join(':'),
              'english' => english.join("\n---\n")[0, EXAMPLE_CHARS],
              'japanese' => japanese.join("\n---\n")[0, EXAMPLE_CHARS],
              'chinese' => chinese[0, EXAMPLE_CHARS],
              'korean' => korean[0, EXAMPLE_CHARS]
            }
          end
        end
      end
      {
        'english_candidate' => name,
        'lexical_crosslinks' => lexical_crosslinks(name, names_by_token),
        'distinct_source_rows' => source_ids.length,
        'korean_labels' => labels.to_a.sort.join('|'),
        'evidence_ids' => source_ids.sort.join('|'),
        'source_context_keys' => contexts.sort.join('|'),
        'examples' => JSON.generate(examples),
        'status' => 'needs-context'
      }
    end
    rows.sort_by! do |row|
      label_count = row['korean_labels'].empty? ? 0 : row['korean_labels'].split('|').length
      [-label_count, -row['distinct_source_rows'], row['english_candidate'].downcase,
       row['english_candidate']]
    end
    rows.drop(offset).first(limit).each_with_index.map do |row, index|
      [offset + index + 1, *HEADERS.drop(1).map { |header| row.fetch(header) }]
    end
  end

  def safe_output(path, inputs)
    expanded = File.expand_path(path)
    raise ProperNameCandidates::Error, 'output must not be a CSV or symlink' if
      File.extname(expanded).downcase == '.csv' || File.symlink?(expanded)

    parent = File.realpath(File.dirname(expanded))
    output = File.join(parent, File.basename(expanded))
    roots = [File.realpath('/private/tmp'), ProperNameCandidates::AUDIT_ROOT]
    raise ProperNameCandidates::Error, 'output must be under /private/tmp or work/zh_cn/audit' unless
      roots.any? { |root| output.start_with?("#{root}/") }
    raise ProperNameCandidates::Error, 'output must not overwrite an input' if
      inputs.any? { |input| output == File.realpath(input) || (File.exist?(output) && File.identical?(output, input)) }
    if File.exist?(output) && (!File.file?(output) || File.stat(output).nlink > 1)
      raise ProperNameCandidates::Error, 'output must be a regular file without hard links'
    end

    output
  end

  def run(argv)
    options = { limit: 20, offset: 0 }
    parser = OptionParser.new do |opts|
      opts.banner = 'Usage: scout-unregistered-person-names.rb --inventory PATH --glossary PATH --out PATH [--limit N] [--offset N]'
      opts.separator 'Heuristic English-anchored scout only; lexical links do not assert identity.'
      opts.on('--inventory PATH') { |value| options[:inventory] = value }
      opts.on('--glossary PATH') { |value| options[:glossary] = value }
      opts.on('--out PATH') { |value| options[:out] = value }
      opts.on('--limit N', Integer) { |value| options[:limit] = value }
      opts.on('--offset N', Integer) { |value| options[:offset] = value }
    end
    parser.parse!(argv)
    missing = %i[inventory glossary out].reject { |key| options[key] }
    raise ProperNameCandidates::Error, "missing options: #{missing.map { |key| "--#{key}" }.join(', ')}" unless missing.empty?
    raise ProperNameCandidates::Error, 'limit must be 1..50' unless (1..50).cover?(options[:limit])
    raise ProperNameCandidates::Error, 'offset must be nonnegative' if options[:offset].negative?
    raise ProperNameCandidates::Error, "unexpected arguments: #{argv.join(' ')}" unless argv.empty?

    output = safe_output(options[:out], options.values_at(:inventory, :glossary))
    inventory = read_tsv(options[:inventory], %w[resource ID_Linha en_texts_json ja_texts_json zh_text work_text])
    glossary = read_tsv(options[:glossary], %w[entity_key english_canonical english_aliases category])
    rows = build(inventory, glossary, options[:limit], offset: options[:offset])
    CSV.open(output, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    warn "Wrote #{rows.length} unregistered-name review candidates to #{output}; no glossary/index/source files changed."
    rows.length
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    UnregisteredPersonNameScout.run(ARGV)
  rescue ProperNameCandidates::Error, OptionParser::ParseError, SystemCallError, JSON::ParserError => e
    warn e.message
    exit 1
  end
end
