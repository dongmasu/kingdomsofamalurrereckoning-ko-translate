path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "광부들을 2교대로 일하게 해 손실을 만회하면 수익을 유지할 수 있다." =>
    "광부들에게 두 교대분의 일을 시켜 손실을 만회하면 수익을 유지할 수 있다.",
  "59934;이 전쟁으로 비탄의 왕이 살아 움직이던 시절을 알던" =>
    "59934;이 전쟁으로 통곡하는 왕이 살아 움직이던 시절을 알던",
  "59935;선택받은 자여, 이 터널에는 무슨 일이지?" =>
    "59935;부름받은 자여, 이 터널에는 무슨 일이지?"
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
