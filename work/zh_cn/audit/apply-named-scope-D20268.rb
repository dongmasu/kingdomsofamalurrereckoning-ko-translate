path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59671;아이튼은 조용한 작은 마을이야. 범죄는 대부분 지나가는 여행객이나 빌어먹을 자유민들이 저지르지." =>
    "59671;아이튼은 조용한 작은 마을이야. 범죄는 대부분 지나가는 여행객이나 빌어먹을 프리맨(Freemen)들이 저지르지.",
  "59683;흥미로운 선택이지만 틀렸어. 슬픔의 가문의 역사를 공부해야겠군." =>
    "59683;흥미로운 선택이지만 틀렸어. 비탄의 집 역사를 공부해야겠군."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected exactly one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
