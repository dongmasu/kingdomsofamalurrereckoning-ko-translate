path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61571 => ["슬픔의 집(House of Sorrows)", "비탄의 집(House of Sorrows)"],
  61572 => ["불려온 자(Beckoned)", "부름받은 자(Beckoned)"],
  61577 => ["쉬어 부인(Lady Shir)", "쉬르 부인(Lady Shir)"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
