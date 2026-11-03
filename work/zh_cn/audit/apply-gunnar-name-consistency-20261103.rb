#!/usr/bin/env ruby

ROOT = File.expand_path("..", __dir__)

CHANGES = {
  "base" => {
    1086 => ["거너(Gunnar)", "군나르(Gunnar)"],
    1902 => ["거너 프로드의 열쇠(Gunnar Frode's Key)", "군나르 프로드의 열쇠(Gunnar Frode's Key)"],
    4415 => ["거너 프로드(Gunnar Frode)의 지도", "군나르 프로드(Gunnar Frode)의 지도"],
    4534 => ["가너(Gunnar)의 금고", "군나르(Gunnar)의 금고"]
  },
  "default" => {
    81 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    17679 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    19281 => ["거너 프로드의 일지(The Journal of Gunnar Frode)", "군나르 프로드의 일지(The Journal of Gunnar Frode)"],
    22066 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    28475 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    32520 => ["군나르가", "군나르(Gunnar)가"],
    32842 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    36298 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    37828 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    40322 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    41239 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    43736 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    45122 => ["애니 거너(Ani Gunnar)", "애니 군나르(Ani Gunnar)"],
    45151 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    45649 => ["그레이 거너(Gray Gunnar)", "그레이 군나르(Gray Gunnar)"],
    48023 => ["그레이 거너(Gray Gunnar)", "그레이 군나르(Gray Gunnar)"],
    49754 => ["거너 프로드(Gunnar Frode)", "군나르 프로드(Gunnar Frode)"],
    54730 => ["에스메 거너(Esme Gunnar)", "에스메 군나르(Esme Gunnar)"]
  }
}.freeze

def line_ending_counts(bytes)
  crlf = bytes.scan("\r\n").length
  [crlf, bytes.count("\n") - crlf]
end

CHANGES.each do |resource, edits|
  path = File.join(ROOT, "locatexts_zh_cn.koalocatext_#{resource}.csv")
  original = File.binread(path)
  updated = original.dup
  bom = original.start_with?("\xEF\xBB\xBF".b)
  endings = line_ending_counts(original)

  edits.each do |id, (old_text, new_text)|
    pattern = /^#{id};[^\r\n]*/
    rows = updated.scan(pattern)
    raise "#{resource}:#{id}: expected one row, found #{rows.length}" unless rows.length == 1

    row = rows.first
    old_bytes = old_text.b
    new_bytes = new_text.b
    if row.include?(new_bytes) && !row.include?(old_bytes)
      next
    end
    raise "#{resource}:#{id}: expected old text exactly once" unless row.scan(old_bytes).length == 1

    updated.sub!(row, row.sub(old_bytes, new_bytes))
  end

  raise "#{resource}: BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b) == bom
  raise "#{resource}: line endings changed" unless line_ending_counts(updated) == endings

  File.binwrite(path, updated) unless updated == original
  puts "Verified #{resource}: #{edits.length} ID-scoped Gunnar edits"
end
