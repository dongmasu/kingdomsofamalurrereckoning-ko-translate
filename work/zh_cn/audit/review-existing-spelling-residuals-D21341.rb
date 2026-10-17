#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_341
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
targets = {
  "person:callis-dren" => ["17797", "캐리스 드렌(Callis Dren)", "캘리스 드렌(Callis Dren)", /キャリス・ドレン/, /卡利斯/],
  "person:orsinian-paige" => ["39155", "오르시니안 페이지(Orsinian Paige)", "오르시니언 페이지(Orsinian Paige)", /オーシニアン・ペイジ/, /奥斯尼安·派奇/],
  "person:medgar-krast" => ["46228", "메드거 크라스트(Medgar Krast)", "메드가르 크라스트(Medgar Krast)", /メドガー・クラスト/, /麦德加·克拉斯特/],
  "person:syllareta-vauner" => ["52873", "실라레타 바우너(Syllareta Vauner)", "실라리타 바우너(Syllareta Vauner)", /シラリータ・ボーナ/, /塞拉瑞塔·沃纳尔/]
}.freeze
inventory = m.refresh_inventory
index = m.table(m::INDEX)
glossary_path = File.join(__dir__, "proper-name-glossary.tsv")
glossary = m.table(glossary_path)
entity_by_key = glossary.to_h { |row| [row["entity_key"], row] }
reviews = targets.map do |entity, (id, from, to, ja, zh)|
  key = ["default", id, ""]
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  prior = index.select { |row| row["entity_key"] == entity && m.key(row) == key }
  raise "expected existing terminal occurrence" unless prior.length == 1 &&
    %w[accepted not-an-issue].include?(prior.first["status"])
  raise "canonical changed" unless entity_by_key.fetch(entity)["korean_canonical"] == to
  raise "reviewed exact-pair discrepancy disappeared" unless old.scan(from).length == 1
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n")
  raise "aligned name differs" unless japanese.match?(ja) && source["zh_text"].match?(zh)
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => entity, "status" => "accepted", "old" => old,
    "new" => old.sub(from, to),
    "evidence" => "Concrete new exact-pair residual evidence: current #{from.inspect} contradicts this same English name's already confirmed canonical #{to.inspect}. Independent read-only verification and direct English/Japanese/Chinese re-examination confirm the discrepancy. Correct only this Korean spelling span; no identity, alias, title, surrounding text, particle, token or line-break change. Update the existing occurrence in place, preserving its exact previous status/evidence in this manifest; do not add an occurrence or recount historical global totals. Official Korean manual PDF page 1 supplies setting context, not these individual spellings.",
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => japanese, "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entity => "accepted")
  }
end
targets.each do |entity, (_id, from, _to, _ja, _zh)|
  entry = entity_by_key.fetch(entity)
  variant = from.sub(/\([^()]*\)\z/, "")
  entry["korean_variants"] =
    (entry["korean_variants"].to_s.split("|") + [variant]).uniq.join("|")
  entry["evidence_ids"] = (entry["evidence_ids"].split("|") + ["D-#{d}"]).uniq.join("|")
end
raise "unexpected glossary headers" unless glossary.headers.include?("korean_variants")
path = File.join(__dir__, "proper-name-spelling-residual-review-D#{d}.tsv")
raise "residual proposal exists" if File.exist?(path)
m.write_table(path, m::HEADERS.take(12), reviews)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h))
m.run(path, d, nil, review_states: %w[accepted not-an-issue])
