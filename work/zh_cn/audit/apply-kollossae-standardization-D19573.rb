#!/usr/bin/env ruby

require "digest"

csv_path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup_path = "/private/tmp/ko-translate-backups/20261012/before-kollossae-standardization-D19573/locatexts_zh_cn.koalocatext_default.csv"
expected_pre_hash = "9b745401670abe1d2860e41e826a27f3482bad4338476b3e5549158023e7f432"
changes = {
  191 => ["콜로새", "콜로사이"],
  1081 => ["콜로세", "콜로사이"],
  1106 => ["콜로세", "콜로사이"],
  7950 => ["콜로새", "콜로사이"],
  11003 => ["콜로세", "콜로사이"],
  11395 => ["콜로세", "콜로사이"],
  14970 => ["콜로세", "콜로사이"],
  20950 => ["콜로세", "콜로사이"]
}

original = File.binread(csv_path)
backup = File.binread(backup_path)
raise "backup is not byte-identical to source" unless backup == original
raise "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected_pre_hash

lines = original.lines(chomp: false)
found = {}
updated = lines.map do |line|
  match = line.match(/\A([0-9]+);/n)
  next line unless match

  id = match[1].to_i
  next line unless changes.key?(id)
  raise "duplicate row for ID #{id}" if found.key?(id)

  old_text, new_text = changes.fetch(id).map(&:b)
  position = line.index(old_text)
  raise "expected text missing for ID #{id}" unless position
  raise "multiple old spellings in ID #{id}" if line.index(old_text, position + old_text.bytesize)

  found[id] = true
  line.byteslice(0, position) + new_text + line.byteslice(position + old_text.bytesize, line.bytesize)
end

raise "missing target IDs: #{(changes.keys - found.keys).join(', ')}" unless found.keys.sort == changes.keys.sort

updated_bytes = updated.join
restored = updated.map do |line|
  match = line.match(/\A([0-9]+);/n)
  next line unless match

  id = match[1].to_i
  next line unless changes.key?(id)

  old_text, new_text = changes.fetch(id).map(&:b)
  position = line.index(new_text)
  raise "expected replacement missing for ID #{id}" unless position
  line.byteslice(0, position) + old_text + line.byteslice(position + new_text.bytesize, line.bytesize)
end.join
raise "reverse reconstruction differs from backup" unless restored == backup
raise "BOM changed" unless updated_bytes.byteslice(0, 3) == original.byteslice(0, 3)
raise "CRLF count changed" unless updated_bytes.scan("\r\n").length == original.scan("\r\n").length
raise "bare-LF count changed" unless updated_bytes.count("\n") - updated_bytes.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length

original_ids = original.lines.map { |line| line[/\A([0-9]+);/n, 1] }.compact
updated_ids = updated_bytes.lines.map { |line| line[/\A([0-9]+);/n, 1] }.compact
raise "row order or count changed" unless updated_ids == original_ids

File.binwrite(csv_path, updated_bytes)
puts "updated IDs: #{found.keys.sort.join(', ')}"
puts "pre-edit SHA-256: #{Digest::SHA256.hexdigest(original)}"
puts "post-edit SHA-256: #{Digest::SHA256.hexdigest(updated_bytes)}"
puts "BOM, row order/count, mixed line endings, and exact reversal verified"
