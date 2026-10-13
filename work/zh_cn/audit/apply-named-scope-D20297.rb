path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61101 => ["콜로사이(Kollossae)", "콜로세(Kollossae)"],
  61133 => ["숄리아 아르카나(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"],
  61143 => ["틸레라(Tilera)", "티레라(Tilera)"],
  61147 => ["개드플로(Gadflow)", "가드플로(Gadflow)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
