path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "60143;비탄의 왕(King of Sorrows)의 얼굴을 본뜬 조각상이다."
after = "60143;통곡하는 왕(King of Sorrows)의 얼굴을 본뜬 조각상이다."
data = File.binread(path)
raise "Expected one #{before}" unless data.scan(before.b).length == 1
File.binwrite(path, data.sub(before.b, after.b))
