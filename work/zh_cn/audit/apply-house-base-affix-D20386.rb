#!/usr/bin/env ruby
require 'csv'
require 'digest'

PATH = 'work/zh_cn/locatexts_zh_cn.koalocatext_base.csv'
BACKUP = '/private/tmp/ko-translate-backups/20261014/before-house-base-affix-D20386/locatexts_zh_cn.koalocatext_base.csv'
EXPECTED = 'ae076352cbf75a75b12661e06ca65032059f5c3108e495f7bd1a23b21c432e72'
MANIFEST = 'work/zh_cn/audit/house-base-edits-D20386.tsv'
AFFIX_SOURCE = 'src/csv/en_us/locatexts_en_us.koalocatext_affix.csv'
BASE_SOURCE = 'src/csv/en_us/locatexts_en_us.koalocatext_base.csv'
JA_SOURCE = 'src/csv/ja_jp/locatexts_ja_jp.koalocatext_base.csv'
ZH_SOURCE = 'src/csv/zh_cn/locatexts_zh_cn.koalocatext_base.csv'
UTF8_BOM = "\xEF\xBB\xBF".b

EDITS = {
  '32' => ['발라드 기도실', '발라드의 집(House of Ballads) 기도실', 'Ballads Oratory; House affiliation follows the established Ballads faction.'],
  '219' => ['계절의 집', '계절의 집(House of Seasons)', 'Explicit House of Seasons label.'],
  '621' => ['발라드의 집', '발라드의 집(House of Ballads)', 'Explicit House of Ballads label.'],
  '869' => ['복수의 집', '복수의 집(House of Vengeance)', 'Explicit House of Vengeance label.'],
  '973' => ['계절의 성소', '계절의 집(House of Seasons) 성소', 'Japanese identifies the abbreviated English title as the House of Seasons sanctuary.'],
  '1035' => ['긍지의 가문', '긍지의 집(House of Pride)', 'Explicit House of Pride label; align House terminology.'],
  '1597' => ['발라드 가문의 로브', '발라드의 집(House of Ballads) 로브', 'Explicit House of Ballads equipment name.'],
  '1729' => ['용맹의 가문', '용맹의 집(House of Valor)', 'Explicit House of Valor label; align House terminology.'],
  '2303' => ['비탄의 집', '비탄의 집(House of Sorrows)', 'Explicit House of Sorrows label.'],
  '2799' => ['시즌스(Seasons) 지하 통로', '계절의 집(House of Seasons) 지하 통로', 'The matching House of Seasons Tunnel source row at ID 3678 confirms the faction relation.'],
  '2921' => ['하우스 오브 발라드(House of Ballads)의 성역', '발라드의 집(House of Ballads) 성역', 'Japanese identifies this Ballads Sanctuary as the House of Ballads sanctuary.'],
  '3092' => ['하우스 오브 발라드(House of Ballads) 반지', '발라드의 집(House of Ballads) 반지', 'Explicit House of Ballads equipment name.'],
  '3159' => ['발라드 가문(House of Ballads)의 방패', '발라드의 집(House of Ballads) 방패', 'Explicit House of Ballads equipment name.'],
  '3304' => ['발라드 가문(House of Ballads)의 두건', '발라드의 집(House of Ballads) 두건', 'Explicit House of Ballads equipment name.'],
  '3333' => ['발라드 가문 인장 반지', '발라드의 집(House of Ballads) 인장 반지', "Ballads Signet Ring; standardize the named faction following the user's example."],
  '3678' => ['계절의 가문(House of Seasons) 지하 통로', '계절의 집(House of Seasons) 지하 통로', 'Explicit House of Seasons location.'],
  '3975' => ['발라드 가문(House of Ballads) 구내', '발라드의 집(House of Ballads) 구내', 'Explicit House of Ballads location.'],
  '4151' => ['비탄의 집', '비탄의 집(House of Sorrows)', 'Explicit House of Sorrows label.'],
  '4160' => ['발라드 가문 도서관', '발라드의 집(House of Ballads) 도서관', 'Japanese identifies the abbreviated English title as the House of Ballads library.'],
  '4475' => ['발라드 가문의 장갑', '발라드의 집(House of Ballads) 장갑', 'Explicit House of Ballads equipment name.'],
  '4513' => ['발라드 가문의 슬리퍼', '발라드의 집(House of Ballads) 슬리퍼', 'Explicit House of Ballads equipment name.']
}.freeze

def read_rows(path)
  CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
     .to_h { |row| [row['ID_Linha'], row] }
end

def escaped(value)
  value.to_s.gsub("\\", "\\\\").gsub("\t", "\\t").gsub("\r", "\\r").gsub("\n", "\\n")
end

original = File.binread(PATH)
abort "active base hash differs: #{Digest::SHA256.hexdigest(original)}" unless
  Digest::SHA256.hexdigest(original) == EXPECTED
abort 'byte-identical backup differs' unless File.binread(BACKUP) == original

affix_rows = read_rows(AFFIX_SOURCE)
affix_pattern = /\b(?:House of (?:Ballads|Sorrows|Valor|Vengeance|Pride|Seasons)|Ballads|Seasons|Valor|Vengeance|Pride|Sorrows?)\b/i
affix_matches = affix_rows.values.select { |row| row['Texto'].to_s.match?(affix_pattern) }
abort "unexpected House/faction terms in affix: #{affix_matches.length}" unless affix_matches.empty?

sources = {
  'en_us' => read_rows(BASE_SOURCE),
  'ja_jp' => read_rows(JA_SOURCE),
  'zh_cn' => read_rows(ZH_SOURCE)
}
active_rows = read_rows(PATH)

manifest_rows = []
EDITS.each do |id, (before, after, rationale)|
  english = sources.fetch('en_us').fetch(id)['Texto'].to_s
  japanese = sources.fetch('ja_jp').fetch(id)['Texto'].to_s
  chinese = sources.fetch('zh_cn').fetch(id)['Texto'].to_s
  active = active_rows.fetch(id)['Texto'].to_s
  abort "ID #{id}: unexpected previous Korean text #{active.inspect}" unless active == before
  manifest_rows << [id, escaped(english), escaped(japanese), escaped(chinese),
                    escaped(before), escaped(after), escaped(rationale)]
end

updated = original.dup
applied_edits = []
EDITS.keys.sort_by { |id| -id.to_i }.each do |id|
  before, after, = EDITS.fetch(id)
  source_row = "#{id};11;#{before}\r\n".b
  target_row = "#{id};11;#{after}\r\n".b
  matches = updated.split(source_row, -1).length - 1
  abort "ID #{id}: expected exactly one matching row, found #{matches}" unless matches == 1
  start_at = updated.index(source_row)
  updated[start_at, source_row.bytesize] = target_row
  applied_edits << [start_at, source_row, target_row]
end

inverse = updated.dup
applied_edits.reverse_each do |start_at, source_row, target_row|
  abort "inverse target row missing at byte #{start_at}" unless
    inverse.byteslice(start_at, target_row.bytesize) == target_row
  inverse[start_at, target_row.bytesize] = source_row
end
abort 'inverse substitutions did not restore original bytes' unless inverse == original

parsed = CSV.parse(updated.sub(/\A\xEF\xBB\xBF/n, '').force_encoding(Encoding::UTF_8),
                   headers: true, col_sep: ';')
abort "row count changed: #{parsed.length}" unless parsed.length == 4_844
abort 'ID order changed' unless parsed.map { |row| row['ID_Linha'].to_i } == (0...4_844).to_a
abort 'BOM changed' unless updated.start_with?(UTF8_BOM)
abort 'line-ending counts changed' unless
  updated.scan("\r\n".b).length == original.scan("\r\n".b).length &&
  updated.scan(/(?<!\r)\n/n).length == original.scan(/(?<!\r)\n/n).length
updated_rows = parsed.to_h { |row| [row['ID_Linha'], row['Texto']] }
EDITS.each do |id, (_before, after, _)|
  abort "ID #{id}: target value mismatch" unless updated_rows.fetch(id) == after
end
abort 'non-target rows changed' unless active_rows.all? do |id, row|
  EDITS.key?(id) || row['Texto'] == updated_rows.fetch(id)
end

File.binwrite(PATH, updated)
File.write(MANIFEST, [
  %w[id english japanese chinese korean_before korean_after rationale].join("\t"),
  *manifest_rows.map { |row| row.join("\t") }
].join("\n") + "\n")
puts "base rows reviewed=#{EDITS.length}; Texto cells changed=#{EDITS.length}; affix rows reviewed=#{affix_rows.length}; House/faction source hits=0"
puts "post=#{Digest::SHA256.hexdigest(updated)}; inverse/BOM/order/CSV/line-endings/non-target checks=OK"
