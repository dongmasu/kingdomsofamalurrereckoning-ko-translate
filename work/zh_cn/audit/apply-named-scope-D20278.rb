path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "참 볼품없는 물건이다. 갈로우스 엔드(Gallows End)" =>
    "참 볼품없는 물건이다. 갤로우즈 엔드(Gallows End)",
  "60163;갈로우스 엔드(Gallows End)" =>
    "60163;갤로우즈 엔드(Gallows End)"
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
