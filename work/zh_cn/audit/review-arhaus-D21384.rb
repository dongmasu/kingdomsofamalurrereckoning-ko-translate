#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:30114 introduces Arhaus Vorm at his lodge; default:46910,
  25890 and 28795 identifies him as Luca Soren's healer using Searstalk.
  The short Arhaus references describe the same lodge, healer and patient's
  recovery at default:7603/33568/32695/64511. Japanese アーハウス・ヴォーム/
  アーハウス and Chinese 阿豪斯·沃尔姆/阿豪斯 corroborate. Register the
  full name with short alias Arhaus; retain the established 아르하우스 보름
  and use 아르하우스(Arhaus), replacing 아하우스 and adding missing pairs.
  No global Vorm surname alias is introduced. The official Korean manual
  PDF p. 1 supplies Varani background and p. 8 repeated dialogue/quest-contact
  context, not this character's spelling. All three resources were searched;
  only 25 default rows match. Other names and existing prior dispositions on
  the shared Luca/quest rows remain unchanged.
TEXT
specs = [{
  key: 'person:arhaus-vorm', english: 'Arhaus Vorm', aliases: 'Arhaus',
  category: 'person', korean: '아르하우스 보름(Arhaus Vorm)',
  variants: '아르하우스 보름|아르하우스|아하우스', count: 25, notes: context
}]
ReviewedDiscoverySpecs.run(
  21_384, 'Arhaus Vorm And Short Name', specs, context,
  '## D-21383: Doness Vere And Edoel Brelt Full Names'
) do |spec, key, text, source|
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  if english.include?('Arhaus Vorm')
    raise "changed full-name row #{key.inspect}" unless text.include?(spec[:korean])
    [text, false]
  else
    pattern = /(?:아르하우스|아하우스)(?:\(Arhaus\))?/
    raise "missing short name #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, '아르하우스(Arhaus)'), false]
  end
end
