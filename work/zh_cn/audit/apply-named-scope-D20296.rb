path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61054 => ["운명 직조사단(Order of Fateweavers)", "페이트위버 교단(Order of Fateweavers)"],
  61065 => ["트래블러스(Travelers)", "트래블러(Travelers)"],
  61089 => ["엘더스트(The Eldest)을", "엘더스트(The Eldest)를"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
