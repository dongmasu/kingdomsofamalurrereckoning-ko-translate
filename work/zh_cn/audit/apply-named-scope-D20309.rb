path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "흐느끼는 눈(Crying Eyes)를"
after = "흐느끼는 눈(Crying Eyes)을"
data = File.binread(path).force_encoding("UTF-8")
pattern = /(?<=\n)61739;[^\r\n]*?#{Regexp.escape(before)}/
raise "Expected one phrase in row 61739" unless data.scan(pattern).length == 1
File.binwrite(path, data.sub(pattern) { |row| row.sub(before, after) })
