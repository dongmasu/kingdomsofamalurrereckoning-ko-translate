path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
before = "59450;세칸드라와 나는 하이페리안 단지를 탈출했다. 그곳에서 아노카토스는 나를 속여 신들의 유물인 하이페리안에 접근할 수 있게 했다.".b
after = "59450;세칸드라와 나는 하이페리안 단지를 탈출했다. 그곳에서 아노카토스는 나를 속여 신들의 유물인 하이페리안에 접근할 권한을 얻었다.".b
data = File.binread(path)
raise "Expected exactly one target" unless data.scan(before).length == 1
File.binwrite(path, data.sub(before, after))
