#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19750/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

edits = {
  28480 => ["희귀한 몸통 방어구의 영웅 등급 소켓에 장착하면 방어구의 성능이 크게 향상됩니다.",
            "희귀한 몸통 방어구의 에픽 보석 소켓에 장착하면 방어구의 성능이 크게 향상됩니다."],
  28485 => ["하지만 굴착공과 석공 일을 멈추라는 명령을 받았어. 그래서 우린 티스 오브 나로스(Teeth of Naros)에 남아 있지.",
            "하지만 굴착공과 석공들을 남겨 두라는 명령을 받았어. 그래서 우린 나로스의 이빨(Teeth of Naros)에 남아 있지."],
  28487 => ["죽을 준비는 됐나, 티끌 같은 자여?", "죽을 준비는 됐나, 먼지나부랭이야?"]
}
result = source.dup
edits.each do |id, (old, new_text)|
  before = "#{id};#{old}\r\n".b
  after = "#{id};#{new_text}\r\n".b
  abort "not exactly one target #{id}" unless result.scan(before).size == 1
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
