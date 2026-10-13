path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "61323;내가 그대를 나로스의 이빨(Teeth of Naros)에 이르는 길로 인도하리라."
after = "61323;내가 그대를 위해 나로스의 이빨(Teeth of Naros)에 이르는 길을 열어 주리라."
data = File.read(path, encoding: "UTF-8")
raise "Expected one phrase in row 61323" unless data.scan(/(?<=\n)#{Regexp.escape(before)}/).length == 1
File.binwrite(path, data.sub(before, after))
