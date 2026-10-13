#!/usr/bin/env ruby

require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "a227a6b104d324a689b06b36c6f1b29ed27cf6bfca23545b717929b32971f98b"
old_text = "완벽한 미사루 서리 지렛대".b
new_text = "흠 없는 미타란 서리 지렛목".b

bytes = File.binread(path)
actual_sha = Digest::SHA256.hexdigest(bytes)
abort "unexpected pre-edit SHA-256: #{actual_sha}" unless actual_sha == expected_sha
abort "missing UTF-8 BOM" unless bytes.start_with?("\xEF\xBB\xBF".b)

lines = bytes.lines
matches = 0
updated_lines = lines.map do |line|
  next line unless line.start_with?("62789;".b)

  matches += 1
  abort "unexpected ID 62789 text" unless line.scan(old_text).length == 1
  line.sub(old_text, new_text)
end
abort "unexpected target row count: #{matches}" unless matches == 1

updated = updated_lines.join
crlf_count = ->(value) { value.scan(/\r\n/n).length }
bare_lf_count = ->(value) { value.scan(/(?<!\r)\n/n).length }
abort "record endings changed" unless
  crlf_count.call(bytes) == crlf_count.call(updated) &&
  bare_lf_count.call(bytes) == bare_lf_count.call(updated)
abort "physical line count changed" unless bytes.lines.length == updated.lines.length
abort "edit is not a reversible single-cell substitution" unless
  updated.sub(new_text, old_text) == bytes

File.binwrite(path, updated)
puts "updated approved Texto cell at ID 62789"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(updated)}"
puts "CRLF endings: #{crlf_count.call(updated)}"
puts "bare-LF endings: #{bare_lf_count.call(updated)}"
