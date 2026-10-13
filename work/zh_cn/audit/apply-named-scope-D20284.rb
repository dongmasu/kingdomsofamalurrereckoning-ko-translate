path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60458 => [
    "완벽한 미사루 확대 지렛목",
    "완벽한 미타란 확대 지렛목"
  ],
  60460 => [
    "네 물약 덕분에 페이(Fae)가 회복했어. 완전히 나아서 회복할 때까지 앞으로 몇 주 동안 마을에 머물고 싶다더군.",
    "네 물약 덕분에 페이(Fae)가 한결 나아졌어. 앞으로 몇 주 동안 마을에 머물며 완전히 회복하고 싶다더군."
  ]
}

data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};#{Regexp.escape(before)}(?=\r?\n)/
  raise "Expected one complete row for #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern, "#{id};#{after}")
end
File.binwrite(path, data)
