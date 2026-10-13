path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61151 => ["개드플로(Gadflow)", "가드플로(Gadflow)"],
  61163 => ["하이페리온(Hyperian)", "하이페리언(Hyperian)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
