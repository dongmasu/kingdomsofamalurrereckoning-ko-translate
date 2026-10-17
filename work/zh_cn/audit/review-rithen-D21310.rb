#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English default:864 explicitly calls Rithen a labyrinth, default:34706 lists it among Alfar strongholds, and the quest journals locate its tower on the Tywili Coast. Japanese リゼン and Chinese 瑞森 corroborate. Reuse existing 리센(Rithen); do not treat the site as a person. Official manual PDF pp. 1, 6 and 9 provide Alfar/world and inventory context, not a spelling for Rithen. Exact place, amulet and key scopes are separate; overlapping matches count once per CSV row.'
specs = [
  {key: 'place:rithen', english: 'Rithen', category: 'place',
   korean: '리센(Rithen)', count: 38, variants: '리덴|리슨|리선|리든|리텐',
   notes: 'Normalize direct Rithen references to the established bilingual 리센. At default:42521 English steal from Rithen concerns a place, so correct 리든에게서 to 리센(Rithen)에서. Compound amulet and key rows are excluded from this parent-place disposition and handled as complete named items; no item alias is added to the place.'},
  {key: 'unique item:amulet-of-rithen', english: 'Amulet of Rithen',
   aliases: 'Rithen Amulet', category: 'unique item',
   korean: '리센의 부적(Amulet of Rithen)', count: 11,
   notes: 'English Amulet of Rithen and Rithen Amulet describe the same cursed amulet used on Phasmer/the Guardian. Japanese リゼンのアミュレット and Chinese 瑞森的护符 corroborate. Normalize the Korean to 리센의 부적 and retain each source-local English form as one complete annotation, without nested place parentheses. Do not alter the independent Tear of Mitharu or Glass of Ambient wording.'},
  {key: 'unique item:key-to-rithen', english: 'Key to Rithen', category: 'unique item',
   korean: '리센의 열쇠(Key to Rithen)', count: 1,
   notes: 'base:2831 is the complete key item. English Key to Rithen and Chinese 瑞森钥匙 support its place relation; Japanese リゼンの家への鍵 supplies the same stem. Pair the full item name rather than only its Rithen component.'}
]
ReviewedDiscoverySpecs.run(21310, 'Rithen and Its Named Items', specs, context,
                           '## D-21309:') do |spec, key, text, source|
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  item = english.match?(/Amulet of Rithen|Rithen Amulet|Key to Rithen/i)
  if spec[:key] == 'place:rithen'
    next [text, true] if item
    if key == ['default', '42521', '']
      raise 'unexpected place/person confusion' unless text.include?('리든에게서')
      new_text = text.sub('리든에게서', '리센(Rithen)에서')
    else
      raise "missing Rithen span #{key.inspect}" unless text.match?(/(?:리센|리덴|리슨|리선|리든|리텐)(?:\(Rithen\))?/)
      new_text = text.gsub(/(?:리센|리덴|리슨|리선|리든|리텐)(?:\(Rithen\))?/, spec[:korean])
    end
  elsif spec[:key] == 'unique item:amulet-of-rithen'
    form = english.include?('Rithen Amulet') ? 'Rithen Amulet' : 'Amulet of Rithen'
    pattern = /(?:리센|리덴|리슨|리선|리든|리텐)(?:\(Rithen\))?(?:의)? 부적(?:\((?:Rithen Amulet|Amulet of Rithen)\))?/
    raise "missing amulet span #{key.inspect}" unless text.match?(pattern)
    new_text = text.sub(pattern, "리센의 부적(#{form})")
  else
    raise 'unexpected complete key item' unless key == ['base', '2831', '11'] && text == '리텐(Rithen)의 열쇠'
    new_text = spec[:korean]
  end
  [new_text, false]
end
