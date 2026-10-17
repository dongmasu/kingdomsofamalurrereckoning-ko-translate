#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
audit = __dir__
d = 21_122
definitions_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} discovery artifacts already exist" if
  [definitions_path, reviews_path].any? { |path| File.exist?(path) }

definition_values = [
  ['person:dennrit-rond', 'Dennrit Rond', 'person', '덴릿 론드(Dennrit Rond)', '',
   '덴릿 론드|데른릿 론드', 'D-21122|default:2729|default:14076|default:17087|default:18584|default:21212|default:23422|default:28084|default:56422|default:16058',
   'confirmed',
   'English identifies one person, Dennrit Rond, and explicitly says he is the speaker’s husband. Japanese デンリット・ロンド and Chinese 丹里特·朗多 corroborate the identity and pronunciation. Standardize the nine exact references to 덴릿 론드(Dennrit Rond).'],
  ['person:donnel-cutty', 'Donnel Cutty', 'person', '도넬 커티(Donnel Cutty)', '',
   '도넬 커티|도널 커티', 'D-21122|base:1755|default:1344|default:2327|default:11804|default:62285|default:64403',
   'confirmed',
   'English identifies Donnel Cutty as a person and explicitly calls him the speaker’s assistant. Japanese ドンネル・カッティー and Chinese 唐纳·库迪 corroborate the identity. Use the prevailing aligned Korean form 도넬 커티(Donnel Cutty).'],
  ['person:drystan-rydder', 'Drystan Rydder', 'person', '드리스탄 라이더(Drystan Rydder)', '',
   '드리스탄 라이더|드리스탄 리더', 'D-21122|default:16522|default:24044|default:38256|default:51167|default:60288|default:55295',
   'confirmed',
   'English identifies the same named person, including Warsworn context. Japanese ドリスタン・リッダー and Chinese 德瑞斯坦·莱德 corroborate. Standardize the six exact references to 드리스탄 라이더(Drystan Rydder).'],
  ['person:horace-despero', 'Horace Despero', 'person', '호러스 데스페로(Horace Despero)', '',
   '호러스 데스페로|호레이스 데스페로', 'D-21122|default:3025|default:51919|default:5050|default:7502|default:11593|default:51670',
   'confirmed',
   'English identifies one person, described as a gnome and as Stellan’s friend. Japanese ホレス・デスペロ and Chinese 贺拉斯·德斯佩罗 corroborate the name. Use 호러스 데스페로(Horace Despero), reflecting the English pronunciation; do not conflate the existing 호레이스 variant with a separate person.'],
  ['person:lou-winfreigh', 'Lou Winfreigh', 'person', '루 윈프레이(Lou Winfreigh)', '',
   '루 윈프레이|루 윈프리', 'D-21122|default:2070|default:22015|default:22189|default:51283|default:55065|default:29361',
   'confirmed',
   'English identifies the same person in the wolf and troll quest context. Japanese ルー・ウィンフレイ and Chinese 卢·温弗瑞 corroborate the reading. Standardize to 루 윈프레이(Lou Winfreigh).'],
  ['person:logan-darrow', 'Logan Darrow', 'person', '로건 대로(Logan Darrow)', '',
   '로건 대로|로건 대로우', 'D-21122|default:3371|default:15692|default:56631|default:60918|default:60540',
   'confirmed',
   'English identifies one woman in the Revival refugee-camp quest. Japanese ローガン・ダロー and Chinese 洛根·达罗 corroborate the identity and surname reading. Use 로건 대로(Logan Darrow), matching the aligned Japanese and Chinese forms.'],
  ['person:elias-hurk', 'Elias Hurk', 'person', '일라이어스 허크(Elias Hurk)', '',
   '일라이어스 허크|엘리아스 허크', 'D-21122|default:2778|default:16724|default:24163|default:50688|default:61228',
   'confirmed',
   'English identifies Elias Hurk in repeated objective and character labels. Japanese エリアス・ハーク and Chinese 伊莱亚斯·赫尔克 corroborate identity; the English pronunciation supports 일라이어스 허크(Elias Hurk).'],
  ['person:goyen-reen', 'Goyen Reen', 'person', '고옌 린(Goyen Reen)', '',
   '고옌 린|고이엔 린', 'D-21122|base:4301|default:2752|default:5657|default:23235|default:51321',
   'confirmed',
   'English identifies Goyen Reen as Ivan’s old friend and betrayer. Japanese ゴイエン・リーン and Chinese 戈因·里恩 corroborate the identity. Standardize the five exact references to 고옌 린(Goyen Reen).'],
  ['person:abel-gefroy', 'Abel Gefroy', 'person', '아벨 게프로이(Abel Gefroy)', '',
   '아벨 게프로이|아벨 제프로이', 'D-21122|default:18611|default:51899',
   'confirmed',
   'English identifies Savant Abel Gefroy as the source of a magical hypothesis in a scholarly letter and names him in a separate label. Japanese アベル・ゲフロイ and Chinese 亚伯·戈弗里 corroborate the hard initial consonant. Use 아벨 게프로이(Abel Gefroy).']
].freeze

glossary = m.table(File.join(audit, 'proper-name-glossary.tsv'))
definitions = definition_values.map do |values|
  glossary.headers.zip(values).to_h
end

candidates = m.table(File.join(audit, 'proper-name-variant-discovery-candidates-20261015.tsv'))
candidate_names = definition_values.map { |values| values[1] }
candidate_keys = candidate_names.flat_map do |name|
  candidate = candidates.find { |row| row['english_candidate'] == name }
  raise "missing heuristic candidate #{name}" unless candidate
  candidate['sampled_row_keys'].split('|').map do |value|
    resource, id, variant = value.split(':', -1)
    [resource, id, variant.to_s]
  end
end
raise 'heuristic candidate keys overlap' unless candidate_keys.uniq.length == candidate_keys.length
raise 'D-21122 must contain exactly 50 distinct row keys' unless candidate_keys.length == 50

changes = {
  ['default', '16058', ''] => ['데른릿 론드', '덴릿 론드'],
  ['base', '1755', '11'] => ['도널 커티', '도넬 커티'],
  ['default', '30152', ''] => ['도넬 커티', '도넬 커티(Donnel Cutty)'],
  ['default', '47682', ''] => ['도넬 커티', '도넬 커티(Donnel Cutty)'],
  ['default', '55295', ''] => ['드리스탄 리더', '드리스탄 라이더'],
  ['default', '29449', ''] => ['드리스탄 리더(Rydder)', '드리스탄 라이더(Drystan Rydder)'],
  ['default', '32565', ''] => ['드리스탄 라이더', '드리스탄 라이더(Drystan Rydder)'],
  ['default', '36170', ''] => ['드리스탄 리더', '드리스탄 라이더(Drystan Rydder)'],
  ['default', '5050', ''] => ['호레이스 데스페로', '호러스 데스페로'],
  ['default', '7502', ''] => ['호레이스 데스페로', '호러스 데스페로'],
  ['default', '11593', ''] => ['호레이스 데스페로', '호러스 데스페로'],
  ['default', '51670', ''] => ['호레이스 데스페로', '호러스 데스페로'],
  ['default', '29361', ''] => ['루 윈프리', '루 윈프레이'],
  ['default', '9503', ''] => ['루 윈프레이', '루 윈프레이(Lou Winfreigh)'],
  ['default', '15362', ''] => ['루 윈프레이', '루 윈프레이(Lou Winfreigh)'],
  ['default', '37295', ''] => ['루 윈프레이', '루 윈프레이(Lou Winfreigh)'],
  ['default', '45226', ''] => ['루 윈프레이', '루 윈프레이(Lou Winfreigh)'],
  ['default', '50183', ''] => ['루 윈프레이', '루 윈프레이(Lou Winfreigh)'],
  ['default', '58129', ''] => ['루 윈프레이', '루 윈프레이(Lou Winfreigh)'],
  ['default', '59121', ''] => ['루 윈프레이그', '루 윈프레이(Lou Winfreigh)'],
  ['default', '60540', ''] => ['로건 대로우', '로건 대로'],
  ['default', '42655', ''] => ['로건 대로우', '로건 대로(Logan Darrow)'],
  ['default', '46280', ''] => ['로건 대로', '로건 대로(Logan Darrow)'],
  ['default', '49629', ''] => ['로건 대로우', '로건 대로(Logan Darrow)'],
  ['default', '2778', ''] => ['엘리아스 허크', '일라이어스 허크'],
  ['default', '16724', ''] => ['엘리아스 허크', '일라이어스 허크'],
  ['default', '24163', ''] => ['엘리아스 허크', '일라이어스 허크'],
  ['default', '30914', ''] => ['엘리아스 허크', '일라이어스 허크(Elias Hurk)'],
  ['default', '37986', ''] => ['엘리아스 허크', '일라이어스 허크(Elias Hurk)'],
  ['default', '39775', ''] => ['엘리아스 허크', '일라이어스 허크(Elias Hurk)'],
  ['default', '47729', ''] => ['엘리아스 허크', '일라이어스 허크(Elias Hurk)'],
  ['default', '64462', ''] => ['엘리아스 허크', '일라이어스 허크(Elias Hurk)'],
  ['default', '51321', ''] => ['고이엔 린', '고옌 린'],
  ['default', '7598', ''] => ['고이엔 린', '고옌 린'],
  ['default', '9550', ''] => ['고이언 린', '고옌 린(Goyen Reen)'],
  ['default', '49347', ''] => ['고옌 린', '고옌 린(Goyen Reen)'],
  ['default', '65093', ''] => ['고옌 린', '고옌 린(Goyen Reen)'],
  ['default', '51899', ''] => ['아벨 제프로이', '아벨 게프로이'],
  ['default', '62841', ''] => ['아벨 게프루아', '아벨 게프로이(Abel Gefroy)']
}.freeze

rationales = {
  'person:dennrit-rond' => 'English identifies Dennrit Rond as the speaker’s husband; Japanese デンリット・ロンド and Chinese 丹里特·朗多 corroborate. Standardized only the exact name span to 덴릿 론드(Dennrit Rond).',
  'person:donnel-cutty' => 'English identifies Donnel Cutty as a person and, in the assistant dialogue, explicitly as the speaker’s assistant; Japanese ドンネル・カッティー and Chinese 唐纳·库迪 corroborate. Standardized only the exact name span to 도넬 커티(Donnel Cutty).',
  'person:drystan-rydder' => 'English identifies Drystan Rydder in aligned character/objective text; Japanese ドリスタン・リッダー and Chinese 德瑞斯坦·莱德 corroborate. Standardized only the exact name span to 드리스탄 라이더(Drystan Rydder).',
  'person:horace-despero' => 'English identifies Horace Despero as the same gnome in the aligned narratives; Japanese ホレス・デスペロ and Chinese 贺拉斯·德斯佩罗 corroborate. Standardized the name to 호러스 데스페로(Horace Despero), following the English pronunciation.',
  'person:lou-winfreigh' => 'English quest text identifies the same person; Japanese ルー・ウィンフレイ and Chinese 卢·温弗瑞 corroborate. Standardized only the exact name span to 루 윈프레이(Lou Winfreigh).',
  'person:logan-darrow' => 'English identifies the same woman in the Revival quest; Japanese ローガン・ダロー and Chinese 洛根·达罗 corroborate. Standardized only the exact name span to 로건 대로(Logan Darrow).',
  'person:elias-hurk' => 'English identifies Elias Hurk in the aligned character/objective rows; Japanese エリアス・ハーク and Chinese 伊莱亚斯·赫尔克 corroborate. The English pronunciation supports 일라이어스 허크(Elias Hurk).',
  'person:goyen-reen' => 'English identifies Goyen Reen as Ivan’s old friend and betrayer; Japanese ゴイエン・リーン and Chinese 戈因·里恩 corroborate. Standardized only the exact name span to 고옌 린(Goyen Reen).',
  'person:abel-gefroy' => 'English identifies Savant Abel Gefroy in the scholarly letter and a separate label; Japanese アベル・ゲフロイ and Chinese 亚伯·戈弗里 corroborate. Standardized only the exact name span to 아벨 게프로이(Abel Gefroy).'
}.freeze

inventory_rows = m.table(m::INVENTORY).map(&:to_h)
inventory = inventory_rows.to_h { |row| [m.key(row), row] }
generated = build_occurrences(inventory_rows, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
generated_keys = generated.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s] }
missing_candidate_keys = candidate_keys - generated_keys
raise "glossary source matches omit candidate keys: #{missing_candidate_keys.inspect}" unless
  missing_candidate_keys.empty?
extra_keys = generated_keys - candidate_keys
puts "Expanded past heuristic candidates to review all #{generated_keys.length} source occurrences (#{extra_keys.length} additional rows)."
raise 'unexpected CSV row keys in review changes' unless
  (changes.keys - generated_keys).empty?

reviews = generated.map do |occurrence|
  entity = occurrence.fetch('entity_key')
  key = m.key(occurrence)
  old_text = occurrence.fetch('korean_current')
  new_text = old_text.dup
  if (change = changes[key])
    old_span, new_span = change
    raise "expected one reviewed span at #{key.inspect}" unless new_text.scan(old_span).length == 1
    new_text.sub!(old_span, new_span)
  end
  status = new_text == old_text ? 'not-an-issue' : 'accepted'
  source = inventory.fetch(key)
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entity,
    'status' => status,
    'old' => old_text,
    'new' => new_text,
    'evidence' => "#{rationales.fetch(entity)} This is a new exact entity/row key; previous decisions for other entities and all global tallies remain unchanged.",
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end

raise 'expected 39 exact cell corrections' unless changes.length == 39
raise 'expected 39 accepted and 36 retained rows' unless
  reviews.group_by { |row| row['status'] }.transform_values(&:length) ==
    { 'not-an-issue' => 36, 'accepted' => 39 }

definitions.each do |definition|
  keys = generated.select { |row| row['entity_key'] == definition['entity_key'] }
                  .map { |row| "#{row['resource']}:#{row['ID_Linha']}" }
  definition['evidence_ids'] = keys.uniq.join('|')
end

m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "Prepared D-#{d}: #{definitions.length} people, #{reviews.length} exact row keys, #{changes.length} corrections."
puts "Dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
