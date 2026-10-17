#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "place:luminary-leaf", english: "Luminary Leaf",
    korean: "루미너리 리프(Luminary Leaf)", category: "place", count: 4,
    notes: "English default:3325 welcomes the player to the Luminary Leaf and explicitly says Bookseller; default:3322/43437 describes its shelves and books. Japanese ルミナリィ書店 confirms the bookstore, while Chinese supplies semantic versions 光明之叶/光耀之叶. Reuse the existing Korean dialogue name 루미너리 리프 and correct base:121's disconnected literal 빛의 잎; preserve source-full The Luminary Leaf on that label."
  },
  {
    key: "title:masters-key", english: "Master's Key",
    korean: "장인의 열쇠(Master's Key)", category: "title", count: 3,
    notes: "English base:56/default:26406/53982 explicitly uses Master's Key; Japanese 達人の鍵 and Chinese 钥匙 support key, not pick. Normalize the isolated 명장의 열쇠 to the existing 장인의 열쇠 and preserve each complete local source label. Default:26406's damaged-key/Arrivus description closely parallels Master's Pick at default:59521, but default:53982 describes use among briar vines. This registration concerns the source-local name only: it neither identifies these referents with each other nor merges/distinguishes their identities against Master's Pick. Do not silently substitute Pick for Key or register it as an alias of the pick."
  },
  {
    key: "unique item:ansilla-key", english: "Ansilla Key",
    korean: "안실라의 열쇠(Ansilla Key)", category: "unique item", count: 5,
    notes: "English default:23766 describes keeping the Ansilla Key in sight for ten years, alongside a question about Drewn; default:28994 is the acquisition objective and default:62492/64191 exact labels. Japanese アンシラの鍵 and Chinese 安西拉钥匙 corroborate the named key. Use the established base:65 genitive 안실라의 열쇠 and whole-item annotation rather than annotating only Ansilla. The existing person:drewn disposition on default:23766 is preserved; this newly indexed key-item scope does not re-review or recount the person."
  },
  {
    key: "title:the-titan-spear", english: "The Titan Spear",
    korean: "타이탄의 창(The Titan Spear)", category: "title", count: 2,
    notes: "Both exact base:35/2366 labels agree with Japanese タイタンの槍 and Chinese 泰坦之矛. Preserve both already-complete bilingual labels, including their spacing. This complete-label registration does not infer item rarity, a particular Titan, ownership or identity with other Titan objects."
  }
]
context = <<~TEXT.strip
  Review 14 distinct base/default keys for the Luminary Leaf bookstore,
  the exact Master's Key source form, the Ansilla Key and two Titan Spear
  labels. Check all affix/base/default English matches and aligned Japanese
  and Chinese; no affix row matches. Normalize names and complete labels
  only, leaving narration, keys, owners and prior entity findings intact.
  The official Korean manual PDF pp. 4 and 7-8 provides Lockpicking,
  quest-item, inventory and dialogue context, not these exact proper names.
  Similar Master-name spellings and matching engine descriptions are not
  sufficient evidence for a global item-identity merge.
TEXT
ReviewedDiscoverySpecs.run(
  21_367, "Luminary Leaf, Ansilla Key And Scoped Master Key Labels",
  specs, context, "## D-21366: Mairu People And Distinct Complete Volume Titles"
) do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  case spec.fetch(:key)
  when "place:luminary-leaf"
    if key.first == "base"
      raise "Luminary base label changed" unless text == "빛의 잎 (The Luminary Leaf)"
      ["루미너리 리프(The Luminary Leaf)", false]
    else
      raise "Luminary name span missing" unless text.include?("루미너리 리프")
      [text.gsub(/루미너리 리프(?:\(Luminary Leaf\))?/, spec.fetch(:korean)), false]
    end
  when "title:masters-key"
    if key.first == "base"
      raise "Master Key label changed" unless text == "장인의 열쇠 (The Master's Key)"
      [text, false]
    else
      pattern = /(?:명장|장인)의 열쇠(?:\(Master's Key\))?/
      raise "Master Key span missing" unless text.match?(pattern)
      [text.sub(pattern, spec.fetch(:korean)), false]
    end
  when "unique item:ansilla-key"
    label = english == "The Ansilla Key" ?
      "안실라의 열쇠(The Ansilla Key)" : spec.fetch(:korean)
    pattern = /안실라(?:\(Ansilla\))?(?:의)? 열쇠(?: ?\((?:The )?Ansilla Key\))?/
    raise "Ansilla key span missing" unless text.match?(pattern)
    if key.first == "base"
      [text, false]
    else
      [text.sub(pattern, label), false]
    end
  else
    raise "Titan Spear complete label missing" unless text.include?("(The Titan Spear)")
    [text, false]
  end
end
