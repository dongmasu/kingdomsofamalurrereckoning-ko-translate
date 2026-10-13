#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-plumb-D19646/locatexts_zh_cn.koalocatext_default.csv"
expected = "2ee10c3cddf17eec601215eeaba0a6862983bbf66ddbf5f194803ac3e76ca5d6"
old = "8500;미타란 프리즈미어 배관".b
replacement = "8500;미타란 프리즈미어 플럼(Plumb)".b

before = File.binread(path)
abort "active CSV hash changed" unless Digest::SHA256.hexdigest(before) == expected
abort "backup differs" unless File.binread(backup) == before
abort "not exactly one target row" unless before.scan(old).length == 1
after = before.sub(old, replacement)
abort "inverse mismatch" unless after.sub(replacement, old) == before
abort "BOM changed" unless after.start_with?("\xEF\xBB\xBF".b)
shape = ->(data) {
  [
    data.scan("\r\n".b).size, data.scan(/(?<!\r)\n/n).size,
    data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact
  ]
}
abort "line endings or ID order changed" unless shape.call(before) == shape.call(after)
File.binwrite(path, after)
puts "edited=8500 post=#{Digest::SHA256.hexdigest(after)} inverse/BOM/order/line-endings=OK"
