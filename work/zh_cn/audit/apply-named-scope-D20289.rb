path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60718 => ["숄리아 아르카나(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"],
  60733 => ["워스워른(Warsworn)", "워스원(Warsworn)"],
  60744 => ["벡컨드(Beckoned)", "부름받은 자(Beckoned)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
