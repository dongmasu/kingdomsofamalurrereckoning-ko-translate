#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'place:proving-halls', english: 'Proving Halls', category: 'place',
    korean: '시련의 전당(Proving Halls)', aliases: 'The Proving Halls',
    variants: '시련의 전당|증명 전당', count: 18,
    notes: 'English base:477/2578/3693 and the Bisarane trial journals consistently identify Proving Halls. Japanese 試練の祠 and Chinese 证明大厅 corroborate. Reuse 시련의 전당 and correct the three 증명 전당 variants. Preserve base:3693’s already-complete local The Proving Halls annotation; do not add nested labels. Preserve every trial action and other name.'
  },
  {
    key: 'place:delving-hall', english: 'Delving Hall', category: 'place',
    korean: '델빙 홀(Delving Hall)',
    variants: '델빙 홀|탐사 전당|탐사 회관|탐구의 전당', count: 5,
    notes: 'English default:7760 explicitly identifies Delving Hall as the magical ruin run by the Scholia Arcana Ysa Chapter; default:17810/42266 gives teaching/trial context. Japanese 探究の間 and Chinese 探索大厅/深入大厅 corroborate. Reuse the two existing complete paired 델빙 홀 forms and normalize the unpaired literal variants. No faction, teacher, title or trial wording changes.'
  },
  {
    key: 'place:convicts-cavern', english: "Convict's Cavern", category: 'place',
    korean: "죄수의 동굴(Convict's Cavern)", variants: '죄수의 동굴', count: 7,
    notes: 'English base:373 and the Maun Cointaker quest identify Convict’s Cavern; Chinese 罪犯洞穴 corroborates. Japanese varies between 囚人洞窟 and ホワイトストーン監獄, including the latter at default:2775/41918/49962/51686. Record that locale naming conflict and follow unambiguous English with Chinese support; do not register Whitestone Prison as an alias from Japanese alone. Preserve the current Korean 죄수의 동굴 and add the covering English place name.'
  },
  {
    key: 'place:lawbreakers-grotto', english: "Lawbreaker's Grotto", category: 'place',
    korean: "법을 어긴 자의 동굴(Lawbreaker's Grotto)",
    variants: '법을 어긴 자의 동굴|무법자의 동굴', count: 3,
    notes: 'English base:2252/default:25293 gives Lawbreaker’s Grotto and default:59992 names its door key; Chinese 违法者洞穴 corroborates. Japanese default:25293 instead says ゴーハート監獄, while the other two records use the English fallback. Follow the explicit English location name, retaining the two Korean base/label forms 법을 어긴 자의 동굴, and normalize the isolated 무법자의 동굴 description. Do not merge the place with Gorhart Prison.'
  },
  {
    key: 'person:ulla-eklund', english: 'Ulla Eklund', category: 'person',
    korean: '울라 에클룬드(Ulla Eklund)', variants: '울라 에클룬드|율라 에클룬드',
    count: 3,
    notes: 'English default:41998 explicitly identifies Ulla Eklund as the talisman-payment recipient; default:4615/34674 repeats her full personal-name label. Japanese ウッラ・エクルンド and Chinese 乌拉·埃克伦 corroborate. Reuse the existing paired 울라 에클룬드, correct 율라, and preserve the existing 는 particle and all Preordained/reward prose. No short alias.'
  },
  {
    key: 'person:ursa-erickson', english: 'Ursa Erickson', category: 'person',
    korean: '우르사 에릭슨(Ursa Erickson)', variants: '우르사 에릭슨', count: 2,
    notes: 'Aligned full-name labels default:30736/50594 give English Ursa Erickson, Japanese アーサ・エリクソン and Chinese 乌尔萨·埃里克森. Reuse the existing paired 우르사 에릭슨. The already-paired bare Ursa greeting at default:61346 is outside this full-name scope and remains unchanged; do not infer a global short-name identity link.'
  },
  {
    key: 'person:alexa-brunhilde', english: 'Alexa Brunhilde', category: 'person',
    korean: '알렉사 브룬힐데(Alexa Brunhilde)', variants: '알렉사 브룬힐데', count: 1,
    notes: 'English default:31376 is the complete personal-name label, corroborated by Japanese アレクサ・ブリュンヒルデ and Chinese 亚莉克莎·布伦希尔徳. Keep the existing Korean and add the full English pair. Alexa’s Crudok at default:18213 identifies only a short owner name and does not independently establish the full-name identity; leave that separately discovered short-form question unmodified rather than register a global Alexa alias.'
  },
  {
    key: 'person:allain-avitus', english: 'Allain Avitus', category: 'person',
    korean: '알랭 아비투스(Allain Avitus)', variants: '알랭 아비투스', count: 1,
    notes: 'English default:40604 is the complete personal-name label, corroborated by Japanese アライン・アヴィタス and Chinese 阿兰因·阿维图斯. Retain the established Korean 알랭 아비투스 and pair the full English source. No first-name or surname alias is inferred.'
  }
]
context = 'English-first discovery across affix/base/default, independently scouted and then re-read against aligned English/Japanese/Chinese. Official Korean manual PDF pp. 1-3 gives people/setting context and PDF p. 7 distinguishes faction and quest context; none of these eight names has a direct manual entry. Follow English for the documented Japanese prison-label conflicts without inventing cross-locale aliases. Change only mapped name spans, preserving particles, quest actions, lore claims, other names, tokens and line breaks. Do not reopen older sequential dispositions or global totals.'
patterns = {
  'place:proving-halls' => /(?:시련의 전당|증명 전당)(?:[ \t]*\((?:The )?Proving Halls\))?/,
  'place:delving-hall' => /(?:델빙 홀|탐사 전당|탐사 회관|탐구의 전당)(?:[ \t]*\(Delving Hall\))?/,
  'place:convicts-cavern' => /죄수의 동굴(?:[ \t]*\(Convict's Cavern\))?/,
  'place:lawbreakers-grotto' => /(?:법을 어긴 자의 동굴|무법자의 동굴)(?:[ \t]*\(Lawbreaker's Grotto\))?/,
  'person:ulla-eklund' => /[울율]라 에클룬드(?:[ \t]*\(Ulla Eklund\))?/,
  'person:ursa-erickson' => /우르사 에릭슨(?:[ \t]*\(Ursa Erickson\))?/,
  'person:alexa-brunhilde' => /알렉사 브룬힐데(?:[ \t]*\(Alexa Brunhilde\))?/,
  'person:allain-avitus' => /알랭 아비투스(?:[ \t]*\(Allain Avitus\))?/
}

ReviewedDiscoverySpecs.run(
  21_282, 'Four People and Four Named Places', specs, context,
  '## D-21214: Alfar Army Organization, Part 1'
) do |spec, key, text, _source|
  if spec[:key] == 'place:proving-halls' && key == ['base', '3693', '11']
    raise 'covering The Proving Halls label differs' unless text == '시련의 전당 (The Proving Halls)'
  else
    pattern = patterns.fetch(spec[:key])
    raise "missing name span #{spec[:key]} #{key}" unless text.match?(pattern)
    text.gsub!(pattern, spec.fetch(:korean))
  end
  [text, false]
end
