path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "라시어에서도"
after = "라시르에서도"
data = File.binread(path).force_encoding("UTF-8")
pattern = /(?<=\n)62235;[^\r\n]*?#{Regexp.escape(before)}/
raise "Expected one phrase in row 62235" unless data.scan(pattern).length == 1
File.binwrite(path, data.sub(pattern) { |row| row.sub(before, after) })
