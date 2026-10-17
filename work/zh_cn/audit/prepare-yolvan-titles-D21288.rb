#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'title:blades-of-yolvan', english: 'Blades of Yolvan', category: 'title',
    korean: '요르반의 칼날(Blades of Yolvan)', count: 1,
    notes: 'English base:1336:11 is the complete label Blades of Yolvan; Japanese ヨルヴァンのブレード and Chinese 尤凡之刃 corroborate the name. Pair the complete label atomically. Its precise runtime equipment/bonus type is not established here and is not inferred from the word Blades.'
  },
  {
    key: 'title:yolvan-stone', english: 'Yolvan Stone', category: 'title',
    korean: '요르반의 돌(Yolvan Stone)', count: 1,
    notes: 'English base:1678:11 is the complete label Yolvan Stone; Japanese ヨルヴァンの石 and Chinese 尤凡之石 corroborate it. Pair the whole title without inferring an item type or expanding Stone to Lorestone.'
  },
  {
    key: 'named work:a-history-of-yolvan', english: 'A History of Yolvan', category: 'named work',
    korean: '요르반의 역사(A History of Yolvan)', count: 1,
    notes: 'English base:3011:11 names A History of Yolvan, corroborated by Japanese ヨルヴァンの歴史 and Chinese 尤凡的历史. The distinct ordinary description at default:55656 discusses the history of Yolvan but does not quote this complete book title; it is not a title alias and is outside this exact-title match.'
  },
  {
    key: 'title:yolvans-poison', english: "Yolvan's Poison", category: 'title',
    korean: "요르반의 독(Yolvan's Poison)", count: 1,
    notes: 'English default:47163 supplies the full label Yolvan\'s Poison; Japanese ヨルヴァンの毒 and Chinese 尤凡的毒药 corroborate it. Preserve the Korean meaning 독 and pair the whole title; do not infer a potion, skill, quest or person identity from this isolated label.'
  }
]
patterns = {
  'title:blades-of-yolvan' => /욜반\(Yolvan\)의 칼날/,
  'title:yolvan-stone' => /욜반\(Yolvan\)의 돌/,
  'named work:a-history-of-yolvan' => /욜반\(Yolvan\)의 역사/,
  'title:yolvans-poison' => /욜반의 독/
}
context = 'English-led exact complete-title review across affix/base/default. Reuse the already reviewed Castle Yolvan Korean stem 요르반 for orthographic consistency without conflating these four complete labels, the region, or the castle. Official Korean manual PDF p. 1 describes the Faelands setting, PDF pp. 6-8 distinguishes equipment and inventory, and PDF p. 7 distinguishes quest types; it does not establish the type or spelling of these four labels. Exact Japanese/Chinese provide corroboration; only the name span changes. Preserve old entity decisions, global totals, other text, particles, tokens and line breaks.'

ReviewedDiscoverySpecs.run(
  21_288, 'Four Complete Yolvan Titles', specs, context,
  '## D-21283: Delfric Surname-Only References'
) do |spec, key, text, _source|
  pattern = patterns.fetch(spec.fetch(:key))
  raise "unexpected complete-title text at #{key.inspect}" unless text.scan(pattern).length == 1
  [text.sub(pattern, spec.fetch(:korean)), false]
end
