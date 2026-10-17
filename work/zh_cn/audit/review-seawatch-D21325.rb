#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English default:1830 and 10206 explicitly identify Seawatch as the named fortress, and 42083 calls it the first Ansilla castle. Japanese シーウォッチ and Chinese 观海堡垒 corroborate. Normalize both observed 시워치 and 씨워치 to the established 시워치(Seawatch), including repeated explicit mentions within a cell. English Ghosts of Seawatch is a complete quest title and is scoped separately from the fortress. Preserve Ansilla family/castle identities, all named people and surrounding grammar. Official Korean manual PDF p. 10 supplies player-house restoration context, not this exact fortress name.'
specs = [
  {key: 'place:seawatch', english: 'Seawatch', category: 'place',
   korean: '시워치(Seawatch)', variants: '씨워치', count: 50,
   notes: 'Named fortress/home with staff return and restoration context. Default:9533,29455,29757 and 42083 use 씨워치; normalize these as well as unpaired 시워치. Exclude the complete Ghosts of Seawatch quest title from the parent-place disposition.'},
  {key: 'quest:ghosts-of-seawatch', english: 'Ghosts of Seawatch', category: 'quest',
   korean: '시워치의 망령들(Ghosts of Seawatch)', count: 1,
   notes: 'Default:6993 is the complete Ghosts of Seawatch title; Japanese シーウォッチの亡霊 and Chinese 观海堡垒的鬼魂 support the existing 망령들. Annotate the whole quest name, not just its embedded place.'}
]
ReviewedDiscoverySpecs.run(21325, 'Seawatch Fortress And Complete Quest Title',
                           specs, context, '## D-21322:') do |spec, key, text, source|
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  if spec[:key] == 'place:seawatch' && english == 'Ghosts of Seawatch'
    [text, true]
  elsif spec[:key] == 'quest:ghosts-of-seawatch'
    raise 'complete quest title changed' unless key == ['default', '6993', ''] &&
      text == '시워치의 망령들'
    [spec[:korean], false]
  else
    pattern = /(?:시워치|씨워치)(?: ?\(Seawatch\))?/
    raise "missing explicit fortress name #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  end
end
