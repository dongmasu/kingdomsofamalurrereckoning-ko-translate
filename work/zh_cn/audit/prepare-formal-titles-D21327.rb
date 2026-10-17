#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
audit = File.dirname(__FILE__)
context = 'English determines the meaning of formal titles, not an inferred faction taxonomy. Default:43058/51107 explicitly define Truesworn as an honored rank; retain the repeated transliteration 트루스원, not several incompatible truth/oath renderings or a newly expanded faction name. Delver/Delvers denotes the House role that bears another Fae’s sorrows (1300,19435,22322,24493,42553), contrasted with Tender. Japanese 担い手/デルバー and Chinese 钻研者/研究者 corroborate this spiritual role, not literal excavation; normalize 탐굴자/탐사자/탐사가/델버/딜버 to the established 탐구자. Preserve explicit Korean plural suffixes and the English row-local singular/plural forms. Official Korean manual PDF pp. 1,2,7 supplies Fate, Fae and faction context but does not name these ranks. Basilei/Primoida are source-local label spellings only; their identities/subtypes are not inferred. Existing records for other entities in the same CSV rows are preserved, not a reason to drop these newly scoped title matches.'
specs = [
  ['title:truesworn', 'Truesworn', '트루스원(Truesworn)', '', '진실맹세자|진실에 맹세한 자|진실의 맹세자|진실한 맹세자|진실서약자|트루스워른|진정한 워스원', 19,
   'English default:4518/43058 says only two living people hold this rank. Japanese トゥルースウォーン and Chinese 誓真者 corroborate. Preserve rank wording and adjust only directly attached vocative/quotative particles when changing a vowel-final synonym to consonant-final 트루스원.'],
  ['title:forsworn', 'Forsworn', '맹세를 저버린 자(Forsworn)', '', '포스원', 4,
   'Default:33738 calls the addressee Forsworn and a prince of chaos, with Japanese フォースウォーン and Chinese 背誓. Reuse the already paired semantic title 맹세를 저버린 자; do not assert a new faction or person.'],
  ['title:basilei', 'Basilei', '바실레이(Basilei)', '', 'Basilei', 2,
   'Exact standalone labels default:5150/38062, Japanese バシレイ and Chinese 巴斯雷. Reuse 바실레이, pair both labels, and do not infer rank/group/person identity.'],
  ['title:primoida', 'Primoida', '프리모이다(Primoida)', '', '', 1,
   'Exact standalone default:8772, Japanese プリモイダ and Chinese 普瑞莫达. Pair the existing Korean source-local label without guessing its subtype or identity.'],
  ['title:delver', 'Delver', '탐구자(Delver)', 'Delvers', '탐굴자|탐사자|탐사가|델버|딜버', 43,
   'English singular/plural explicitly denotes the same formal House role and contrasts it with Tender. Default:13340 contains plural then singular references; keep both source forms. Default:22322 and 52346 repeat the title, so pair every explicit Korean mention. Exclude the complete Sorrows Delver role label from the bare-title scope. Do not alter neighboring Sorrows/House/Tender wording or reopen their earlier decisions.'],
  ['title:sorrows-delver', 'Sorrows Delver', '비탄의 집 탐구자(Sorrows Delver)', '', '비탄의 집 탐굴자', 1,
   'Default:1733 is the complete Sorrows Delver label; Japanese ハウス・オブ・ソローの担い手 (quoted role) explicitly supports the existing House association, Chinese 悲灵钻研者 supports the role. Keep the Korean House wording and annotate the full source role, not nested English labels. No person identity is inferred.']
]
headers = m.table(File.join(audit, 'proper-name-glossary.tsv')).headers
definitions = specs.map do |key, english, korean, aliases, variants, _count, note|
  headers.zip([key, english, 'title', korean, aliases, variants, 'D-21327-D-21328',
               'confirmed', "#{context} #{note}"]).to_h
end
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map { |row| OCCURRENCE_HEADERS.zip(row).to_h }
raise 'formal title source coverage changed' unless generated.group_by { |row| row['entity_key'] }.transform_values(&:length) ==
  specs.to_h { |key, _english, _korean, _aliases, _variants, count, _note| [key, count] }
grouped = generated.group_by { |row| m.key(row) }
raise 'expected 69 distinct title keys' unless grouped.length == 69
reviews = grouped.keys.sort_by { |key| [m::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |key|
  source = inventory.fetch(key)
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  old = source.fetch('work_text')
  proposed = old.dup
  dispositions = {}
  grouped.fetch(key).each do |occurrence|
    entity = definitions.find { |definition| definition['entity_key'] == occurrence['entity_key'] }
    if entity['entity_key'] == 'title:delver' && english == 'Sorrows Delver'
      dispositions[entity['entity_key']] = 'excluded'
      next
    end
    proposed = case entity['entity_key']
               when 'title:truesworn'
                 pattern = /(?:진실에 맹세한 자|진실한 맹세자|진실의 맹세자|진실맹세자|진실서약자|진정한 워스원|트루스워른|트루스원)(?: ?\(Truesworn\))?/
                 raise 'missing explicit rank' unless proposed.match?(pattern)
                 text = proposed.gsub(pattern, entity['korean_canonical'])
                 particle = { '487' => ['라고', '이라고'], '43058' => ['라는', '이라는'],
                              '48766' => ['여', '이여'], '57798' => ['라', '이라'] }[key[1]]
                 if particle
                   from, to = particle
                   raise 'quotative/vocative context changed' unless text.include?("#{entity['korean_canonical']}#{from}")
                   text = text.sub("#{entity['korean_canonical']}#{from}", "#{entity['korean_canonical']}#{to}")
                 end
                 text
               when 'title:forsworn'
                 pattern = /(?:맹세를 저버린 자|포스원)(?: ?\(Forsworn\))?/
                 raise 'missing explicit Forsworn title' unless proposed.match?(pattern)
                 proposed.gsub(pattern, entity['korean_canonical'])
               when 'title:basilei'
                 raise 'Basilei standalone label changed' unless %w[Basilei 바실레이].include?(proposed)
                 entity['korean_canonical']
               when 'title:primoida'
                 raise 'Primoida standalone label changed' unless proposed == '프리모이다'
                 entity['korean_canonical']
               when 'title:sorrows-delver'
                 raise 'full House role label changed' unless proposed == '비탄의 집(House of Sorrows) 탐굴자'
                 entity['korean_canonical']
               else
                 pattern = /(?:탐굴자|탐구자|탐사자|탐사가|딜버|델버)(들)?(?: ?\((Delvers?)\))?(들)?/
                 raise 'missing explicit spiritual role' unless proposed.match?(pattern)
                 ordinal = 0
                 singular = english.match?(/\bDelver\b/) && !english.match?(/\bDelvers\b/)
                 mixed = english.match?(/\bDelver\b/) && english.match?(/\bDelvers\b/)
                 raise 'unreviewed mixed number row' if mixed && key[1] != '13340'
                 proposed.gsub(pattern) do
                   match = Regexp.last_match
                   label = mixed ? (ordinal.zero? ? 'Delvers' : 'Delver') : (singular ? 'Delver' : 'Delvers')
                   ordinal += 1
                   "탐구자#{match[1] || match[3] ? '들' : ''}(#{label})"
                 end
               end
    dispositions[entity['entity_key']] = nil
  end
  status = old == proposed ? 'not-an-issue' : 'accepted'
  dispositions.transform_values! { |value| value || status }
  { 'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
    'old' => old, 'new' => proposed,
    'evidence' => grouped.fetch(key).map { |row| definitions.find { |d| d['entity_key'] == row['entity_key'] }['notes'] }.uniq.join(' '),
    'english' => english,
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text'], 'entity_dispositions_json' => JSON.generate(dispositions) }
end
definition_path = File.join(audit, 'proper-name-discovery-definitions-D21327.tsv')
review_path = File.join(audit, 'proper-name-discovery-D21327.tsv')
raise 'prepared artifacts already exist' if [definition_path, review_path].any? { |path| File.exist?(path) }
ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
  m.table(File.join(audit, 'proper-name-glossary.tsv')).map(&:to_h), m.table(m::INDEX).map(&:to_h))
ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
m.write_table(definition_path, headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} keys / #{generated.length} matches in 50+19 slices; #{reviews.count { |row| row['status'] == 'accepted' }} edits."
