#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "place:trellis", english: "Trellis", korean: "트렐리스(Trellis)",
    category: "place", count: 27, variants: "격자 구조물|격자 정원|트렐리스",
    notes: "English default:6636 explicitly describes the Trellis as common ground for the Great Houses; default:4271/11315 identifies the ascent/gateway to the Court, and default:57235 labels Ysa - The Trellis. Japanese 集会場 and Chinese 棚架 corroborate the city location. Reuse the prevalent Korean 트렐리스, correcting the disconnected literal base label and Ysa compound label. Preserve short Trellis in prose, full The Trellis on exact labels and the source-full component of Ysa - The Trellis; do not normalize ordinary lattice structures."
  },
  {
    key: "place:silken-seat", english: "Silken Seat",
    korean: "비단 의자(Silken Seat)", category: "place", count: 4,
    variants: "실크 시트|실크 좌석|비단 의자",
    notes: "English default:31697 discusses restoring the Silken Seat and Billis's work; Japanese シルク亭 at default:12114/31697/38132 identifies an establishment rather than loose furniture. The base transliteration シルクン・シート and Chinese semantic versions corroborate the name, not an invented particular building subtype. Retain the already-paired 비단 의자 at base:1238/default:12114 and normalize 실크 시트/실크 좌석 only in the two source-matched rows."
  }
]
context = <<~TEXT.strip
  Review 31 distinct base/default keys for the Trellis in Ysa and the
  Silken Seat establishment, with English identity/meaning and aligned
  Japanese/Chinese support. Correct mismatched literal or phonetic labels
  and add missing English annotations without changing surrounding
  Court, Font, faction, person or Understyle terminology. Keep complete
  The labels and preserve the already-paired Ysa component separately
  in its compound location label. The official Korean manual PDF pp. 1,
  4 and 7 provides world, map and faction context, not these exact names.
  Affix has no applicable key; existing terminal entity/key decisions
  and all reviewed holds remain unchanged.
TEXT
ReviewedDiscoverySpecs.run(
  21_368, "Trellis And Silken Seat Place Names",
  specs, context, "## D-21367: Luminary Leaf, Ansilla Key And Scoped Master Key Labels"
) do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  if spec.fetch(:key) == "place:trellis"
    if key.take(2) == %w[base 1252]
      raise "Trellis base label changed" unless text == "격자 구조물 (The Trellis)"
      ["트렐리스(The Trellis)", false]
    elsif key.take(2) == %w[default 57235]
      raise "Ysa/Trellis label changed" unless text == "이사(Ysa) - 격자 정원"
      ["이사(Ysa) - 트렐리스(The Trellis)", false]
    elsif english == "The Trellis"
      raise "complete Trellis annotation changed" unless text == "트렐리스(The Trellis)"
      [text, false]
    else
      raise "Trellis span missing" unless text.include?("트렐리스")
      [text.gsub(/트렐리스(?:\(Trellis\))?/, spec.fetch(:korean)), false]
    end
  elsif key.take(2) == %w[default 31697]
    raise "Silken Seat prose span changed" unless text.include?("실크 시트")
    [text.sub("실크 시트", spec.fetch(:korean)), false]
  elsif key.take(2) == %w[default 38132]
    raise "Silken Seat short label changed" unless text == "실크 좌석"
    [spec.fetch(:korean), false]
  else
    raise "complete Silken Seat annotation missing" unless text.include?("(The Silken Seat)")
    [text, false]
  end
end
