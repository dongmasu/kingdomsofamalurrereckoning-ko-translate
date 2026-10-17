#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
inventory = m.refresh_inventory
index = m.table(m::INDEX)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
names = glossary.to_h { |row| [row['english_canonical'], row['entity_key']] }
reviews = inventory.values.map do |source|
  old = source.fetch('work_text')
  matches = old.to_enum(:scan, /\(([A-Za-z][^()]*)\)\s*\(\1\)/).map { Regexp.last_match.dup }
  next if matches.empty?
  key = m.key(source)
  entities = matches.map { |match| names.fetch(match[1]) }.uniq
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  matches.each do |match|
    raise "source does not confirm duplicate label #{key.inspect}" unless english.match?(/(?<![A-Za-z])#{Regexp.escape(match[1])}(?![A-Za-z])/i)
  end
  entities.each do |entity|
    row = index.find { |entry| entry['entity_key'] == entity && m.key(entry) == key }
    raise "duplicate-pair repair has no terminal occurrence #{key.inspect}" unless row && %w[accepted not-an-issue].include?(row['status'])
  end
  text = old.gsub(/\(([A-Za-z][^()]*)\)\s*\(\1\)/, '(\1)')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => 'accepted',
    'old' => old, 'new' => text,
    'evidence' => 'Focused residual check found two adjacent identical English name labels. English and the existing registered canonical identity confirm one bilingual pair suffices. Remove only the duplicate parenthesis pair; preserve the Korean spelling, particles, other independent name edits, and every other byte. This updates existing terminal entity/row keys and does not create or recount an occurrence.',
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, 'accepted'] })
  }
end.compact
raise 'expected 15 duplicate-pair rows' unless reviews.length == 15
reviews.sort_by! { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
out = File.join(__dir__, "proper-name-reviewed-duplicate-pairs-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil, review_states: %w[accepted not-an-issue])
