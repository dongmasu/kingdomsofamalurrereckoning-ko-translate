path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "불려온 자(Beckoned)"
after = "부름받은 자(Beckoned)"
data = File.binread(path).force_encoding("UTF-8")
pattern = /(?<=\n)61657;[^\r\n]*?#{Regexp.escape(before)}/
raise "Expected one phrase in row 61657" unless data.scan(pattern).length == 1
File.binwrite(path, data.sub(pattern) { |row| row.sub(before, after) })
