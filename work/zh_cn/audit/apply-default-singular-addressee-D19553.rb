#!/usr/bin/env ruby

require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "07c8c8bca5d4a2f0c80640ed8df69021759ec627d3d41398433aa511e404cd77"
old_text = "그렇지. 특히 너희처럼 전선에서 막 돌아온 이들은 더 잘 알겠지. 자, 방문 고위 인사들에게 주는 통행증을 받아. 그리고 술은 좀 적당히 마셔.".b
new_text = "그렇지. 특히 너 같은 사람은 전선에서 막 돌아왔으니 더 잘 알겠지. 자, 방문 고위 인사들에게 주는 통행증을 받아. 그리고 술은 좀 적당히 마셔.".b

bytes = File.binread(path)
actual_sha = Digest::SHA256.hexdigest(bytes)
abort "unexpected pre-edit SHA-256: #{actual_sha}" unless actual_sha == expected_sha
abort "missing UTF-8 BOM" unless bytes.start_with?("\xEF\xBB\xBF".b)

lines = bytes.lines
matches = 0
updated_lines = lines.map do |line|
  next line unless line.start_with?("62792;".b)

  matches += 1
  abort "unexpected ID 62792 text" unless line.scan(old_text).length == 1
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
puts "updated approved Texto cell at ID 62792"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(updated)}"
puts "CRLF endings: #{crlf_count.call(updated)}"
puts "bare-LF endings: #{bare_lf_count.call(updated)}"
