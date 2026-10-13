path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60773 => ["틸레라(Tilera)", "티레라(Tilera)"],
  60780 => ["벡컨드(Beckoned)", "부름받은 자(Beckoned)"],
  60798 => ["숄리아 아르카나(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
