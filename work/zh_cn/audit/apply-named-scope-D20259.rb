path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
data = File.binread(path)

edits = {
  "59207;나르카가 어떻게 생겨났는지는 확실히 모르지만, 플로리온은 알세룬드에서 그들을 몰아낼 방법을 알고 있어." =>
    "59207;나르카가 어떻게 생겨났는지는 확실히 모르지만, 플로리온은 알세룬드에서 그들을 몰아낼 방법을 생각해 둔 게 있어.",
  "59209;아주 오래전, 나와 알라레인은 통곡하는 왕을 독실하게 따르며 미든을 거닐었어. 그녀는 텐더였고 나는 델버였지. 우리는 각자의 첫 번째였어." =>
    "59209;아주 오래전, 나와 알라레인은 통곡하는 왕을 독실하게 따르며 미든을 거닐었어. 그녀는 텐더였고 나는 델버였지. 우리는 각자 그 역할의 시초였어.",
  "59235;엘로렌 크리에트의 주머니를 뒤졌지만, 보석함이 압수됐다는 압류 통지서만 찾았다. 아데사 무기고의 압수품 보관함에 있을 것이다." =>
    "59235;엘로렌 크리에트의 주머니를 털었지만, 보석함이 압수됐다는 압류 통지서만 찾았다. 아데사 무기고의 압수품 보관함에 있을 것이다."
}

edits.each do |before, after|
  before = before.b
  after = after.b
  count = data.scan(before).length
  raise "Expected one exact source row, found #{count}" unless count == 1
  data.sub!(before, after)
end

File.binwrite(path, data)
