#!/usr/bin/env ruby

require "digest"

csv_path = File.expand_path("../locatexts_zh_cn.koalocatext_default.csv", __dir__)
backup_path = "/private/tmp/ko-translate-backups/20261012/before-savant-address-cluster-D19509/locatexts_zh_cn.koalocatext_default.csv"
expected_sha256 = "ecad10035af40fb682d1f03f20760e5cb4bb0f3dbe34e0f022ca50951e550a53"

edits = [
  ["14170;학자님, 늘 그렇듯 만나서 반갑습니다.", "14170;사반트님, 늘 그렇듯 만나서 반갑습니다."],
  ["43791;어서 오게, 현자여. 무엇을 도와드릴까?", "43791;어서 오게, 사반트여. 무엇을 도와드릴까?"],
  ["48572;지금은 한가롭게 이야기할 때가 아니오, 현자여. 전투가 코앞이오!", "48572;지금은 한가롭게 이야기할 때가 아니오, 사반트여. 전투가 코앞이오!"]
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

temporary_path = "#{csv_path}.D19509.tmp"
File.binwrite(temporary_path, edited)
File.rename(temporary_path, csv_path)
puts "pre-edit SHA-256: #{expected_sha256}"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(edited)}"
puts "BOM, #{crlf_count} CRLF, #{bare_lf_count} bare LF, and byte reversibility verified"
