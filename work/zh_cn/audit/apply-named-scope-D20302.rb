path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61367 => ["앨린 쉬어(Alyn Shir)", "앨린 쉬르(Alyn Shir)"],
  61375 => ["불려온 자(Beckoned)", "부름받은 자(Beckoned)"],
  61380 => ["프리즘어(Prismere)", "프리즈미어(Prismere)"],
  61399 => ["정해진 자(Preordained)", "예정된 자(Preordained)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
