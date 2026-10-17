#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "place:lower-tunnels", english: "Lower Tunnels",
    korean: "하층 터널(Lower Tunnels)", category: "place", count: 20,
    variants: "아래쪽 터널|아래쪽 지하 통로|아래쪽 통로|하층 터널",
    notes: "English default:34600/35761 explicitly identifies Rathir's Lower Tunnels; Nuer, Kest and Selni contexts corroborate the same named district. Japanese 下層地下道 and Chinese 下层隧道 support the existing base:1486/2869 canonical 하층 터널. The lowercase Nuer reference at default:39460 is connected by default:10002/35761 and is annotated using its local lower tunnels wording. Exclude default:39277's explicitly Snaketail Grotto mining tunnels and the unsupported lowercase generic descriptions at default:50646/63462 from this named-place scope only; do not assert these last two definitively refer to different places or change their ordinary Korean descriptions."
  },
  {
    key: "title:the-new-assistant", english: "The New Assistant",
    korean: "새로운 조수(The New Assistant)", category: "title", count: 8,
    notes: "Eight exact English labels consist of six base keys and default:52910/56720. Japanese 新しい助手 (with two untranslated source labels) and Chinese 新助理/新的助手 support the existing base title 새로운 조수. Normalize the two short Korean 새 조수 labels and pair the complete English title. Generic new assistant in the male/female letters at default:5017/11360 is not an exact The New Assistant title match, is not included, and establishes no title-to-person identity."
  }
]
context = <<~TEXT.strip
  Review 28 distinct source-matched base/default keys, distinguishing the
  Rathir Lower Tunnels place name from ordinary lower-tunnel descriptions,
  and registering only the eight exact New Assistant title labels. Keep
  the three generic/unlinked tunnel references unchanged and excluded
  from this place scope; annotate Nuer's linked lowercase location with
  its local source spelling. Preserve fragment grammar, including 이야
  after the consonant-final 터널. The official Korean manual PDF pp. 4,
  7-8 provides map, quest and dialogue context, not these exact labels.
  Affix has no match. Prior names, findings and reviewed holds remain.
TEXT
ReviewedDiscoverySpecs.run(
  21_369, "Lower Tunnels Place Scope And New Assistant Titles",
  specs, context, "## D-21368: Trellis And Silken Seat Place Names"
) do |spec, key, text, source|
  if spec.fetch(:key) == "title:the-new-assistant"
    if key.first == "base"
      raise "existing New Assistant label changed" unless text.include?("(The New Assistant)")
      [text, false]
    else
      raise "New Assistant short label changed" unless text == "새 조수"
      [spec.fetch(:korean), false]
    end
  elsif %w[39277 50646 63462].include?(key[1]) && key.first == "default"
    [text, true]
  elsif key.take(2) == %w[base 1486]
    raise "full Lower Tunnels label changed" unless text == "하층 터널 (The Lower Tunnels)"
    [text, false]
  else
    english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
    form = if english == "The Lower Tunnels"
             "The Lower Tunnels"
           elsif key.take(2) == %w[default 39460]
             "lower tunnels"
           else
             "Lower Tunnels"
           end
    pattern = /하층 터널|아래쪽 (?:지하 통로|터널|통로)/
    raise "Lower Tunnels span missing #{key.inspect}" unless text.scan(pattern).length == 1
    updated = text.sub(pattern, "하층 터널(#{form})")
    if key.take(2) == %w[default 27141]
      raise "vowel-final original fragment changed" unless updated.include?("(#{form})야.")
      updated = updated.sub("(#{form})야.", "(#{form})이야.")
    end
    [updated, false]
  end
end
