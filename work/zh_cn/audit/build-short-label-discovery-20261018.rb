#!/usr/bin/env ruby

require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-inventory'

module ShortLabelDiscovery20261018
  extend self
  M = ReviewedNameBatches
  HEADERS = %w[
    english_candidate unpaired_label_keys_json paired_evidence_keys_json
    existing_label_owners_json status
  ].freeze
  OUTPUT = File.join(__dir__, 'proper-name-short-label-discovery-20261018.tsv')

  def reviewed_dispositions(audit = __dir__)
    dispositions = Dir.glob(File.join(audit, 'proper-name-short-label-dispositions-D*.tsv'))
      .flat_map do |path|
        M.table(path).map do |row|
          [row.fetch('english_candidate'), row.fetch('resource'),
           row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
        end
      end
    prior_closures = File.join(
      audit, 'proper-name-short-label-prior-closures-20261018.tsv'
    )
    if File.file?(prior_closures)
      dispositions.concat(
        M.table(prior_closures).map do |row|
          [row.fetch('english_candidate'), row.fetch('resource'),
           row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
        end
      )
    end
    dispositions.to_set
  end

  def build(inventory, glossary, occurrences, reviewed_dispositions: nil)
    reviewed_dispositions ||= self.reviewed_dispositions
    owned = glossary.flat_map do |row|
      [row.fetch('english_canonical'), *row['english_aliases'].to_s.split('|')]
    end.map(&:downcase).to_set
    labels = Hash.new { |hash, term| hash[term] = [] }
    pairs = Hash.new { |hash, term| hash[term] = [] }
    inventory.each do |row|
      english = JSON.parse(row.fetch('en_texts_json')).compact.uniq
      korean = row['work_text'].to_s
      english.each do |text|
        next unless text.match?(/\A[A-Z][A-Za-z -]{2,40}\z/) && !owned.include?(text.downcase)
        labels[text] << row unless korean.include?("(#{text})")
      end
      korean.scan(/\(([A-Za-z][A-Za-z -]{1,40})\)/).flatten.uniq.each do |term|
        pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i
        next unless english.any? { |text| text.match?(pattern) }
        pairs[term.downcase] << M.key(row)
      end
    end
    owners = occurrences.group_by { |row| M.key(row) }
    labels.keys.sort.map do |term|
      next if pairs[term.downcase].empty?
      targets = labels.fetch(term).map { |row| M.key(row) }.uniq.sort.reject do |key|
        reviewed_dispositions.include?([term, *key])
      end
      evidence = pairs.fetch(term.downcase).uniq.sort.reject do |key|
        reviewed_dispositions.include?([term, *key])
      end
      next if targets.empty? || evidence.empty?
      known = targets.to_h do |key|
        [key.join(':'), owners.fetch(key, []).map do |row|
          [row.fetch('entity_key'), row.fetch('status')]
        end]
      end
      {
        'english_candidate' => term,
        'unpaired_label_keys_json' => JSON.generate(targets),
        'paired_evidence_keys_json' => JSON.generate(evidence),
        'existing_label_owners_json' => JSON.generate(known),
        'status' => 'candidate-not-reviewed'
      }
    end.compact
  end

  def run
    raise 'discovery snapshot already exists; preserve it rather than overwrite' if File.exist?(OUTPUT)
    before = M.hashes
    rows = M::RESOURCES.flat_map do |resource|
      sources = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *sources).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    raise 'incomplete discovery inventory' unless rows.length == 73_430
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    index = M.table(M::INDEX)
    result = build(rows, glossary, index)
    raise 'CSV changed during read-only discovery' unless M.hashes == before
    M.write_table(OUTPUT, HEADERS, result)
    keys = result.flat_map { |row| JSON.parse(row.fetch('unpaired_label_keys_json')) }.uniq
    puts "#{result.length} unreviewed candidate groups in #{keys.length} distinct label keys."
    puts 'Bounded discovery snapshot only: not confirmed defects, remaining holds, or an exhaustive universe.'
    puts OUTPUT
  end
end

ShortLabelDiscovery20261018.run if $PROGRAM_NAME == __FILE__
