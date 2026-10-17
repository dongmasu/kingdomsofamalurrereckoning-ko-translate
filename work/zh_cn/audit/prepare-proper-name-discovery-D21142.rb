#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_142
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
values = [[
  'person:argine', 'Argine', 'person', '아르진(Argine)', '',
  '아르긴|아진', "D-#{d}|default:91|default:1043|default:37464|default:42264",
  'confirmed',
  'English identifies Argine as the person who founded and leads Sun Camp; the repeated epithet Queen of Staves is a role/title reference to her, not a separate identity. Japanese アジーン and Chinese 阿金妮 corroborate the name. Reuse the predominant Korean form 아르진, standardize 아르긴/아진, and add the missing English name label. Preserve existing fuller Argine, Queen of Staves annotations, titles, particles, and surrounding text.'
]]
definitions = values.map { |row| glossary.headers.zip(row).to_h }
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
raise 'unexpected Argine source-match count' unless generated.length == 116
raise 'Argine source matches are not unique default rows' unless
  generated.all? { |row| row['resource'] == 'default' } &&
  generated.map { |row| m.key(row) }.uniq.length == 116

name_pattern = /(?<!\p{Hangul})(?<name>아르진|아르긴|아진)(?<particle>\p{Hangul}*)(?!\p{Hangul})/
reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  matches = []
  new_text.to_enum(:scan, name_pattern).each do
    current = Regexp.last_match
    before = new_text[0...current.begin(0)]
    next unless before.count('(') <= before.count(')')

    matches << [current.begin(0), current.end(0), current[:name], current[:particle]]
  end
  raise "no Korean Argine span at #{key.inspect}" if matches.empty?
  matches.reverse_each do |first, last, _old_name, particle|
    suffix = new_text[last..]
    label = suffix.match(/\A\s*\((?<value>[^()]*)\)/)
    paired = label && label[:value].match?(/(?<![A-Za-z])Argine(?![A-Za-z])/i)
    replacement = "아르진#{paired ? '' : '(Argine)'}#{particle}"
    new_text[first...last] = replacement
  end
  status = new_text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => 'person:argine', 'status' => status, 'old' => old,
    'new' => new_text,
    'evidence' => 'English identifies the Sun Camp founder/leader Argine; aligned Japanese アジーン and Chinese 阿金妮 corroborate identity. Standardize only Korean Argine spans to 아르진(Argine), preserving an existing full English epithet annotation, particles, line breaks, other names, and surrounding wording.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate('person:argine' => status)
  }
end
raise 'Argine rows are not fully bilingual in the source locales' if
  reviews.any? { |row| %w[english japanese chinese].any? { |field| row[field].strip.empty? } }
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}-D-#{d + 2}: #{reviews.length} distinct rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
