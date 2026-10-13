path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59565;그래? 그이는 어때?" => "59565;그래? 그 사람은 어때?",
  "59580;내 운명을 이해하게 됐다." => "59580;내 운명을 알기 위해 왔어."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected exactly one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
