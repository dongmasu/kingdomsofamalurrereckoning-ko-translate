path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "상기질 선택"
after = "다혈질 선택"
data = File.binread(path).force_encoding("UTF-8")
pattern = /(?<=\n)62166;[^\r\n]*?#{Regexp.escape(before)}/
raise "Expected one phrase in row 62166" unless data.scan(pattern).length == 1
File.binwrite(path, data.sub(pattern) { |row| row.sub(before, after) })
