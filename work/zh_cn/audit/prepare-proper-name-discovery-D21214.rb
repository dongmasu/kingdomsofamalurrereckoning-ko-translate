#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_214
[d, d + 1].each { |number| ReviewedProperNameDiscovery.ensure_unused_batch!(number) }
headers = m.table(File.join(__dir__, "proper-name-glossary.tsv")).headers
definition = headers.zip([
  "organization:alfar-army", "Alfar Army", "organization",
  "알파르 군(Alfar Army)", "", "알파르(Alfar) 군대|알파르(Alfar)군|알파르(Alfar) 군",
  "D-21214|D-21215|default:32827|default:52160|default:54619|default:61226",
  "confirmed",
  "English names the military organization Alfar Army, distinct from the people Alfar and from Dokkalfar army. Japanese アルファー軍 and Chinese 精灵军队 corroborate the collective army. Reuse established 알파르, attach one complete English organization annotation, and retain unit qualifiers such as main, Mountain Brigade and officer. Official Korean manual PDF page 1 distinguishes the Ljosalfar/Dokkalfar peoples and war setting but is not an exhaustive army roster. No substring alias for Dokkalfar or military-services phrase."
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
raise "expected exactly 82 Alfar Army occurrences" unless generated.length == 82
reviews = generated.sort_by { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"]] }.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  new_text = old.dup
  if %w[5449 27698 55834].include?(key[1])
    raise "missing main-force phrase" unless new_text.include?("알파르(Alfar) 주력군으로")
    new_text.sub!("알파르(Alfar) 주력군으로", "알파르 군(Alfar Army) 주력 부대로")
  elsif key == ["default", "64166", ""]
    raise "missing soldiers phrase" unless new_text.include?("알파르(Alfar) 군인들")
    new_text.sub!("알파르(Alfar) 군인들", "알파르 군(Alfar Army) 병사들")
  else
    # 군대 loses its final vowel in 군; adjust only the directly attached particle.
    new_text.gsub!(/알파르\(Alfar\) ?군대(?:\(Alfar Army\))?(는|가|를|로)?/) do
      particle = {"는" => "은", "가" => "이", "를" => "을", "로" => "으로"}.fetch($1, $1.to_s)
      "알파르 군(Alfar Army)#{particle}"
    end
    new_text.gsub!(/알파르\(Alfar\) ?군(?:\(Alfar Army\))?/, "알파르 군(Alfar Army)")
  end
  raise "missing bilingual army #{key}" unless new_text.include?("알파르 군(Alfar Army)")
  raise "residual split army #{key}" if new_text.match?(/알파르\(Alfar\) ?(?:군|주력군)/)
  status = old == new_text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => definition["entity_key"], "status" => status, "old" => old, "new" => new_text,
    "evidence" => "D-21214-D-21215 English-led military organization review across affix/base/default. Exact aligned English, Japanese and Chinese cells establish Alfar Army as the military organization, not a species rename. Use 알파르 군(Alfar Army); preserve bare Alfar elsewhere in the same row, main-force and soldier qualifiers, all unrelated names and line breaks. The manual PDF page 1 gives war and Ljosalfar/Dokkalfar setting context; no army spelling is inferred from its omissions. At default:56262 only the explicit Alfar Army clause is normalized; the separate Alfar Military Services heading retains its original wording.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(definition["entity_key"] => status)
  }
end
# The heading denotes Military Services, not the exact army name on line two.
discharge = reviews.find { |r| r["ID_Linha"] == "56262" }
discharge["new"].sub!("알파르 군(Alfar Army) 복무", "알파르(Alfar) 군 복무")
definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise "existing discovery files" if [definition_path, review_path].any? { |p| File.exist?(p) }
m.write_table(definition_path, headers, [definition])
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])
reviews.each_slice(50).with_index do |batch, ordinal|
  number = d + ordinal
  note = <<~TEXT

  ## D-#{number}: Alfar Army Organization, Part #{ordinal + 1}

  Registered the distinct military organization 알파르 군(Alfar Army).
  Reviewed #{batch.length} distinct default row keys in this slice; corrected
  #{batch.count { |r| r["old"] != r["new"] }} cells and retained
  #{batch.count { |r| r["old"] == r["new"] }}. All 82 exact English-source
  keys were covered in 50+32 slices. Dokkalfar substring matches were excluded
  by the English word boundary, not conflated with Alfar Army. Main-force
  wording and soldiers are retained as qualifiers; at default:56262 the
  separate Military Services heading remains outside the army-name edit.
  Direct particles follow 군 rather than 군대. No historical global total
  or reviewed uncertainty was reopened. See the exact trilingual manifest.
  TEXT
  %W[named-scope-review-D#{number}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{number}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
    path = File.join(__dir__, filename)
    File.write(path, File.read(path) + note)
  end
  %w[README.md decision-register-20261009.md].each do |filename|
    path = File.join(__dir__, filename)
    text = File.read(path)
    marker = "## D-21213: Registered Monk Title Consistency"
    raise "missing summary marker" unless text.include?(marker)
    File.write(path, text.sub(marker, note + "\n" + marker))
  end
end
