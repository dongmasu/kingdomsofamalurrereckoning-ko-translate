path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
data = File.binread(path)

edits = {
  "59101;실의 아만의 굴은 멀지 않아. 바로 여기 여름의 요람에 있지. 지금 그리로 가는 중이야. 그곳이 날 구원해 줄 거야." =>
    "59101;실에 있는 아만의 굴은 멀지 않아. 바로 여기 여름의 요람에 있지. 지금 그리로 가는 중이야. 그곳이 날 구원해 줄 거야.",
  "59150;미타루께서 결국 우리를 해방해 주실 거야. 이 모든 것도 그분의 위대한 계획의 일부지." =>
    "59150;미사루께서 결국 우리를 해방해 주실 거야. 이 모든 것도 그분의 위대한 계획의 일부지."
}

edits.each do |before, after|
  before = before.b
  after = after.b
  count = data.scan(before).length
  raise "Expected one exact source row, found #{count}" unless count == 1
  data.sub!(before, after)
end

File.binwrite(path, data)
