path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60606 => [
    "데타이어(Detyre) 황무지 최고의 세이지크래프트!",
    "데티르(Detyre) 황무지 최고의 마법물품 제작!"
  ],
  60611 => [
    "물론 늙은 포모러스 휴그스(Fomorous Hugues)지!",
    "물론 늙은 포모러스 휴즈(Fomorous Hugues)지!"
  ]
}

data = File.read(path, encoding: "UTF-8")
edits.each do |id, (before, after)|
  pattern = /(?<=\n)#{id};#{Regexp.escape(before)}/
  raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern, "#{id};#{after}")
end
File.binwrite(path, data)
