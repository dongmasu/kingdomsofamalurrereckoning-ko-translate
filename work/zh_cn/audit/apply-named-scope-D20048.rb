#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20048/locatexts_zh_cn.koalocatext_default.csv"
expected = "eb0e5f01113e53da19d8a42093bebf4f4c3afb4a2b0d9fbf64190379be672afd"
old = "그 늙은이는 도통 남의 말을 들으려 하지 않았어.".b
replacement = "그 늙은 바보는 도통 이치에 맞는 말을 들으려 하지 않았어.".b

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
match = source.match(/^48697;(.*?)(?=^\d+;|\z)/mn)
abort "target row missing" unless match
row = match[0]
abort "fragment missing or duplicated" unless row.scan(old).length == 1
updated = source.dup
updated[match.begin(0)...match.end(0)] = row.sub(old, replacement)
inverse = updated.dup
match = inverse.match(/^48697;(.*?)(?=^\d+;|\z)/mn)
abort "inverse target missing" unless match && match[0].scan(replacement).length == 1
inverse[match.begin(0)...match.end(0)] = match[0].sub(replacement, old)
abort "other bytes changed" unless inverse == source
shape = ->(bytes) {
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
}
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "ordered ID count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (48651..48700).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=48697 inverse/BOM/endings/order=OK"
