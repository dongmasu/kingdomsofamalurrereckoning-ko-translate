path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
data = File.binread(path)

before = "59294;대장장이 기술을 익히면 수리 도구의 효율이 높아져 야외에서도 장비를 손볼 수 있습니다.".b
after = "59294;대장기술을 익히면 수리 도구의 효율이 높아져 야외에서도 장비를 손볼 수 있습니다.".b

count = data.scan(before).length
raise "Expected one exact source row, found #{count}" unless count == 1
File.binwrite(path, data.sub(before, after))
