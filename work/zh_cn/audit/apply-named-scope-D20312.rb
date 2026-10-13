path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "아르긴(Argine)"
after = "아르진(Argine)"
data = File.binread(path).force_encoding("UTF-8")
pattern = /(?<=\n)61857;[^\r\n]*?#{Regexp.escape(before)}/
raise "Expected one phrase in row 61857" unless data.scan(pattern).length == 1
File.binwrite(path, data.sub(pattern) { |row| row.sub(before, after) })
