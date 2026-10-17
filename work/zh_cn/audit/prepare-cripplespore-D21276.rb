#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [
  {
    key: 'resource:cripplespore-caps', english: 'Cripplespore Caps',
    category: 'resource', korean: '크리플스포어 갓(Cripplespore Caps)',
    aliases: 'Cripplespore Cap',
    variants: '크리플스포어 갓|크리플스포어(Cripplespore) 버섯갓|절름발이 포자 갓',
    count: 18,
    notes: 'English base:800 and recipes identify the harvested Cripplespore Caps; default:42240 explicitly describes the singular Cripplespore Cap and the mushroom species. Japanese クリップルスポア・キャップ/クリップルスポアの笠 and Chinese 杀人菇伞盖 corroborate. Reuse the established 크리플스포어 갓 and pair the entire ingredient name, including the singular source alias. Normalize default:38435 절름발이 포자 갓 and the split base annotation. Keep species-only references distinct rather than automatically append 갓.'
  },
  {
    key: 'resource:cripplespore', english: 'Cripplespore', category: 'resource',
    korean: '크리플스포어(Cripplespore)', aliases: 'Cripplespores',
    variants: '크리플스포어', count: 20,
    notes: 'English base:1111 names Cripplespore and default:42240 distinguishes the mushroom species (including plural Cripplespores) from its Caps. Japanese クリップルスポア and Chinese 杀人菇 corroborate the species. Default:7247 names the poisonous ingredient generically. Exclude the shorter lexical hit in rows naming only Caps; annotate the three species-only mentions separately from five cap mentions in default:42240. No new pharmacological or real-world species identity is asserted.'
  }
]
context = 'English-first named fungus and harvested ingredient review across all three resources. The official Korean manual PDF p. 4 and p. 8 establishes Alchemy, Reagents and Recipes but does not name this fungus. Preserve ingredient quantities, poison effects, scholarly prose, author names, existing other-name annotations, tokens and line breaks. No affix hit. Count overlapping species/cap matches once per CSV row.'

ReviewedDiscoverySpecs.run(
  21_276, 'Cripplespore Species and Caps', specs, context,
  '## D-21214: Alfar Army Organization, Part 1'
) do |spec, key, text, source|
  if spec[:key] == 'resource:cripplespore-caps'
    pattern = /(?:크리플스포어(?:\(Cripplespore\))?[ \t]*(?:버섯갓|갓)|절름발이 포자 갓)(?:[ \t]*\(Cripplespore Caps?\))?/
    raise "missing cap name #{key}" unless text.match?(pattern)
    text.gsub!(pattern, spec.fetch(:korean))
    [text, false]
  else
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    if !english.match?(/\bCripplespores?\b(?![ \t]+Caps?\b)/i)
      [text, true]
    else
      pattern = /크리플스포어(?![ \t]*(?:갓|\())/
      hits = text.scan(pattern).length
      paired = text.scan('크리플스포어(Cripplespore)').length
      expected = english.scan(/\bCripplespores?\b(?![ \t]+Caps?\b)/i).length
      raise "species span count differs #{key}: #{hits}+#{paired} vs #{expected}" unless hits + paired == expected
      text.gsub!(pattern, spec.fetch(:korean))
      [text, false]
    end
  end
end
