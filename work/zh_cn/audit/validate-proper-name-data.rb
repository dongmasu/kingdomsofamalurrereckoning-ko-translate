#!/usr/bin/env ruby

require 'csv'
require_relative 'build-proper-name-inventory'

root = File.expand_path('../../..', __dir__)
glossary = CSV.read(File.join(__dir__, 'proper-name-glossary.tsv'), headers: true, col_sep: "\t")
occurrences = CSV.read(File.join(__dir__, 'proper-name-occurrences.tsv'), headers: true, col_sep: "\t")
keys = {}
categories = ['person', 'place', 'faction', 'organization', 'people', 'item', 'deity', 'monster', 'skill', 'quest', 'unique item', 'named work', 'title', 'lore term', 'named event', 'creature', 'resource']
glossary.each do |entry|
  key = entry['entity_key']
  raise "empty/duplicate entity #{key}" if key.to_s.empty? || keys.key?(key)
  raise "invalid category #{entry['category']}" unless categories.include?(entry['category'])
  raise "invalid entity status #{entry['status']}" unless %w[confirmed unresolved excluded].include?(entry['status'])
  if entry['status'] == 'confirmed'
    raise "blank English canonical #{key}" if entry['english_canonical'].to_s.strip.empty?
    raise "non-bilingual canonical #{key}" unless entry['korean_canonical'].to_s.match?(/[가-힣]/) &&
      entry['korean_canonical'].include?("(#{entry['english_canonical']})")
  end
  keys[key] = entry
end
active = RESOURCES.to_h do |resource|
  rows = read_rows(inventory_paths(root, 'work', resource))
  index = rows.group_by { |row| [row['ID_Linha'], row['Tipo_Variante'].to_s] }
  [resource, index]
end
seen = {}
occurrences.each do |occurrence|
  key = occurrence['entity_key']
  raise "orphan entity #{key}" unless keys.key?(key)
  resource = occurrence['resource']
  tuple = [occurrence['ID_Linha'], occurrence['Tipo_Variante'].to_s]
  composite = [key, resource, *tuple]
  raise "duplicate occurrence #{composite.inspect}" if seen[composite]
  seen[composite] = true
  rows = active.fetch(resource).fetch(tuple)
  raise "ambiguous active snapshot #{composite.inspect}" unless rows.length == 1
  raise "stale Korean snapshot #{composite.inspect}" unless rows.first['Texto'] == occurrence['korean_current']
  unless %w[needs-context accepted not-an-issue excluded uncertain].include?(occurrence['status'])
    raise "invalid occurrence status #{occurrence['status']}"
  end
end
puts "PASS #{glossary.length} unique entities; #{occurrences.length} unique active-aligned occurrences"
puts occurrences.group_by { |row| row['status'] }.transform_values(&:length).inspect
