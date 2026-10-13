#!/usr/bin/env ruby

require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_affix.csv"
expected_sha = "c31f35a98a4b2875cc6d44c46c4404c2249f4ec6f758dae3543a07c917def676"
variants = %w[11 12 14 21 22 24]
old_text = "*운명*".b
new_text = "*운명지어진 자*".b

bytes = File.binread(path)
actual_sha = Digest::SHA256.hexdigest(bytes)
abort "unexpected pre-edit SHA-256: #{actual_sha}" unless actual_sha == expected_sha
abort "missing UTF-8 BOM" unless bytes.start_with?("\xEF\xBB\xBF".b)

lines = bytes.lines
matches = Hash.new(0)
updated_lines = lines.map do |line|
  variants.each do |variant|
    prefix = "55;#{variant};".b
    next unless line.start_with?(prefix)

    matches[variant] += 1
    old_prefix = prefix + old_text
    abort "unexpected text for variant #{variant}" unless line.start_with?(old_prefix)
    new_prefix = prefix + new_text
    line = new_prefix + line.byteslice(old_prefix.bytesize..)
  end
  line
end

abort "unexpected target key set: #{matches}" unless matches == variants.to_h { |v| [v, 1] }

updated = updated_lines.join
crlf_count = ->(value) { value.scan(/\r\n/n).length }
bare_lf_count = ->(value) { value.scan(/(?<!\r)\n/n).length }
abort "record endings changed" unless
  crlf_count.call(bytes) == crlf_count.call(updated) &&
  bare_lf_count.call(bytes) == bare_lf_count.call(updated)

File.binwrite(path, updated)
puts "updated #{matches.length} approved Texto cells"
