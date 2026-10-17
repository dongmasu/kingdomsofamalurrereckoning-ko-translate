#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:587/12037/12512/46099 names the Fae hollow Gorguath and
  the Grave Thresh's lair, while default:5219/30360 personifies that living
  hollow. Japanese ゴーグアス/ゴーグアス洞穴 and Chinese 戈尔加斯/戈尔瓜斯
  corroborate the place component. Reuse the consistent Korean 고르구아스,
  adding its English annotation only where missing. Preserve the separate
  already-reviewed Sagrell/Thresh/House of Ballads and other terminology.
  Base:547 Gorguath Stone and default:55353 The Spirits of Gorguath are
  registered as complete source labels under title scope, without inferring
  a new item subtype or quest type. Japanese ゴーグアスの石/ゴーグアスの精霊
  and Chinese 戈尔加斯之石/戈尔加斯的幽灵 corroborate those labels.
  The official Korean manual PDF p. 7 supplies House of Ballads/faction-quest
  context, not this hollow's name. All three resources were searched; 27
  distinct rows occur in base/default and no affix hits were found.
TEXT
specs = [
  {
    key: 'place:gorguath', english: 'Gorguath', category: 'place',
    korean: '고르구아스(Gorguath)', variants: '고르구아스',
    count: 27, notes: context
  },
  {
    key: 'title:gorguath-stone', english: 'Gorguath Stone', category: 'title',
    korean: '고르구아스의 돌(Gorguath Stone)', variants: '고르구아스(Gorguath)의 돌',
    count: 1, notes: context
  },
  {
    key: 'title:spirits-of-gorguath', english: 'The Spirits of Gorguath', category: 'title',
    korean: '고르구아스의 정령들(The Spirits of Gorguath)',
    variants: '고르구아스(Gorguath)의 정령들', count: 1, notes: context
  }
]
ReviewedDiscoverySpecs.run(
  21_381, 'Gorguath And Complete Labels', specs, context,
  '## D-21380: Alarane'
) do |spec, key, text, _source|
  case spec[:key]
  when 'place:gorguath'
    pattern = /고르구아스(?:\(Gorguath\))?/
    raise "missing Gorguath span #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  when 'title:gorguath-stone'
    raise 'changed stone label' unless text == '고르구아스(Gorguath)의 돌'
    [spec[:korean], false]
  when 'title:spirits-of-gorguath'
    raise 'changed spirits label' unless text == '고르구아스(Gorguath)의 정령들'
    [spec[:korean], false]
  end
end
