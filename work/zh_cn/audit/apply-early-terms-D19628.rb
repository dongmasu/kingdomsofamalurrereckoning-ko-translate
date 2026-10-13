#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-terms-D19628/locatexts_zh_cn.koalocatext_default.csv"
expected_before = "3cfde536c074dc853a732a28ec6f380c242f9959cafb5748f8a487f92479f77e"

edits = [
  [
    "4623;도시에 새로 도착한 사람들을 분류하는 데 쓰여. 모두가 있어야 할 자리에 배치되도록 하려는 거지.".b,
    "4623;그들은 도시에 새로 도착한 사람들을 분류하는 일을 도와. 모두가 있어야 할 자리에 배치되도록 하려는 거지.".b
  ],
  [
    "4626;초대받은 자가 누구냐고? 신들의 상징인 암호(Cipher)를 지닌 자. 내 동족의 고난을 망설임 없이 마주하는 자. 그 초대받은 자가 바로 너다.".b,
    "4626;부름받은 자가 누구냐고? 신들의 상징인 사이퍼(Cipher)를 지닌 자. 내 동족의 고난을 망설임 없이 마주하는 자. 그 부름받은 자가 바로 너다.".b
  ]
]

abort "backup missing" unless File.binread(backup)
original = File.binread(path)
abort "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected_before
abort "backup is not byte-identical" unless File.binread(backup) == original

updated = original.dup
edits.each do |before, after|
  abort "expected exact source record once" unless updated.scan(before).length == 1
  updated.sub!(before, after)
end

abort "BOM missing" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line-ending counts changed" unless [updated.scan("\r\n".b).length, updated.scan(/(?<!\r)\n/n).length] ==
  [original.scan("\r\n".b).length, original.scan(/(?<!\r)\n/n).length]

reversed = updated.dup
edits.reverse_each { |before, after| reversed.sub!(after, before) }
abort "unapproved bytes changed" unless reversed == original

File.binwrite(path, updated)
puts "pre=#{expected_before}"
puts "post=#{Digest::SHA256.hexdigest(updated)}"
puts "crlf=#{updated.scan("\r\n".b).length} bare_lf=#{updated.scan(/(?<!\r)\n/n).length}"
