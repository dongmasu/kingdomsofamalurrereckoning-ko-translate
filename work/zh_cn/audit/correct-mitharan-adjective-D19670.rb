#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "118c55ed5ffc18e35561843823ad5e6802730c4d30b40ce9624f6fb290d84d93"
backup = "/private/tmp/ko-translate-backups/20261012/before-mitharan-corrigendum-D19670/locatexts_zh_cn.koalocatext_default.csv"
ids = [39884, 40370, 42970, 43168]
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected

def records(bytes)
  header = +"".b
  rows = []
  bytes.each_line do |line|
    id = line[/\A(\d+);/n, 1]&.to_i
    if id
      rows << [id, line.dup]
    elsif rows.empty?
      header << line
    else
      rows.last[1] << line
    end
  end
  [header, rows]
end

header, rows = records(source)
hits = []
updated = header + rows.map do |id, row|
  next row unless ids.include?(id)
  abort "ambiguous #{id}" unless row.scan("미사루식".b).size == 1
  hits << id
  row.sub("미사루식".b, "미타란".b)
end.join
abort "missing IDs" unless hits.sort == ids
old_rows = rows.to_h
records(updated)[1].each do |id, row|
  original = old_rows.fetch(id)
  expected_row = ids.include?(id) ? original.sub("미사루식".b, "미타란".b) : original
  abort "unexpected change #{id}" unless row == expected_row
end
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
shape = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size, records(bytes)[1].map(&:first)] }
abort "CSV structure changed" unless shape.call(source) == shape.call(updated)
FileUtils.mkdir_p(File.dirname(backup))
abort "backup collision" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup mismatch" unless File.binread(backup) == source
File.binwrite(path, updated)
puts "corrected=#{ids.join(',')} hash=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} BOM/endings/order/other_bytes=OK"
