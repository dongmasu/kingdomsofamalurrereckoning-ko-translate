path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  60805 => [
    ["벡컨드(Beckoned)", "부름받은 자(Beckoned)"],
    ["콜로사이(Kollossae)", "콜로세(Kollossae)"]
  ],
  60807 => [["콜로사이(Kollossae)", "콜로세(Kollossae)"]],
  60817 => [["여행자들(Travelers)", "트래블러(Travelers)"]],
  60840 => [["벡컨드(Beckoned)", "부름받은 자(Beckoned)"]]
}
data = File.read(path, encoding: "UTF-8")
edits.each do |id, pairs|
  pairs.each do |before, after|
    pattern = /(?<=\n)#{id};[^\r\n]*?#{Regexp.escape(before)}/
    raise "Expected one phrase in row #{id}" unless data.scan(pattern).length == 1
    data = data.sub(pattern) { |row| row.sub(before, after) }
  end
end
File.binwrite(path, data)
