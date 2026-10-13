path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60923 => ["워스워른(Warsworn)", "워스원(Warsworn)"],
  60950 => ["세이지크래프트 장인", "마법물품 제작 장인"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
