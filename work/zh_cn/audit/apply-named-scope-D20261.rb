path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "59321;앞장서. 복수의 전당에서 만나자!".b
after = "59321;앞장서. 복수의 집에서 만나자!".b
data = File.binread(path)
raise "Expected exactly one target" unless data.scan(before).length == 1
File.binwrite(path, data.sub(before, after))
