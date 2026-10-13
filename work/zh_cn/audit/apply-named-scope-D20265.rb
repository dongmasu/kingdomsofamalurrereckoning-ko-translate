path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "59514;깊은 잠은 깨뜨리지 말아야 한다. 충고하마, 필멸자여. 꼭 필요한 일이 아니라면 백일몽에 잠긴 이들을 방해하지 마라.".b
after = "59514;깊은 잠은 깨뜨리지 말아야 한다. 충고하마, 필멸자여. 꼭 필요한 일이 아니라면 명상에 잠긴 이들을 방해하지 마라.".b
data = File.binread(path)
raise "Expected exactly one target" unless data.scan(before).length == 1
File.binwrite(path, data.sub(before, after))
