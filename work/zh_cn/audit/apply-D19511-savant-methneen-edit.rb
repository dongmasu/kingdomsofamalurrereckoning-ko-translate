#!/usr/bin/env ruby

require "digest"

csv_path = File.expand_path("../locatexts_zh_cn.koalocatext_default.csv", __dir__)
backup_path = "/private/tmp/ko-translate-backups/20261012/before-savant-methneen-context-D19511/locatexts_zh_cn.koalocatext_default.csv"
expected_sha256 = "55925a375fb2c86c1946054fec3894d1345d7957ce2940880f2c412370401334"
before = "19063;현자 메스닌과 대화하기".b
after = "19063;사반트 메스닌과 대화하기".b

original = File.binread(csv_path)
backup = File.binread(backup_path)
abort "active CSV hash mismatch" unless Digest::SHA256.hexdigest(original) == expected_sha256
abort "backup is not byte-identical" unless backup == original
abort "expected one target row" unless original.scan(before).length == 1
abort "UTF-8 BOM missing" unless original.start_with?("\xEF\xBB\xBF".b)

crlf_count = original.scan(/\r\n/n).length
bare_lf_count = original.gsub(/\r\n/n, "").count("\n")
edited = original.sub(before, after)
abort "BOM changed" unless edited.start_with?("\xEF\xBB\xBF".b)
abort "CRLF count changed" unless edited.scan(/\r\n/n).length == crlf_count
abort "bare-LF count changed" unless edited.gsub(/\r\n/n, "").count("\n") == bare_lf_count
abort "changes exceed the approved Texto substitution" unless edited.sub(after, before) == backup

temporary_path = "#{csv_path}.D19511.tmp"
File.binwrite(temporary_path, edited)
File.rename(temporary_path, csv_path)
puts "pre-edit SHA-256: #{expected_sha256}"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(edited)}"
puts "BOM, #{crlf_count} CRLF, #{bare_lf_count} bare LF, and byte reversibility verified"
