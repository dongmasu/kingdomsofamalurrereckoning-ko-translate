#!/usr/bin/env ruby

require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "84f6eac5ab61cca00b219d2949605f086a86daca0ddeb5d132321c959ad71ebd"
old_text = "간다고? 그는 당연히 위대한 순환으로 돌아간 거야. 개화 의식에 자신을 바쳤고, 의식은 완성됐지.".b
new_text = "간다고? 그는 당연히 대순환으로 돌아간 거야. 개화 의식에 자신을 바쳤고, 의식은 완성됐지.".b

bytes = File.binread(path)
actual_sha = Digest::SHA256.hexdigest(bytes)
abort "unexpected pre-edit SHA-256: #{actual_sha}" unless actual_sha == expected_sha
abort "missing UTF-8 BOM" unless bytes.start_with?("\xEF\xBB\xBF".b)

lines = bytes.lines
matches = 0
updated_lines = lines.map do |line|
  next line unless line.start_with?("62899;".b)

  matches += 1
  abort "unexpected ID 62899 text" unless line.scan(old_text).length == 1
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

File.binwrite(path, updated)
puts "updated approved Texto cell at ID 62899"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(updated)}"
