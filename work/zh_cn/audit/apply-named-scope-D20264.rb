path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59463;웬센 왕이 알현을 기다리고 계십니다." =>
    "59463;웬센 왕께서 당신과 상의하기를 기다리고 계십니다.",
  "59492;빛바랜 화이트스톤" => "59492;더럽혀진 화이트스톤"
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected exactly one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
