#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'resource:sky-blossom',
    english: 'Sky Blossom',
    category: 'resource',
    korean: '하늘꽃(Sky Blossom)',
    variants: '스카이 블로섬|스카이 블로섬(Sky Blossom)|하늘꽃',
    count: 37,
    notes: 'English base:1667/base:2825 gives the standalone reagent name; default:22661 describes Sky Blossom as a pale-blue wildflower whose petals are used in potions. Other recipe, dialogue, and journal rows use the same named plant as an alchemical reagent or refer to it in prose. Japanese スカイ・ブロッサム and Chinese 天空之花 corroborate the source name. Reuse the established Korean translation 하늘꽃 and pair the complete item name as 하늘꽃(Sky Blossom), replacing 스카이 블로섬 consistently. The official Korean manual PDF p. 4 defines Reagents and Alchemy generically but does not name this plant. Preserve recipe quantities, other ingredients, prose, tokens, and line breaks.'
  }
]

context = 'English-led discovery of Sky Blossom as a named wildflower and alchemical reagent across 37 distinct base/default rows. Japanese スカイ・ブロッサム and Chinese 天空之花 corroborate. The official Korean manual PDF p. 4 supplies generic reagent/alchemy context, not a specific plant spelling. Standardize the established Korean translation 하늘꽃 and preserve quantities, other ingredients, tokens, and paragraph structure.'

ReviewedDiscoverySpecs.run(
  21_265,
  'Sky Blossom Reagent',
  specs,
  context,
  '## D-21264: Red Idward'
) do |spec, key, text, _source|
  pattern = /(?:하늘꽃|스카이\s*블로섬)\s*(?:\(Sky Blossom\))?/
  count = text.scan(pattern).length
  raise "Sky Blossom Korean span missing at #{key.inspect}" unless count.positive?
  text.gsub!(pattern, spec.fetch(:korean))
  [text, false]
end
