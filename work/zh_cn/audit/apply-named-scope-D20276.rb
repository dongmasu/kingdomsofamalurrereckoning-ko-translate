path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "60064;처음엔 클루리콘(Klurikon)으로 파병된다는 말에 크게 걱정했어."
after = "60064;처음엔 클루리콘(Klurikon)에서 복무하게 된다는 말에 크게 걱정했어."
data = File.binread(path)
raise "Expected one #{before}" unless data.scan(before.b).length == 1
File.binwrite(path, data.sub(before.b, after.b))
