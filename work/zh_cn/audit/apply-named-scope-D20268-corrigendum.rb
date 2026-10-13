path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "59683;흥미로운 선택이지만 틀렸어. 비탄의 집의 역사를 공부해야겠군.".b
after = "59683;흥미로운 선택이지만 틀렸어. 비탄의 집 역사를 공부해야겠군.".b
data = File.binread(path)
raise "Expected exactly one target" unless data.scan(before).length == 1
File.binwrite(path, data.sub(before, after))
