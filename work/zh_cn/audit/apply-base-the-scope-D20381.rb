require "csv"

active_path = "work/zh_cn/locatexts_zh_cn.koalocatext_base.csv"
english_path = "src/csv/en_us/locatexts_en_us.koalocatext_base.csv"

manual_translations = {
  56 => "장인의 열쇠",
  226 => "새로운 조수",
  524 => "계곡의 손싸개",
  1099 => "새로운 조수",
  1119 => "약제사의 비할 데 없는 반지",
  1168 => "신의 송곳니",
  1199 => "갤로우스 엔드의 처형된 자들",
  1440 => "보석",
  2074 => "새로운 조수",
  2129 => "새로운 조수",
  2540 => "약제사의 믿음직한 수호자",
  2547 => "참회의 고서",
  2684 => "약제사의 비할 데 없는 모자",
  2923 => "약제사의 믿음직한 수호자",
  3001 => "약제사의 비할 데 없는 칼날",
  3167 => "약제사의 비할 데 없는 모자",
  3635 => "약제사의 비할 데 없는 반지",
  4387 => "새로운 조수",
  4506 => "새로운 조수"
}

english_rows = {}
CSV.foreach(english_path, headers: true, col_sep: ";", encoding: "bom|utf-8") do |row|
  english_rows[row["ID_Linha"].to_i] = row["Texto"]
end
target_ids = english_rows.each_with_object([]) do |(id, text), ids|
  ids << id if text.start_with?("The ")
end
raise "Expected 183 English The-prefixed rows, found #{target_ids.length}" unless target_ids.length == 183

data = File.binread(active_path)
raise "Expected UTF-8 BOM" unless data.start_with?("\xEF\xBB\xBF".b)
lines = data.lines
updated = {}

target_ids.each do |id|
  source = english_rows.fetch(id)
  raise "Unexpected delimiter/newline in English source at #{id}" if source.match?(/[;\r\n]/)

  matching = lines.each_index.select do |index|
    line = lines[index].sub(/\r?\n\z/, "")
    line.start_with?("#{id};")
  end
  raise "Expected one active row for ID #{id}, found #{matching.length}" unless matching.length == 1

  index = matching.first
  line = lines[index]
  ending = line[/\r?\n\z/] || ""
  fields = line.delete_suffix(ending).sub(/\A\xEF\xBB\xBF/n, "").split(";", 3)
  raise "Unexpected active row shape at ID #{id}" unless fields.length == 3 && fields[0].to_i == id
  old_text = fields[2].force_encoding("UTF-8")

  suffix = " (#{source})"
  current_base = old_text.end_with?(suffix) ? old_text.delete_suffix(suffix) : old_text
  base = manual_translations.fetch(id, current_base)
  source_norm = source.downcase.gsub(/[^a-z0-9]/, "")
  base = base.gsub(/\s*\(([^()]*)\)/) do |match|
    parenthetical = Regexp.last_match(1).downcase.gsub(/[^a-z0-9]/, "")
    parenthetical.empty? || !source_norm.include?(parenthetical) ? match : ""
  end.strip
  new_text = "#{base}#{suffix}"
  raise "Unexpected delimiter/newline in Korean text at #{id}" if new_text.match?(/[;\r\n]/)

  prefix = "#{fields[0]};#{fields[1]}"
  bom = line.start_with?("\xEF\xBB\xBF".b) ? "\xEF\xBB\xBF".b : "".b
  lines[index] = bom + prefix.b + ";".b + new_text.encode("UTF-8").b + ending.b
  updated[id] = [old_text, new_text]
end

File.binwrite(active_path, lines.join)
puts "Updated #{updated.length} rows."
updated.each { |id, (before, after)| puts "#{id}\t#{before}\t#{after}" }
