#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English default:31370 explicitly names the Fae ballad Cureseeker, default:20992/55060 uses it as Oleyn’s epithet, and default:57550 names the song Oleyn, Cureseeker. Japanese 癒しを求めし者 and Chinese 治愈追寻者/求医者 corroborate the title. Normalize 찾는 자/구하는 자/구도자 to the repeated 치유를 구하는 자, without merging a role, person or physical work identity. Pair the complete Oleyn, Cureseeker phrase separately where English gives it. The ten additional closed standalone base labels are lexical title annotations only; infer no equipment class or rarity. Official Korean manual PDF pp. 6-8 supplies inventory/faction/crafting context, not these individual names. Preserve existing Oleyn and Telling decisions, prose, line breaks and tokens.'
labels = [
  ['2225', 'Dragonfang', '용의 송곳니', '竜の牙', '龙之牙'],
  ['2424', 'Heartstring', '심금', 'ハートストリング', '心弦'],
  ['2508', 'Hopestone', '희망의 돌', '希望の石', '希望之石'],
  ['2815', 'Omniblades', '옴니블레이드', 'オムニブレード', '全知之刃'],
  ['3794', 'Unmuffin', '반머핀', 'アンマフィン', '反松饼'],
  ['3857', 'Heartpins', '하트 핀', 'ハートピン', '心针'],
  ['3861', 'Lifedrinker', '생명 흡수자', 'ライフドリンカー', '生命摄取者'],
  ['4127', 'Earthcrushers', '대지 파괴자', '地砕き', '裂地者'],
  ['4595', 'Earthgavel', '대지 강타', '大地砕き', '大地之槌'],
  ['4831', 'Mindshield', '정신 방패', 'マインドシールド', '神智护盾']
].freeze
specs = labels.map do |id, english, korean, japanese, chinese|
  {key: "title:#{english.downcase}", english: english, category: 'title',
   korean: "#{korean}(#{english})", count: 1,
   notes: "Exact standalone base:#{id}:11 #{english}, Japanese #{japanese}, Chinese #{chinese}. Retain #{korean} and add only the complete English annotation. This source-local title record does not establish a unique-item subtype or other identity."}
end
specs += [
  {key: 'title:cureseeker', english: 'Cureseeker', category: 'title',
   korean: '치유를 구하는 자(Cureseeker)', variants: '치유를 찾는 자|치유의 구도자',
   count: 13,
   notes: 'English explicitly uses Cureseeker as both ballad name and epithet. This is a consistent lexical title form, not a merger of named people or of the narrative with a physical object. Normalize all exact short labels and explicit title/epithet spans; exclude the complete Oleyn, Cureseeker phrase from the short-title scope.'},
  {key: 'title:oleyn-cureseeker', english: 'Oleyn, Cureseeker', category: 'title',
   korean: '치유를 구하는 올레인(Oleyn, Cureseeker)', variants: '치유를 찾는 자 올레인',
   count: 2,
   notes: 'Default:57550 explicitly names the song Oleyn, Cureseeker; default:4476 begins with the same exact English phrase before a synopsis. Pair the complete phrase in each context and retain the source-local Oleyn form, not a new global personal alias or an unproved same-work identity.'}
]
ReviewedDiscoverySpecs.run(21330, 'Cureseeker Titles And Standalone Compound Labels',
                           specs, context, '## D-21329:') do |spec, key, text, source|
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  case spec[:key]
  when 'title:cureseeker'
    if english.include?('Oleyn, Cureseeker')
      [text, true]
    else
      pattern = /(?:치유를 구하는 자|치유를 찾는 자|치유의 구도자)(?: ?\(Cureseeker\))?/
      raise 'missing explicit short title' unless text.match?(pattern)
      [text.gsub(pattern, spec[:korean]), false]
    end
  when 'title:oleyn-cureseeker'
    old = {
      '4476' => '치유를 찾는 자 올레인(Oleyn)',
      '57550' => '치유를 구하는 올레인(Oleyn)'
    }.fetch(key[1])
    raise 'complete Oleyn title changed' unless text.include?(old)
    [text.sub(old, spec[:korean]), false]
  else
    label = labels.find { |row| row[1] == spec[:english] }
    raise 'standalone compound/source changed' unless key == ['base', label[0], '11'] &&
      text == label[2] && english == label[1] &&
      JSON.parse(source['ja_texts_json']).compact == [label[3]] && source['zh_text'] == label[4]
    [spec[:korean], false]
  end
end
