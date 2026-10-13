#!/usr/bin/env ruby

require "digest"

csv_path = File.expand_path("../locatexts_zh_cn.koalocatext_default.csv", __dir__)
backup_path = "/private/tmp/ko-translate-backups/20261012/before-savant-engar-followup-D19512/locatexts_zh_cn.koalocatext_default.csv"
expected_sha256 = "2296e257804d0b027fef7d1e1b9fa9b4da43ac9eafe0eac804041de41c1d08d0"

edits = [
  [
    "24292;에이던 엥가르가 스카이크라운 봉우리에서 만나자고 했다. 그곳에서 폭풍석을 만들고 있었다. 그는 곧 빙의됐지만, 나는 그를 물리치고 유물을 되찾았다. 사반트 엥가르의 죽음을 보고하려던 중 라시르로 소환되어 대현자 주발 칼레두스에게 경과를 보고했다.",
    "24292;에이선 엥가르가 스카이크라운 봉우리에서 만나자고 했다. 그곳에서 폭풍석을 만들고 있었다. 그는 곧 빙의됐지만, 나는 그를 물리치고 유물을 되찾았다. 사반트 엥가르의 죽음을 보고하려던 중 라시르로 소환되어 대현자 주발 칼레두스에게 경과를 보고했다."
  ],
  [
    "43822;에이선 엥가가 태양석처럼 생겼지만 번개 마법이 깃든 유물을 만드는 모습을 지켜봐 달라고 초대했다. 거대한 번개가 하늘왕관 꼭대기에서 사반트 엥가르를 날려 버리는 걸 목격했다. 그가 떨어진 곳을 찾아가 시신에서 챙길 수 있는 걸 회수해야겠다.",
    "43822;에이선 엥가르가 태양석처럼 생겼지만 번개 마법이 깃든 유물을 만드는 모습을 지켜봐 달라고 초대했다. 거대한 번개가 스카이크라운(Skycrown) 꼭대기에서 사반트 엥가르를 날려 버리는 걸 목격했다. 그가 떨어진 곳을 찾아가 시신에서 챙길 수 있는 걸 회수해야겠다."
  ],
  [
    "51192;사반트 이선 엥가르(Aethan Engar)만큼 재능과 지혜를 갖춘 마법사는 드물어. 스콜리아 아르카나(Scholia Arcana)는 그를 둔 게 행운이지.",
    "51192;사반트 에이선 엥가르(Aethan Engar)만큼 재능과 지혜를 갖춘 마법사는 드물어. 스콜리아 아르카나(Scholia Arcana)는 그를 둔 게 행운이지."
  ],
  [
    "51208;사반트 이선 엥가르에게,",
    "51208;사반트 엥가르에게,"
  ],
  [
    "56450;\"…이번에도 내가 새로 발견한 내용을 담아 보낸 보고서를 스콜리아(Scholia)가 무시한 모양이다. 서신을 관리하는 담당자가 내 편지가 사반트 엔가르(Savant Engar)에게 닿지 못하게 막고 있는 게 분명해.",
    "56450;\"…이번에도 내가 새로 발견한 내용을 담아 보낸 보고서를 스콜리아(Scholia)가 무시한 모양이다. 서신을 관리하는 담당자가 내 편지가 사반트 엥가르(Savant Engar)에게 닿지 못하게 막고 있는 게 분명해."
  ]
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

temporary_path = "#{csv_path}.D19512.tmp"
File.binwrite(temporary_path, edited)
File.rename(temporary_path, csv_path)
puts "pre-edit SHA-256: #{expected_sha256}"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(edited)}"
puts "BOM, #{crlf_count} CRLF, #{bare_lf_count} bare LF, and byte reversibility verified"
