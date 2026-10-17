#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'resource:tindertwig', english: 'Tindertwig', category: 'resource',
    korean: '틴더트윅(Tindertwig)',
    variants: '틴더트윅|틴더트위그|팅더트위그', count: 22,
    notes: 'English default:8629 explicitly describes Tindertwig as a plant used for potions, default:8159/50439 gives gathering context, and recipes list quantities. Japanese ティンダートウィッグ and Chinese 火柴枝 corroborate. Reuse both base labels 틴더트윅(Tindertwig), replacing 틴더트위그 and the 팅더 typo. Default:64696 has source-English fallback support; identity is independently established by the repeated base/quest labels. Preserve the wind/scent wording at default:61417 rather than expand a name correction into a new interpretation.'
  },
  {
    key: 'resource:edelweiss', english: 'Edelweiss', category: 'resource',
    korean: '에델바이스(Edelweiss)', variants: '에델바이스', count: 14,
    notes: 'English default:49140 identifies the named Edelweiss flower and its potion use; recipes and default:9813 ritual context refer to the same flower. Japanese エーデルワイス and Chinese 雪绒花 corroborate. Keep the existing Korean name 에델바이스 and add the English pair only where absent. Do not infer real-world pharmacology or alter the ritual/reagent context.'
  }
]

context = 'English-first plant/reagent consistency across affix/base/default. Official manual PDF p. 4 defines the Alchemy skill and PDF p. 8 describes Reagents, Recipes and Alchemy Workbenches, but gives no name for these plants. Only source-mapped name spans change; quantities, potion effects, other named entities, particles, tokens and exact line breaks remain intact. No affix hit.'

ReviewedDiscoverySpecs.run(
  21_273, 'Tindertwig and Edelweiss', specs, context,
  '## D-21214: Alfar Army Organization, Part 1'
) do |spec, key, text, _source|
  pattern = if spec[:key] == 'resource:tindertwig'
              /(?:틴더트위그|팅더트위그|틴더트윅)(?:[ \t]*\(Tindertwig\))?/
            else
              /에델바이스(?:[ \t]*\(Edelweiss\))?/
            end
  raise "missing reagent name #{spec[:key]} #{key}" unless text.match?(pattern)
  text.gsub!(pattern, spec.fetch(:korean))
  [text, false]
end
