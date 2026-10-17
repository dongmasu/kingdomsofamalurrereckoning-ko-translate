#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
[21_357, 21_358].each { |d| ReviewedProperNameDiscovery.ensure_unused_batch!(d) }
context = <<~TEXT.strip
  English identifies Amman the Clever as the Fae mage/trickster who made
  the cursed Eye of Amman and hid treasure keys/statues. Japanese
  知恵者アマン/アマン and Chinese 智者安曼/安曼 corroborate; normalize
  아만/암만 and the untranslated epithet 더 클레버. Keep source-short
  Amman as 아만(Amman), and explicit full names as
  영리한 아만(Amman the Clever). Preserve full item labels atomically,
  including the distinct Eye of Amman. Seasonal keys and statues remain
  separate objects; no season or Esharra suffix is discarded.
  Default:9392 discusses Amman as a possible name in contrast to Casmaran
  without identifying the Fae trickster: exclude that occurrence from
  this person's scope and leave its source-faithful Korean untouched.
  The manual's setting, Fae/quest and equipment sections (PDF pp. 1, 7-8)
  provide context, not an exact Amman spelling. Preserve all unrelated
  narration, prior proper-name decisions, tokens and line breaks.
TEXT
headers = m.table(File.join(__dir__, "proper-name-glossary.tsv")).headers
definitions = [
  {
    "entity_key" => "person:amman-the-clever",
    "english_canonical" => "Amman the Clever", "category" => "person",
    "korean_canonical" => "영리한 아만(Amman the Clever)",
    "english_aliases" => "Amman", "korean_variants" => "암만|아만 더 클레버",
    "evidence_ids" => "D-21357-D-21358", "status" => "confirmed",
    "notes" => context
  },
  {
    "entity_key" => "item:eye-of-amman", "english_canonical" => "Eye of Amman",
    "category" => "unique item", "korean_canonical" => "아만의 눈(Eye of Amman)",
    "english_aliases" => "", "korean_variants" => "암만의 눈",
    "evidence_ids" => "D-21357-D-21358", "status" => "confirmed",
    "notes" => "English default:9480/55176 identifies a cursed magical gem/amulet made by the Fae Amman, cleansed at Syl's altar and returned to one of two claimants. Japanese アマンの眼 and Chinese 安曼之眼 corroborate. Keep the object separate from its maker, and retain quest/book-heading contexts without inventing another object."
  }
]
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |v|
  OCCURRENCE_HEADERS.zip(v).to_h
end
counts = generated.group_by { |r| r["entity_key"] }.transform_values(&:length)
raise "unexpected source coverage #{counts.inspect}" unless counts == {
  "person:amman-the-clever" => 57, "item:eye-of-amman" => 15
}
grouped = generated.group_by { |r| m.key(r) }
raise "expected 57 distinct source keys" unless grouped.length == 57
full_name_ids = %w[5011 9480 9918 11658 13310 23828 45072 55636 57502 59531]
reviews = grouped.keys.sort_by { |k| [m::RESOURCES.index(k[0]), k[1].to_i, k[2]] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  excluded = key == ["default", "9392", ""]
  new_text = old.dup
  unless excluded
    if grouped.fetch(key).any? { |r| r["entity_key"] == "item:eye-of-amman" }
      eye = /(?:아만|암만)(?:\(Amman\))?의 눈(?:\(Eye of Amman\))?/
      raise "missing Eye label #{key.inspect}" unless new_text.match?(eye)
      new_text = new_text.gsub(eye, "아만의 눈(Eye of Amman)")
    end
    if key[0] == "default" && full_name_ids.include?(key[1])
      if key[1] == "55636"
        raise "split full-name span differs" unless new_text.include?("영리한 페이(Fae) 아만(Amman the Clever)")
        new_text = new_text.sub("영리한 페이(Fae) 아만(Amman the Clever)",
                                "페이(Fae) 영리한 아만(Amman the Clever)")
      else
        full = /(?:영리한 (?:아만|암만)|아만 더 클레버)(?:\(Amman(?: the Clever)?\))?/
        raise "missing full-name span #{key.inspect}" unless new_text.match?(full)
        new_text = new_text.gsub(full, "영리한 아만(Amman the Clever)")
      end
    end
    # Consume full bilingual object/person labels before short-name spans.
    new_text = new_text.gsub(/아만의 눈\(Eye of Amman\)|영리한 아만\(Amman the Clever\)|(?:아만|암만)(?:\(Amman\))?/) do |span|
      span == "아만의 눈(Eye of Amman)" || span == "영리한 아만(Amman the Clever)" ?
        span : "아만(Amman)"
    end
  end
  status = excluded ? "excluded" : old == new_text ? "not-an-issue" : "accepted"
  dispositions = grouped.fetch(key).to_h { |r| [r.fetch("entity_key"), status] }
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => dispositions.keys.sort.join("|"), "status" => status,
    "old" => old, "new" => new_text, "evidence" => context,
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(dispositions)
  }
end
definition_path = File.join(__dir__, "proper-name-discovery-definitions-D21357.tsv")
review_path = File.join(__dir__, "proper-name-discovery-D21357-D21358.tsv")
raise "discovery manifests already exist" if [definition_path, review_path].any? { |p| File.exist?(p) }
m.write_table(definition_path, headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, "21357"])
reviews.each_slice(50).with_index do |batch, ordinal|
  d = 21_357 + ordinal
  note = <<~TEXT

    ## D-#{d}: Amman The Clever And The Eye Of Amman

    Reviewed #{batch.length} distinct resource/ID/variant keys in this
    slice of the 57-key Amman scope (50 + 7), with
    #{batch.group_by { |r| r["status"] }.transform_values(&:length).inspect}.
    #{context}
    This is focused name/annotation review, not a new global translation
    tally. Existing terminal keys/holds outside these two new scopes are
    not reopened. Full discovery remains incomplete.
  TEXT
  %W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |name|
    path = File.join(__dir__, name)
    File.write(path, File.read(path) + note)
  end
  %w[README.md decision-register-20261009.md].each do |name|
    path = File.join(__dir__, name)
    text = File.read(path)
    marker = "## D-21356: Audience Hall, Sanctuaries And Three City Prisons"
    raise "missing current summary marker" unless text.include?(marker)
    File.write(path, text.sub(marker, note + "\n" + marker))
  end
  puts note
end
