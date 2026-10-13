#!/usr/bin/env ruby

require "digest"

csv_path = File.expand_path("../locatexts_zh_cn.koalocatext_default.csv", __dir__)
backup_path = "/private/tmp/ko-translate-backups/20261012/before-savant-reen-followup-D19510/locatexts_zh_cn.koalocatext_default.csv"
expected_sha256 = "b61b33154e52e814630ea28fa6156001a59eef54b3b570aec8c3a35e851b9eb2"

edits = [
  ["4313;현자 린(Savant Reen)", "4313;사반트 린(Savant Reen)"],
  ["11487;현자 린(Savant Reen)은", "11487;사반트 린(Savant Reen)은"],
  ["15917;미스로스(Mithros) 곳곳에 흩어진 거석에 관한 이반 휴그(Ivan Hugues)의 기록이다. 그는 이 기록을 학자 린(Savant Reen)에게 보내 크라운홀드(Crownhold) 대도서관에 보관하고 싶어 한다.", "15917;미스로스(Mithros) 곳곳에 흩어진 거석에 관한 이반 휴그(Ivan Hugues)의 기록이다. 그는 이 기록을 사반트 린(Savant Reen)에게 보내 크라운홀드(Crownhold) 대도서관에 보관하고 싶어 한다."],
  ["18023;현자 리엔(Savant Reen)", "18023;사반트 린(Savant Reen)"]
]

original = File.binread(csv_path)
backup = File.binread(backup_path)
abort "active CSV hash mismatch" unless Digest::SHA256.hexdigest(original) == expected_sha256
abort "backup is not byte-identical" unless backup == original
abort "UTF-8 BOM missing" unless original.start_with?("\xEF\xBB\xBF".b)

crlf_count = original.scan(/\r\n/n).length
bare_lf_count = original.gsub(/\r\n/n, "").count("\n")
edited = original.dup

edits.each do |before, after|
  before = before.b
  after = after.b
  abort "expected one occurrence: #{before}" unless edited.scan(before).length == 1
  edited = edited.sub(before, after)
end

abort "BOM changed" unless edited.start_with?("\xEF\xBB\xBF".b)
abort "CRLF count changed" unless edited.scan(/\r\n/n).length == crlf_count
abort "bare-LF count changed" unless edited.gsub(/\r\n/n, "").count("\n") == bare_lf_count

reversed = edited.dup
edits.reverse_each { |before, after| reversed = reversed.sub(after.b, before.b) }
abort "changes exceed approved Texto substitutions" unless reversed == backup

temporary_path = "#{csv_path}.D19510.tmp"
File.binwrite(temporary_path, edited)
File.rename(temporary_path, csv_path)
puts "pre-edit SHA-256: #{expected_sha256}"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(edited)}"
puts "BOM, #{crlf_count} CRLF, #{bare_lf_count} bare LF, and byte reversibility verified"
