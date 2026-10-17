#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_181
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))

raw_definitions = [
  [
    'person:sinon-carrag', 'Sinon Carrag', '시논 카라그(Sinon Carrag)',
    %w[4759 9874 18986 32263 47527 51881 57143 61419],
    'English identifies Sinon Carrag as the same Alfar captain in the Drowned Forest quest and its related dialogue/objective rows. Japanese シノン・カラグ and Chinese 赛侬·卡拉格 corroborate the name. Standardize the observed 시논 카라그/시논 캐랙 variants as 시논 카라그(Sinon Carrag).'
  ],
  [
    'person:varen-seawine', 'Varen Seawine', '바렌 시와인(Varen Seawine)',
    %w[7102 21755 26104 37358 50611 52936 54369 56813],
    'English identifies Varen Seawine in the Klurikon monologue, name-list references, and isolated name labels. Japanese ヴァレン・シーワイン and Chinese 瓦仁·希万尼 corroborate the same personal name. Standardize 베런 시와인 as 바렌 시와인(Varen Seawine).'
  ],
  [
    'person:arnick-arduna', 'Arnick Arduna', '아르닉 아르두나(Arnick Arduna)',
    %w[234 15394 16170 21764 25941 57640],
    'English identifies Arnick Arduna as the Gorhart Inn proprietor and in related references. Japanese アルニック・アルデュナ supports 아르닉 아르두나; Chinese 亚尼克·阿杜那 is corroborative. Standardize the observed 아닉 아르두나 variant as 아르닉 아르두나(Arnick Arduna).'
  ],
  [
    'person:loutre-gent', 'Loutre Gent', '루트르 젠트(Loutre Gent)',
    %w[6626 7157 17660 37116 47074 51914 59925],
    'English identifies Loutre Gent as the head staffer of Motus Mining’s Adessa home office and the person assigning and receiving the branch-handbook task. Japanese ルーター・ジェント and Chinese 卢特·金特 corroborate the same person. Standardize all local split-name and shortened Korean variants as 루트르 젠트(Loutre Gent).'
  ]
]

definitions = raw_definitions.map do |entity_key, english, korean, ids, notes|
  evidence_ids = ["D-#{d}", *ids.map { |id| "default:#{id}" }].join('|')
  glossary.headers.zip([
    entity_key, english, 'person', korean, '', '', evidence_ids, 'confirmed', notes
  ]).to_h
end

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = raw_definitions.to_h do |entity_key, _english, _korean, ids, _notes|
  [entity_key, ids.map { |id| ['default', id, ''] }.sort]
end
actual = generated.group_by { |row| row.fetch('entity_key') }
  .transform_values { |rows| rows.map { |row| m.key(row) }.sort }
raise "source-key mismatch: #{actual.inspect}" unless actual == expected

patterns = {
  'person:sinon-carrag' => /시논\s+(?:카라그|캐랙)(?:\s*\(Sinon Carrag\))?/,
  'person:varen-seawine' => /(?:바렌|베런)\s+시와인(?:\s*\(Varen Seawine\))?/,
  'person:arnick-arduna' => /(?:아닉|아르닉)\s+아르두나(?:\s*\(Arnick Arduna\))?/,
  'person:loutre-gent' => /(?:루트르\s*\(Loutre\)\s+젠트|루트르\s+젠트|루트르\s+젠)(?:\s*\(Loutre Gent\))?/
}
canonical = definitions.to_h { |row| [row.fetch('entity_key'), row.fetch('korean_canonical')] }
reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.dup
  matches.each do |match|
    entity = match.fetch('entity_key')
    proposed.gsub!(patterns.fetch(entity), canonical.fetch(entity))
  end
  matches.each do |match|
    entity = match.fetch('entity_key')
    english_name = definitions.find { |row| row['entity_key'] == entity }.fetch('english_canonical')
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    english_count = english.scan(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i).length
    korean_count = proposed.scan(patterns.fetch(entity)).length
    raise "name-count mismatch #{entity} #{key.inspect}: EN=#{english_count}, KO=#{korean_count}" unless
      english_count == korean_count
  end
  dispositions = matches.to_h do |match|
    entity = match.fetch('entity_key')
    [entity, proposed == old ? 'not-an-issue' : 'accepted']
  end
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => matches.map { |row| row.fetch('entity_key') }.uniq.sort.join('|'),
    'status' => dispositions.value?('accepted') ? 'accepted' : 'not-an-issue',
    'old' => old,
    'new' => proposed,
    'evidence' => matches.map { |row| definitions.find { |definition| definition['entity_key'] == row['entity_key'] }['notes'] }.uniq.join(' '),
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'more than 50 distinct row keys' if reviews.length > 50
definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definition_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definition_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{reviews.length} keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
reviews.each do |row|
  next if row['old'] == row['new']
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
