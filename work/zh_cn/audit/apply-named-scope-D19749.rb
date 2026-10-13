#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19749/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

edits = {
  28408 => ["분부대로……", "무슨 분부라도……"],
  28438 => ["이건 완전히 난장판이 되겠군. 웰런(Walen)이 바지에 오줌을 지릴지 달탄(Daltan)과 내기를 했거든.",
            "이건 완전히 촌극이 되겠군. 웰런(Walen)이 바지에 오줌을 지릴지 달탄(Daltan)과 내기를 했거든."]
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
