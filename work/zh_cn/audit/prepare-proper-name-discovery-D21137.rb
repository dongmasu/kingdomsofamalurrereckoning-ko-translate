#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_137
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definition = glossary.headers.zip([
  'monster:khamazandu', 'Khamazandu', 'monster',
  '카마잔두(Khamazandu)', 'Khazamandu', '카마잔두|카자만두',
  "D-#{d}", 'confirmed',
  'English identifies the Niskaru Lord Khamazandu imprisoned in Cloudcrest Mountain and invoked by Fahrlang/Besin. Japanese カマザンドゥ and Chinese 卡扎曼杜 corroborate identity. Khazamandu at default:60248 is the same Niskaru Lord in the same mountain/blessing context; preserve that local English spelling while normalizing Korean to 카마잔두. Khamazandu Gift title rows contain the same name component, but this does not register the whole reward as a monster alias or establish an item/skill type.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
expected = %w[
  3540 7589 10815 15148 16119 17357 19510 21922 22008 25496
  27748 27760 30761 31298 36464 36490 45192 48733 50254 51339
  52226 54076 55397 57753 60248 60800 61713 63262 64167 64664
]
raise 'unexpected Khamazandu source matches' unless
  generated.map { |row| row['ID_Linha'] }.sort_by(&:to_i) == expected &&
  generated.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'].empty? }
reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.dup
  if key[1] == '60248'
    proposed.sub!('카자만두(Khazamandu)', '카마잔두(Khazamandu)')
  elsif key[1] != '60800'
    proposed.gsub!(/카마잔두(?!\()/, '카마잔두(Khamazandu)')
  end
  proposed.sub!('카마잔두(Khamazandu)로 돌아가기', '카마잔두(Khamazandu)에게 돌아가기') if key[1] == '30761'
  status = proposed == old ? 'not-an-issue' : 'accepted'
  evidence = case key[1]
             when '60248'
               'English Khazamandu identifies the same Niskaru Lord blessing on Cloudcrest Mountain; Japanese and Chinese match Khamazandu elsewhere. Normalize Korean to 카마잔두, preserving source-local English Khazamandu.'
             when '30761'
               'English Return to Khamazandu names the Niskaru Lord, not a place. Match the parallel objective at 25496 with 카마잔두(Khamazandu)에게 돌아가기.'
             when '55397', '60800'
               'The reward-title possessive contains the same Khamazandu name. The existing name-level or whole-title English annotation is already source-traceable; retain without nesting or duplicate glosses. This component review does not classify or register the entire reward.'
             when '51339', '7589'
               'English names the same Khamazandu twice in this row, corroborated by Japanese and Chinese. Preserve the already paired occurrence and annotate the unpaired repeated mention only; retain all other names, lore and line breaks.'
             else
               'English names the Niskaru Lord Khamazandu, corroborated by Japanese カマザンドゥ and Chinese 卡扎曼杜. Reuse the existing bilingual Korean canonical and add missing name glosses only; preserve crown, prison, quest and reward wording.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => definition['entity_key'], 'status' => status,
    'old' => old, 'new' => proposed, 'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
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
puts "D-#{d}: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
