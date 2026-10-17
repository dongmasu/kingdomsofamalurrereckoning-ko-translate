#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

variants = [
  ["shocked", "Shocked Evenroot", "감전된 이븐루트", 2],
  ["primal", "Primal Evenroot", "원초의 이븐루트", 4],
  ["flamed", "Flamed Evenroot", "화염 이븐루트", 2],
  ["wild", "Wild Evenroot", "야생 이븐루트", 4],
  ["iced", "Iced Evenroot", "얼어붙은 이븐루트", 2]
]
specs = [
  {
    key: "resource:evenroot", english: "Evenroot",
    korean: "이븐루트(Evenroot)", category: "resource", count: 40,
    variants: "에븐루트|이븐루트",
    notes: "English default:26614/36117 identifies the special Evenroot brought to Idylla from the Kollossae homeland; default:4876/4943/31684 distinguishes its wild variants, and the reagent labels and recipes establish material uses. Japanese イーブンルート and Chinese 晚根草 corroborate the name. Reuse the established 이븐루트, correcting 에븐루트 only at default:16976/25909. This lexical plant/material record does not equate the city's individual plant with every wild plant or harvested reagent. Keep the caretaker role's earlier exclusions untouched."
  }
]
variants.each do |key, english, korean, count|
  specs << {
    key: "resource:#{key}-evenroot", english: english,
    korean: "#{korean}(#{english})", category: "resource", count: count,
    notes: "Exact English #{english} labels/descriptions and the aligned Japanese/Chinese establish a named Evenroot variant or treated reagent. Reuse the base-label Korean #{korean} and pair the complete compound rather than only Evenroot; preserve any recipe quantities and effects. Primal's isolated 태고의 at default:20110 is standardized to the existing 원초의. Do not infer a new botanical species, merge individual plants or apply this compound name where English says only wild variant of Evenroot."
  }
end
context = <<~TEXT.strip
  Review all 40 distinct base/default Evenroot keys and the five exact
  compound material names in the same bounded batch, counting overlapping
  lexical and compound matches once per row. Normalize phonetic spelling
  and reaction/Primal label discrepancies against the existing base
  forms; annotate complete compound names without nested parentheses.
  Keep bare Evenroot references bare even when Korean also describes
  them as wild; retain The Evenroot on the complete base label.
  The official Korean manual PDF pp. 4 and 8 provides Alchemy, reagent,
  recipe and workbench context, not this expansion plant. Preserve all
  ingredients, numbers, effects, paragraphs and quest/caretaker context.
  No affix source row matches and no prior entity/key is reopened.
TEXT
ReviewedDiscoverySpecs.run(
  21_370, "Evenroot Plant And Exact Variant Material Labels",
  specs, context, "## D-21369: Lower Tunnels Place Scope And New Assistant Titles"
) do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  if spec.fetch(:key) == "resource:evenroot"
    if english == "The Evenroot"
      raise "complete Evenroot base label changed" unless text == "이븐루트 (The Evenroot)"
      [text, false]
    elsif variants.any? { |_name, term, _ko, _count| english.match?(/\b#{Regexp.escape(term)}\b/i) }
      [text, false]
    else
      pattern = /[이에]븐루트(?:\(Evenroot\))?/
      raise "Evenroot span missing #{key.inspect}" unless text.match?(pattern)
      [text.gsub(pattern, spec.fetch(:korean)), false]
    end
  else
    korean_stems = {
      "resource:shocked-evenroot" => "감전된 이븐루트",
      "resource:primal-evenroot" => "(?:원초의|태고의) 이븐루트",
      "resource:flamed-evenroot" => "(?:화염|불타는) 이븐루트",
      "resource:wild-evenroot" => "야생 이븐루트",
      "resource:iced-evenroot" => "얼어붙은 이븐루트"
    }
    pattern = Regexp.new(
      "#{korean_stems.fetch(spec.fetch(:key))}(?:\\((?:Evenroot|#{Regexp.escape(spec.fetch(:english))})\\))?"
    )
    raise "compound Evenroot span missing #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec.fetch(:korean)), false]
  end
end
