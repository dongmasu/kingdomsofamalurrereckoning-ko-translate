path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "아포티르(Apotyre)"
after = "아포타이어(Apotyre)"
data = File.binread(path).force_encoding("UTF-8")
pattern = /(?<=\n)62269;[^\r\n]*?#{Regexp.escape(before)}/
raise "Expected one phrase in row 62269" unless data.scan(pattern).length == 1
File.binwrite(path, data.sub(pattern) { |row| row.sub(before, after) })
