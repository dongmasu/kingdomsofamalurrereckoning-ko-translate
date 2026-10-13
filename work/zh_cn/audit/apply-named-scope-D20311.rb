path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61811 => ["불려온 자(Beckoned)", "부름받은 자(Beckoned)"],
  61814 => ["개드플로(Gadflow)", "가드플로(Gadflow)"],
  61823 => ["프리즘어(Prismere)", "프리즈미어(Prismere)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
