#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_135
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definition = glossary.headers.zip([
  'place:hollowlands', 'Hollowlands', 'place',
  '할로우랜드(Hollowlands)', 'The Hollowlands',
  '할로우랜드|할로우랜즈|홀로우랜드|홀로우랜즈|홀로랜드|할로랜드|할로랜즈|공허의 땅|공허지대',
  "D-#{d}", 'confirmed',
  'English consistently identifies Hollowlands as the Detyre desert/mining region, including its lore stones and named-region labels. Japanese ホローランド and Chinese 空洞之地/虚空之地 corroborate identity; default:61509 retains untranslated English in both support locales. Reuse the base labels and repeated bilingual 할로우랜드(Hollowlands); preserve The in standalone The Hollowlands labels, not grammatical articles in prose. Normalize phonetic and literal Korean variants only in matched region references, preserving directions, neighboring places, mining firms, and lore wording.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
default_ids = %w[
  2696 5352 6626 7157 7981 9027 9382 9432 9851 10095 10197 11147
  11969 12018 13757 14591 16453 17357 17511 17618 18195 19756
  21815 22597 22613 24204 25368 26103 26347 26928 29368 30398
  30476 30940 32025 33402 33560 34414 34776 35382 35580 36370
  38150 39873 39899 40219 40275 41521 44260 44489 44929 45159
  45164 46872 47146 47872 48733 51312 52353 52515 53566 53695
  54925 57062 59563 59925 61509 64524 64895
]
expected = default_ids.map { |id| ['default', id, ''] } +
  %w[342 1978 2093].map { |id| ['base', id, '11'] }
raise 'unexpected Hollowlands source matches' unless
  generated.map { |row| m.key(row) }.sort == expected.sort

name_pattern = /(?:할로우랜드|할로우랜즈|홀로우랜드|홀로우랜즈|홀로랜드|할로랜드|할로랜즈|공허의 땅|공허지대)(?: ?\((?:The )?Hollowlands\))?/
reviews = generated.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
end.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  old = source.fetch('work_text')
  raise "missing scoped Korean region #{key}" unless old.match?(name_pattern)
  label = english == 'The Hollowlands' ? '할로우랜드(The Hollowlands)' : '할로우랜드(Hollowlands)'
  proposed = old.gsub(name_pattern, label)
  if %w[16453 33560].include?(key[1]) && key[0] == 'default'
    proposed.sub!('할로우랜드(Hollowlands)을', '할로우랜드(Hollowlands)를')
  end
  status = proposed == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => definition['entity_key'], 'status' => status,
    'old' => old, 'new' => proposed,
    'evidence' => 'English names the same Hollowlands region in Detyre; Japanese ホローランド and Chinese desert-region readings corroborate, while default:61509 keeps untranslated English in both support locales. Reuse the base-label 할로우랜드 canonical; normalize scoped phonetic/literal variants and missing glosses. Preserve The only for standalone The Hollowlands labels. Adjust the object particle after the two translated 공허의 땅 references at 16453/33560; retain all other wording, directions, tokens and line breaks.',
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(definition['entity_key'] => status)
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}-D-#{d + 1}: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
