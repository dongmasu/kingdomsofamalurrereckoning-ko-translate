#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English default:13355 explicitly defines the House Tenders as sacred overseers of Winter Fae bodily decay; 42553 and 63584 contrast that bodily role with Delvers’ spiritual role. Japanese 護り手/テンダー and Chinese 看管者 corroborate. Normalize only that formal House role to the repeated 돌보는 이(Tender), retaining explicit Korean plurals and source-local Tender/Tenders. The bare matcher is case-insensitive and also finds unrelated adjective/attendant/title uses: explicitly exclude those from the House scope without inventing identities. Official Korean manual PDF pp. 1,7 provides Winter Court/faction context, not this role. Keep Delver, Sorrows, Cadoroc/Saturnyn and all other neighboring decisions unchanged.'
specs = [
  {key: 'title:tender', english: 'Tender', aliases: 'Tenders', category: 'title',
   korean: '돌보는 이(Tender)', variants: '텐더|수호자', count: 49,
   notes: 'Formal House bodily-care role. Exclude all complete named titles, ordinary tender adjectives, Loris the Tender Eye, Nyralim attendants, Evenroot caretakers and lowercase hollow caretakers whose House identity is not established. Exclusion concerns only this formal role and does not assert that those caretakers are definitively unrelated people. Bare plural Tenders labels retain their source-local title spelling without inferring a particular person.'},
  {key: 'title:the-tenders-path', english: "The Tender's Path", category: 'title',
   korean: "돌보는 이의 길(The Tender's Path)", variants: '텐더의 길|돌봄이의 길', count: 3,
   notes: "Base:4683 and default:25321/45513 are complete the Tender's Path/The Tender's Path labels, Japanese テンダーの道/世話役の道 and Chinese 看管者之路. Normalize the whole Korean title and retain the exact source-local capitalization in its English annotation. This title does not prove that the Tender is the House role, a Nyralim attendant, or the Evenroot caretaker."},
  {key: 'title:sorrows-tender', english: 'Sorrows Tender', category: 'title',
   korean: '비탄의 집 돌보는 이(Sorrows Tender)', count: 1,
   notes: 'Default:323 explicitly has Sorrows Tender, Japanese ハウス・オブ・ソローの護り手 (quoted role) and Chinese 悲灵看管者. Preserve the existing Korean House association and role, pairing the complete label without nested annotations. Do not infer a named individual.'},
  {key: 'title:tender-of-nyralim', english: 'Tender of Nyralim', category: 'title',
   korean: '니랄림의 시종(Tender of Nyralim)', count: 1,
   notes: 'Default:4219 is the exact Tender of Nyralim label, Japanese ニラリムの世話役 and Chinese 尼拉利姆看管者. Preserve 시종 and the established 니랄림 spelling, pairing the whole role label. Do not merge this role with House Tenders or infer a named person.'}
]
excluded_ids = %w[
  2116 4383 8414 11049 24268 26614 28076 35124 41989
  50178 50247 52891 54525 60665 62063
].freeze
complete_ids = %w[323 4219 25321 45513].freeze
ReviewedDiscoverySpecs.run(21329, 'House Tender Role With Contextual Exclusions',
                           specs, context, '## D-21326:') do |spec, key, text, source|
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  case spec[:key]
  when 'title:tender'
    if key == ['base', '4683', '11'] ||
       (key[0] == 'default' && (excluded_ids + complete_ids).include?(key[1]))
      [text, true]
    else
      pattern = /(?:돌보는 이|수호자|텐더)(들)?(?: ?\((Tenders?)\))?(들)?/
      raise "missing explicitly reviewed House role #{key.inspect}" unless text.match?(pattern)
      singular = english.match?(/\bTender\b/) && !english.match?(/\bTenders\b/)
      raise 'unreviewed mixed number role context' if english.match?(/\bTender\b/) && english.match?(/\bTenders\b/)
      label = singular ? 'Tender' : 'Tenders'
      proposed = text.gsub(pattern) do
        match = Regexp.last_match
        "돌보는 이#{match[1] || match[3] ? '들' : ''}(#{label})"
      end
      [proposed, false]
    end
  when 'title:the-tenders-path'
    expected = {
      ['base', '4683', '11'] => '텐더(The Tender)의 길',
      ['default', '25321', ''] => '돌봄이의 길',
      ['default', '45513', ''] => '돌보는 이(Tender)의 길'
    }
    raise 'complete path label changed' unless text == expected.fetch(key) &&
      ["the Tender's Path", "The Tender's Path"].include?(english)
    ["돌보는 이의 길(#{english})", false]
  when 'title:sorrows-tender'
    raise 'complete Sorrows role changed' unless key == ['default', '323', ''] &&
      text == '비탄의 집(House of Sorrows) 돌보는 이(Tender)'
    [spec[:korean], false]
  else
    raise 'complete Nyralim role changed' unless key == ['default', '4219', ''] &&
      text == '니랄림(Nyralim)의 시종'
    [spec[:korean], false]
  end
end
