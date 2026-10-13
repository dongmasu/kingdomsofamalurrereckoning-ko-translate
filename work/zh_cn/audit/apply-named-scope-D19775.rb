#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19775/locatexts_zh_cn.koalocatext_default.csv"
expected = "7441691583bb55ed0d6dc22428ddf523ad65282888c5bc7c0a0efbc5151941b2"
source = File.binread(backup)
abort "unexpected backup hash" unless Digest::SHA256.hexdigest(source) == expected
abort "active differs from backup" unless File.binread(path) == source

changes = {
  29971 => ["수세기에 걸쳐 쌓인 비탄은 실로 무시무시한 무기지.",
            "수세기에 걸쳐 쌓인 비탄의 힘은 실로 무시무시한 무기지."],
  29979 => ["아마 자유민일 텐데", "아마 프리맨(Freemen)일 텐데"],
  30025 => ["다이든힐보다", "다이덴힐보다"],
  30033 => ["이 광권은 스코리아 가문 소유야!",
            "이 광권은 스코리아의 소유야!"]
}.transform_values { |old, replacement| [old.b, replacement.b] }

def split_records(bytes)
  prefix = +"".b
  records = []
  current_id = nil
  record = +"".b
  bytes.each_line do |line|
    id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if id
      records << [current_id, record] if current_id
      current_id = id
      record = line.dup
    elsif current_id
      record << line
    else
      prefix << line
    end
  end
  records << [current_id, record] if current_id
  [prefix, records]
end

prefix, records = split_records(source)
seen = []
result = prefix + records.map do |id, record|
  next record unless changes.key?(id)
  old, replacement = changes.fetch(id)
  abort "duplicate target ID #{id}" if seen.include?(id)
  abort "expected one old value at #{id}" unless record.scan(old).size == 1
  seen << id
  record.sub(old, replacement)
end.join
abort "missing target IDs" unless seen.sort == changes.keys.sort

inverse_prefix, inverse_records = split_records(result)
inverse = inverse_prefix + inverse_records.map do |id, record|
  next record unless changes.key?(id)
  old, replacement = changes.fetch(id)
  abort "expected one new value at #{id}" unless record.scan(replacement).size == 1
  record.sub(replacement, old)
end.join
abort "inverse mismatch" unless inverse == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "line-ending counts changed" unless
  [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
  [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
abort "record order/count changed" unless
  source.scan(/^\d+;/n) == result.scan(/^\d+;/n)

File.binwrite(path, result)
abort "write mismatch" unless File.binread(path) == result
puts "before=#{Digest::SHA256.hexdigest(source)}"
puts "active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
puts "edited_ids=#{seen.sort.join(",")}"
