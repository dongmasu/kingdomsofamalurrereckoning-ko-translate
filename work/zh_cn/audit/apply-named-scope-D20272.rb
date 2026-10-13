path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59865;어머니가 역병에 걸리셨어. 노인들이 가장 심하게 앓고, 모두가 이겨 내는 건 아니야." =>
    "59865;어머니가 역병에 걸리셨어. 노인들이 가장 심하게 앓고, 그중엔 살아남지 못하는 이들도 있어.",
  "59875;감전 피해가 적 사이로 전이될 확률이 40% 증가하고, 폭풍 화살(Storm Bolt)의 피해가 40% 증가합니다." =>
    "59875;감전 피해가 적 사이로 전이될 확률이 40% 증가하고, 스톰 볼트(Storm Bolt)의 피해가 40% 증가합니다.",
  "59884;비탄의 왕(King of Sorrows)의 무덤에 남은 마지막 시련까지 통과했다. 계속 나아가 투아사(Tuatha)가 그들을 이용하지 못하게 막을 수 있도록, 비사라네(Bisarane)가 비탄의 집 사람들을 구출하는 데 필요한 열쇠를 찾아야 한다." =>
    "59884;통곡하는 왕(Weeping King)의 무덤에 남은 마지막 시련까지 통과했다. 계속 나아가 투아사(Tuatha)가 그 힘을 이용하지 못하게 막을 수 있도록, 비사라네(Bisarane)가 비탄의 힘을 되찾는 데 필요한 열쇠를 찾아야 한다.",
  "59890;잘됐군. 절벽 위쪽, 캐니언 힐 유적지(Canyon Hill Site)에" =>
    "59890;잘됐군. 절벽 위쪽의 캐니언 힐(Canyon Hill Site)에",
  "59895;웬센(Wencen) 왕이 떠난 건 이상하지만, 그에게 더는 맡을 역할이 없다면 어쩔 수 없지. 이제 새로운 이야기가 시작되려나 봐." =>
    "59895;웬센(Wencen) 왕이 떠난 건 이상하지만, 그에게 더는 맡을 역할이 없다면 어쩔 수 없지. 이제는 그에게 새로운 전승이 주어지겠지."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
