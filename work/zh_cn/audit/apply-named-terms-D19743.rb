#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-terms-D19743/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup and target differ" unless source == File.binread(path)
abort "missing UTF-8 BOM" unless source.start_with?("\xEF\xBB\xBF".b)

edits = {
  28213 => ["얼음의 힘이 깃든 신비로운 홀.", "얼음의 힘이 깃든 신비로운 셉터."],
  28249 => ["언젠가 이곳에 우리 지부 회관을 세울 수 있을지도 몰라. 라시어에 있는 곳과 견줄 만한 회관을 말이야.",
            "언젠가 이곳에 우리 지부 회관을 세울 수 있을지도 몰라. 라시르에 있는 곳과 견줄 만한 회관을 말이야."]
}

result = source.dup
edits.each do |id, (old, new_text)|
  before = "#{id};#{old}\r\n".b
  after = "#{id};#{new_text}\r\n".b
  abort "not one exact old record at #{id}" unless result.scan(before).length == 1
  result.sub!(before, after)
end
abort "inverse reconstruction failed" unless edits.reduce(result.dup) { |s, (id, (old, new_text))|
  s.sub("#{id};#{new_text}\r\n".b, "#{id};#{old}\r\n".b)
} == source
abort "record breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                    [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)

File.binwrite(path, result)
abort "on-disk hash mismatch" unless Digest::SHA256.file(path).hexdigest == Digest::SHA256.hexdigest(result)
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bare_LF=#{result.scan(/(?<!\r)\n/n).size}"
