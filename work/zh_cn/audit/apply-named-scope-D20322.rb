path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  62362 => ["케이프 솔라스(Cape Solace)", "케이프 솔러스(Cape Solace)"],
  62363 => ["완벽한 미타란", "흠 없는 미타란"],
  62371 => ["교만의 집(House of Pride)", "긍지의 집(House of Pride)"],
  62385 => ["라시어(Rathir)", "라시르(Rathir)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
