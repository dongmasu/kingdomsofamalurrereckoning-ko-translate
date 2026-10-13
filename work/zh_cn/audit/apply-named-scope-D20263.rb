path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59416;때로는 원래의 질서를 되찾으려면 극단적인 행동이 필요해. 미타루께서는 내가 바로잡기를 바라셔." =>
    "59416;때로는 원래의 질서를 되찾으려면 극단적인 행동이 필요해. 미사루께서는 내가 바로잡기를 바라셔.",
  "59417;대장장이 기술" => "59417;대장기술",
  "59450;세칸드라와 나는 아노카토스가 속여서 신들의 유물인 하이페리안에 들어가게 해 준 하이페리안 단지를 탈출했다." =>
    "59450;세칸드라와 나는 하이페리안 단지를 탈출했다. 그곳에서 아노카토스는 나를 속여 신들의 유물인 하이페리안에 접근할 권한을 얻었다."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected exactly one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
