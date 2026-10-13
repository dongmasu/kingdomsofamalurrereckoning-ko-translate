#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-lore-D19630/locatexts_zh_cn.koalocatext_default.csv"
expected_before = "f71213391a2cdc7ce77442429a6954bfc8d2ad4d3c69ffde66cb89766866cea5"

edits = [
  [
    "4753;나는 추방자 사이던(Cydan). 한때 슬픔의 집(House of Sorrows)의 왕자였지만, 내 진정한 의무는 내 종족을 위한 것이야.".b,
    "4753;나는 추방자 사이던(Cydan). 한때 비탄의 집(House of Sorrows)의 왕자였지만, 내 진정한 의무는 내 종족을 위한 것이야.".b
  ],
  [
    "4769;크리살레야(Chrysalae). 크리살레야 씨앗을 심어.".b,
    "4769;크리살라이(Chrysalae). 크리살라이 씨앗을 심어.".b
  ]
]

original = File.binread(path)
abort "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected_before
abort "backup is not byte-identical" unless File.binread(backup) == original

updated = original.dup
edits.each do |before, after|
  abort "expected exact source record once" unless updated.scan(before).length == 1
  updated.sub!(before, after)
end

reversed = updated.dup
edits.reverse_each { |before, after| reversed.sub!(after, before) }
abort "unapproved bytes changed" unless reversed == original
abort "BOM missing" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line-ending counts changed" unless [updated.scan("\r\n".b).length, updated.scan(/(?<!\r)\n/n).length] ==
  [original.scan("\r\n".b).length, original.scan(/(?<!\r)\n/n).length]

File.binwrite(path, updated)
puts "pre=#{expected_before}"
puts "post=#{Digest::SHA256.hexdigest(updated)}"
puts "crlf=#{updated.scan("\r\n".b).length} bare_lf=#{updated.scan(/(?<!\r)\n/n).length}"
