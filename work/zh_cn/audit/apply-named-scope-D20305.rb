path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61512 => ["트래블러스(Travelers)", "트래블러(Travelers)"],
  61513 => ["미사란(Mitharan)", "미타란(Mitharan)"],
  61526 => ["불려온 자(Beckoned)", "부름받은 자(Beckoned)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
