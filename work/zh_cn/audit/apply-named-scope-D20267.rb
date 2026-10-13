path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59604;\"이제 에메랄드 날개다." => "59604;\"이제 에메랄드 관이다.",
  "악의에 찬 목적을 품은 수수께끼의 지하 묘지 대신 세상에 더 많은 경이로움을 보여 줄 수 있었을 텐데." =>
    "복수심으로 지은 수수께끼의 지하 묘지 대신 세상에 더 많은 경이로움을 보여 줄 수 있었을 텐데.",
  "59643;배를 타고 싶어." => "59643;항해하고 싶어."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected exactly one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
