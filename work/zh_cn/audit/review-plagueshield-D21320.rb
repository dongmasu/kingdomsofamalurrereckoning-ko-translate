#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'Review every English Plagueshield match across affix/base/default. English default:4574 calls it medicine, 3761 and 12465 say it treats the village, and 41687 explicitly says Plagueshield medicine. Japanese プラーグシールド and Chinese 瘟疫屏障 corroborate the name; 19347/25484 explicitly name the tincture in all three sources. Reuse the well-established 역병 방호제, not a physical shield or an invented new drug identity. The official manual PDF p. 3 explains health/healing and p. 8 covers consumables/crafting context, not this exact medicine name. Full Plagueshield Tincture references are scoped atomically as a separate complete title; exclude the shorter resource label there. Do not change quest state, neighboring names or source conflicts.'
specs = [
  {key: 'resource:plagueshield', english: 'Plagueshield', category: 'resource',
   korean: '역병 방호제(Plagueshield)', variants: '역병 방패|플레그실드',
   count: 48,
   notes: 'Default:131,4574,12465,18131 and 41687 establish the named medicinal supply in the Didenhil/Fallon/Astrid quest context. Source-identical base:127/base:1724 are paired with the established medicinal label, not assigned an invented armor subtype. Normalize only explicit Plagueshield spans; do not change other medicine or plague words.'},
  {key: 'title:plagueshield-tincture', english: 'Plagueshield Tincture', category: 'title',
   korean: '역병 방호제 팅크제(Plagueshield Tincture)', variants: '역병 방패 팅크제',
   count: 2,
   notes: 'English default:19347 Drink the Plagueshield Tincture and 25484 Craft the Plagueshield Tincture are confirmed full labels, with Japanese チンキ剤 and Chinese 酊剂. Keep the existing 팅크제 wording and actions, pair the complete medicinal title atomically, and do not infer an ingredient/result identity.'}
]
ReviewedDiscoverySpecs.run(21320, 'Plagueshield Medicine And Complete Tincture Label',
                           specs, context, '## D-21313:') do |spec, key, text, source|
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  tincture = english.include?('Plagueshield Tincture')
  if spec[:key] == 'resource:plagueshield' && tincture
    [text, true]
  elsif spec[:key] == 'title:plagueshield-tincture'
    raise "unexpected tincture row #{key.inspect}" unless %w[19347 25484].include?(key[1])
    pattern = /역병 방패 팅크제/
    raise 'complete tincture title changed' unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  else
    pattern = /(?:역병 방호제|역병 방패|플레그실드)(?: ?\(Plagueshield\))?/
    raise "missing explicit medicinal label #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  end
end
