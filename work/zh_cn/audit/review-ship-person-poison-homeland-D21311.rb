#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'Read-only English-led comparison across affix/base/default with aligned Japanese/Chinese. Official Korean manual PDF pp. 1-2 establishes Alfar homelands and peoples; pp. 6 and 9 distinguish inventory, effects and world context, without an exhaustive expansion roster. Register only source-supported identities; do not create an Oneth short-name alias or infer a subtype for Caolainn. Existing reviewed entities on overlapping rows remain unchanged.'
specs = [
  {key: 'lore term:the-calamity', english: 'The Calamity', aliases: 'Calamity',
   category: 'lore term', korean: '재앙호(The Calamity)', count: 18,
   variants: '칼래머티|칼래미티|칼라미티|칼러미티',
   notes: 'English explicitly names Brattigan’s ship in default:18763 and calls the Calamity a ship at 5307. Japanese カラミティー号 and Chinese 灾难号 corroborate. Reuse existing 재앙호 and consistently pair the complete ship label, using Calamity without The only at 5307. Exclude generic calamity descriptions at 9936, 14368, 17052, 23962, 44177 and 50466. At 14368 Japanese interprets a ship name but English/Chinese say a calamity; preserve the English-led general 재앙 rather than infer a ship reference.'},
  {key: 'person:kail-murdagh', english: 'Kail Murdagh', category: 'person',
   korean: '케일 무르다그(Kail Murdagh)', count: 4, variants: '케일 머다|케일 머다가|카일 무르다그',
   notes: 'English default:44588/60612 names the same Niskaru-hunting contact as the two name labels. Japanese ケイル・ムルダ and Chinese 凯尔·穆尔达夫/莫达格 corroborate. Reuse 케일 from three source-aligned forms and existing 무르다그 from the journals; do not claim an audio pronunciation. Remove the spurious subject-particle-like final 가 from default:41105, whose English is only the full personal name.'},
  {key: 'resource:roilwence', english: 'Roilwence', category: 'resource',
   korean: '로일웬스(Roilwence)', count: 4,
   notes: 'English default:19360 calls Roilwence the poison used on Mallion Anwon; default:46429 calls it a rare compound. Japanese ロイルウェンス supports the established Korean spelling; Chinese 湍流之壁 is a semantic rendering and 罗尔文斯 appears in a name label. Retain the existing Korean and add missing English annotations without changing the poisoning story or compound meaning.'},
  {key: 'place:fieriol', english: 'Fieriol', category: 'place',
   korean: '피에리올(Fieriol)', count: 7,
   notes: 'English default:7031 explicitly identifies Fieriol as the speaker’s homeland, and the war/migration texts refer to travel from it. Japanese フィエリオル and Chinese 菲里尔 corroborate. Preserve the existing Korean and poem/document line breaks; default:63206 has English fallback in JA/ZH and gains no independent corroboration from those fallbacks. Do not change unrelated trade quantities or other proper names in these documents.'},
  {key: 'title:caolainn-label', english: 'Caolainn', category: 'title',
   korean: '카올레인(Caolainn)', count: 1,
   notes: 'default:63168 is the only exact source label Caolainn, Japanese カオライン and Chinese 卡奥莱因. Preserve 카올레인 and add English; title here records only the named label, not an identified person, place or entity subtype. No aliases or identity link are inferred.'},
  {key: 'person:oneth-tansand', english: 'Oneth Tansand', category: 'person',
   korean: '오네스 탄샌드(Oneth Tansand)', count: 1, variants: '오넷 탄샌드',
   notes: 'default:63311 gives the complete name, Japanese オネス・タンザンド and Chinese 奥尼斯·坦桑德. Use 오네스, matching the already-present short-name Korean form, and preserve 탄샌드. No global Oneth alias or asserted identity link to default:30213/36701 is introduced; only the full-name label is reviewed here.'}
]
generic_calamity = %w[9936 14368 17052 23962 44177 50466].freeze
ReviewedDiscoverySpecs.run(21311, 'Ship, Contact, Poison and Homeland', specs, context,
                           '## D-21310:') do |spec, key, text, _source|
  case spec[:key]
  when 'lore term:the-calamity'
    next [text, true] if generic_calamity.include?(key[1])
    pattern = /(?:칼래머티|칼래미티|칼라미티|칼러미티)(?:\((?:The )?Calamity\))?호|재앙호(?:\(The Calamity\))?/
    raise "missing ship span #{key.inspect}" unless text.match?(pattern)
    replacement = key[1] == '5307' ? '재앙호(Calamity)' : spec[:korean]
    [text.sub(pattern, replacement), false]
  when 'person:kail-murdagh'
    if %w[33703 41105].include?(key[1])
      raise 'unexpected personal label' unless ['케일 머다', '케일 머다가'].include?(text)
      [spec[:korean], false]
    else
      pattern = /(?:케일|카일) 무르다그(?:\(Kail Murdagh\))?/
      raise "missing person span #{key.inspect}" unless text.match?(pattern)
      [text.sub(pattern, spec[:korean]), false]
    end
  when 'resource:roilwence', 'place:fieriol'
    stem = spec[:korean].split('(').first
    pattern = /#{Regexp.escape(stem)}(?:\(#{Regexp.escape(spec[:english])}\))?/
    raise "missing exact Korean #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  when 'title:caolainn-label'
    raise 'unexpected Caolainn label' unless text == '카올레인'
    [spec[:korean], false]
  else
    raise 'unexpected full personal name' unless text == '오넷 탄샌드'
    [spec[:korean], false]
  end
end
