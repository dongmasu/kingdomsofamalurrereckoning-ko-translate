path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60651 => ["벡컨드(Beckoned)", "부름받은 자(Beckoned)"],
  60658 => ["틸레라 장군(General Tilera)", "티레라 장군(General Tilera)"],
  60669 => ["휴그스(Hugues)", "휴즈(Hugues)"],
  60686 => ["벡컨드(Beckoned)", "부름받은 자(Beckoned)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
