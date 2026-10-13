path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "61003;미타란 프리즘어 경비병(Mitharan Prismere Guard)"
after = "61003;미타란 프리즈미어 경비병(Mitharan Prismere Guard)"
data = File.read(path, encoding: "UTF-8")
raise "Expected one complete row" unless data.scan(/(?<=\n)#{Regexp.escape(before)}(?=\r?\n)/).length == 1
File.binwrite(path, data.sub(before, after))
