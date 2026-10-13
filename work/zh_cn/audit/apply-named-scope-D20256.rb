path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
data = File.binread(path)

edits = {
  "59059;멜 센시르의 위대한 영웅인 당신이 오셨군요. 뵙게 되어 영광입니다. 유언 결사에 맞서도록 도와주시겠습니까?" =>
    "59059;멜 센시르의 위대한 영웅인 당신이 오셨군요. 뵙게 되어 영광입니다. 테스타먼트에 맞서도록 도와주시겠습니까?",
  "59079;자유민을 적으로 돌렸구나, 이 자식아." =>
    "59079;프리맨(Freemen)을 적으로 돌렸구나, 이 자식아."
}

edits.each do |before, after|
  before = before.b
  after = after.b
  count = data.scan(before).length
  raise "Expected one exact source row, found #{count}" unless count == 1
  data.sub!(before, after)
end

File.binwrite(path, data)
