#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
d = 21_200
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definitions_data = [
  [
    'person:orsinian-paige', 'Orsinian Paige', 'person',
    '오르시니언 페이지(Orsinian Paige)', '', '오르시니안 페이지|프레토리안 오르시니안 페이지',
    'default:412|default:17839|default:19744|default:19797|default:29482|default:38366|default:39155|default:54483|default:56601',
    'English identifies the same named Warsworn officer and quest contact. Japanese オーシニアン・ペイジ and Chinese 奥斯尼安·派奇 corroborate the name. The source title Praetorian is retained in the two title-bearing rows; use the already-established Korean 근위대장 there and the canonical bilingual personal name in all exact occurrences.'
  ],
  [
    'person:ana-hadhallow', 'Ana Hadhallow', 'person',
    '애나 해드할로우(Ana Hadhallow)', '', '아나 해드할로',
    'base:3017|default:503',
    'Both aligned English rows identify the named deceased person through her grave label. Japanese アナ・ハッドハロー and Chinese 安娜·哈德哈罗 corroborate the identity and pronunciation. Keep the grave as a place/object label, not a separate person identity.'
  ],
  [
    'person:bertran-lot', 'Bertran Lot', 'person',
    '버트런 로트(Bertran Lot)', '', '버트런 롯',
    'base:2|default:51529',
    'The English source names the same person in both Grave of Bertran Lot labels. Japanese バートラン・ロット and Chinese 贝尔特兰·洛特 corroborate the name. Normalize the Korean surname to 로트 and preserve the complete grave-label meaning.'
  ],
  [
    'person:ina-sawerth', 'Ina Sawerth', 'person',
    '이나 소워스(Ina Sawerth)', '', '아이나 소워스|이나 소워스',
    'base:1244|default:12370|default:45368|default:63873',
    'English identifies the Alfar soldier and ward named Ina Sawerth in the death notices and letter. Japanese イナ・サワース and Chinese 因纳·萨沃斯/艾纳·萨维尔斯 corroborate the identity; follow the established Korean base label 이나 소워스. Retain Alfar Army, document, and addressee wording as separate context.'
  ],
  [
    'person:erlen-vanik', 'Erlen Vanik', 'person',
    '에를렌 바닉(Erlen Vanik)', '', '얼렌 바닉|엘렌 바닉',
    'default:22863|default:38668|default:42454|default:49020|default:63760|default:64663',
    'English identifies the same Varani advisor in the Scuttle Beach quest and advisor references. Japanese エルレン・ヴァニック and Chinese 厄尔林·瓦尼克 corroborate. Reuse the already-complete base occurrence spelling 에를렌 바닉 and normalize the related dialogue/objective labels.'
  ],
  [
    'person:erran-gastyr', 'Erran Gastyr', 'person',
    '에란 가스티르(Erran Gastyr)', '', '에런 개스티어|에런 가스티르|에란 가스티르',
    'base:2520|default:4564|default:10701|default:17718|default:34732|default:45991|default:53161',
    'English identifies the named Gastyr lord and the first/last bearers of the repeated personal name. Japanese エラン・ガスティア and Chinese 厄兰·加斯提尔 corroborate. Treat Erran Gastyr as a source name shared by distinct historical bearers; do not merge those bearers into one biography or conflate this person-name with House Gastyr or Castle Gastyr. Preserve Lord as a separate title and pair its complete source label where applicable.'
  ],
  [
    'person:froma-tonwald', 'Froma Tonwald', 'person',
    '프로마 톤월드(Froma Tonwald)', '', '프로나 톤월드',
    'default:1338|default:9741|default:12289',
    'The three English standalone labels identify the same person. Japanese フロマ・タンウェルド and Chinese 弗洛玛·汤瓦尔德 corroborate. Normalize the inconsistent Korean first-name rendering to 프로마 and retain the established full bilingual labels.'
  ],
  [
    'person:adin-clunwawl', 'Adin Clunwawl', 'person',
    '아딘 클런월(Adin Clunwawl)', '', '아딘 클룬월',
    'default:8194|default:38800',
    'Both English standalone labels identify the same person. Japanese アディン・クランワウル and Chinese 艾丁·克伦瓦尔 corroborate the established Korean form 클런월. Normalize the alternate vowel spelling and retain the full English label.'
  ],
  [
    'person:bastian-rapp', 'Bastian Rapp', 'person',
    '바스티안 랩(Bastian Rapp)', '', '바스티안 라프',
    'default:1531|default:55272',
    'English names Bastian Rapp in the corpse label and victim list; the aligned source contexts connect the corpse reference to the named victim. Japanese バスティアン・ラップ and Chinese 巴斯蒂安·拉普 corroborate. Standardize the final consonant rendering as 랩 and retain the distinct corpse/document contexts.'
  ]
]
definitions = definitions_data.map do |entity, english, category, korean, aliases, variants, ids, note|
  glossary.headers.zip([
    entity, english, category, korean, aliases, variants,
    "D-#{d}|#{ids}", 'confirmed',
    "#{note} English is the identity and meaning anchor; Japanese informs pronunciation and Chinese is supporting evidence. The official Korean manual does not list these NPCs, and its relevant setting/name coverage is non-exhaustive."
  ]).to_h
end
raise 'one or more entities already registered' unless
  (glossary.map { |row| row['entity_key'] } & definitions.map { |row| row['entity_key'] }).empty?

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = definitions.flat_map { |row| row.fetch('evidence_ids').split('|').drop(1) }.uniq
actual = generated.map { |row| "#{row['resource']}:#{row['ID_Linha']}" }.uniq
raise "source-key coverage mismatch: expected #{expected.length}, found #{actual.length}" unless
  expected.sort == actual.sort && actual.length <= 50

rewrites = {
  ['default', '19744', ''] => [['오르시니안 페이지', '오르시니언 페이지(Orsinian Paige)']],
  ['default', '19797', ''] => [['프레토리안 오르시니안 페이지', '근위대장 오르시니언 페이지(Praetorian Orsinian Paige)']],
  ['default', '29482', ''] => [['오르시니언 페이지를 만나기', '오르시니언 페이지(Orsinian Paige)를 만나기']],
  ['default', '38366', ''] => [['오르시니안 페이지(Orsinian Paige)', '오르시니언 페이지(Orsinian Paige)']],
  ['default', '56601', ''] => [['오르시니안 페이지에게 돌아가기', '오르시니언 페이지(Orsinian Paige)에게 돌아가기']],
  ['default', '503', ''] => [['아나 해드할로(Ana Hadhallow)', '애나 해드할로우(Ana Hadhallow)']],
  ['default', '51529', ''] => [['버트런 롯(Bertran Lot)', '버트런 로트(Bertran Lot)']],
  ['default', '12370', ''] => [['아이나 소워스(Ina Sawerth)', '이나 소워스(Ina Sawerth)']],
  ['default', '45368', ''] => [['사망 통지서: 이나 소워스', '사망 통지서: 이나 소워스(Ina Sawerth)']],
  ['default', '38668', ''] => [['얼렌 바닉(Erlen Vanik)', '에를렌 바닉(Erlen Vanik)']],
  ['default', '42454', ''] => [['엘렌 바닉에게 돌아가기', '에를렌 바닉(Erlen Vanik)에게 돌아가기']],
  ['default', '49020', ''] => [['엘렌 바닉에게 돌아가', '에를렌 바닉(Erlen Vanik)에게 돌아가']],
  ['default', '63760', ''] => [['얼렌 바닉(Erlen Vanik)', '에를렌 바닉(Erlen Vanik)']],
  ['default', '64663', ''] => [['얼렌 바닉', '에를렌 바닉(Erlen Vanik)']],
  ['base', '2520', '11'] => [['에런 가스티르 경(Lord Erran Gastyr)', '에란 가스티르 경(Lord Erran Gastyr)']],
  ['default', '10701', ''] => [['에란 가스티르 경', '에란 가스티르 경(Lord Erran Gastyr)']],
  ['default', '17718', ''] => [['에런 개스티어(Erran Gastyr) 경', '에란 가스티르 경(Lord Erran Gastyr)']],
  ['default', '34732', ''] => [['에란 가스티르', '에란 가스티르(Erran Gastyr)', 2]],
  ['default', '45991', ''] => [['에란 가스티르 경의 편지', '에란 가스티르 경(Lord Erran Gastyr)의 편지']],
  ['default', '1338', ''] => [['프로나 톤월드(Froma Tonwald)', '프로마 톤월드(Froma Tonwald)']],
  ['default', '8194', ''] => [['아딘 클룬월(Adin Clunwawl)', '아딘 클런월(Adin Clunwawl)']],
  ['default', '55272', ''] => [['바스티안 라프(Bastian Rapp)', '바스티안 랩(Bastian Rapp)']]
}

reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  (rewrites[key] || []).each do |from, to, expected_count|
    count = new_text.scan(Regexp.new(Regexp.escape(from))).length
    expected_count ||= 1
    raise "expected #{expected_count} rewrite span(s), found #{count}: #{key.inspect}: #{from}" unless
      count == expected_count
    new_text.gsub!(from, to)
  end
  entities = matches.map { |row| row.fetch('entity_key') }.uniq.sort
  status = old == new_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => definitions.select { |definition| entities.include?(definition['entity_key']) }
      .map { |definition| "#{definition['english_canonical']}: #{definition['notes']}" }.join(' '),
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'preparation output exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "#{reviews.length} distinct source keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
