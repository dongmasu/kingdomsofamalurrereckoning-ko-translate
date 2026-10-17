#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
audit = __dir__
d = 21_127
definitions_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
scout_path = File.join(audit, "proper-name-discovery-scout-D#{d}.tsv")
raise "D-#{d} artifacts already exist" if
  [definitions_path, reviews_path, scout_path].any? { |path| File.exist?(path) }

definition_values = [
  'person:carloman-manoise',
  'Carloman Manoise',
  'person',
  '카를로만 마누아즈(Carloman Manoise)',
  '',
  '카를로망|카를로만|마노이즈|마노이스|마누아즈',
  '',
  'confirmed',
  'English full-name labels at default:6158 and default:37950, plus the explicitly named Scholar Carloman Manoise in default:28301, identify this person. Japanese カーロマン・マノイス and Chinese 卡罗曼·玛诺伊斯 corroborate pronunciation. Reuse the active Korean forms 카를로만(Carloman) at default:4735 and 마누아즈(Manoise) at default:12571; standardize full references to 카를로만 마누아즈(Carloman Manoise). Standalone Carloman rows default:4735 and default:44214 are not registered as aliases because their exact source context does not establish the full identity.'
].freeze

patches = {
  ['default', '6158', ''] => [
    ['카를로망 마누아즈(Carloman Manoise)', '카를로만 마누아즈(Carloman Manoise)']
  ],
  ['default', '37950', ''] => [
    ['카를로만 마노이스(Carloman Manoise)', '카를로만 마누아즈(Carloman Manoise)']
  ],
  ['default', '28301', ''] => [
    ['카를로망 마노이즈(Carloman Manoise)', '카를로만 마누아즈(Carloman Manoise)']
  ]
}.freeze

glossary = m.table(File.join(audit, 'proper-name-glossary.tsv'))
raise 'Carloman Manoise already registered' if
  glossary.any? { |row| row['entity_key'] == definition_values.first }
definition = glossary.headers.zip(definition_values).to_h
inventory = m.refresh_inventory
inventory_rows = inventory.values
generated = build_occurrences(inventory_rows, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_ids = %w[28301 6158 37950]
actual_ids = generated.select { |row| row['resource'] == 'default' }
  .map { |row| row['ID_Linha'] }.sort_by(&:to_i)
raise "unexpected full-name source IDs: #{actual_ids.inspect}" unless
  actual_ids == expected_ids.sort_by(&:to_i)
raise 'unexpected resource or variant' unless generated.all? do |row|
  row['resource'] == 'default' && row['Tipo_Variante'].empty?
end

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  old_text = occurrence.fetch('korean_current')
  new_text = old_text.dup
  Array(patches[key]).each do |old_span, new_span|
    count = new_text.scan(Regexp.new(Regexp.escape(old_span))).length
    raise "expected one exact Korean span at #{key.inspect}" unless count == 1
    new_text.sub!(old_span, new_span)
  end
  source = inventory.fetch(key)
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => definition.fetch('entity_key'),
    'status' => 'accepted',
    'old' => old_text,
    'new' => new_text,
    'evidence' => 'English explicitly identifies Carloman Manoise in all three rows. Japanese カーロマン・マノイス and Chinese 卡罗曼·玛诺伊斯 corroborate pronunciation. Reused the active source-matched Korean forms 카를로만(Carloman) at default:4735 and 마누아즈(Manoise) at default:12571. Standardized only the full-name spans; standalone Carloman candidates remain unlinked and unchanged.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(
      definition.fetch('entity_key') => 'accepted'
    )
  }
end
raise 'expected three accepted full-name corrections' unless
  reviews.length == 3 && reviews.all? { |row| row['old'] != row['new'] }

definition['evidence_ids'] = (
  ["D-#{d}"] + generated.map do |row|
    "#{row['resource']}:#{row['ID_Linha']}"
  end
).join('|')

scout_rows = %w[4735 44214].map do |id|
  key = ['default', id, '']
  source = inventory.fetch(key)
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'candidate' => 'Carloman',
    'status' => 'uncertain',
    'korean_current' => source.fetch('work_text'),
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'evidence' => 'The source names only Carloman in this exact row. Related Manoise expedition context is suggestive but does not establish that this short reference is the registered Carloman Manoise; do not add Carloman as a global alias or edit this row without stronger identity evidence.'
  }
end

m.write_table(definitions_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
m.write_table(
  scout_path,
  %w[resource ID_Linha Tipo_Variante candidate status korean_current english japanese chinese evidence],
  scout_rows
)
puts "Prepared D-#{d}: 1 person, #{reviews.length} explicit full-name rows, " \
     "#{scout_rows.length} unlinked short-form candidates."
