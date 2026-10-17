#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_131
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
values = [
  [
    'person:tuven-lynch', 'Tuven Lynch', 'person',
    '투벤 린치(Tuven Lynch)', 'Tuven', '투벤|린치', "D-#{d}", 'confirmed',
    'English identifies Tuven Lynch as Augur lieutenant and the captured saboteur. Short Tuven references concern the same Augur follower or necklace thief. Japanese ツヴェン・リンチ and Chinese 图文·林奇 corroborate the full name; retain the already bilingual Korean spelling. Do not add Lynch as an unscoped surname alias.'
  ],
  [
    'person:calan-mcleod', 'Calan Mcleod', 'person',
    '칼란 맥클라우드(Calan Mcleod)', 'Calan|Mcleod', '칼란|칼럼|캘런|맥클라우드',
    "D-#{d}", 'confirmed',
    'English identifies Calan Mcleod as the murdered master Sagecrafter researching Chaos Gems; surname references concern his notes, workshop or death. Japanese normally カラン・マクラウド and Chinese 卡兰·麦克劳德 corroborate. The isolated Japanese カーン at default:30160 does not override English Calan, Chinese or the repeated Japanese reading. Reuse existing bilingual 칼란 맥클라우드; preserve local English surname case McLeod/Mcleod. Exclude default:48261 McLeod & Sons as a named business/title, not the person.'
  ]
]
definitions = values.map { |row| glossary.headers.zip(row).to_h }
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
expected = {
  'person:tuven-lynch' => %w[
    default:4702 default:12310 default:13920 default:14108 default:16541
    default:35896 default:36741 default:36928 default:41877 default:49006 default:54494
  ],
  'person:calan-mcleod' => %w[
    base:3465 default:936 default:4206 default:4732 default:14788 default:16283
    default:18072 default:19772 default:24250 default:25290 default:30160
    default:30631 default:31971 default:34324 default:34339 default:34781
    default:35222 default:39064 default:39791 default:43468 default:48261
    default:49118 default:49483 default:57253 default:64043
  ]
}
actual = generated.group_by { |row| row['entity_key'] }.transform_values do |rows|
  rows.map { |row| "#{row['resource']}:#{row['ID_Linha']}" }.sort
end
raise 'unexpected Tuven/Calan source matches' unless
  actual == expected.transform_values(&:sort) && generated.all? do |row|
    row['Tipo_Variante'] == (row['resource'] == 'base' ? '11' : '')
  end

reviews = generated.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
end.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.dup
  excluded = key == ['default', '48261', '']
  unless excluded
    proposed.gsub!(/투벤 린치(?!\()/, '투벤 린치(Tuven Lynch)')
    proposed.gsub!(/투벤(?! 린치|\()/, '투벤(Tuven)')
    proposed.gsub!(/(?:칼란|칼럼|캘런) 맥클라우드(?:\(Calan Mcleod\))?/, '칼란 맥클라우드(Calan Mcleod)')
    proposed.gsub!(/맥클라우드(?!\()/, '맥클라우드(Mcleod)')
    proposed.gsub!(/칼란(?! 맥클라우드|\()/, '칼란(Calan)')
  end
  status = excluded ? 'excluded' : (old == proposed ? 'not-an-issue' : 'accepted')
  evidence = if excluded
               'English McLeod & Sons is a named business/title, not a personal-name reference. Retain this label and exclude it from the Calan-person scope; do not silently normalize the business as the person.'
             elsif key == ['default', '30160', '']
               'English Calan Mcleod and Chinese 卡兰·麦克劳德 agree with the repeated Japanese カラン elsewhere; this row alone has Japanese カーン. Retain the English-led 칼란 spelling and add the missing full-name gloss. Other glossary terms and wording remain untouched.'
             else
               'English establishes the full or local short personal name; aligned Japanese and Chinese corroborate. Reuse the existing bilingual canonical spelling and annotate only scoped name spans, preserving short forms, titles, particles and unrelated names.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => match['entity_key'], 'status' => status, 'old' => old, 'new' => proposed,
    'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(match['entity_key'] => status)
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
