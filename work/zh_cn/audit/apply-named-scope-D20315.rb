path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  62004 => ["고대 미사루 도시", "고대 미타란 도시"],
  62014 => ["아포티르(Apotyre)", "아포타이어(Apotyre)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
