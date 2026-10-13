path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60855 => ["볼건(Bolgan)", "볼간(Bolgan)"],
  60858 => ["로살파르(Ljosalfar)", "료스알브(Ljosalfar)"]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
end
File.binwrite(path, data)
