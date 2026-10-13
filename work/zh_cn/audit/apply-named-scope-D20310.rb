path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61752 => ["우리도 불려온 자(Beckoned)라고?", "우리도 부름받은 자(Beckoned)라고?"],
  61777 => ["사이온(Scion)를", "사이온(Scion)을"],
  61778 => ["{*1대장장이} 기술로", "{*1대장기술}로"],
  61786 => ["불려온 자(Beckoned)여", "부름받은 자(Beckoned)여"],
  61800 => ["프리즘어(Prismere)", "프리즈미어(Prismere)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
