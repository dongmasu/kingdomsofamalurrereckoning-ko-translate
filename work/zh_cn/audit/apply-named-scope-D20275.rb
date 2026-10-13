path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "60025;선택받은 자여, 정말 많은 은혜를 입었네." =>
    "60025;부름받은 자여, 정말 많은 은혜를 입었네.",
  "60037;멜 아글리르(Mel Aglir)에 도착했다. 이디리스(Idris)의 과제를 마치려면 아르카나 총람(Omnibus Arcana)의 쪽지를 읽고 다음 목적지를 알아내야 한다." =>
    "60037;멜 아글리르(Mel Aglir)에 도착했다. 이디리스(Idris)의 과제를 마치려면 아르카나 총람(Omnibus Arcana)의 페이지를 읽어 다음 목적지를 알아내야 한다."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
