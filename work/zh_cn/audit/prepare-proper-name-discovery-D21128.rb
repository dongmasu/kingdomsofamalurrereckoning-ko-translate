#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
audit = __dir__
d = 21_128
definitions_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} artifacts already exist" if
  [definitions_path, reviews_path].any? { |path| File.exist?(path) }

definition_values = [
  [
    'person:nettie-blevins',
    'Nettie Blevins',
    'person',
    '네티 블레빈스(Nettie Blevins)',
    'Nettie',
    '네티|넷티|블레빈스',
    '',
    'confirmed',
    'English explicitly names Nettie Blevins in her labels, dialogue, objectives, and Alfar discharge certificate. Japanese ネッティ・ブレビンス and Chinese 内蒂·布莱文斯 corroborate the name. The short form Nettie is registered as a search alias but is context-sensitive: Nettie Grildas rows and the smith reference are excluded from this person, while the isolated group-memory reference remains uncertain. default:57868 is identified as Blevins by its Luethar De Groot murder clues and the Alfar discharge paper signed by Captain Enright, whose full certificate names Lieutenant Nettie Blevins at default:56262.'
  ],
  [
    'person:nettie-grildas',
    'Nettie Grildas',
    'person',
    '네티 그릴다스(Nettie Grildas)',
    '',
    '네티|그릴다스',
    '',
    'confirmed',
    'English names Nettie Grildas directly at default:5400, default:8847, and default:50116. Japanese ネッティ・グリルダス and Chinese 内蒂·格瑞尔达斯 corroborate the full name. Keep this person distinct from Nettie Blevins; the shared short first name alone does not establish identity.'
  ]
].freeze

definitions = definition_values.map do |values|
  headers = m.table(File.join(audit, 'proper-name-glossary.tsv')).headers
  headers.zip(values).to_h
end
glossary_table = m.table(File.join(audit, 'proper-name-glossary.tsv'))
glossary = glossary_table.map(&:to_h)
new_keys = definitions.map { |row| row.fetch('entity_key') }
raise 'Nettie entity already registered' if
  glossary.any? { |row| new_keys.include?(row['entity_key']) }
inventory = m.refresh_inventory
inventory_rows = inventory.values
generated = build_occurrences(inventory_rows, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end

expected_ids = {
  'person:nettie-blevins' => %w[
    3849 5400 8847 21595 26896 34499 36527 39297 41685 43179
    50116 51451 51492 51939 52277 56262 57868 61762
  ],
  'person:nettie-grildas' => %w[5400 8847 50116]
}
actual_ids = generated.group_by { |row| row.fetch('entity_key') }.transform_values do |rows|
  rows.select { |row| row['resource'] == 'default' }
    .map { |row| row['ID_Linha'] }.sort_by(&:to_i)
end
expected_ids.each do |entity, ids|
  raise "unexpected source matches for #{entity}: #{actual_ids[entity].inspect}" unless
    actual_ids[entity] == ids.sort_by(&:to_i)
end
raise 'unexpected resource or variant' unless generated.all? do |row|
  row['resource'] == 'default' && row['Tipo_Variante'].empty?
end

patches = {
  ['default', '26896', ''] => [
    ['네티 블레빈스는', '네티 블레빈스(Nettie Blevins)는']
  ],
  ['default', '36527', ''] => [
    ['네티 블레빈스', '네티 블레빈스(Nettie Blevins)']
  ],
  ['default', '39297', ''] => [
    ['네티 블레빈스와', '네티 블레빈스(Nettie Blevins)와'],
    ['네티와 이야기해야겠다. 네티는',
     '네티(Nettie)와 이야기해야겠다. 네티(Nettie)는']
  ],
  ['default', '41685', ''] => [
    ['네티 블레빈스가', '네티 블레빈스(Nettie Blevins)가']
  ],
  ['default', '43179', ''] => [
    ['네티 블레빈스와', '네티 블레빈스(Nettie Blevins)와'],
    ['네티와 근처에서', '네티(Nettie)와 근처에서']
  ],
  ['default', '56262', ''] => [
    ['넷티 블레빈스 중위', '네티 블레빈스(Nettie Blevins) 중위']
  ],
  ['default', '57868', ''] => [
    ['네티의 시신', '네티(Nettie)의 시신'],
    ['네티와 루에타르', '네티(Nettie)와 루에타르']
  ],
  ['default', '8847', ''] => [
    ['네티 그릴다스', '네티 그릴다스(Nettie Grildas)']
  ],
  ['default', '50116', ''] => [
    ['네티 그릴다스는', '네티 그릴다스(Nettie Grildas)는']
  ]
}.freeze

decisions = {
  ['default', '5400', ''] => {
    'person:nettie-blevins' => 'excluded',
    'person:nettie-grildas' => 'not-an-issue'
  },
  ['default', '8847', ''] => {
    'person:nettie-blevins' => 'excluded',
    'person:nettie-grildas' => 'accepted'
  },
  ['default', '21595', ''] => {
    'person:nettie-blevins' => 'uncertain'
  },
  ['default', '34499', ''] => {
    'person:nettie-blevins' => 'excluded'
  },
  ['default', '50116', ''] => {
    'person:nettie-blevins' => 'excluded',
    'person:nettie-grildas' => 'accepted'
  }
}.freeze

by_key = generated.group_by { |row| m.key(row) }
reviews = by_key.keys.sort_by { |resource, id, variant| [resource, id.to_i, variant] }
  .map do |key|
    matches = by_key.fetch(key)
    old_text = inventory.fetch(key).fetch('work_text')
    new_text = old_text.dup
    Array(patches[key]).each do |old_span, new_span|
      count = new_text.scan(Regexp.new(Regexp.escape(old_span))).length
      raise "expected one exact Korean span at #{key.inspect}: #{old_span.inspect}" unless count == 1
      new_text.sub!(old_span, new_span)
    end
    entities = matches.map { |row| row.fetch('entity_key') }.uniq.sort
    per_entity = entities.to_h do |entity|
      default = decisions.dig(key, entity)
      if default
        [entity, default]
      elsif new_text == old_text
        [entity, 'not-an-issue']
      else
        [entity, 'accepted']
      end
    end
    source = inventory.fetch(key)
    aggregate = if new_text != old_text
                  'accepted'
                elsif per_entity.value?('uncertain')
                  'uncertain'
                elsif per_entity.values.all? { |status| status == 'excluded' }
                  'excluded'
                else
                  'not-an-issue'
                end
    rationale = case key[1]
                when '21595'
                  'The source says only “Lue and Nettie”; it does not identify which Nettie. Retain the already bilingual Korean unchanged and leave this short reference uncertain.'
                when '34499'
                  'The source identifies a smith called Nettie in a local shop list, not the murdered Wolf Pack soldier Nettie Blevins. No surname or identity link is supplied; leave unchanged and exclude from the Blevins scope.'
                when '5400', '8847', '50116'
                  'The exact source name is Nettie Grildas, a distinct person from Nettie Blevins. Disposition is row-scoped for both full-name entities.'
                when '57868'
                  'The source describes the same Luethar De Groot murder clues and Alfar discharge paper signed by Captain Enright. The aligned certificate at default:56262 explicitly names Lieutenant Nettie Blevins; the short reference is therefore row-scoped to her.'
                else
                  'English explicitly identifies the named person in this row. Japanese and Chinese corroborate the name; standardize only the scoped personal-name references.'
                end
    {
      'resource' => key[0],
      'ID_Linha' => key[1],
      'Tipo_Variante' => key[2],
      'entity_key' => entities.join('|'),
      'status' => aggregate,
      'old' => old_text,
      'new' => new_text,
      'evidence' => rationale,
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(per_entity)
    }
  end

expected_row_ids = expected_ids.values.flatten.uniq.sort_by(&:to_i)
actual_row_ids = reviews.map { |row| row['ID_Linha'] }.sort_by(&:to_i)
raise "unexpected unique review rows: #{actual_row_ids.inspect}" unless
  actual_row_ids == expected_row_ids
raise 'wrong accepted corrections' unless
  reviews.count { |row| row['old'] != row['new'] } == 9
raise 'all edits must be accepted dispositions' unless reviews.all? do |row|
  row['old'] == row['new'] || row['status'] == 'accepted'
end

definitions.each do |definition|
  entity = definition.fetch('entity_key')
  definition['evidence_ids'] = (
    ["D-#{d}"] + generated.select { |row| row['entity_key'] == entity }.map do |row|
      "#{row['resource']}:#{row['ID_Linha']}"
    end.uniq
  ).join('|')
end

m.write_table(definitions_path, glossary_table.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "Prepared D-#{d}: #{definitions.length} distinct people, " \
     "#{generated.length} entity matches across #{reviews.length} rows, " \
     "#{reviews.count { |row| row['old'] != row['new'] }} proposed edits."
puts "Row dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
