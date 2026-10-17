#!/usr/bin/env ruby
require 'csv'
require 'digest'

HASHES = {
  'affix' => '516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e',
  'base' => '437986dea9000fca2fa96fee0dd98b71c678bc12db0c3e11ff45a7904e22cd70',
  'default' => 'e6112db6ec6ea420d689526caf5aef6c93065e8e9639aa64adda2f9d588a849a'
}.freeze
BACKUP_DIR = '/private/tmp/ko-translate-backups/20261014/before-jewelry-D20388'
MANIFEST = 'work/zh_cn/audit/jewelry-terminology-edits-D20388.tsv'
PATTERN = /\b(necklaces?|amulets?|pendants?|medallions?|medals?|rings?|loops?|hoops?|bands?|torcs?|talismans?|lockets?|signets?)\b/i

def rows(path)
  CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
end

# Locate logical records and fields without normalizing their original bytes.
def spans(bytes, separator)
  result = []
  start = 0
  quoted = false
  index = 0
  while index < bytes.bytesize
    byte = bytes.getbyte(index)
    if byte == 34
      if quoted && bytes.getbyte(index + 1) == 34
        index += 1
      else
        quoted = !quoted
      end
    elsif byte == separator && !quoted
      finish = separator == 10 ? index + 1 : index
      result << (start...finish)
      start = index + 1
    end
    index += 1
  end
  result << (start...bytes.bytesize) if start < bytes.bytesize
  abort 'unbalanced CSV quoting' if quoted
  result
end

def text_span(record, column)
  ending = record.end_with?("\r\n".b) ? 2 : (record.end_with?("\n".b) ? 1 : 0)
  spans(record.byteslice(0, record.bytesize - ending), 59).fetch(column)
end

def replacement(resource, id, en, old)
  text = old.dup
  reason = nil
  if en.match?(/\bAmrynthian Band\b/i)
    text.gsub!(/(?:암린시안\(Amrynthian\) 반지|아므린티안 반지(?:\(Amrynthian Band\))?|암린시안 반지|아므린티아의 고리|암린시아의 반지|암린시아의 띠\(Amrynthian Band\)|암린시안 밴드)/,
               '암린시안 관(Amrynthian Band)')
    reason = 'Crown explicitly identified at default 11022/39286/57945; reuse D-19795.'
  elsif en.match?(/\bRing of Keozai\b/i)
    text.gsub!(/케오자이의 (?:반지단|반지|고리)(?:\(Ring of Keozai\))?/,
               '케오자이의 고리(Ring of Keozai)')
    reason = 'Named circle with members, not finger jewelry; default 15489/19820/63790.'
  elsif resource == 'default'
    case id
    when '1029'
      text.sub!('반지다', '고리(Ring)다')
      reason = 'We are the Ring refers to the Twelve/branches, not a physical ring.'
    when '12925', '13271', '19289', '46307', '58371', '61434'
      text.gsub!('목걸이다', '부적이다')
      text.gsub!('목걸이는', '부적은')
      text.gsub!('목걸이를', '부적을')
      text.gsub!('목걸이', '부적')
      reason = 'English amulet; reuse base 3985 and affix 351, distinct from necklace.'
    when '45543'
      text.sub!('목걸이를', '펜던트를')
      reason = 'English/Japanese/Chinese pendant; reuse base 4208 and default 10902/61475.'
    when '51870'
      text.sub!('목걸이', '펜던트')
      reason = 'English/Japanese/Chinese pendant, distinct from the whole necklace.'
    when '8739'
      text.sub!('구리 고리', '구리 반지')
      reason = 'Copper band jewelry; Chinese finger ring, parallel gold/silver rings at 64454.'
    when '57985'
      text.sub!('은제 고리', '은제 반지')
      reason = 'Silver band jewelry; Chinese ring, parallel 64454 and accepted 41117.'
    when '9734'
      text.sub!('왕실 훈장', '왕실 메달')
      reason = 'Same royal medallion as default 43136/61590; not a separate awarded medal.'
    end
  end
  [text, reason]
end

plans = {}
manifest = [['Resource', 'ID', 'Variant', 'English', 'Japanese', 'Chinese',
             'Korean before', 'Korean after', 'Evidence']]
HASHES.each do |resource, expected|
  path = "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv"
  original = File.binread(path)
  abort "unexpected #{resource} hash" unless Digest::SHA256.hexdigest(original) == expected
  active = rows(path)
  sources = %w[en_us ja_jp zh_cn].map do |locale|
    rows("src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{resource}.csv").group_by { |r| r['ID_Linha'] }
  end
  records = spans(original.byteslice(3, original.bytesize - 3), 10).map { |r| (r.begin + 3...r.end + 3) }
  abort 'BOM or record count mismatch' unless original.start_with?("\xEF\xBB\xBF".b) && records.size == active.size + 1
  column = active.headers.index('Texto')
  edits = []
  screened = 0
  active.each_with_index do |row, index|
    id = row['ID_Linha']
    variant = row['Tipo_Variante']
    locale_texts = sources.map do |source|
      candidates = source.fetch(id)
      (candidates.find { |r| r['Tipo_Variante'] == variant } || candidates.first)['Texto'].to_s
    end
    old = row['Texto'].to_s
    screened += 1 if locale_texts[0].match?(PATTERN) || old.match?(/목걸이|메달|펜던트|팬던트|반지|고리/)
    new_text, reason = replacement(resource, id, locale_texts[0], old)
    next if old == new_text
    record_range = records.fetch(index + 1)
    record = original.byteslice(record_range)
    field = text_span(record, column)
    encoded = CSV.generate_line([new_text], col_sep: ';', row_sep: '').b
    edits << [(record_range.begin + field.begin...record_range.begin + field.end), encoded]
    manifest << [resource, id, variant, *locale_texts, old, new_text, reason]
    puts "#{resource}/#{id}: #{reason}"
  end
  updated = original.dup
  edits.reverse_each { |span, encoded| updated[span] = encoded }
  restored = updated.dup
  offset = 0
  inverse_spans = edits.map do |span, encoded|
    shifted = (span.begin + offset...span.begin + offset + encoded.bytesize)
    offset += encoded.bytesize - span.size
    [shifted, original.byteslice(span)]
  end
  inverse_spans.reverse_each { |span, encoded| restored[span] = encoded }
  abort 'non-target byte preservation failed' unless restored == original
  parsed = CSV.parse(updated.dup.force_encoding('UTF-8').sub(/\A\uFEFF/, ''), headers: true, col_sep: ';')
  abort 'headers/order/count mismatch' unless parsed.headers == active.headers && parsed.size == active.size
  parsed.each_with_index do |row, i|
    active.headers.each do |header|
      next if header == 'Texto'
      abort 'non-Texto field changed' unless row[header] == active[i][header]
    end
    desired, = replacement(resource, row['ID_Linha'], sources[0].fetch(row['ID_Linha']).first['Texto'].to_s, active[i]['Texto'].to_s)
    abort "Texto mismatch #{resource}/#{row['ID_Linha']}" unless row['Texto'].to_s == desired
  end
  abort 'line-ending pattern changed' unless updated.scan(/\r\n|\r|\n/n) == original.scan(/\r\n|\r|\n/n)
  plans[path] = [original, updated] unless edits.empty?
  puts "#{resource}: scanned=#{active.size}, keyword candidates=#{screened}, edited=#{edits.size}, SHA256=#{Digest::SHA256.hexdigest(updated)}, CRLF=#{updated.scan(/\r\n/n).size}, bareLF=#{updated.scan(/(?<!\r)\n/n).size}"
end
exit unless ENV['APPLY'] == '1'

plans.each do |path, (original, _)|
  backup = "#{BACKUP_DIR}/#{File.basename(path)}"
  abort "missing/different backup #{backup}" unless File.binread(backup) == original
  abort "active file changed #{path}" unless File.binread(path) == original
end
plans.each { |path, (_, updated)| File.binwrite(path, updated) }
File.binwrite(MANIFEST, CSV.generate(col_sep: "\t", row_sep: "\n") { |csv| manifest.each { |row| csv << row } })
puts "Verified byte-identical backups; inverse reconstruction, BOM, row order, non-Texto fields, all expected cells and exact line-ending pattern passed. Manifest: #{MANIFEST}"
