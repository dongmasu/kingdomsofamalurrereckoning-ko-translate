path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61917 => ["거의 맞힐 뻔했군.", "이번엔 걸려들지 않았군."],
  61923 => ["케스터 발케이(Kester Barlcay)", "케스터 바클레이(Kester Barlcay)"],
  61949 => ["버려진 부적", "저주받은 부적"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
