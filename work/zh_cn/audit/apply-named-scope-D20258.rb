path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
data = File.binread(path)

edits = {
  "59156;기란은 벨렌의 유언 결사에 현혹됐다. 어쩔 수 없이 그와 그가 조종하던 꼭두각시들을 죽였다. 콜름에게 가서 무사한지 확인해야겠다." =>
    "59156;기란은 벨렌의 테스타먼트에 현혹됐다. 어쩔 수 없이 그와 그가 조종하던 꼭두각시들을 죽였다. 콜름에게 가서 무사한지 확인해야겠다.",
  "59167;지금은 복수의 전당을 지나 그 커를 죽이기만 하면 돼." =>
    "59167;지금은 복수의 집을 지나 그 커를 죽이기만 하면 돼.",
  "59194;이건 너무 시시하잖아, 친구. 마음이 바뀌면 여기서 게임을 계속할 수 있어." =>
    "59194;그건 좀 치사하잖아, 친구. 마음이 바뀌면 여기서 게임할 수 있어."
}

edits.each do |before, after|
  before = before.b
  after = after.b
  count = data.scan(before).length
  raise "Expected one exact source row, found #{count}" unless count == 1
  data.sub!(before, after)
end

File.binwrite(path, data)
