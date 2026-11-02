#!/usr/bin/env ruby

require "csv"
require "json"
require "open3"

def parse(bytes)
  CSV.parse(bytes.dup.force_encoding("UTF-8").sub(/\A\uFEFF/, "").gsub("\r\n", "\n"),
            headers: true, col_sep: ";", row_sep: "\n").reject { |r| r["ID_Linha"].nil? }
end

def decode_audited_field(value)
  serialized = value.gsub("\r\n", "\n")
  CSV.parse("ID_Linha;Texto\n0;#{serialized}", headers: true,
            col_sep: ";", row_sep: "\n").first.fetch("Texto")
end

effects = JSON.parse(File.read("work/zh_cn/audit/item-effect-consistency-20261103.json"))
damage_edits = JSON.parse(File.read("work/zh_cn/audit/damage-type-consistency-20261103.json"))
damage_by_id = damage_edits.fetch("rows").to_h { |row| [row.fetch("id"), row] }
codex_edits = JSON.parse(File.read("work/zh_cn/audit/codex-term-consistency-20261103.json"))
codex_by_id = codex_edits.to_h { |row| [row.fetch("id"), row] }
dialogue_edits = JSON.parse(File.read("work/zh_cn/audit/dialogue-register-consistency-20261103.json"))
dialogue_by_id = dialogue_edits.to_h { |row| [row.fetch("id"), row] }
proper_name_edits = JSON.parse(File.read("work/zh_cn/audit/proper-name-crosscheck-20261103.json"))
proper_name_by_id = proper_name_edits.to_h { |row| [row.fetch("id"), row] }
saints = []
counts = {}
codex_source_count = 0
fate_ids = %w[
  2745 7163 9804 14334 14541 15424 20128 23680 24692 26476 26786 34645
  39464 40909 47111 52562 53721 55977 63340
]
manual_ids = %w[56331]
brother_ids = %w[
  11672 35754 47100 51594 2592 3017 6182 13815 16993 21596 45307 57474 57606
]
%w[default base affix].each do |family|
  path = "work/zh_cn/locatexts_zh_cn.koalocatext_#{family}.csv"
  before_bytes, status = Open3.capture2("git", "show", "HEAD:#{path}")
  abort "git show failed" unless status.success?
  before_bytes = before_bytes.b
  after_bytes = File.binread(path)
  before, after = parse(before_bytes), parse(after_bytes)
  abort "row count changed #{family}" unless before.length == after.length
  abort "BOM changed #{family}" unless before_bytes.byteslice(0, 3) == after_bytes.byteslice(0, 3)
  abort "EOL changed #{family}" unless before_bytes.scan(/\r\n|\n|\r/n) == after_bytes.scan(/\r\n|\n|\r/n)
  refs = %w[en_us ja_jp zh_cn].to_h do |locale|
    [locale, parse(File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{family}.csv"))
      .to_h { |r| [r["ID_Linha"], r["Texto"]] }]
  end
  changed = 0
  after.each_with_index do |row, index|
    old = before.fetch(index)
    id = row["ID_Linha"]
    abort "structural fields changed #{family}:#{id}" unless
      row.to_h.reject { |k, _| k == "Texto" } == old.to_h.reject { |k, _| k == "Texto" }
    text, previous = row["Texto"], old["Texto"]
    en = refs.fetch("en_us")[id].to_s
    if text != previous
      changed += 1
      abort "tokens changed #{family}:#{id}" unless
        text.scan(/\{[^}]*\}/) == previous.scan(/\{[^}]*\}/)
      abort "line count changed #{family}:#{id}" unless text.count("\n") == previous.count("\n")
      if family == "default" && effects.key?(id)
        effect = effects.fetch(id)
        if damage_by_id.key?(id)
          damage = damage_by_id.fetch(id)
          abort "combined effect/damage audit mismatch #{id}" unless
            effect["before"] == previous &&
            effect["after"] == decode_audited_field(damage["before"]) &&
            decode_audited_field(damage["after"]) == text
        else
          abort "effect audit mismatch #{id}" unless effect["before"] == previous &&
                                                          effect["after"] == text
        end
      elsif family == "default" && damage_by_id.key?(id)
        entry = damage_by_id.fetch(id)
        abort "damage audit mismatch #{id}" unless decode_audited_field(entry["before"]) == previous &&
                                                    decode_audited_field(entry["after"]) == text &&
                                                    decode_audited_field(entry["en"]) == en &&
                                                    decode_audited_field(entry["ja"]) == refs["ja_jp"][id] &&
                                                    decode_audited_field(entry["zh"]) == refs["zh_cn"][id]
      elsif family == "default" && codex_by_id.key?(id)
        entry = codex_by_id.fetch(id)
        abort "Codex audit mismatch #{id}" unless entry["after"] == text &&
                                                   entry["en"] == en
      elsif family == "default" && dialogue_by_id.key?(id)
        entry = dialogue_by_id.fetch(id)
        abort "dialogue audit mismatch #{id}" unless entry["before"] == previous &&
                                                      entry["after"] == text &&
                                                      entry["en"] == en &&
                                                      entry["ja"] == refs["ja_jp"][id] &&
                                                      entry["zh"] == refs["zh_cn"][id]
      elsif family == "default" && proper_name_by_id.key?(id)
        entry = proper_name_by_id.fetch(id)
        abort "proper-name audit mismatch #{id}" unless entry["before"] == previous &&
                                                         entry["after"] == text &&
                                                         entry["en"] == en &&
                                                         entry["ja"] == refs["ja_jp"][id] &&
                                                         entry["zh"] == refs["zh_cn"][id]
      elsif !en.match?(/\b(?:Odwig|Hadw[iy]n|Udo)\b/) &&
            !(family == "default" && (brother_ids.include?(id) || damage_by_id.key?(id) ||
                                      codex_by_id.key?(id) || dialogue_by_id.key?(id) ||
                                      proper_name_by_id.key?(id) || fate_ids.include?(id) ||
                                      manual_ids.include?(id)))
        abort "out-of-scope change #{family}:#{id}"
      end
    end
    next unless en.match?(/\b(?:Odwig|Hadw[iy]n|Udo)\b/) ||
                (family == "default" && brother_ids.include?(id))
    abort "old saint spelling #{family}:#{id}" if text.match?(/오드위그|해드윈|세인트|브라더/)
    abort "missing English name #{family}:#{id}" unless text.match?(/\((?:[^)]*\b)?(?:Odwig|Hadw[iy]n|Udo|Brother)[^)]*\)/)
    saints << { family: family, id: id, before: previous, after: text, changed: text != previous,
                en: en, ja: refs["ja_jp"][id], zh: refs["zh_cn"][id] }
  end
  if family == "default"
    manual_ids.each do |id|
      english = refs.fetch("en_us").fetch(id)
      korean = after.find { |row| row["ID_Linha"] == id }.fetch("Texto")
      abort "manual translation audit mismatch #{id}" unless
        english.include?("Craft Hall") && english.include?("land dispute") &&
        korean.include?("코라(Cora)") && korean.include?("장인의 전당(Craft Hall)") &&
        korean.include?("토지 분쟁")
    end
    fate_ids.each do |id|
      english = refs.fetch("en_us").fetch(id)
      korean = after.find { |row| row["ID_Linha"] == id }.fetch("Texto")
      if id == "40909"
        abort "descriptive fate-weaving mismatch #{id}" unless
          english.match?(/\bfate weaving\b/i) && korean.include?("운명의 실") &&
          !korean.include?("운명 엮기(Fateweaving)")
      else
        abort "Fateweaving terminology mismatch #{id}" unless
          english.match?(/\bFateweaving\b/i) && korean.include?("운명 엮기(Fateweaving)")
      end
    end
    damage_by_id.each do |id, entry|
      row = after.find { |candidate| candidate["ID_Linha"] == id }
      abort "damage translation mismatch #{id}" unless
        row&.fetch("Texto") == decode_audited_field(entry["after"])
      abort "damage source mismatch #{id}" unless
        refs.fetch("en_us")[id] == decode_audited_field(entry["en"]) &&
        refs.fetch("ja_jp")[id] == decode_audited_field(entry["ja"]) &&
        refs.fetch("zh_cn")[id] == decode_audited_field(entry["zh"])
    end
    codex_source_count = refs.fetch("en_us").count { |_, text| text.to_s.match?(/\bcodex\b/i) }
    refs.fetch("en_us").each do |id, english|
      next unless english.to_s.match?(/\bcodex\b/i)
      target = if english.match?(/\bCodex of Destiny\b/i)
                 "운명의 서(Codex of Destiny)"
               elsif english.match?(/\bCodex of Fate\b/i)
                 "운명의 서(Codex of Fate)"
               elsif english.match?(/\bCodex Scaith\b/i)
                 "스케이스의 서(Codex Scaith)"
               elsif english.match?(/\bCodex of Order\b/i)
                 "질서의 서(Codex of Order)"
               else
                 "코덱스(Codex)"
               end
      abort "Codex terminology mismatch default:#{id}" unless
        after.find { |row| row["ID_Linha"] == id }&.fetch("Texto")&.include?(target)
    end
    dialogue_by_id.each do |id, entry|
      abort "dialogue source mismatch #{id}" unless
        refs.fetch("en_us")[id] == entry["en"] &&
        refs.fetch("ja_jp")[id] == entry["ja"] &&
        refs.fetch("zh_cn")[id] == entry["zh"]
    end
    proper_name_by_id.each do |id, entry|
      abort "proper-name source mismatch #{id}" unless
        refs.fetch("en_us")[id] == entry["en"] &&
        refs.fetch("ja_jp")[id] == entry["ja"] &&
        refs.fetch("zh_cn")[id] == entry["zh"]
    end
  end
  counts[family] = { rows: after.length, changed: changed }
end
File.write("work/zh_cn/audit/saint-reference-consistency-20261103.json",
           JSON.pretty_generate(saints) + "\n")
puts JSON.pretty_generate(counts)
puts "saint/name review rows: #{saints.length}; changed: #{saints.count { |r| r[:changed] }}"
puts "effect audit rows: #{effects.length}"
puts "damage terminology rows: #{damage_edits.fetch("changed_rows")}"
puts "Fateweaving rows checked: #{fate_ids.length}"
puts "manual addendum rows checked: #{manual_ids.length}"
puts "Codex terminology rows: #{codex_edits.length}; source rows checked: #{codex_source_count}"
puts "Dialogue register rows: #{dialogue_edits.length}"
puts "Proper-name cross-check rows: #{proper_name_edits.length}"
puts "PASS: scope, keys/variants/order, BOM, exact EOL sequence, variables/markup, per-row line counts"
