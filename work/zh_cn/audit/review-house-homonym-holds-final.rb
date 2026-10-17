#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
  .to_h { |r| [ReviewedNameBatches.key(r), r.to_h] }
index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX)
selected = index.select do |r|
  r['status'] == 'uncertain' && r['entity_key'].match?(/\A(faction:|unique_item:cryamor\z)/)
end
rows = selected.group_by { |r| ReviewedNameBatches.key(r) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source['work_text']
  updated = old.dup
  status = 'not-an-issue'
  evidence = if matches.first['entity_key'] == 'unique_item:cryamor'
               'EN bare Cryamor label leaves person-versus-pet-sword identity unresolved; both independently established entities use exactly 크라이아모어(Cryamor). JA/ZH likewise contain the same bare name. No material textual ambiguity remains, so retain the bilingual label as not-an-issue for display only, without asserting entity identity.'
             else
               case key[1]
               when '5958'
                 updated = '발라드의 갑옷(Ballads armor)을 획득해 장착하기'
                 status = 'accepted'
                 'EN Ballads armor, JA バラッドの防具, ZH 歌谣护甲 identify the shortened named armor phrase. Add its exact English wording as a bilingual compound exception, rather than inventing House of Ballads in the source. Faction affiliation remains unasserted.'
               when '11246'
                 updated = old.sub('프라이드(Pride)', '긍지의 집(House of Pride)')
                 status = 'accepted'
                 'EN contrasts Gadflow against capitalized Pride as an enemy; JA プライド and ZH 高傲家族 (House/family) resolve the faction referent. Use the confirmed House of Pride canonical, not an abstract emotion.'
               when '42093', '47186'
                 replacement = '비탄의 집(House of Sorrows)과 긍지의 집(House of Pride), 복수의 집(House of Vengeance)'
                 updated = if key[1] == '42093'
                             old.sub('비탄과 긍지, 복수의 집', replacement)
                           else
                             old.sub('비탄의 집과 긍지의 집, 복수의 집', replacement)
                           end
                 status = 'accepted'
                 'EN explicitly enumerates the Houses of Sorrows, Pride and Vengeance; JA ハウス・オブ・ソロー、プライド、ヴェンジェンス and ZH 悲伤、高傲和复仇家族 corroborate all three Houses. The earlier uncertain Pride disposition was unnecessary in this explicit context. Add the three established bilingual names while preserving all line breaks.'
               when '15644'
                 status = 'uncertain'
                 'EN poetic Seasons/Vengeance/Pride/Sorrow stanza and JA transliterated names versus ZH abstract emotions leave a material choice between literal verse and full faction names. Retain verse without expanding absent House wording; explicit prose at 42093/47186 does not prove this poem must use the same expanded title.'
               when '62013'
                 status = 'excluded'
                 'EN Champion of Valor is explicitly a title of the Fae Engard contrasted with the mortal pretender, not the House of Valor faction name. JA チャンピオン and ZH 冠军 corroborate a champion. Preserve title and exclude this House-entity candidate only.'
               else
                 raise "unreviewed hold #{key}"
               end
             end
  # The two explicit House-list cells also have already-terminal sibling
  # entity matches. Record their corrected display without recounting keys.
  applicable = if %w[42093 47186].include?(key[1])
                 index.select { |r| ReviewedNameBatches.key(r) == key && r['entity_key'].match?(/\Afaction:house-of-(pride|sorrows|vengeance)\z/) }
               else
                 matches
               end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => applicable.map { |r| r['entity_key'] }.sort.join('|'),
    'status' => status, 'old' => old, 'new' => updated, 'evidence' => evidence
  }
end
ReviewedNameBatches.write_table(File.join(__dir__, 'proper-name-reviewed-house-homonym-holds-final.tsv'),
                               ReviewedNameBatches::HEADERS, rows)
puts rows.group_by { |r| r['status'] }.transform_values(&:length).inspect
