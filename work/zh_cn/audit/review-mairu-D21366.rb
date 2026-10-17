#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "people:mairu", english: "Mairu", korean: "마이루(Mairu)",
    category: "people", count: 32, variants: "마일루|마이루",
    notes: "English default:40560 calls Mairu the ancestor race; default:44515 the progenitor race of Kollossae, and default:44827 explicitly contrasts the peoples. Default:7190/61685 discusses Ethene and Kreios in that history, while the theatrical and hymn contexts use the same ethnonym. Japanese consistently マイルー and Chinese 麦鲁 corroborate the established Korean 마이루, correcting the isolated 마일루 at default:58599. Preserve narrator claims rather than treating their religious or dramatic accounts as independently proven history. Annotate complete source titles atomically, not with nested people names."
  }
]
titles = [
  ["title:the-mairu-i", "The Mairu, I", "마이루 I", %w[base 1333]],
  ["title:the-mairu-ii", "The Mairu, II", "마이루 II", %w[base 1707]],
  ["named work:of-mairu-and-kollossae-i", "Of Mairu and Kollossae, I",
   "마이루와 콜로사이에 관하여 I", %w[default 57419]],
  ["named work:of-mairu-and-kollossae-ii", "Of Mairu and Kollossae, II",
   "마이루와 콜로사이에 관하여 II", %w[default 50935]]
]
titles.each do |key, english, korean, _row|
  specs << {
    key: key, english: english, korean: "#{korean}(#{english})",
    category: key.split(":").first, count: 1,
    notes: "Exact source label #{english} has aligned Japanese/Chinese volume numbering. Use the existing 마이루 and 콜로사이 stems and preserve the complete local English title, punctuation and Roman numeral. The two distinct title stems The Mairu and Of Mairu and Kollossae are not asserted to be alternate names of the same work; individual prose descriptions are not assigned to volumes."
  }
end
title_keys = titles.map(&:last)
context = <<~TEXT.strip
  Review all 32 Mairu row keys across affix/base/default, including the
  four separately scoped complete titles. Correct 마일루 to 마이루 and
  annotate explicit name occurrences, including repeated names within
  long passages, while preserving omitted names/anaphors, surrounding
  terminology, narrator voice, verse and paragraph breaks. Existing
  already-bilingual title spacing is retained where no edit is needed.
  Default:584 retains its source-full The Mairu ethnonym/topic label.
  The official Korean manual PDF pp. 1-2 provides people and Ethene context,
  but does not enumerate this expansion people or its histories.
  No affix key matches. No prior entity/key disposition or unresolved
  hold is reopened; these focused records do not change global totals.
TEXT
ReviewedDiscoverySpecs.run(
  21_366, "Mairu People And Distinct Complete Volume Titles",
  specs, context, "## D-21365: Numbered Titles, Pearse Journals And Wavemaker"
) do |spec, key, text, _source|
  if spec.fetch(:key) == "people:mairu"
    if title_keys.include?(key.take(2))
      [text, false]
    else
      raise "Mairu span missing #{key.inspect}" unless text.match?(/마[이일]루/)
      updated = text.gsub(/마[이일]루(?:\((?:The )?Mairu\))?/) do |span|
        span == "마이루(The Mairu)" ? span : spec.fetch(:korean)
      end
      [updated, false]
    end
  elsif key.first == "base"
    raise "complete Mairu label missing" unless text.include?("(#{spec.fetch(:english)})")
    [text, false]
  else
    expected = {
      "50935" => "마이루와 콜로사이(Kollossae)에 관하여, 제2권",
      "57419" => "마이루와 콜로사이(Kollossae)에 관하여 I"
    }
    raise "reviewed combined title differs" unless text == expected.fetch(key[1])
    [spec.fetch(:korean), false]
  end
end
