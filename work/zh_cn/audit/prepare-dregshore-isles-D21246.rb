#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:dregshore", english: "Dregshore", category: "place",
   korean: "드레그쇼어(Dregshore)", count: 3,
   notes: "English default:31800 locates Fort Olghorn's Varani trading post in Dregshore; default:41271 identifies Ollie Madsen's former service there, and default:57328 places its Varani southeast. Japanese ドレグショア and Chinese shore/place names corroborate. Preserve the repeated Korean 드레그쇼어 stem and all surrounding roles/directions."},
  {key: "place:obsidian-isles", english: "Obsidian Isles", category: "place",
   korean: "옵시디언 제도(Obsidian Isles)", count: 2,
   notes: "English default:31946 sends orders to the plural Obsidian Isles; default:57328 locates the Dverga there. Chinese 黑曜群岛 in the directional list supports an archipelago; Japanese has singular オブシディアン島. Keep the English plural scope and project-established 옵시디언 stem, without aliasing or merging the separately registered singular Obsidian Isle. The same long book contains a singular Obsidian Island patrons reference; leave that separate source-local wording untouched."}
]
context = "Read-only comparison of the exact English, Japanese and Chinese source rows across affix/base/default establishes two regional names. Manual PDF pages 1/3/4 provide Varani/Ljosalfar, world and map context, not these DLC locations. Review four distinct rows with five entity matches, counting the shared directional list only once. Preserve Fort Olghorn, Ollie, peoples, directions, book paragraphs and all unrelated names. Existing 28 indexed holds and separate Hreid identity relationship are unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_246, "Dregshore And Plural Obsidian Isles", specs, context,
  "## D-21245: Two Diplomatic Cities And Outposts") do |spec, key, text, source|
  case spec[:key]
  when "place:dregshore"
    raise "Dregshore stem missing" unless text.include?("드레그쇼어")
    text.gsub!(/드레그쇼어(?:\(Dregshore\))?/, spec[:korean])
  when "place:obsidian-isles"
    raise "archipelago stem missing" unless text.match?(/(?:옵시디언|흑요석) 제도/)
    text.gsub!(/(?:옵시디언|흑요석) 제도(?:\(Obsidian Isles\))?/, spec[:korean])
  end
  [text, false]
end
