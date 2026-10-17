#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'optparse'
require 'set'

# Discovery heuristics, not named-entity judgments or an exhaustive guarantee.
# Ordinary words remain candidates; every result needs contextual review.
module ProperNameCandidates
  class Error < StandardError; end

  HEADERS = %w[candidate_key english_candidate reason evidence_ids source_context_keys status].freeze
  WORD = /[A-Za-z]+(?:['\u2019-][A-Za-z]+)*/
  LABEL = /\A#{WORD}(?:\s+#{WORD})*\z/
  AUDIT_ROOT = File.realpath(__dir__)

  def self.read_tsv(path, required)
    table = CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
    missing = required - (table.headers || [])
    raise Error, "#{path}: missing columns: #{missing.join(', ')}" unless missing.empty?

    table.map(&:to_h)
  rescue CSV::MalformedCSVError => e
    raise Error, "#{path}: malformed TSV: #{e.message}"
  end

  def self.clean(text)
    text.gsub(/\{[^{}]*\}/, ' ').strip.gsub(/\s+/, ' ')
  end

  def self.glossary_matchers(glossary)
    glossary.flat_map do |row|
      [row.fetch('english_canonical'), *row['english_aliases'].to_s.split('|')]
    end.compact.map { |term| clean(term) }.select { |term| term.match?(LABEL) }.uniq.sort.map do |term|
      [term, Regexp.new("(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])", Regexp::IGNORECASE)]
    end
  end

  def self.discover(text, matchers)
    text = clean(text)
    found = Hash.new { |hash, key| hash[key] = Set.new }
    found[text] << 'standalone-label' if text.match?(LABEL)

    # Token offsets prevent spans from crossing punctuation or lowercase prose.
    words = text.to_enum(:scan, WORD).map { Regexp.last_match.dup }
    run = []
    flush = lambda do
      run.pop while !run.empty? && !run.last[0].match?(/\A[A-Z]/)
      if run.length > 1
        found[text[run.first.begin(0)...run.last.end(0)]] << 'title-case-span'
        # Also recover "Iron-Fist Keep" inside "Go to Iron-Fist Keep".
        run.slice_when { |left, right| !left[0].match?(/\A[A-Z]/) || !right[0].match?(/\A[A-Z]/) }.each do |span|
          next unless span.length > 1

          found[text[span.first.begin(0)...span.last.end(0)]] << 'title-case-span'
        end
      end
      run.clear
    end
    words.each do |word|
      capitalized = word[0].match?(/\A[A-Z]/)
      connector = word[0].match?(/\A(?:of|the|and|in|at|for|to|a|an)\z/)
      adjacent = run.empty? || text[run.last.end(0)...word.begin(0)].match?(/\A\s+\z/)
      flush.call unless adjacent && (capitalized || connector)
      if capitalized
        found[word[0]] << 'title-case-span'
        run << word
      elsif connector && !run.empty?
        run << word
      end
      found[word[0]] << 'internal-capitalization' if word[0].match?(/[a-z][A-Z]/)
    end
    flush.call
    matchers.each { |term, pattern| found[term] << 'known-glossary-key' if text.match?(pattern) }
    found
  end

  def self.build(inventory, glossary)
    matchers = glossary_matchers(glossary)
    candidates = {}
    source_cache = {}
    inventory.each do |row|
      resource = row.fetch('resource')
      id = row.fetch('ID_Linha')
      evidence = "#{resource}:#{id}"
      context = [resource, id, row['Tipo_Variante']].compact.reject(&:empty?).join(':')
      texts = JSON.parse(row.fetch('en_texts_json'))
      unless texts.is_a?(Array) && texts.all? { |text| text.nil? || text.is_a?(String) }
        raise Error, "#{evidence}: en_texts_json must be an array of strings or nulls"
      end
      texts.compact.uniq.each do |text|
        source_key = [resource, id, text]
        # Reuse discoveries across target variants, but retain each context key.
        discoveries = source_cache[source_key] ||= discover(text, matchers)
        discoveries.each do |english, reasons|
          key = "candidate:#{english.downcase}"
          candidate = candidates[key] ||= {
            spellings: Set.new, reasons: Set.new, evidence: Set.new, contexts: Set.new
          }
          candidate[:spellings] << english
          candidate[:reasons].merge(reasons)
          candidate[:evidence] << evidence
          candidate[:contexts] << context
        end
      end
    rescue JSON::ParserError => e
      raise Error, "#{evidence}: invalid en_texts_json: #{e.message}"
    end
    candidates.keys.sort.map do |key|
      entry = candidates.fetch(key)
      [key, entry[:spellings].to_a.sort.first, entry[:reasons].to_a.sort.join('|'),
       entry[:evidence].to_a.sort.join('|'), entry[:contexts].to_a.sort.join('|'), 'needs-context']
    end
  end

  def self.safe_output(path, inputs)
    expanded = File.expand_path(path)
    raise Error, 'output must not be a CSV or symlink' if File.extname(expanded).downcase == '.csv' || File.symlink?(expanded)

    parent = File.realpath(File.dirname(expanded))
    output = File.join(parent, File.basename(expanded))
    roots = [File.realpath('/private/tmp'), AUDIT_ROOT]
    unless roots.any? { |root| output.start_with?("#{root}/") }
      raise Error, 'output must be under /private/tmp or work/zh_cn/audit'
    end
    if inputs.any? { |input| output == File.realpath(input) || (File.exist?(output) && File.identical?(output, input)) }
      raise Error, 'output must not overwrite inventory or glossary'
    end
    if File.exist?(output) && (!File.file?(output) || File.stat(output).nlink > 1)
      raise Error, 'output must be a regular file without hard links'
    end
    output
  end

  def self.run(argv)
    options = {}
    parser = OptionParser.new do |opts|
      opts.banner = 'Usage: build-proper-name-candidates.rb --inventory PATH --glossary PATH --out PATH'
      opts.separator 'Heuristic candidate coverage only, not exhaustive or named-entity judgment.'
      %i[inventory glossary out].each { |key| opts.on("--#{key} PATH") { |value| options[key] = value } }
    end
    parser.parse!(argv)
    missing = %i[inventory glossary out].reject { |key| options[key] }
    raise Error, "missing options: #{missing.map { |key| "--#{key}" }.join(', ')}" unless missing.empty?
    raise Error, "unexpected arguments: #{argv.join(' ')}" unless argv.empty?

    output = safe_output(options[:out], options.values_at(:inventory, :glossary))
    inventory = read_tsv(options[:inventory], %w[resource ID_Linha en_texts_json])
    glossary = read_tsv(options[:glossary], %w[english_canonical english_aliases])
    rows = build(inventory, glossary)
    File.open(output, 'w:UTF-8') do |file|
      csv = CSV.new(file, col_sep: "\t", row_sep: "\r\n", force_quotes: true)
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    warn "Wrote #{rows.length} heuristic candidates (all needs-context) to #{output}"
    rows.length
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    ProperNameCandidates.run(ARGV)
  rescue ProperNameCandidates::Error, OptionParser::ParseError, SystemCallError => e
    warn e.message
    exit 1
  end
end
