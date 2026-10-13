path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "아니, 감시대는 부패하지 않아. 그들을 믿지 못한다면 우린 아무도 믿을 수 없어."
after = "아니, 감시대는 부패하지 않아. 그들을 믿지 못한다면 우리에겐 아무것도 남지 않아."
data = File.binread(path)
raise "Expected one source phrase" unless data.scan(before.b).length == 1
File.binwrite(path, data.sub(before.b, after.b))
