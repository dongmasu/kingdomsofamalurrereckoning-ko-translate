path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60955 => ["벡컨드(Beckoned)", "부름받은 자(Beckoned)"],
  60956 => ["페이랜드(Faelands)", "패란즈(Faelands)"],
  60975 => ["예언자(Augur)", "오거(Augur)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
before, after = "아포타이어(Apotyre)", "아포티아(Apotyre)"
pattern = /(?<=\n)60993;.*?#{Regexp.escape(before)}/m
raise "Expected one 60993 phrase" unless data.scan(pattern).length == 1
data = data.sub(pattern) { |row| row.sub(before, after) }
File.binwrite(path, data)
