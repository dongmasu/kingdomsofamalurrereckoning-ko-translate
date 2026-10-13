path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "선각자들(The Preordained)"
after = "예정된 자들(The Preordained)"
data = File.binread(path).force_encoding("UTF-8")
pattern = /(?<=\n)62325;[^\r\n]*?#{Regexp.escape(before)}/
raise "Expected one phrase in row 62325" unless data.scan(pattern).length == 1
File.binwrite(path, data.sub(pattern) { |row| row.sub(before, after) })
