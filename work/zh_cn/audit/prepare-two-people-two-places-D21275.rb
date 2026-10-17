#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'person:zanvil-whit', english: 'Zanvil Whit', category: 'person',
    korean: '잔빌 윗(Zanvil Whit)', aliases: 'Zanvil',
    variants: '잔빌 윗|잰빌 휘트|잔빌 위트|잔빌', count: 8,
    notes: 'English default:58177 identifies the Alfar captain receiving Venris reconnaissance; default:439/7417/34594 confirms the same recipient. Japanese ザンヴィル・ウィット and Chinese 赞维尔·惠特 corroborate. Reuse existing paired 잔빌 윗(Zanvil Whit), correcting 잰빌 휘트 and 잔빌 위트. The sole short Zanvil at default:56345 is the return objective in the same quest chain; retain source-short 잔빌(Zanvil) rather than expand it. Change only the subject particle 가 to 이 at default:40310 because the normalized surname 윗 has a final consonant. Preserve the unresolved wolf-ownership prose in default:58177.'
  },
  {
    key: 'person:frama-aedic', english: 'Frama Aedic', category: 'person',
    korean: '프라마 에이딕(Frama Aedic)',
    variants: '프라마 에이딕|프라마 에딕', count: 5,
    notes: 'English default:8734/11234/25574 names Frama Aedic, and default:17529/58721 identifies the quest/rite report recipient. Japanese フラマ・エイディック and Chinese 法拉玛·埃迪克 corroborate. Reuse existing paired 프라마 에이딕 and correct the isolated 에딕 variant. Frama Foswig at default:39968 is a distinct source full name; bare Frama in Frama’s Husband at default:48893 cannot be linked by first name alone. Register no global Frama alias.'
  },
  {
    key: 'place:barren-cove', english: 'Barren Cove', category: 'place',
    korean: '불모의 만(Barren Cove)', variants: '불모의 만', count: 1,
    notes: 'English base:149 is the complete location label Barren Cove. Japanese バレン洞穴 and Chinese 巴伦湾 corroborate the name but differ in feature wording. English is the semantic anchor: retain the existing defensible descriptive translation 불모의 만 and add the full English label. Transliteration 배런 is not required merely because Japanese transliterates Barren. Do not infer a cave from Japanese against English Cove.'
  },
  {
    key: 'place:castle-grey', english: 'Castle Grey', category: 'place',
    korean: '그레이 성(Castle Grey)', variants: '그레이 성', count: 1,
    notes: 'English base:1705 names Castle Grey; Japanese グレイ城 and Chinese 灰堡 corroborate the named castle. Keep the existing Korean 그레이 성 and pair the complete English place label. Do not treat this location as a person named Grey.'
  }
]
context = 'English-indexed discovery verified across affix/base/default. Exact source keys and prior named-entity history were checked by a separate read-only scout and re-read in the editor pass. Official Korean manual PDF pp. 1-3 provides Alfar/people context and PDF p. 7 distinguishes faction and quest context; it has no direct entries for these two people or two places. Source-specific names supply the identity evidence. No earlier entity disposition, historical sequential outcome, or global tally is reopened; only the new proper-name scope is counted.'

ReviewedDiscoverySpecs.run(
  21_275, 'Zanvil Whit, Frama Aedic and Two Places', specs, context,
  '## D-21214: Alfar Army Organization, Part 1'
) do |spec, key, text, _source|
  case spec[:key]
  when 'person:zanvil-whit'
    if key == ['default', '56345', '']
      raise 'unexpected short Zanvil cell' unless text == '잔빌에게 돌아가기'
      text = '잔빌(Zanvil)에게 돌아가기'
    else
      pattern = /(?:잔빌 윗|잰빌 휘트|잔빌 위트)(?:[ \t]*\(Zanvil Whit\))?/
      raise "missing Zanvil span #{key}" unless text.match?(pattern)
      text.gsub!(pattern, spec.fetch(:korean))
      if key == ['default', '40310', '']
        raise 'Zanvil subject particle differs' unless
          text.sub!('잔빌 윗(Zanvil Whit)가', '잔빌 윗(Zanvil Whit)이')
      end
    end
  when 'person:frama-aedic'
    pattern = /프라마 에(?:이)?딕(?:[ \t]*\(Frama Aedic\))?/
    raise "missing Frama Aedic span #{key}" unless text.match?(pattern)
    text.gsub!(pattern, spec.fetch(:korean))
  when 'place:barren-cove'
    raise 'unexpected Barren Cove label' unless text == '불모의 만'
    text = spec.fetch(:korean)
  when 'place:castle-grey'
    raise 'unexpected Castle Grey label' unless text == '그레이 성'
    text = spec.fetch(:korean)
  end
  [text, false]
end
