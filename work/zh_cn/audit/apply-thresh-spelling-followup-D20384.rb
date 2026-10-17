#!/usr/bin/env ruby
require 'csv'
require 'digest'

PATH = 'work/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
BACKUP = '/private/tmp/ko-translate-backups/20261014/before-thresh-spelling-followup-D20384/locatexts_zh_cn.koalocatext_default.csv'
EXPECTED = '7670f32c73396dccfc5974c8165d975c337b86bc26a791f55842a73fc790926d'
OLD_ROW = "45374;이 꽃잎은 진입의 동굴 수호자인 쓰레쉬의 시신에서 뜯어 낸 것이다.\r\n".b
NEW_ROW = "45374;이 꽃잎은 진입의 동굴 수호자인 스레시(Thresh)의 시신에서 뜯어 낸 것이다.\r\n".b

original = File.binread(PATH)
abort "active CSV hash differs: #{Digest::SHA256.hexdigest(original)}" unless
  Digest::SHA256.hexdigest(original) == EXPECTED
abort 'byte-identical follow-up backup differs' unless File.binread(BACKUP) == original

matches = original.to_enum(:scan, /^45374;[^\r\n]*\r\n/n).map { Regexp.last_match }
abort "expected exactly one row 45374, found #{matches.length}" unless matches.length == 1
match = matches.first
abort 'unexpected previous ID 45374 row' unless match[0] == OLD_ROW

updated =
  original.byteslice(0, match.begin(0)) +
  NEW_ROW +
  original.byteslice(match.end(0), original.bytesize - match.end(0))
inverse =
  updated.byteslice(0, match.begin(0)) +
  OLD_ROW +
  updated.byteslice(match.begin(0) + NEW_ROW.bytesize, updated.bytesize - match.begin(0) - NEW_ROW.bytesize)
abort 'inverse edit did not restore original bytes' unless inverse == original

parsed = CSV.parse(updated.sub(/\A\xEF\xBB\xBF/n, '').force_encoding(Encoding::UTF_8),
                   headers: true, col_sep: ';')
abort 'row count changed' unless parsed.length == 65_135
row = parsed.find { |item| item['ID_Linha'] == '45374' }
abort 'updated target value mismatch' unless
  row && row['Texto'] == '이 꽃잎은 진입의 동굴 수호자인 스레시(Thresh)의 시신에서 뜯어 낸 것이다.'
abort 'ID order changed' unless parsed.map { |item| item['ID_Linha'].to_i } == (0..65_134).to_a
abort 'BOM or line ending shape changed' unless
  updated.start_with?("\xEF\xBB\xBF".b) &&
  updated.scan("\r\n".b).length == original.scan("\r\n".b).length &&
  updated.scan(/(?<!\r)\n/n).length == original.scan(/(?<!\r)\n/n).length

File.binwrite(PATH, updated)
puts "ID 45374 corrected; post=#{Digest::SHA256.hexdigest(updated)}; inverse/BOM/CSV/order/line endings=OK"
