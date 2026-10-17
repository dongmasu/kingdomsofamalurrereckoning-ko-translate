#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English is primary; compare all affix/base/default matches with Japanese and Chinese. Preserve complete source-local compound titles without inventing equipment subtypes or identities. English default:4225 explicitly names Stormcaller and its creator Gwin Olwy, supporting alignment of its two spellings. The English Niskaru Bloodhunter subtype is separate from the unqualified Bloodhunter label: preserve the prior Niskaru species disposition and pair the complete subtype atomically. Official manual PDF pp. 6-8 supplies inventory/equipment/crafting context, not these individual names. Chinese 可燃 for Flameblade is a modifier mismatch; English Flameblade and Japanese フレイムブレード support retaining 화염검 without importing the Chinese meaning.'
labels = [
  ['841', 'Flameblade', '화염검', 'フレイムブレード', '可燃'],
  ['1084', 'Frostblade', '서리 칼날', 'フロストブレード', '冰霜之刃'],
  ['2276', 'Bloodthirsters', '피를 갈망하는 자들', 'ブラッドサースターズ', '嗜血者'],
  ['2475', 'Stormcaller', '폭풍 소환자', 'ストームコーラー', '风暴召唤者'],
  ['3660', 'Bloodhunter', '피 사냥꾼', 'ブラッドハンター', '血猎人'],
  ['3934', 'Windcarver', '바람 조각자', 'ウィンドカーバー', '雕风者'],
  ['3966', 'Stormscythe', '폭풍낫', 'ストームサイズ', '风暴之镰'],
  ['4359', 'Flametongue', '화염의 혀', 'フレイムタン', '火舌'],
  ['4652', 'Frostwatcher', '서리 감시자', 'フロストウォッチャー', '冰霜守望者'],
  ['4804', 'Stormspirit', '폭풍 정령', 'ストームスピリット', '风暴精魂'],
  ['4841', 'Frostrobes', '서리 로브', 'フロストローブ', '冰霜长袍']
].freeze
specs = labels.map do |id, english, korean, japanese, chinese|
  {key: "title:#{english.downcase}", english: english, category: 'title',
   korean: "#{korean}(#{english})",
   count: %w[Stormcaller Bloodhunter].include?(english) ? 2 : 1,
   notes: "Standalone base:#{id}:11 #{english}, Japanese #{japanese}, Chinese #{chinese}. Pair the existing Korean #{korean}; no item subtype or link to other identities is inferred. #{english == 'Stormcaller' ? 'The created object named Stormcaller at default:4225 is normalized from 스톰콜러 to the existing base title 폭풍 소환자.' : ''} #{english == 'Bloodhunter' ? 'Exclude the longer Niskaru Bloodhunter compound from the bare-title identity, without equating it with the standalone label.' : ''}"}
end
specs << {
  key: 'monster:niskaru-bloodhunter', english: 'Niskaru Bloodhunter', category: 'monster',
  korean: '니스카루 피 사냥꾼(Niskaru Bloodhunter)', count: 1,
  notes: 'English default:35626 explicitly names the Niskaru Bloodhunter subtype, with Japanese ニスカル・ブラッドハンター and Chinese 尼斯卡鲁猎血者. Keep the established 니스카루 and 피 사냥꾼 stems; replace the embedded species annotation with the complete subtype annotation. Do not merge with the bare Bloodhunter label or alter the earlier Niskaru species disposition/evidence.'
}
ReviewedDiscoverySpecs.run(21322, 'Compound Names And Complete Bloodhunter Subtype',
                           specs, context, '## D-21321:') do |spec, key, text, source|
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  if spec[:english] == 'Bloodhunter' && english == 'Niskaru Bloodhunter'
    [text, true]
  elsif spec[:english] == 'Niskaru Bloodhunter'
    raise 'unexpected subtype cell' unless key == ['default', '35626', ''] &&
      text == '니스카루(Niskaru) 피 사냥꾼'
    [spec[:korean], false]
  elsif key == ['default', '4225', '']
    raise 'unexpected Stormcaller spelling' unless spec[:english] == 'Stormcaller' &&
      text.include?('스톰콜러(Stormcaller)')
    [text.sub('스톰콜러(Stormcaller)', spec[:korean]), false]
  else
    label = labels.find { |row| row[1] == spec[:english] }
    raise 'unexpected standalone title/source' unless key == ['base', label[0], '11'] &&
      text == label[2] && english == label[1] &&
      JSON.parse(source['ja_texts_json']).compact == [label[3]] && source['zh_text'] == label[4]
    [spec[:korean], false]
  end
end
