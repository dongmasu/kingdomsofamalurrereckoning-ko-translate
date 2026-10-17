#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_139
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
values = [
  [
    'place:menetyre', 'Menetyre', 'place', '메네타이어(Menetyre)', '',
    '메네타이어|메네티어|메네티르', "D-#{d}", 'confirmed',
    'English identifies the Detyre region Menetyre. Japanese メネティア and Chinese 梅内泰尔/梅尼泰尔 corroborate. Preserve the established 메네타이어 explicitly accepted at D-20202/default:56364 and the base labels; normalize 메네티어/메네티르. Existing whole-feature Menetyre Heights annotations at 12164/16356 remain intact without nesting; the feature is not a region alias. default:14926 retains untranslated Menetyre in both support locales.'
  ],
  [
    'place:alserund', 'Alserund', 'place', '알세룬드(Alserund)', '',
    '알세룬드|앨서런드|알서런드|알세런드', "D-#{d}", 'confirmed',
    'English identifies Alserund as the Detyre region afflicted by the Narca curse. Japanese アルセランド and Chinese 艾尔斯朗德 corroborate. Reuse the existing bilingual base/region labels and predominant 알세룬드. Normalize 앨서런드/알서런드/알세런드 only in matched place references. Retain source-explicit Cedric at 22478, the regional semantic correction at 32422, and distinct stone/quest/title words; these are not additional region aliases.'
  ]
]
definitions = values.map { |row| glossary.headers.zip(row).to_h }
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
default_ids = {
  'place:menetyre' => %w[
    412 7035 9342 9783 10854 11544 11581 12164 14506 14926 16356
    16453 16576 18902 19797 20771 25324 25917 31978 33237 33560
    34236 36370 37783 39434 41973 44260 44392 45813 49337 49931
    50955 50993 52583 54362 55655 56049 56364 57406 61406 61779
    61804 64194
  ],
  'place:alserund' => %w[
    40 185 939 2259 3247 3678 4604 5210 6455 6518 7340 9628
    11093 11445 11892 12349 15385 16325 16453 17943 20746 21378
    21714 22478 23367 23399 24166 25089 25930 26217 26303 29725
    30370 32422 32781 33560 33686 33840 36297 36740 36910 39089
    39109 39305 40129 40626 41124 43509 44767 46111 46515 47335
    49530 49775 51568 52232 55497 56350 56920 59207 61591 62148
    63148 63884 64606
  ]
}
base_ids = { 'place:menetyre' => %w[303 2150], 'place:alserund' => %w[3296] }
expected = default_ids.to_h do |entity, ids|
  [entity, ids.map { |id| ['default', id, ''] } +
    base_ids.fetch(entity).map { |id| ['base', id, '11'] }]
end
actual = generated.group_by { |row| row['entity_key'] }.transform_values do |rows|
  rows.map { |row| m.key(row) }.sort
end
raise 'unexpected Menetyre/Alserund source matches' unless actual == expected.transform_values(&:sort)

transform = lambda do |text, entity|
  if entity == 'place:menetyre'
    text.gsub(/(?:메네타이어|메네티어|메네티르)(?:\(Menetyre\))?(?! 고지\(Menetyre Heights\))/,
              '메네타이어(Menetyre)')
  else
    text.gsub(/(?:알세룬드|앨서런드|알서런드|알세런드)(?:\(Alserund\))?/,
              '알세룬드(Alserund)')
  end
end
reviews = generated.group_by { |row| m.key(row) }.sort_by do |key, _|
  [m::RESOURCES.index(key[0]), key[1].to_i]
end.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  entities = matches.map { |row| row['entity_key'] }.sort
  proposed = entities.reduce(old) { |text, entity| transform.call(text, entity) }
  per_entity = entities.to_h do |entity|
    [entity, transform.call(old, entity) == old ? 'not-an-issue' : 'accepted']
  end
  status = old == proposed ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status,
    'old' => old, 'new' => proposed,
    'evidence' => 'English establishes the Menetyre/Alserund region references; aligned Japanese and Chinese corroborate identity, except untranslated Menetyre supports at 14926. Retain established 메네타이어 (D-20202/56364) and predominant/base-label 알세룬드, normalize scoped phonetic variants and missing glosses including repeated mentions. Preserve complete Menetyre Heights annotations at 12164/16356, source Cedric at 22478 and regional semantics at 32422. Shared verse rows 16453/33560 are reviewed once with per-entity dispositions; all other names, lore, tokens and line breaks remain unchanged.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(per_entity)
  }
end
raise 'wrong distinct regional row count' unless reviews.length == 109
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}-D-#{d + 2}: #{generated.length} entity matches; #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
