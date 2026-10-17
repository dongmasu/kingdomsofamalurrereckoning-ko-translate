#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
inventory = m.refresh_inventory
index = m.table(m::INDEX)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definitions = glossary.to_h { |row| [row['entity_key'], row.to_h] }
pattern = /\(([A-Za-z][^()\r\n]*)\)[ \t]*\(\1\)/
reviews = inventory.values.map do |source|
  old = source.fetch('work_text')
  labels = old.scan(pattern).flatten.uniq
  next if labels.empty?

  key = m.key(source)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  labels.each do |label|
    plural_stem = label.sub(/s\z/i, '')
    source_pattern = /(?<![A-Za-z])#{Regexp.escape(label)}(?:s|es)?(?![A-Za-z])/i
    raise "duplicate label lacks source support #{key.inspect}: #{label}" unless
      english.match?(source_pattern) || english.match?(/(?<![A-Za-z])#{Regexp.escape(plural_stem)}(?![A-Za-z])/i)
  end
  entities = index.select do |row|
    next false unless m.key(row) == key &&
      %w[accepted not-an-issue].include?(row['status'])
    definition = definitions.fetch(row['entity_key'])
    terms = [definition['english_canonical'], *definition['english_aliases'].to_s.split('|')]
    labels.any? do |label|
      terms.any? { |term| label.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) }
    end
  end.map { |row| row['entity_key'] }.uniq
  raise "duplicate label has no reviewed entity #{key.inspect}" if entities.empty?
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => 'accepted',
    'old' => old, 'new' => old.gsub(pattern, '(\1)'),
    'evidence' => 'Residual comparison found adjacent identical English labels, including complete location labels. The exact English source and existing terminal entity/row decision confirm one label is sufficient. Remove only the duplicate pair, keeping the complete name, Korean spelling, grammatical suffixes, placeholders, and all line breaks. This repairs a parenthetical-regex fallback artifact without introducing or recounting an occurrence.',
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, 'accepted'] })
  }
end.compact
reviews.sort_by! { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
out = File.join(__dir__, "proper-name-reviewed-duplicate-labels-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
puts "Reviewed duplicate-label rows: #{reviews.length}"
m.run(out, start_d, nil, review_states: %w[accepted not-an-issue]) unless reviews.empty?
