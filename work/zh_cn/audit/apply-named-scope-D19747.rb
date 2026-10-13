#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19747/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

edits = {
  28360 => ["꿰뚫는 빛(Piercing Light) 찾기", "관통의 빛(Piercing Light) 찾기"],
  28388 => ["여행자 리나 아딘(Lina Ardeen)이 선버그(Sun Camp)에 사는 동족에게서 화이트스톤(Whitestone) 시장이 훔친 물건을 되찾도록 도와야 한다. 시장의 집은 여러 층으로 되어 있다. 먼저 위층으로 이어지는 통로의 문을 열어야 한다.",
            "트래블러 리나 아딘(Lina Ardeen)이 태양 야영지(Sun Camp)에 사는 동족에게서 화이트스톤(Whitestone) 시장이 훔친 물건을 되찾도록 도와야 한다. 시장의 집은 여러 층으로 되어 있다. 먼저 위층으로 이어지는 통로의 문을 열어야 한다."],
  28393 => ["워스워른(Warsworn)", "워스원(Warsworn)"]
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
