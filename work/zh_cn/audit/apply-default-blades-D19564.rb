#!/usr/bin/env ruby

require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "539e1d1a1473a229ba218b853d514ba0f25a68083e4ed19dff389c33adb6067f"
old_text = "이 우아하고 화려한 칼은".b
new_text = "이 우아하고 화려한 칼날들은".b

bytes = File.binread(path)
actual_sha = Digest::SHA256.hexdigest(bytes)
abort "unexpected pre-edit SHA-256: #{actual_sha}" unless actual_sha == expected_sha
abort "missing UTF-8 BOM" unless bytes.start_with?("\xEF\xBB\xBF".b)

lines = bytes.lines
target_index = lines.index { |line| line.start_with?("62755;".b) }
abort "missing ID 62755 row" unless target_index

matches = 0
updated_lines = lines.map do |line|
  next line unless line.start_with?("62755;".b)

  matches += 1
  abort "unexpected ID 62755 text" unless line.scan(old_text).length == 1
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
abort "unapproved lines changed" unless lines.each_with_index.all? { |line, i|
  i == target_index ? line != updated_lines[i] : line == updated_lines[i]
}

abort "edit is not a reversible single-cell substitution" unless
  updated_lines[target_index].sub(new_text, old_text) == lines[target_index]

File.binwrite(path, updated)
puts "updated approved Texto cell at ID 62755"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(updated)}"
puts "CRLF endings: #{crlf_count.call(updated)}"
puts "bare-LF endings: #{bare_lf_count.call(updated)}"
