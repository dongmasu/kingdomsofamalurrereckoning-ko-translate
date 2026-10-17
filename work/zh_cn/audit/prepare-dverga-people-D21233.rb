#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
start = 21_233
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
raise "people already registered" if glossary.any? { |r| r["entity_key"] == "people:dverga" }
notes = "English Dverga names the people and Dvergan is its related adjective/demonym, not another species. Japanese ドゥバーガ and Chinese 迪维尔干 corroborate across ship, tunnel, equipment, grave and dialogue contexts. Use 드베르가(Dverga) and source-adjectival 드베르간(Dvergan). Preserve noun 드베르가족 with the source-local English form and atomic language 드베르간어(Dvergan), not duplicated parentheses. English generic dwarfs does not require a new Dverga name annotation. Official Korean manual PDF pages 1-3 provides the race/people distinction; pages 7-8 covers quest and equipment context, not an exhaustive DLC race list."
definitions = [
  glossary.headers.zip(["people:dverga", "Dverga", "people", "드베르가(Dverga)",
    "Dvergan", "드워가|드워간|데버가", "D-21233-D-21236", "confirmed", notes]).to_h,
  glossary.headers.zip(["place:grundholm", "Grundholm", "place", "그룬드홀름(Grundholm)",
    "", "", "D-21233-D-21236|default:42154", "confirmed",
    "English default:42154 explicitly names the lands where the Dverga seek a home. Japanese グルンドホルム and Chinese 格兰德霍尔姆 corroborate the same place; retain existing 그룬드홀름 and keep it distinct from the people and vessels."]).to_h
]
generated = build_occurrences(inventory.values, definitions).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
raise "source match counts differ" unless generated.group_by { |r| r["entity_key"] }.transform_values(&:length) ==
  {"people:dverga" => 174, "place:grundholm" => 1}
reviews = generated.group_by { |r| m.key(r) }.sort_by { |key, _| [m::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |key, matches|
  source = inventory.fetch(key)
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  old = source.fetch("work_text")
  text = old.dup
  if key != ["default", "54295", ""]
    terms = english.scan(/\bDverga(?:n)?\b/i)
    ordinal = 0
    matched = 0
    pattern = /(?:드베르가|드베르간|드워가|드워간|데버가)(족|어)?(?:\((?:Dverga|Dvergan)\))?((?:으로|로|은|는|이|가|을|를|과|와)(?=[ \t\r\n,.!?]))?/
    text = text.gsub(pattern) do |span|
      noun_suffix = Regexp.last_match(1).to_s
      particle = Regexp.last_match(2).to_s
      current = ordinal
      ordinal += 1
      # Korean explicitly names the people where English uses generic dwarfs.
      next span if key == ["default", "15086", ""] && current == 1

      term = terms.fetch(matched)
      matched += 1
      adjective = term.casecmp("Dvergan").zero?
      korean = adjective && noun_suffix != "족" ? "드베르간" : "드베르가"
      consonant = noun_suffix == "족" || (noun_suffix.empty? && adjective)
      particles = consonant ? {"가"=>"이", "는"=>"은", "를"=>"을", "와"=>"과", "로"=>"으로"} :
        {"이"=>"가", "은"=>"는", "을"=>"를", "과"=>"와", "으로"=>"로"}
      korean + noun_suffix + "(#{term})" + particles.fetch(particle, particle)
    end
    raise "Korean/source span count mismatch #{key}" unless matched == terms.length
  else
    raise "complete map label missing" unless text.include?("드베르간 지도(Dvergan Map)")
  end
  if matches.any? { |r| r["entity_key"] == "place:grundholm" }
    raise "homeland span missing" unless text.include?("그룬드홀름")
    text.sub!("그룬드홀름", "그룬드홀름(Grundholm)")
  end
  entities = matches.map { |r| r["entity_key"] }.sort
  status = old == text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => entities.join("|"), "status" => status, "old" => old, "new" => text,
    "evidence" => notes + " Exact English/Japanese/Chinese row comparison approved the source-local spans. The twelve mixed-form keys preserve their ordered Dverga/Dvergan referents. At default:15086 retain the extra Korean 드베르가족 translating generic dwarfs, and annotate only two explicit source names. At default:54295 retain the complete Dvergan Map label rather than duplicating parentheses. Grundholm at default:42154 is a separate homeland. Directly affected particles follow the resulting Korean final sound. All other people, ships, book titles, quantities, tokens, paragraph breaks, prior dispositions and historical global counts remain unchanged.",
    "english" => english,
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end
raise "expected 174 distinct rows" unless reviews.length == 174
definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{start}.tsv")
review_path = File.join(__dir__, "proper-name-discovery-D#{start}.tsv")
m.write_table(definition_path, glossary.headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} rows: #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
exit unless ARGV == ["--apply"]

ReviewedProperNameDiscovery.run([definition_path, review_path, start.to_s])
(start..start + 3).each do |d|
  batch = reviews.slice((d - start) * 50, 50)
  summary = <<~TEXT

  ## D-#{d}: Dverga People And Source-Adjectival Dvergan

  Reviewed #{batch.length} distinct row keys, corrected
  #{batch.count { |r| r["old"] != r["new"] }} and retained
  #{batch.count { |r| r["old"] == r["new"] }} in this slice of the 174-row
  source review. Canonical people label is 드베르가(Dverga); Dvergan is the
  same people's source-adjectival form 드베르간(Dvergan), not a new race.
  #{batch.any? { |r| r["ID_Linha"] == "42154" } ? "Registered the separate place 그룬드홀름(Grundholm) at default:42154." : ""}
  Mixed-form rows, the complete Dvergan Map label, and generic dwarfs were
  handled explicitly. Preserve the unresolved Hreid identity relationship
  from D-21232 and all 25 prior occurrence holds. No global cumulative tally.
  Full proper-name discovery remains incomplete.
  TEXT
  %W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
    target = File.join(__dir__, filename)
    File.write(target, File.read(target) + summary)
  end
  %w[README.md decision-register-20261009.md].each do |filename|
    target = File.join(__dir__, filename)
    text = File.read(target)
    marker = d == start ? "## D-21232: Hreid Identity Link Withdrawn" :
      "## D-#{d - 1}: Dverga People And Source-Adjectival Dvergan"
    raise "missing prior summary marker" unless text.include?(marker)
    File.write(target, text.sub(marker, summary + "\n" + marker))
  end
end
