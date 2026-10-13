#!/usr/bin/env ruby

require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "b35edaa0b7c2ff6424481f03dbab58897e7a1a846982d8a9dc675a6a2fbfbfd6"
old_lines = [
  "62867;\"어리석은 필멸자들이여, 귀 기울여라",
  "이 이야기의 교훈에,",
  "우리가 들려줄 잔혹한 만행,",
  "넘어진 바보들에겐 공포가 기다리고,",
  "비전의 장막 뒤에서 쇠락하리라\""
].map(&:b)
new_lines = [
  "어리석은 필멸자들이여, 귀 기울여라",
  "이 이야기의 충고를,",
  "우리가 들려줄 참혹한 만행을,",
  "넘어진 어리석은 자들에겐 공포가 기다리고,",
  "비전의 장막 너머에서 쇠락하리라."
].map(&:b)

bytes = File.binread(path)
actual_sha = Digest::SHA256.hexdigest(bytes)
abort "unexpected pre-edit SHA-256: #{actual_sha}" unless actual_sha == expected_sha
abort "missing UTF-8 BOM" unless bytes.start_with?("\xEF\xBB\xBF".b)

lines = bytes.lines
indices = lines.each_index.select { |index| lines[index].start_with?("62867;".b) }
abort "unexpected target row count: #{indices.length}" unless indices.length == 1
index = indices.first
old_row = lines[index, old_lines.length]
abort "unexpected target row length" unless old_row&.length == old_lines.length

endings = old_row.map { |line| line[/\r\n|\n|\r\z/n] || "".b }
contents = old_row.map { |line| line.sub(/\r\n|\n|\r\z/n, "".b) }
abort "unexpected target poem text" unless contents == old_lines
abort "unexpected target record endings" unless endings.all? { |ending| ending == "\r\n".b }

new_row = new_lines.each_with_index.map do |text, offset|
  content =
    if offset.zero?
      "62867;\"".b + text
    elsif offset == new_lines.length - 1
      text + "\"".b
    else
      text
    end
  content + endings[offset]
end

updated_lines = lines.dup
updated_lines[index, old_row.length] = new_row
updated = updated_lines.join
abort "physical line count changed" unless bytes.lines.length == updated.lines.length
abort "CRLF count changed" unless bytes.scan(/\r\n/n).length == updated.scan(/\r\n/n).length
abort "bare-LF count changed" unless bytes.scan(/(?<!\r)\n/n).length == updated.scan(/(?<!\r)\n/n).length
abort "edit is not a reversible single-row substitution" unless
  updated.sub(new_row.join, old_row.join) == bytes

File.binwrite(path, updated)
puts "updated only the approved Texto cell at ID 62867"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(updated)}"
puts "CRLF endings: #{updated.scan(/\r\n/n).length}"
puts "bare-LF endings: #{updated.scan(/(?<!\r)\n/n).length}"
