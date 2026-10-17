#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:42831 names the cave of Amethyn beneath the Winter King's
  court, and default:23461/24897 names Gadflow's crystalline fortress of
  Amethyn. Default:1091/15600 places Tirnoch's imprisonment between worlds
  there. These identify the shared place-name component, not a claim that
  every named chamber and fortress label is interchangeable. Japanese
  アメシン and Chinese 阿梅辛 corroborate 아메신, the dominant Korean form,
  rather than 아메틴. Register Amethyn Castle, Heart of Amethyn and Deep
  Amethyn as distinct complete source labels; Japanese アメシン城,
  アメシン中心部, アメシン深部 and Chinese 阿梅辛城堡, 阿梅辛之心,
  深邃阿梅辛 corroborate their local roles. Use 아메신 성, 아메신의 심장,
  and 아메신 심부 respectively, with complete English annotations and no
  nested parentheses. The official Korean manual PDF p. 1 supplies the
  Winter Court/war setting and p. 7 the main-quest framework, not these
  individual location labels. All three resources were searched.
TEXT
specs = [
  {
    key: 'place:amethyn', english: 'Amethyn', category: 'place',
    korean: '아메신(Amethyn)', variants: '아메신|아메틴', count: 27, notes: context
  },
  {
    key: 'place:amethyn-castle', english: 'Amethyn Castle', category: 'place',
    korean: '아메신 성(Amethyn Castle)', variants: '아메신(Amethyn) 성',
    count: 1, notes: context
  },
  {
    key: 'place:heart-of-amethyn', english: 'Heart of Amethyn', category: 'place',
    korean: '아메신의 심장(Heart of Amethyn)', variants: '아메신의 심장|아메신(Amethyn)의 심장',
    count: 2, notes: context
  },
  {
    key: 'place:deep-amethyn', english: 'Deep Amethyn', category: 'place',
    korean: '아메신 심부(Deep Amethyn)', variants: '딥 아메신',
    count: 1, notes: context
  }
]
ReviewedDiscoverySpecs.run(
  21_378, 'Amethyn And Named Subareas', specs, context,
  '## D-21377: Sativa Stalks, Road And Amulet'
) do |spec, key, text, _source|
  case spec[:key]
  when 'place:amethyn'
    pattern = /(?:아메신|아메틴)(?:\(Amethyn\))?/
    raise "missing Amethyn span #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  when 'place:amethyn-castle'
    raise 'changed castle label' unless text == '아메신(Amethyn) 성'
    [spec[:korean], false]
  when 'place:heart-of-amethyn'
    raise 'changed heart label' unless text == '아메신(Amethyn)의 심장'
    [spec[:korean], false]
  when 'place:deep-amethyn'
    raise 'changed deep label' unless text == '플레이어가 딥 아메신(Amethyn)에 진입'
    ['플레이어가 아메신 심부(Deep Amethyn)에 진입', false]
  end
end
