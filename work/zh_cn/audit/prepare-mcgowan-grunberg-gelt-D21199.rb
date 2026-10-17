#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_199
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
context = 'English determines identity and rank/name wording; Japanese and Chinese corroborate pronunciation and role. The official Korean manual does not list these NPCs. Preserve the source title in the bilingual label and keep each entity distinct.'
definitions = [
  ['person:private-mcgowan', 'Private McGowan', 'person', '맥고완 이병(Private McGowan)', '', '맥고완 일병|맥고완 이등병|이병 맥고원|맥고완',
   'default:7343|default:9812|default:12795|default:16490|default:24855|default:38927|default:52843|default:52968|default:61383',
   'English consistently identifies the refugee-camp Warsworn fighter by the rank-bearing label Private McGowan. Japanese 兵卒マクゴワン and Chinese 列兵麦高文 corroborate. Use the military equivalent 이병 and standard surname 맥고완; retain the title and complete English label on each exact source occurrence. Pledgeshield McGowan is not included without a separate identity review.'],
  ['person:pledgeshield-grunberg', 'Pledgeshield Grunberg', 'person', '서약방패병 그룬베르크(Pledgeshield Grunberg)', '', '서약방패병 그룬버그|서약방패병 그룬베르크',
   'default:13095|default:17227|default:39131|default:54277',
   'English identifies the same Warsworn member through the abandoned-house report and settler protection. Japanese 二等傭兵グルンバーグ and Chinese 誓言之盾格伦伯格 corroborate. Normalize the inconsistent Korean Grunberg spelling to 그룬베르크 and retain the title-bearing full name.'],
  ['person:gelt-far', 'Gelt Far', 'person', '겔트 파(Gelt Far)', '', '겔트 파르',
   'default:8782|default:13174|default:19404|default:46046',
   'English identifies the same named traveler, including the companion reference with Edwin Hoswig. Japanese ゲルト・ファー and Chinese 格尔特·法尔 corroborate. Standardize the Korean transcription as 겔트 파; Far is rendered by its attested Korean phonetic form, not expanded with an unsupported final consonant.']
].map do |entity, english, category, korean, aliases, variants, ids, note|
  glossary.headers.zip([
    entity, english, category, korean, aliases, variants,
    "D-#{d}|#{ids}", 'confirmed', "#{note} #{context}"
  ]).to_h
end
raise 'one or more entities already registered' unless
  (glossary.map { |row| row['entity_key'] } & definitions.map { |row| row['entity_key'] }).empty?

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
rewrites = {
  ['default', '7343', ''] => [['맥고완 일병(Private McGowan)', '맥고완 이병(Private McGowan)']],
  ['default', '9812', ''] => [['사병 맥고완을 완전히 박살', '맥고완 이병(Private McGowan)을 완전히 박살']],
  ['default', '12795', ''] => [['맥고완(McGowan) 이등병', '맥고완 이병(Private McGowan)']],
  ['default', '16490', ''] => [['맥고완(McGowan) 일병 처치', '맥고완 이병(Private McGowan) 처치']],
  ['default', '24855', ''] => [['이등병 맥고완', '맥고완 이병(Private McGowan)']],
  ['default', '38927', ''] => [['이병 맥고원(Private McGowan)', '맥고완 이병(Private McGowan)']],
  ['default', '52843', ''] => [['맥고완 일병(Private McGowan)', '맥고완 이병(Private McGowan)']],
  ['default', '52968', ''] => [['맥고완 일병(Private McGowan)', '맥고완 이병(Private McGowan)']],
  ['default', '61383', ''] => [['맥고완 일병(Private McGowan)', '맥고완 이병(Private McGowan)']],
  ['default', '13095', ''] => [['서약방패병 그룬버그(Pledgeshield Grunberg)', '서약방패병 그룬베르크(Pledgeshield Grunberg)']],
  ['default', '17227', ''] => [['서약방패병 그룬버그(Pledgeshield Grunberg)', '서약방패병 그룬베르크(Pledgeshield Grunberg)']],
  ['default', '39131', ''] => [['서약방패병 그룬베르크(Pledgeshield Grunberg)', '서약방패병 그룬베르크(Pledgeshield Grunberg)']],
  ['default', '54277', ''] => [['서약방패병 그룬베르크(Pledgeshield Grunberg)', '서약방패병 그룬베르크(Pledgeshield Grunberg)']],
  ['default', '46046', ''] => [['겔트 파르(Gelt Far)', '겔트 파(Gelt Far)']]
}
reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  if (operations = rewrites[key])
    operations.each do |from, to|
      raise "expected rewrite span missing/ambiguous #{key.inspect}: #{from}" unless
        new_text.scan(from).length == 1
      new_text.sub!(from, to)
    end
  elsif key == ['default', '8782', ''] ||
        key == ['default', '13174', ''] ||
        key == ['default', '19404', '']
    # Existing canonical Korean(English) form is retained.
  else
    raise "unreviewed generated occurrence #{key.inspect}"
  end
  entities = matches.map { |row| row.fetch('entity_key') }.uniq
  status = old == new_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => definitions.select { |definition| entities.include?(definition['entity_key']) }
      .map { |definition| "#{definition['english_canonical']}: #{definition['notes']}" }.join(' '),
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise "expected 17 distinct source rows, got #{reviews.length}" unless reviews.length == 17
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'preparation output exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "17 distinct row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
