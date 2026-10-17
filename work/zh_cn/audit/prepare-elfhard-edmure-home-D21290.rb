#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'person:elfhard-engar', english: 'Elfhard Engar', category: 'person',
    korean: '엘프하드 엥가르(Elfhard Engar)', count: 3,
    notes: 'English default:4111/24894/45894 explicitly gives the full name Elfhard Engar in a reporting objective, name label and acquired-letter notice. Japanese エルフハード・エンガー and Chinese 埃尔夫哈德·恩加尔/艾弗哈德·恩加尔 corroborate that complete source name. Retain the two already complete Korean labels and add the missing full annotation to the letter notice. This record establishes the attested full name, not a relationship to Aethan/Aethen Engar; the shared surname is not an alias or evidence for merging identities.'
  },
  {
    key: 'place:edmure-home', english: 'Edmure Home', category: 'place',
    korean: '에드뮤어의 집(Edmure Home)', count: 2,
    notes: 'English base:1492:11 and default:50523 explicitly name Edmure Home. Japanese エドミュアの家 and Chinese 艾德莫尔家 corroborate the complete place label. Use the already established person-name spelling 에드뮤어 but pair the full location name atomically. This location label does not by itself establish the identity of its owner, and is not a person-name alias.'
  }
]
patterns = {
  'person:elfhard-engar' => /엘프하드 엥가르(?:\(Elfhard Engar\))?/,
  'place:edmure-home' => /에드뮤어(?:\(Edmure\))?의 집/
}
context = 'English-first explicit complete-name review across affix/base/default, with aligned Japanese/Chinese corroboration. Official Korean manual PDF p. 1 gives world/people context, PDF p. 7 covers quest objectives, and PDF p. 10 covers owned homes; it does not supply either proper name. Only source-mapped name labels change; preserve all reporting/letter actions, particles, prior name decisions, tokens and line breaks. No shared-surname identity merge or global alias is made; no older finding or historical total is reopened.'

ReviewedDiscoverySpecs.run(
  21_290, 'Elfhard Engar and Edmure Home', specs, context,
  '## D-21283: Delfric Surname-Only References'
) do |spec, key, text, _source|
  pattern = patterns.fetch(spec.fetch(:key))
  raise "complete name span changed at #{key.inspect}" unless text.scan(pattern).length == 1
  [text.sub(pattern, spec.fetch(:korean)), false]
end
