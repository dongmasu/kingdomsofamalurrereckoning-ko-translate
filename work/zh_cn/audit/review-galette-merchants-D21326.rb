#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English default:5603,31630,37878 and 40201 identifies Galette as the named town/ruins; Japanese ガレット and Chinese 盖莱特 corroborate. Separate every complete site/role/trophy label from the parent town and preserve the already registered Inn/Shrine identities. Galette Tunnels, source-singular Galette Tunnel and Galette Caverns retain their exact English forms without an unproved alias/identity merge. English default:36322 explicitly defines United Merchants Delegation as the coalition licensed to trade in Ysa; Japanese 商人連合会 and Chinese 联合商人代表团 corroborate. Normalize its three Korean word orders to 상인 연합 대표단. Official Korean manual PDF pp. 7,9-10 provides quest/trading/exploration context, not these exact names. Keep the Hreid spelling/identity hold and all unrelated prior decisions.'
specs = [
  {key: 'place:galette', english: 'Galette', category: 'place',
   korean: '갈레트(Galette)', count: 37,
   notes: 'Named town and its inhabitants/ruins in English source. Exclude complete Inn, Shrine, Blacksmith, Victim, Tunnels, Tunnel, Caverns and Great Boggart of Galette labels from the parent-place scope. Default:60479 already has the source-local descriptive road annotation 갈레트 길(Galette road); retain it as a covering place annotation, not a new road alias.'},
  {key: 'place:galette-tunnels', english: 'Galette Tunnels', category: 'place',
   korean: '갈레트 터널(Galette Tunnels)', variants: '갈레트 지하도', count: 9,
   notes: 'English default:46028 identifies the cave near town ruins as the Galette Tunnels. Japanese ガレット地下道 and Chinese 盖莱特隧道 corroborate. Normalize 지하도/터널 to the established 터널 and pair the complete plural source name; do not alter Hreid identities or ordinary caverns below the town.'},
  {key: 'title:galette-tunnel', english: 'Galette Tunnel', category: 'title',
   korean: '갈레트 터널(Galette Tunnel)', count: 1,
   notes: 'Default:33810 has the exact singular label Galette Tunnel, Japanese ガレット地下道 and Chinese 盖莱特隧道. Preserve its English singular in a source-local title record; this lexical decision does not establish either identity or distinction from the plural site.'},
  {key: 'place:galette-caverns', english: 'Galette Caverns', category: 'place',
   korean: '갈레트 동굴(Galette Caverns)', count: 1,
   notes: 'English default:52016 names the treasure location Galette Caverns, Japanese ガレット洞窟 and Chinese 盖莱特山洞. Its complete annotation is already correct. Do not treat Caverns as an alias of Tunnels without direct evidence.'},
  {key: 'title:galette-blacksmith', english: 'Galette Blacksmith', category: 'title',
   korean: '갈레트의 대장장이(Galette Blacksmith)', count: 1,
   notes: 'Base:3225:11 is the exact Galette Blacksmith role label, Japanese ガレットの鍛冶職人 and Chinese 盖莱特铁匠. Preserve the existing occupational meaning and annotate the complete label. This does not identify a named person or prove ownership.'},
  {key: 'title:galette-victim', english: 'Galette Victim', category: 'title',
   korean: '갈레트 피해자(Galette Victim)', count: 1,
   notes: 'Default:22527 is the exact Galette Victim role label, Japanese ガレットの被害者 and Chinese 盖莱特受害者. Preserve 피해자, annotate the complete label, and do not infer a named person.'},
  {key: 'title:great-boggart-of-galette', english: 'Great Boggart of Galette', category: 'title',
   korean: '갈레트의 대보가트(Great Boggart of Galette)', count: 1,
   notes: 'Default:7059 identifies a displayed boggart head as Great Boggart of Galette, biggest on record, with Japanese ガレットのグレート・ボガート and Chinese 盖莱特的大博格特. Pair the whole trophy/epithet phrase and preserve the preceding ordinary Boggart annotation. Do not infer a separate monster species.'},
  {key: 'organization:united-merchants-delegation', english: 'United Merchants Delegation', category: 'organization',
   korean: '상인 연합 대표단(United Merchants Delegation)', variants: '상인 연합 사절단|연합 상인 대표단', count: 8,
   notes: 'English default:36322 explicitly defines the coalition of traders allowed to sell in Ysa. Preserve the existing majority 상인 연합 대표단, normalize the other two spellings, and pair all eight explicit names. At default:50048 this is the organization modifying building; keep 건물 and Felltown separately, not as an alias of the organization.'}
]
ReviewedDiscoverySpecs.run(21326, 'Galette Town, Complete Labels And Merchant Coalition',
                           specs, context, '## D-21325:') do |spec, key, text, source|
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  case spec[:key]
  when 'place:galette'
    if english.match?(/\bGalette (?:Inn|Shrine|Blacksmith|Victim|Tunnels|Tunnel|Caverns)\b|\bGreat Boggart of Galette\b/)
      [text, true]
    elsif key == ['default', '60479', '']
      raise 'covering road annotation changed' unless text.include?('갈레트 길(Galette road)')
      [text, false]
    else
      raise 'missing explicit town name' unless text.include?('갈레트')
      [text.gsub(/갈레트(?: ?\(Galette\))?/, spec[:korean]), false]
    end
  when 'place:galette-tunnels'
    pattern = /갈레트 (?:터널|지하도)(?: ?\(Galette Tunnels\))?/
    raise 'missing explicit tunnel name' unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  when 'title:galette-tunnel'
    raise 'singular source label changed' unless key == ['default', '33810', ''] && text == '갈레트 터널'
    [spec[:korean], false]
  when 'place:galette-caverns'
    raise 'complete caverns annotation changed' unless text.include?(spec[:korean])
    [text, false]
  when 'title:galette-blacksmith'
    raise 'role label changed' unless text == '갈레트(Galette)의 대장장이'
    [spec[:korean], false]
  when 'title:galette-victim'
    raise 'victim label changed' unless text == '갈레트 피해자'
    [spec[:korean], false]
  when 'title:great-boggart-of-galette'
    raise 'complete trophy phrase changed' unless text.include?('갈레트의 대보가트')
    [text.sub('갈레트의 대보가트', spec[:korean]), false]
  else
    pattern = /(?:상인 연합 사절단|상인 연합 대표단|연합 상인 대표단)(?: ?\(United Merchants Delegation\))?/
    raise 'missing coalition name' unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  end
end
