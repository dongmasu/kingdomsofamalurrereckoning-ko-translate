#!/usr/bin/env ruby
require "json"

ROOT = File.expand_path("../../..", __dir__)
WORK = File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
AUDIT = File.join(ROOT, "work/zh_cn/audit/damage-type-consistency-20261103.json")
SOURCES = {
  en: File.join(ROOT, "src/csv/en_us/locatexts_en_us.koalocatext_default.csv"),
  ja: File.join(ROOT, "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv"),
  zh: File.join(ROOT, "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
}
BOM = "\xEF\xBB\xBF".b

def read_records(path)
  bytes = File.binread(path)
  raise "Missing UTF-8 BOM: #{path}" unless bytes.start_with?(BOM)

  body = bytes.byteslice(BOM.bytesize..).force_encoding(Encoding::UTF_8)
  header = +""
  records = {}
  order = []
  current_id = nil
  buffer = +""

  body.each_line do |line|
    if (match = /\A(\d+);/.match(line))
      if current_id
        records[current_id] = buffer
      else
        header = buffer
      end
      current_id = match[1]
      raise "Duplicate ID #{current_id} in #{path}" if records.key?(current_id)
      order << current_id
      buffer = line.dup
    elsif current_id
      buffer << line
    else
      buffer << line
    end
  end

  records[current_id] = buffer if current_id
  [bytes, header, records, order]
end

def text_for(record)
  record.sub(/\A\d+;/, "")
end

def eol_counts(bytes)
  [bytes.scan(/\r\n/n).length, bytes.scan(/(?<!\r)\n/n).length]
end

work_bytes, header, korean, order = read_records(WORK)
previous_rows = if File.exist?(AUDIT)
  JSON.parse(File.read(AUDIT)).fetch("rows", []).to_h { |row| [row.fetch("id"), row] }
else
  {}
end
sources = SOURCES.transform_values do |path|
  _bytes, _header, records, source_order = read_records(path)
  raise "Reference ID/order mismatch: #{path}" unless source_order == order
  records
end

changes = []
new_records = korean.dup

order.each do |id|
  english = text_for(sources.fetch(:en).fetch(id))
  before = text_for(korean.fetch(id))
  after = before.dup

  fire = english.match?(/\bFire Damage\b/i) ||
    english.match?(/\bFire and \d+ Burning damage\b/i)
  burning = english.match?(/\bBurning Damage\b/i) ||
    english.match?(/\bFire and \d+ Burning damage\b/i)
  lightning = english.match?(/\bLightning Damage\b/i) ||
    english.match?(/\bLightning and Shocking Damage\b/i)
  shocking = english.match?(/\bShocking Damage\b/i)
  shocking_attack = english.match?(/\bShocking attacks\b/i)
  shock_effect = english.match?(/\bShock enemies when Blocking\b/i)

  # Burning is a damage subtype, not the direct Fire damage type.
  if burning
    after.gsub!("화염 연소 피해", "화상 피해")
    after.gsub!("연소 피해", "화상 피해")
    unless fire
      after.gsub!("화염 피해량", "화상 피해")
      after.gsub!("화염 피해", "화상 피해")
    end
  end

  if lightning && shocking
    after.gsub!(
      "번개와 감전 피해",
      "번개 피해(Lightning Damage)와 감전 피해(Shocking Damage)"
    )
    after.gsub!(
      "번개 및 감전 피해",
      "번개 피해(Lightning Damage) 및 감전 피해(Shocking Damage)"
    )
  end

  if fire
    after.gsub!("화염 피해량", "화염 피해(Fire Damage)")
    after.gsub!(/화염 피해(?!\(Fire Damage\))/, "화염 피해(Fire Damage)")
  end
  if burning
    after.gsub!(/화상 피해(?!\(Burning Damage\))/, "화상 피해(Burning Damage)")
  end
  if lightning
    after.gsub!("번개 피해량", "번개 피해(Lightning Damage)")
    after.gsub!(/번개 피해(?!\(Lightning Damage\))/, "번개 피해(Lightning Damage)")
  end
  if shocking
    after.gsub!("충격 피해", "감전 피해")
    after.gsub!(/감전 피해(?!\(Shocking Damage\))/, "감전 피해(Shocking Damage)")
  end
  after.gsub!("감전 공격을", "감전 공격(Shocking attacks)을") if shocking_attack
  if shock_effect
    after.gsub!("막을 때 적에게 감전 피해를 줍니다.", "막을 때 적을 감전시킵니다.")
  end
  after.gsub!("번개 피해(Lightning Damage)을 높이는", "번개 피해(Lightning Damage)를 높이는")
  after.gsub!("화염 피해(Fire Damage)을 높이는", "화염 피해(Fire Damage)를 높이는")

  # The in-game glossary explicitly distinguishes the three elemental types
  # from the three damage-over-time subtypes.
  if id == "64998"
    after.gsub!(
      "물리, 관통, 화염, 냉기, 번개, 독, 출혈",
      "물리(Physical), 관통(Piercing), 화염(Fire), 냉기(Ice), 번개(Lightning), 독(Poison), 출혈(Bleeding)"
    )
    after.gsub!(
      "화염, 냉기, 번개는",
      "화염(Fire), 냉기(Ice), 번개(Lightning)는"
    )
    after.gsub!(
      "화상, 동결, 감전의",
      "화상(Burning), 동결(Freezing), 감전(Shocking)의"
    )
  end

  raise "Unpaired Fire term at ID #{id}" if fire && after.match?(/화염 피해(?!\(Fire Damage\))/)
  raise "Unpaired Burning term at ID #{id}" if burning &&
    after.match?(/연소 피해|화염 연소 피해|화상 피해(?!\(Burning Damage\))/)
  raise "Unpaired Lightning term at ID #{id}" if lightning &&
    after.match?(/번개 피해(?!\(Lightning Damage\))/)
  raise "Unpaired Shocking term at ID #{id}" if shocking &&
    after.match?(/충격 피해|감전 피해(?!\(Shocking Damage\))/)

  next if after == before && !previous_rows.key?(id)

  new_records[id] = "#{id};#{after}" if after != before
  changes << {
    id: id,
    types: [
      ("Fire Damage" if fire),
      ("Burning Damage" if burning),
      ("Lightning Damage" if lightning),
      ("Shocking Damage" if shocking),
      ("Shocking attacks" if shocking_attack),
      ("Shock effect (not a damage type)" if shock_effect),
      ("Damage Type glossary" if id == "64998")
    ].compact,
    en: english.strip,
    ja: text_for(sources.fetch(:ja).fetch(id)).strip,
    zh: text_for(sources.fetch(:zh).fetch(id)).strip,
    before: previous_rows.dig(id, "before") || before.strip,
    after: after.strip
  }
end

output = BOM + header.b + order.map { |id| new_records.fetch(id).b }.join.b
raise "CSV row/order changed" unless new_records.keys.sort == korean.keys.sort
raise "BOM changed" unless output.start_with?(BOM)
raise "Line endings changed" unless eol_counts(output) == eol_counts(work_bytes)

file_changes = order.count { |id| new_records.fetch(id) != korean.fetch(id) }
File.binwrite(WORK, output) unless file_changes.zero?
File.write(
  AUDIT,
  JSON.pretty_generate(
    date: "2026-11-03",
    terminology: {
      "Fire Damage" => "화염 피해(Fire Damage)",
      "Burning Damage" => "화상 피해(Burning Damage)",
      "Lightning Damage" => "번개 피해(Lightning Damage)",
      "Shocking Damage" => "감전 피해(Shocking Damage)"
    },
    changed_rows: changes.length,
    line_endings: { crlf: eol_counts(output)[0], lone_lf: eol_counts(output)[1] },
    rows: changes
  ) + "\n"
)

puts "Updated #{file_changes} default rows; audit covers #{changes.length} rows."
puts "IDs updated now: #{order.select { |id| new_records[id] != korean[id] }.join(', ')}"
puts "BOM intact; CRLF=#{eol_counts(output)[0]}, lone LF=#{eol_counts(output)[1]}."
