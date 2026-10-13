path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "61262;아주 잘했어. 감탄했네. 교수대 끝(Gallows End)에는 강한 전사라면 언제든 환영이야."
after = "61262;아주 잘했어. 감탄했네. 갤로스 엔드(Gallows End)에는 강한 전사라면 언제든 환영이야."
data = File.read(path, encoding: "UTF-8")
raise "Expected one complete row" unless data.scan(/(?<=\n)#{Regexp.escape(before)}(?=\r?\n)/).length == 1
File.binwrite(path, data.sub(before, after))
