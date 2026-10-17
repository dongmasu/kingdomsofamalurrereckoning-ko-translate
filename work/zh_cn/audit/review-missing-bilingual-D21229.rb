#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_229
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
residual = m.table(File.join(__dir__, "proper-name-residual-missing-bilingual-final.tsv"))
raise "expected 12 residual matches" unless residual.length == 12
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY).to_h { |r| [r["entity_key"], r.to_h] }
reviews = residual.group_by { |r| m.key(r) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  text = old.dup
  matches.map { |r| r["entity_key"] }.uniq.each do |entity|
    prior = index.find { |r| r["entity_key"] == entity && m.key(r) == key }
    raise "missing terminal key" unless prior && %w[accepted not-an-issue].include?(prior["status"])
    canonical = glossary.fetch(entity).fetch("korean_canonical")
    case entity
    when "place:obsidian-isle"
      raise "island source count changed" unless JSON.parse(source["en_texts_json"]).join.scan(/Obsidian Isle/).length == 4
      raise "island Korean count changed" unless text.scan(/흑요섬/).length == 4
      text.gsub!("흑요섬", canonical)
    when "resource:scarwood-bark"
      text.gsub!(/(?:흉터|상처)나무 껍질/, canonical)
    when "resource:leechwood-bark"
      text.gsub!(/(?:흡혈|거머리)나무 껍질/, canonical)
      # The preceding sentence names the same plant, not its bark ingredient.
      text.sub!("흡혈나무는", "리치우드 나무(Leechwood Tree)는") if key[1] == "42501"
    when "lore term:dark-empyrean"
      text.gsub!("암흑 엠피리언", canonical)
    when "lore term:empyrean"
      # The complete Dark Empyrean label covers this overlapping index match.
      next
    when "faction:bitter-frost"
      text.gsub!("비터 프로스트", canonical)
    else
      raise "unexpected residual entity #{entity}"
    end
  end
  raise "residual did not change #{key}" if text == old
  entities = matches.map { |r| r["entity_key"] }.uniq.sort
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => entities.join("|"), "status" => "accepted", "old" => old, "new" => text,
    "evidence" => "D-21229 residual-label verification found an actual missing canonical span in a previously terminal key. English-led exact-row comparison with aligned Japanese and Chinese confirms Obsidian Isle/オブシディアン島/黑曜岛, Scarwood Bark/スカーウッドの樹皮/伤痕之木树皮, Leechwood Bark/リーチウッドの樹皮/水蛭木树皮, Dark Empyrean/天の帝国/黑暗最高天, or Bitter Frost/ビター・フロスト/寒霜 as applicable. Reuse the existing glossary, including all four explicit island references at default:15086; the complete Dark Empyrean label covers the overlapping Empyrean key. At default:42501 keep the tree/bark distinction and retain the opaque Leech token. Manual PDF pages 7-8 explain factions and reagent-based recipes; these are not ordinary ingredient descriptions in place of the named reagent. Preserve quantities, other entities, line breaks and tokens. Existing occurrence keys are updated in place, not registered or cumulatively counted again.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entities.to_h { |e| [e, "accepted"] })
  }
end
raise "expected 10 distinct rows" unless reviews.length == 10
reviews.sort_by! { |r| r["ID_Linha"].to_i }
proposal = File.join(__dir__, "proper-name-residual-labels-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.run(proposal, d, nil, review_states: %w[accepted not-an-issue])
note = <<~TEXT

## D-#{d}: Residual Bilingual Labels On Existing Keys

Corrected ten default cells covering twelve existing entity/row keys:
Obsidian Isle (four explicit references in one row), Scarwood Bark (four
rows), Leechwood Bark (two), Dark Empyrean/Empyrean (two overlapping rows),
and Bitter Frost (one). These missing Korean spans were detected by the
current residual audit, not inferred from an old total. The tree and bark
at default:42501 retain their distinct English meanings. No new glossary
entry or occurrence key; no reviewed hold or historical global tally changed.
All three resources were included in the residual audit. Full proper-name
discovery remains incomplete.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21228: Existing Character Name Aliases"
  raise "missing summary marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
