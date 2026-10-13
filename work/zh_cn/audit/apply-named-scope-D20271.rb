path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59801;포세이큰 평원에서 조심해야 할 위험은 오리에이터의 무덤뿐만이 아니야. 자유민들이" =>
    "59801;포세이큰 평원에서 조심해야 할 위험은 오리에이터의 무덤뿐만이 아니야. 프리맨(Freemen)들이",
  "59810;한동안 가문은 이 땅을 갈라놓는 전쟁을 피해 왔지만" =>
    "59810;한동안 비탄의 집은 이 땅을 갈라놓는 전쟁을 피해 왔지만",
  "59830;감방 열기" => "59830;철창 열기",
  "59831;위대한 미타루여!" => "59831;위대한 미사루여!",
  "59837;이 재조립된 지도에는 교수대 끝의 북쪽 해안이" =>
    "59837;이 재조립된 지도에는 갤로우즈 엔드의 북쪽 해안이"
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
