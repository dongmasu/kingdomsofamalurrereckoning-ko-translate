#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
definitions = [
  ['person:feride', 'Feride', 'person', '페리드(Feride)', '', '페리데',
   'base:75|base:3674|default:35325|default:54479', 'confirmed',
   'The Adessa scholar. English Feride, Japanese フェリデ and Chinese 费里德 identify the same person. Standardize to the already reviewed Korean form 페리드 used in the source-indexed base entries and introduction; this is a written-form consistency choice, not a claim to have verified spoken English pronunciation.'],
  ['person:feride-ouet', 'Feride Ouet', 'person', '페리드 오에트(Feride Ouet)', '',
   '페리데 오에트', 'base:75|base:3674|default:35325|default:20606', 'confirmed',
   'Full name of the same Adessa scholar; Japanese フェリデ・オウエット and Chinese 费里德·欧特. Keep the full name atomic and the source-shortened given name short.']
].map { |values| glossary.headers.zip(values).to_h }
raise 'Feride entries already registered' if definitions.any? do |entry|
  glossary.any? { |old| old['entity_key'] == entry['entity_key'] }
end
inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
by_key = inventory.to_h { |row| [m.key(row), row.to_h] }
reviews = generated.group_by { |row| m.key(row) }.map do |key, occurrences|
  source = by_key.fetch(key)
  old = source['work_text']
  raise "missing Korean Feride span #{key.inspect}" unless old.match?(/페리(?:드|데)/)
  text = old.gsub(/페리(?:드|데)(?:\(Feride\))?\s+오에트(?:\(Feride Ouet\)|\(Ouet\))?/,
                  '페리드 오에트(Feride Ouet)')
  text = text.gsub(/페리(?:드|데)\(Feride\)/, '페리드(Feride)')
  text = text.gsub(/페리(?:드|데)(?!\(Feride|\s+오에트)/, '페리드(Feride)')
  entities = occurrences.map { |row| row['entity_key'] }.sort
  status = old == text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => text,
    'evidence' => 'English identifies the Adessa researcher Feride/Ouet; the aligned Japanese フェリデ / フェリデ・オウエット and Chinese 费里德·欧特 were checked as corroboration. Unify 페리데 and 페리드 to the previously reviewed 페리드 form already present in base labels and the self-introduction. Short English Feride remains 페리드(Feride), and the full personal name is one atomic 페리드 오에트(Feride Ouet) label. This consistency choice does not assert verified spoken pronunciation. The official manual does not list this character. Preserve all other names, prose, titles, particles, tokens, and line breaks; existing Ouet decisions are not recounted.',
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
raise "unexpected Feride scope #{reviews.length}" unless reviews.length == 22
index = m.table(m::INDEX)
out = File.join(__dir__, 'proper-name-reviewed-feride-D20606.tsv')
m.write_table(out, m::HEADERS, reviews)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
m.run(out, 20606, nil)
