#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:15842 explicitly identifies the Ariad as elite scouts and
  skirmishers of the Alfar army; default:24356 calls it a unit, while
  default:20269/26891 describes its Klurikon scouting role. Japanese
  アリアド隊 and Chinese 阿瑞雅德精灵军 corroborate a named military unit,
  not a separate people/race. Reuse 아리아드(Ariad), replacing 아리아드대
  with the same unit name and default:57979's misleading 아리아드인 with
  아리아드(Ariad) 대원들. Register Ariad Camp as a distinct place and
  Shadow of the Ariad as a distinct complete item label, corroborated by
  Japanese アリアド隊のキャンプ/アリアドの影 and Chinese 阿瑞雅德营地/
  阿瑞雅德的暗影. Preserve the already covering camp annotation without
  nested parentheses. The official Korean manual PDF p. 1 distinguishes
  peoples and the war setting, p. 6 inventories equipment, and p. 7 describes
  faction quests; it does not name this unit. All three resources were
  searched, and existing related person/place dispositions remain intact.
TEXT
specs = [
  {
    key: 'faction:ariad', english: 'Ariad', category: 'faction',
    korean: '아리아드(Ariad)', variants: '아리아드|아리아드대|아리아드인',
    count: 32, notes: context
  },
  {
    key: 'place:ariad-camp', english: 'Ariad Camp', category: 'place',
    korean: '아리아드 야영지(Ariad Camp)', variants: '아리아드 야영지',
    count: 1, notes: context
  },
  {
    key: 'unique-item:shadow-of-the-ariad', english: 'Shadow of the Ariad',
    category: 'unique item', korean: '아리아드의 그림자(Shadow of the Ariad)',
    variants: '아리아드(Ariad)의 그림자', count: 1, notes: context
  }
]
ReviewedDiscoverySpecs.run(
  21_379, 'Ariad Unit, Camp And Named Item', specs, context,
  '## D-21378: Amethyn And Named Subareas'
) do |spec, key, text, _source|
  case spec[:key]
  when 'faction:ariad'
    if key == ['default', '52335', '']
      raise 'changed covering camp label' unless text == '아리아드 야영지(Ariad Camp)'
      [text, false]
    else
      text = text.sub('아리아드인에게도', '아리아드(Ariad) 대원들에게도') if
        key == ['default', '57979', '']
      pattern = /아리아드(?:대)?(?:\((?:The )?Ariad\))?/
      raise "missing Ariad name #{key.inspect}" unless text.match?(pattern)
      [text.gsub(pattern, spec[:korean]), false]
    end
  when 'place:ariad-camp'
    raise 'changed camp label' unless text == spec[:korean]
    [text, false]
  when 'unique-item:shadow-of-the-ariad'
    raise 'changed item label' unless text == '아리아드(Ariad)의 그림자'
    [spec[:korean], false]
  end
end
