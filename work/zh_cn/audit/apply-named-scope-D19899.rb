#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19899/locatexts_zh_cn.koalocatext_default.csv"
expected = "8da80d8f1a34ad8bd4435bbbaa2183605c75aa1a6e466e09fcd1adc1b8e3f265"
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
abort "backup mismatch" unless File.binread(backup) == source
ids = source.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
abort "ID order mismatch" unless ids == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  other = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  subset = other.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41201..41250).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless subset == (41201..41250).map(&:to_s)
end
before = "발라드의 가문에서 다시 이야기하자.".b
after = "발라드의 집에서 다시 이야기하자.".b
row = source.match(/^41211;.*?(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[0].scan(before).size == 1
updated = source.dup
updated[row.begin(0)...row.end(0)] = row[0].sub(before, after)
abort "inverse mismatch" unless updated.sub(after, before) == source
shape = ->(bytes) { [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
abort "shape mismatch" unless shape.call(updated) == shape.call(source)
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} inverse/BOM/endings/order/locale=OK"
