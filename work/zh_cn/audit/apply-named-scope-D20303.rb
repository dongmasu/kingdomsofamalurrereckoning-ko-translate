path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  61415 => ["장차 누구가 될지는", "장차 누가 될지는"],
  61420 => ["그자리에 없으니 운이 좋았지.", "그자가 여기 없으니 운이 좋았지."],
  61469 => ["다음 상대가 방금 도착했는데", "다음 경기 일정이 방금 잡혔는데"]
}
data = File.binread(path).force_encoding("UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
