#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-subfindings-D19748/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

edits = {
  28307 => ["위압적이고 성난 생명체들이지. 우리 콜로사이(Kollossae)는 그들 대부분을 이 근방에서 몰아내는 데 성공했어.",
            "위압적이고 분개한 생명체들이지. 우리 콜로사이(Kollossae)는 그들 대부분을 이 근방에서 몰아내는 데 성공했어."],
  28317 => ["그렇다면 네가 이곳에 나타나 이야기의 흐름을 바꾸리라는 할람(Hallam)의 예측이 맞았군. 그를 의심하지 말았어야 했어.",
            "그렇다면 네가 이곳에 나타나 전승(The Telling)을 바꾸리라는 할람(Hallam)의 예측이 맞았군. 그를 의심하지 말았어야 했어."],
  28350 => ["도박 한판 어때? 케스트(Kest)의 판으로 가면 돼.",
            "도박 한판 어때? 케스트(Kest)의 도박 테이블로 가면 돼."],
  28387 => ["나무를 그들이 심었으니까.", "나무를 그들이 키웠으니까."],
  28400 => ["조각가는 형상을 빚고, 건축가는 건물을 세우고, 형성자는 세상을 지어냈다.",
            "조각가는 형상을 빚고, 건축가는 건물을 세우고, 형성자는 구성을 짰다."]
}

result = source.dup
edits.each do |id, (old, new_text)|
  start = result.index(/\n#{id};/n)
  abort "missing record #{id}" unless start
  finish = result.index(/\n\d+;/n, start + 1) || result.size
  record = result.byteslice(start, finish - start)
  abort "not one clause at #{id}" unless record.scan(old.b).size == 1 && result.scan(old.b).size == 1
  result.sub!(old.b, new_text.b)
end
abort "inverse mismatch" unless edits.reduce(result.dup) { |bytes, (_id, (old, new_text))|
  bytes.sub(new_text.b, old.b)
} == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "record breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                    [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "on-disk mismatch" unless Digest::SHA256.file(path).hexdigest == Digest::SHA256.hexdigest(result)
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bare_LF=#{result.scan(/(?<!\r)\n/n).size}"
