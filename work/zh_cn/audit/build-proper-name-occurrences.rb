#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'optparse'
require 'set'
require_relative 'build-proper-name-candidates'

class OccurrenceError < StandardError; end

OCCURRENCE_HEADERS = %w[
  entity_key resource ID_Linha Tipo_Variante matched_english english_source
  korean_current status evidence
].freeze

def read_tsv(path)
  CSV.read(path, headers: true, col_sep: "\t", encoding: "bom|utf-8")
rescue CSV::MalformedCSVError => e
  raise OccurrenceError, "#{path}: malformed TSV: #{e.message}"
end

def build_matchers(entities)
  singles = Hash.new { |hash, key| hash[key] = [] }
  phrases = []

  entities.each do |entity|
    terms = ([entity.fetch("english_canonical")] + entity["english_aliases"].to_s.split("|"))
            .reject(&:empty?).uniq
    terms.each do |term|
      if term.match?(/\A[A-Za-z]+\z/)
        singles[term.downcase] << [entity.fetch("entity_key"), term]
      else
        pattern = Regexp.new("(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])", Regexp::IGNORECASE)
        phrases << [entity.fetch("entity_key"), term, pattern]
      end
    end
  end

  [singles, phrases]
end

def candidate_matches(texts, matchers)
  singles, phrases = matchers
  found = Hash.new { |hash, key| hash[key] = Set.new }

  texts.compact.each do |text|
    # Splitting at apostrophes keeps possessives such as "Alleia's" searchable.
    text.scan(/[A-Za-z]+/).each do |token|
      singles[token.downcase].each { |entity_key, term| found[entity_key] << term }
    end
    phrases.each do |entity_key, term, pattern|
      found[entity_key] << term if text.match?(pattern)
    end
  end

  found
end

def build_occurrences(inventory, entities)
  matchers = build_matchers(entities)
  inventory.flat_map do |row|
    english_texts = JSON.parse(row.fetch("en_texts_json") || "[]").compact
    matches = candidate_matches(english_texts, matchers)
    english_source = english_texts.join("\n---\n")

    matches.map do |entity_key, terms|
      [
        entity_key,
        row.fetch("resource"),
        row.fetch("ID_Linha"),
        row["Tipo_Variante"].to_s,
        terms.to_a.sort.join("|"),
        english_source,
        row.fetch("work_text"),
        "needs-context",
        "Candidate hit from the English source; verify this occurrence in context."
      ]
    end
  end
end

def run_occurrence_cli(argv)
  options = {}
  parser = OptionParser.new do |opts|
    opts.banner = "Usage: build-proper-name-occurrences.rb --glossary PATH --inventory PATH --out PATH"
    opts.on("--glossary PATH") { |value| options[:glossary] = value }
    opts.on("--inventory PATH") { |value| options[:inventory] = value }
    opts.on("--out PATH") { |value| options[:out] = value }
  end
  parser.parse!(argv)
  missing = %i[glossary inventory out].reject { |key| options[key] }
  raise OccurrenceError, "missing options: #{missing.map { |key| "--#{key}" }.join(", ")}" unless missing.empty?
  raise OccurrenceError, "unexpected arguments: #{argv.join(" ")}" unless argv.empty?

  glossary = read_tsv(options[:glossary])
  inventory = read_tsv(options[:inventory])
  output_path = ProperNameCandidates.safe_output(options[:out], options.values_at(:glossary, :inventory))
  occurrences = build_occurrences(inventory, glossary.map(&:to_h))
  File.open(output_path, "w:UTF-8") do |file|
    csv = CSV.new(file, col_sep: "\t", row_sep: "\r\n", force_quotes: true)
    csv << OCCURRENCE_HEADERS
    occurrences.sort_by { |row| [row[1], row[2].to_i, row[3], row[0]] }.each { |row| csv << row }
  end
  warn "Wrote #{occurrences.length} candidate occurrences to #{options[:out]}"
end

if $PROGRAM_NAME == __FILE__
  begin
    run_occurrence_cli(ARGV)
  rescue OccurrenceError, ProperNameCandidates::Error, OptionParser::ParseError, SystemCallError => e
    warn e.message
    exit 1
  end
end
