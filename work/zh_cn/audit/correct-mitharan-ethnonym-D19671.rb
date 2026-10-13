#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "7f5aa2e618e0c12b4df2907ae782a282f91595a216054f18b5d604345735c9bb"
backup = "/private/tmp/ko-translate-backups/20261012/before-mitharan-ethnonym-D19671/locatexts_zh_cn.koalocatext_default.csv"
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


edits = {
  36487 => ["미사루 신도들은".b, "미타란 사람들은".b],
  37035 => ["미사루 신도에".b, "미타란 사람에".b],
  43468 => ["고대 미사루어".b, "고대 미타란어".b]
}
def apply_edits(bytes, edits)
  header, rows = records(bytes)
  hits = []
  result = header + rows.map do |id, row|
    next row unless edits.key?(id)
    from, to = edits.fetch(id)
    abort "ambiguous #{id}" unless row.scan(from).size == 1
    hits << id
    row.sub(from, to)
  end.join
  abort "missing IDs" unless hits.sort == edits.keys.sort
  result
end
updated = apply_edits(source, edits)
abort "inverse failed" unless apply_edits(updated, edits.transform_values(&:reverse)) == source
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
shape = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size, records(bytes)[1].map(&:first)] }
abort "CSV structure changed" unless shape.call(source) == shape.call(updated)
FileUtils.mkdir_p(File.dirname(backup))
abort "backup collision" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup mismatch" unless File.binread(backup) == source
File.binwrite(path, updated)
puts "corrected=#{edits.keys.join(',')} hash=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} inverse/BOM/endings/order/other_bytes=OK"
