#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "title:elund", english: "Elund", category: "title",
    korean: "엘룬드(Elund)", variants: "엘룬", count: 27,
    notes: "English default:3538/53452 explicitly distinguishes the Elund who speaks from the Orbocant that governs; default:36939 says the historical poet Caethra became the Elund. Japanese エランド and Chinese 埃朗德 corroborate. Register the formal role/name label independently of person:elund-carth; the twelve source rows explicitly containing Elund Carth are excluded from this bare-title scope and their existing person decisions are unchanged. Retain bare Elund self-introductions as source-local labels without inferring a personal identity. At default:42202 normalize the title 엘룬 to 엘룬드, but leave Morfen Carth's separate name for a separate scope."
  },
  {
    key: "unique item:elunds-ring", english: "Elund's Ring",
    category: "unique item", korean: "엘룬드의 반지(Elund's Ring)", count: 1,
    notes: "English base:117 names Elund's Ring; Japanese エランドの指輪 and Chinese 埃朗德的戒指 corroborate. Pair the complete object label rather than only the title component. No particular Elund holder, item rarity, or separate identity relation is inferred."
  }
]
ids = %w[7881 8997 9131 15119 36939 42202 62761].freeze
context = <<~TEXT.strip
  English establishes Elund as the formal council-mouthpiece role, not a
  global given-name alias for Elund Carth. Review 27 distinct source keys,
  explicitly exclude the twelve full-person-name rows from this new title
  scope, and retain their prior personal-name decisions. Register the
  separate complete Elund's Ring label. Annotate the seven missing bare
  title rows and normalize the one truncated 엘룬 title, leaving the
  neighboring Morfen Carth name untouched. Preserve first-mention-only
  annotations in long prose and all D-21336/D-21337 edits. Official Korean
  manual PDF pages 1 and 7 provides world/faction context, not this office.
  Chinese default:14366 omits the Elund's-hat idiom; English and Japanese
  explicitly retain it, as does the current Korean. Preserve that idiom
  rather than treating the Chinese omission as a name-identity conflict.
TEXT
ReviewedDiscoverySpecs.run(
  21_338, "Elund Formal Role And Complete Ring Label", specs, context,
  "## D-21337: Orbocant Council And Contextual Seat References"
) do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n")
  raise "missing aligned Japanese" unless japanese.match?(/エランド|Elund/)
  chinese_omission = key == ["default", "14366", ""] &&
    source["zh_text"] == "拜托，告诉我这孩子这次是怎么了。毫无疑问，这是不好的。"
  raise "missing aligned Chinese" unless
    source["zh_text"].match?(/埃朗德|Elund/) || chinese_omission
  if spec[:key] == "title:elund"
    if english.match?(/\bElund Carth\b/)
      [text, true]
    elsif key[0] == "default" && ids.include?(key[1])
      from = key[1] == "42202" ? "엘룬이자" : "엘룬드"
      to = key[1] == "42202" ? "엘룬드(Elund)이자" : "엘룬드(Elund)"
      raise "unexpected annotation" if text.include?("(Elund)")
      raise "missing reviewed title" unless text.include?(from)
      [text.sub(from, to), false]
    else
      raise "unexpected unpaired title" unless text.include?("엘룬드(Elund)")
      [text, false]
    end
  else
    from = "엘룬드(Elund)의 반지"
    raise "ring scope differs" unless key == ["base", "117", "11"] && text == from
    [spec.fetch(:korean), false]
  end
end
