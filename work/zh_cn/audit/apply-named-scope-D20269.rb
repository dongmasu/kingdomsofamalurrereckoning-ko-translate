path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59703;교수대 끝에 신이 있었던 적은 없지만" =>
    "59703;갤로우즈 엔드에 신이 있었던 적은 없지만",
  "59708;혼란을 풀어 주지. 나는 비사라네, 가문의 왕이다." =>
    "59708;혼란을 풀어 주지. 나는 비사라네, 비탄의 집을 다스리는 왕이다.",
  "59735;슬픔의 가문 페이블레이드 발견" =>
    "59735;비탄의 집 페이블레이드 발견"
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
start = data.index("59722;\"".b)
finish = data.index("59723;".b, start)
raise "Sermon record not found" unless start && finish
sermon = data.byteslice(start...finish)
{
  "미타루의 교단이".b => "미사루의 질서가".b,
  "미타루께서는".b => "미사루께서는".b
}.each do |before, after|
  raise "Expected one sermon term" unless sermon.scan(before).length == 1
  sermon = sermon.sub(before, after)
end
File.binwrite(path, data.byteslice(0...start) + sermon + data.byteslice(finish..))
