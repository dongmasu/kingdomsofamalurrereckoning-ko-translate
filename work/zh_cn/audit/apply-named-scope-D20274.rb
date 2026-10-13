path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59951;내가 찾아오라는 부탁을 받은 콜로세(Kollossae) 가보" =>
    "59951;내가 찾아오라는 부탁을 받은 콜로새(Kollossae) 가보",
  "59956;갈로우스 엔드(Gallows End) 외딴섬에 있는" =>
    "59956;갤로우즈 엔드(Gallows End) 외딴섬에 있는",
  "60000;내 손바닥 보듯 훤히 알지." =>
    "60000;굳은살 박인 내 손바닥처럼 훤히 알지."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
