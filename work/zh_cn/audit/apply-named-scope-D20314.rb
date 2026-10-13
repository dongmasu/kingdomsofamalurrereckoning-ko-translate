path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61973 => ["라시어(Rathir)", "라시르(Rathir)"],
  61978 => ["개미안 수사(Brother Gamian)", "가미안 수사(Brother Gamian)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
