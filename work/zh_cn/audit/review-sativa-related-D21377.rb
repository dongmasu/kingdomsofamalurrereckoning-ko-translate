#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English distinguishes the alchemical plant Sativa Stalk/Stalks from Sativa
  Fibers and from the named Sativa Road and Sativa Road Amulet. Base:2397 and
  default:7247/59501 identify the stalk; Japanese サティヴァの茎 and Chinese
  亚麻秆 corroborate. Base:3344, default:17582/29183/62452 identify a road
  crossing dangerous mountains and its named amulet, corroborated by Japanese
  サティヴァの道/サティヴァの道のアミュレット and Chinese 亚麻路/亚麻路护符.
  Reuse 사티바 줄기, 사티바 길, and 사티바 길의 부적. Singular/plural English
  stalk labels are paired locally, without changing the Korean noun's number.
  The official Korean manual PDF p. 8 distinguishes gathered reagents from
  crafting outputs; p. 6 distinguishes inventory items. It does not name this
  plant or road. Preserve the existing Sativa Fibers dispositions and other
  names on these rows; do not register a global bare Sativa alias.
TEXT
specs = [
  {
    key: 'resource:sativa-stalks', english: 'Sativa Stalks',
    aliases: 'Sativa Stalk', category: 'resource',
    korean: '사티바 줄기(Sativa Stalks)', variants: '사티바 줄기|사티바(Sativa) 줄기',
    count: 3, notes: context
  },
  {
    key: 'place:sativa-road', english: 'Sativa Road', category: 'place',
    korean: '사티바 길(Sativa Road)', variants: '사티바 길',
    count: 4, notes: context
  },
  {
    key: 'unique-item:sativa-road-amulet', english: 'Sativa Road Amulet',
    category: 'unique item', korean: '사티바 길의 부적(Sativa Road Amulet)',
    variants: '사티바 길(Sativa Road)의 부적', count: 1, notes: context
  }
]
ReviewedDiscoverySpecs.run(
  21_377, 'Sativa Stalks, Road And Amulet', specs, context,
  '## D-21376: Fahrlangi Faction'
) do |spec, key, text, _source|
  case spec[:key]
  when 'resource:sativa-stalks'
    name = key == ['default', '7247', ''] ? 'Sativa Stalk' : 'Sativa Stalks'
    pattern = /사티바(?:\(Sativa\))? 줄기(?:\(Sativa Stalks?\))?/
    raise "missing stalk label #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, "사티바 줄기(#{name})"), false]
  when 'place:sativa-road'
    raise "missing road label #{key.inspect}" unless text.include?('사티바 길(Sativa Road)')
    [text, false]
  when 'unique-item:sativa-road-amulet'
    raise "unexpected amulet key #{key.inspect}" unless key == ['base', '3344', '11']
    raise 'changed amulet text' unless text == '사티바 길(Sativa Road)의 부적'
    [spec[:korean], false]
  end
end
