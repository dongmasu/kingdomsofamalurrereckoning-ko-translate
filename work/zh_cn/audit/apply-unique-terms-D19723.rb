#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-unique-terms-D19723/locatexts_zh_cn.koalocatext_default.csv"
expected = "06019b6f762809de7fe8856685a7dc93efdd407ba4657b0bc31565afacc823ac"
edits = {
  19377 => ["완벽한 미타라 강화 리벳", "흠 없는 미타란 강화 리벳"],
  19386 => ["우리 콜로세족도", "우리 콜로사이족도"],
  19435 => ["탐굴자가 페이에게서", "탐구자(Delver)가 페이에게서"],
  19462 => ["하이페리온이 떠올랐어!", "하이페리언이 떠올랐어!"],
  19475 => ["그래서 여행자단을 떠났어.", "그래서 트래블러를 떠났어."],
  19518 => ["유능한 여행자야.", "유능한 트래블러야."]
}

def rows(bytes)
  result = {}
  id = nil
  bytes.each_line do |line|
    next_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    id = next_id if next_id
    (result[id] ||= +"".b) << line if id
  end
  result
end

original = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(original) == expected
before = rows(original)
abort "missing keys" unless (edits.keys - before.keys).empty?
updated = original.dup
edits.each do |id, (old, replacement)|
  source = before.fetch(id)
  abort "old text not unique in #{id}" unless source.scan(old.b).size == 1
  abort "replacement already exists in #{id}" if source.include?(replacement.b)
  changed = source.sub(old.b, replacement.b)
  abort "non-Texto bytes touched at #{id}" unless source.start_with?("#{id};".b) &&
    changed.start_with?("#{id};".b)
  abort "row not unique in CSV at #{id}" unless updated.scan(source).size == 1
  updated.sub!(source, changed)
end
after = rows(updated)
abort "row order or count changed" unless before.keys == after.keys
abort "other rows changed" unless (before.keys - edits.keys).all? { |id| before[id] == after[id] }
abort "BOM or header changed" unless updated.start_with?("\xEF\xBB\xBFID_Linha;Texto\r\n".b)
abort "line endings changed" unless [original.scan("\r\n".b).size, original.scan(/(?<!\r)\n/n).size] ==
  [updated.scan("\r\n".b).size, updated.scan(/(?<!\r)\n/n).size]
reconstructed = updated.dup
edits.each do |id, (old, replacement)|
  abort "inverse is ambiguous at #{id}" unless after.fetch(id).scan(replacement.b).size == 1
  reconstructed.sub!(after.fetch(id), after.fetch(id).sub(replacement.b, old.b))
end
abort "inverse mismatch" unless reconstructed == original
FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup differs" if File.exist?(backup) && File.binread(backup) != original
File.binwrite(backup, original) unless File.exist?(backup)
abort "backup mismatch" unless File.binread(backup) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup}"
puts "accepted=#{edits.size} BOM/CRLF/bare-LF/row-order/other-rows/inverse=OK"
