#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19745/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

edits = {
  28269 => ["뭐야, 우울한 멜 센시르(Mel Senshir)에 활기를 불어넣으러 왔나? 워스워른 대열에 끼어 싸우러 왔어? 아니… 넌 평범한 병졸은 아니겠군?",
            "뭐야, 우울한 멜 센시르(Mel Senshir)에 활기를 불어넣으러 왔나? 워스원(Warsworn) 대열에 끼어 싸우러 왔어? 아니… 넌 평범한 병졸은 아니겠군?"],
  28282 => ["교수대 나무가 더럽혀지고 미든(The Midden)은 짓밟혔다. 이제 마지막 남은 타이브리아(Taibreah) 말고는 누구도 서로의 슬픔을 들을 수 없어.",
            "교수대 나무가 더럽혀지고 미든(The Midden)은 짓밟혔다. 이제 마지막 남은 타이브리아(Taibreah) 말고는 누구도 다른 이들의 슬픔을 들을 수 없어."]
}

result = source.dup
edits.each do |id, (old, new_text)|
  before = "#{id};#{old}\r\n".b
  after = "#{id};#{new_text}\r\n".b
  abort "not exactly one target #{id}" unless result.scan(before).length == 1
  result.sub!(before, after)
end
abort "inverse mismatch" unless edits.reduce(result.dup) { |bytes, (id, (old, new_text))|
  bytes.sub("#{id};#{new_text}\r\n".b, "#{id};#{old}\r\n".b)
} == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "record breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                    [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "on-disk mismatch" unless Digest::SHA256.file(path).hexdigest == Digest::SHA256.hexdigest(result)
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bare_LF=#{result.scan(/(?<!\r)\n/n).size}"
