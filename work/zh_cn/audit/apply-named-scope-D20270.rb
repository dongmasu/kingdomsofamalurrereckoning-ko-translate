path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59755;미타루" => "59755;미사루",
  "59782;디뉴엘 신부와 다른 이들은 바보야. 그들의 어리석은 선교 사업은 시들고 무너질 거야." =>
    "59782;디뉴엘 신부와 다른 이들은 바보야. 그들의 어리석은 선교소는 쇠락해 무너질 거야.",
  "59787;우린 네게 큰 빚을 졌어. 눈을 뜨고 칼을 뽑았지. 클루리콘은 손에 넣었지만, 최종 목표로 가는 길에는 자존심의 가문이 버티고 있어." =>
    "59787;우린 네게 큰 빚을 졌어. 눈을 뜨고 칼을 뽑았지. 클루리콘은 손에 넣었지만, 최종 목표로 가는 길에는 긍지의 집이 버티고 있어."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
