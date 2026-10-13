#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-ability-D19629/locatexts_zh_cn.koalocatext_default.csv"
expected_before = "0159e93aeca3e4c4d83718fc5132407071ac6ed2889ac59a7209acf7092f61f4"
expected_backup = "569a92d9a7fadd7ae84e4add086f2f0b05453fae9d7b8887e0c3525b064aaad2"

edits = [
  [
    "4680;이건 전통적인 의미의 의식이 아니야. 우리가 이렇게까지 몰락한 적도, 이런 확신의 행동이 필요했던 적도 없었어.".b,
    "4680;이건 전통적인 의미의 의식이 아니야. 우리가 이렇게까지 몰락한 적도, 이런 결의를 보여 주는 행동이 필요했던 적도 없었어.".b
  ],
  [
    "4681;연금술 실습 해설서".b,
    "4681;연금술 실천 해설서".b
  ]
]

original = File.binread(path)
baseline = File.binread(backup)
abort "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected_before
abort "unexpected backup hash" unless Digest::SHA256.hexdigest(baseline) == expected_backup

updated = original.dup
edits.each do |before, after|
  abort "expected exact source record once" unless updated.scan(before).length == 1
  updated.sub!(before, after)
end

reversed = updated.dup
edits.reverse_each { |before, after| reversed.sub!(after, before) }
reversed.sub!("4672;\"{*1[액티브]}".b, "4672;\"{*1[사용 능력]}".b)
abort "unapproved bytes changed" unless reversed == baseline
abort "BOM missing" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line-ending counts changed" unless [updated.scan("\r\n".b).length, updated.scan(/(?<!\r)\n/n).length] ==
  [original.scan("\r\n".b).length, original.scan(/(?<!\r)\n/n).length]

File.binwrite(path, updated)
puts "pre=#{expected_backup}"
puts "post=#{Digest::SHA256.hexdigest(updated)}"
puts "crlf=#{updated.scan("\r\n".b).length} bare_lf=#{updated.scan(/(?<!\r)\n/n).length}"
