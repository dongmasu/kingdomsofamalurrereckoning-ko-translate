path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
changes = {
  "59390;스콜라 아르카나에 여동생이 있어." => "59390;스콜라 아르카나에 내 누이가 있어.",
  "59393;그다지 다정한 사람은 아니었지만, 죽은 이제 와서 험담하고 싶지는 않아." =>
    "59393;그다지 다정한 사람은 아니었지만, 이제 곁에 없는 그를 험담하고 싶지는 않아."
}
data = File.binread(path)
changes.each do |before, after|
  raise "Expected exactly one #{before}" unless data.scan(before.b).length == 1
  data = data.sub(before.b, after.b)
end
File.binwrite(path, data)
