path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  62093 => ["신비의 망치 재련하기", "신비한 망치 재련하기"],
  62094 => ["하이페리온(Hyperian)", "하이페리언(Hyperian)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
