#!/usr/bin/env ruby

require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_affix.csv"
expected_sha = "611fed1a67bc8eeb277a621e92f463e8b7a451c285ede8dc273e2940e8e0903f"
variants = %w[11 12 14 21 22 24]
old_text = "*의지가 굳은 자*".b
new_text = "*고집 센 자*".b

bytes = File.binread(path)
actual_sha = Digest::SHA256.hexdigest(bytes)
abort "unexpected pre-edit SHA-256: #{actual_sha}" unless actual_sha == expected_sha
abort "missing UTF-8 BOM" unless bytes.start_with?("\xEF\xBB\xBF".b)

lines = bytes.lines
matches = Hash.new(0)
updated_lines = lines.map do |line|
  variants.each do |variant|
    prefix = "444;#{variant};".b
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
