#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_130
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
values = [
  [
    'person:baldo-bergmann', 'Baldo Bergmann', 'person',
    '발도 베르그만(Baldo Bergmann)', 'Baldo', '발도|베르그만|베르크만|버그만',
    "D-#{d}", 'confirmed',
    'English explicitly identifies Baldo Bergmann as the father requesting investigation of missing settlers at Revival. The short Baldo daughter/Mayor Flanagan quest rows describe the same disappearance. Japanese バルドー・バーグマン and Chinese 巴尔多·伯格曼 corroborate. Retain the already bilingual full-name spelling at default:3092 and normalize Bergmann variants to 베르그만. Do not register the shared surname as a person alias.'
  ],
  [
    'person:heidi-bergmann', 'Heidi Bergmann', 'person',
    '하이디 베르그만(Heidi Bergmann)', 'Heidi', '하이디|베르그만|베르크만',
    "D-#{d}", 'confirmed',
    'English names Heidi Bergmann in two labels and explicitly identifies Heidi as Baldo Bergmann daughter in default:45885; the other short-name rows concern her kidnapping, rescue or unknown fate. Japanese ハイディ・バーグマン and Chinese 海蒂·伯格曼 corroborate. Reuse the existing bilingual full name at default:52293 and keep short references short.'
  ]
]
definitions = values.map { |row| glossary.headers.zip(row).to_h }
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
expected = {
  'person:baldo-bergmann' => %w[916 3092 4259 21925 30508 37780 39461 41991 42695 45885 48350],
  'person:heidi-bergmann' => %w[5264 13001 18663 34312 39726 45885 52293]
}
actual = generated.group_by { |row| row['entity_key'] }.transform_values do |rows|
  rows.map { |row| row['ID_Linha'] }.sort_by(&:to_i)
end
raise 'unexpected Bergmann source matches' unless actual == expected &&
  generated.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'].empty? }

reviews = generated.group_by { |row| m.key(row) }.sort_by { |key, _| key[1].to_i }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.dup
  proposed.gsub!(/발도 (?:베르그만|베르크만|버그만)(?:\(Baldo Bergmann\))?/, '발도 베르그만(Baldo Bergmann)')
  proposed.gsub!(/하이디 (?:베르그만|베르크만)(?:\(Heidi Bergmann\))?/, '하이디 베르그만(Heidi Bergmann)')
  if key[1] == '45885'
    proposed.sub!('딸 하이디를', '딸 하이디(Heidi)를')
    proposed.sub!('발도에게', '발도(Baldo)에게')
  end
  proposed.sub!('하이디가 돌아오리라곤', '하이디(Heidi)가 돌아오리라곤') if key[1] == '39726'
  status = proposed == old ? 'not-an-issue' : 'accepted'
  entities = matches.map { |row| row['entity_key'] }.sort
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => proposed,
    'evidence' => 'English full-name labels and the Revival kidnapping journal identify father Baldo and daughter Heidi. Japanese and Chinese corroborate each name. Reuse existing bilingual canonical forms; normalize only the scoped Bergmann spelling and add missing local full/short English glosses. Preserve unrelated names, source pronouns, titles and quest wording.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{generated.length} matches; #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
