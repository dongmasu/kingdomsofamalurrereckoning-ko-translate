#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "resource:seasteel", english: "Seasteel",
    korean: "바다강철(Seasteel)", category: "resource", count: 26,
    variants: "시스틸|씨스틸|해양강|해양 강철|해강철|해양철|해철|바다 강철",
    notes: "English default:35162 explicitly identifies Seasteel as the light, strong enchanted metal collected on Obsidian Isle; default:15086 describes its use for the Naglfar golems, default:54463 construction, and default:26419/54794 weapons. Japanese 海洋鉄 and Chinese 海钢 corroborate the same material. Reuse the repeated active semantic form 바다강철, including base:312/default:2111/39776; do not change ordinary steel or other construction supplies. Preserve source-local capitalization for explicit material occurrences and use complete labels for the two separately registered works."
  },
  {
    key: "named work:the-seasteel-golems", english: "The Seasteel Golems",
    korean: "바다강철 골렘들(The Seasteel Golems)", category: "named work",
    count: 3,
    notes: "The exact English book labels at base:312 and default:39776 agree with Japanese 海洋鉄のゴーレム and Chinese 海钢魔像; default:3224 explicitly describes a telling of their tale. Retain the complete Korean title 바다강철 골렘들. Do not turn the descriptive lowercase seasteel golems in default:3224 into an asserted exact book-title alias."
  },
  {
    key: "named work:the-virtues-of-seasteel", english: "The Virtues of Seasteel",
    korean: "바다강철의 장점(The Virtues of Seasteel)", category: "named work",
    count: 2,
    notes: "Exact base:4366/default:26944 labels and the material treatise at default:35162 establish the source-local work and subject. Japanese 海洋鉄の利点 and Chinese 海钢的优点 support the existing 장점 wording. Align only the material name and complete English title; infer no author or historical identity."
  }
]
context = <<~TEXT.strip
  Review 26 distinct base/default source keys for the fictional Seasteel
  material and its two complete book labels, counting overlapping material
  and work matches once per CSV row. Normalize only the attested material
  spellings, including the incorrect invented English spacing Sea Steel.
  Keep full book titles atomic rather than nesting material parentheses.
  Preserve source-local Seasteel/seasteel case for material references,
  construction quantities, all surrounding names, weapons, paragraphs,
  anaphors and quest narration. Default:35162 already re-expresses the
  third-paragraph English "it" as the material's name; retain that Korean
  name reference and annotate it with lowercase seasteel, without adding
  or deleting a narrative statement. The official Korean manual PDF pp. 7-8
  explains equipment, quest items and crafting materials, but does not
  list this expansion metal. Affix has no matching source row.
TEXT
ReviewedDiscoverySpecs.run(
  21_364, "Seasteel Material And Complete Book Titles",
  specs, context, "## D-21363: Master's Pick Lock-Pick Identity And Bilingual Labels"
) do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  if spec.fetch(:key).start_with?("named work:")
    next [text, true] if key.take(2) == %w[default 3224]
    case spec.fetch(:key)
    when "named work:the-seasteel-golems"
      raise "golem title span missing" unless text.match?(/바다강철 골렘들/)
      updated = text.include?("(The Seasteel Golems)") ?
        text : text.sub("바다강철 골렘들", spec.fetch(:korean))
    else
      pattern = /해양 ?강(?:철)?의 장점(?: ?\(The Virtues of Seasteel\))?/
      raise "virtues title span missing" unless text.match?(pattern)
      updated = text.sub(pattern, spec.fetch(:korean))
    end
    [updated, false]
  elsif ["The Seasteel Golems", "The Virtues of Seasteel"].include?(english)
    [text, false]
  else
    forms = english.scan(/seasteel/i)
    forms.insert(7, "seasteel") if key.take(2) == %w[default 35162]
    pattern = /(?:바다 ?강철|해양 ?강철|해양강|해강철|해양철|시스틸|씨스틸|해철)(?:\((?:Sea Steel|[Ss]easteel)\))?/
    raise "material occurrence coverage differs #{key.inspect}" unless
      text.scan(pattern).length == forms.length
    ordinal = 0
    updated = text.gsub(pattern) do
      form = forms.fetch(ordinal)
      ordinal += 1
      "바다강철(#{form})"
    end
    [updated, false]
  end
end
