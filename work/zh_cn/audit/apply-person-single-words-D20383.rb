#!/usr/bin/env ruby
require 'csv'
require 'digest'

PATH = 'work/zh_cn/locatexts_zh_cn.koalocatext_default.csv'
BACKUP = '/private/tmp/ko-translate-backups/20261014/before-person-single-words-D20383/locatexts_zh_cn.koalocatext_default.csv'
EXPECTED = '200c3a81b6fbe23d231d5a28e64cfd426d7f6a4e2c0b47ec2dbfc5e1675e2c89'
REPORT = 'work/zh_cn/audit/person-single-word-edits-D20383.tsv'

NAMES = %w[
  Aara Abergast Adar Aedran Aery Aewald Afan Agarth Agraivin Aideh Alabon
  Alaghus Alfarinn Alisen Alleia Aloff Alyn Ametair Amfast Andronikos Anela
  Anjar Anokatos Anru Anwon Anwy Anwyr Arawyn Arba Arbos Arden Arick Arigal
  Ariope Arkes Arnick Arvia Atheof Atteia Aurela Aurenda Azo Badon Bardan
  Baret Bareth Barten Bayala Bedlym Boderill Borm Breid Brennac Brighthelm
  Brio Bronwen Brun Bruten Burdick Cadoroc Cady Caelrod Caerwyn Caledus
  Callidus Calovar Carowyn Casmaran Catrin Cemble Chalin Cirys Cleas Codgan
  Colet Colliane Conni Connovar Corelon Coriana Courdan Creth Crilgarin
  Cryamor Cydan Cyf Daltan Darkvari Davril Deadeye Derfel Desiderus Donnoh
  Drefan Dren Drewn Duxtir Dyth Ealfhelm Edar Edstar Egest Eilaly Einar
  Ellova Elswin Emundas Enser Enton Eormen Erann Eriad Erion Eselette Esha
  Esklad Eswin Fahrlang Fallon Fel Fendar Ficon Finna Florian Florion Frenn
  Fridi Fynn Gadflow Gaius Galataea Garaner Garrou Gask Gavroche Gelt Geoff
  Gerald Gifre Glianal Gnarsh Golgoti Gonthorm Gorrenet Gorrier Gortan Graem
  Gray Grian Grimmy Guenfear Guian Guran Gwalchmai Hain Halcyor Hallidite
  Harit Hartwen Helt Hendi Hicener Hidon Hiroen Holte Hoswig Hugues Hystis
  Icob Idwa Iltheia Iluvia Imas Indre Janara Janick Javret Jeibir Jokull
  Jorielle Kaharine Kahrunk Kallas Kalt Kandir Karth Katarina Kest Kiftal
  Kildeen Kolmir Korrinna Kura Lanus Lenero Leodwald Lerkara Liordran Loutre
  Macit Magessa Magnus Magwyr Mallion Malthon Mandolph Marr Mattix Maura
  Maxen Meroch Milou Mina Morhen Morkan Myrcyr Mythany Myrrine Nameria
  Nanne Nareen Nargyfier Nel Nemius Nol Nomeron Octienne Odgray Odwig Olaana
  Ommer Onesimos Onwig Oraven Orcha Ordo Orieator Orwae Orwin Osduin Othel
  Ouet Pagus Parwen Passant Peliad Pengaras Penri Pinadike Pome Porthe Pura
  Purta Quay Racinon Raemund Rathgar Ratofer Reddle Regnatorix Renevel Rhiad
  Rhode Rialtes Rikka Risberg Rolan Rorid Ruhnir Sammoc Saramer Secandra
  Sele Selni Seterlu Shirin Sinon Skoria Sorli Stella Straton Sverri Tak Tal
  Talibor Tanra Tarca Tari Tarion Taibreah Teague Teiner Tems Tenhwa Tennes
  Terenia Tetran Thaddeus Thelgood Thombrum Tilera Tirin Titarion Trav Tyr
  Ucobal Uda Udin Ugnar Unfer Urlik Ursin Varen Ventrinio Vernt Vilsar Vire
  Vlaskar Vogard Vonne Vorm Walen Winred Wulf Wulflac Wyl Wyll Wylla Wyvyrn
  Xeno Zoef Zotikus Zungar Bloodgrin Grastar Kellerac Kurtorix Lysander
  Padaxes
].uniq

# These forms are supported by explicit full-name occurrences or by the
# Japanese/Chinese name readings where the active Korean label was misleading.
OVERRIDES = {
  'Aewald' => '애월드',
  'Abergast' => '애버개스트',
  'Aedran' => '에이드런',
  'Alaghus' => '알라구스',
  'Alfarinn' => '알파린',
  'Anwy' => '안웨이',
  'Baret' => '베럿',
  'Bedlym' => '베들림',
  'Boderill' => '보더릴',
  'Callidus' => '칼리두스',
  'Cirys' => '시리스',
  'Codgan' => '코드건',
  'Cydan' => '사이단',
  'Deadeye' => '데드아이',
  'Drewn' => '드루엔',
  'Ealfhelm' => '이알프헬름',
  'Egest' => '에게스트',
  'Eilaly' => '에일랄리',
  'Einar' => '아이너',
  'Enton' => '엔턴',
  'Erann' => '에란',
  'Fendar' => '펜다르',
  'Fallon' => '팰런',
  'Garrou' => '개로우',
  'Gifre' => '기프르',
  'Gorrier' => '고리어',
  'Gortan' => '고탄',
  'Gnarsh' => '나르쉬',
  'Gray' => '그레이',
  'Grastar' => '그라스타',
  'Guenfear' => '구엔페어',
  'Hain' => '헤인',
  'Harit' => '하리트',
  'Hugues' => '휴그',
  'Jeibir' => '제이버',
  'Jokull' => '조컬',
  'Kahrunk' => '카룽크',
  'Karth' => '카르스',
  'Kildeen' => '킬딘',
  'Lenero' => '레네로',
  'Magessa' => '마게사',
  'Magwyr' => '마그위르',
  'Maxen' => '맥센',
  'Morkan' => '모르칸',
  'Myrrine' => '미린',
  'Nareen' => '나린',
  'Nargyfier' => '나르지피어',
  'Ouet' => '오에트',
  'Parwen' => '파르웬',
  'Passant' => '파상트',
  'Peliad' => '펠리아드',
  'Pome' => '폼',
  'Quay' => '퀘이',
  'Sammoc' => '새목',
  'Sele' => '셀레',
  'Shirin' => '시린',
  'Sorli' => '솔리',
  'Straton' => '스트라톤',
  'Tems' => '템스',
  'Thaddeus' => '새디어스',
  'Thelgood' => '셀굿',
  'Ursin' => '우르신',
  'Vire' => '비르',
  'Vogard' => '보가드',
  'Vonne' => '본느',
  'Wulflac' => '울플랙',
  'Wyvyrn' => '와이번',
  'Zoef' => '조프'
}.freeze

def csv_rows(path)
  CSV.read(path, encoding: 'bom|utf-8', col_sep: ';', headers: true).map(&:to_h)
end

active_bytes = File.binread(PATH)
abort 'active CSV hash differs' unless Digest::SHA256.hexdigest(active_bytes) == EXPECTED
abort 'byte-identical backup differs' unless File.binread(BACKUP) == active_bytes

ko_rows = csv_rows(PATH)
sources = %w[en_us ja_jp zh_cn].to_h do |locale|
  rows = csv_rows("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  [locale, rows.to_h { |row| [row['ID_Linha'], row['Texto']] }]
end
ko_by_id = ko_rows.to_h { |row| [row['ID_Linha'], row] }
name_set = NAMES.to_h { |name| [name, true] }
context_forms = Hash.new { |hash, key| hash[key] = Hash.new(0) }
ko_rows.each do |row|
  row['Texto'].to_s.scan(/([가-힣]{1,16})\(([A-Za-z][A-Za-z'-]*)\)/) do |hangul, english|
    context_forms[english][hangul] += 1 if name_set[english]
  end
end

groups = Hash.new { |hash, key| hash[key] = [] }
ko_rows.each do |row|
  id = row['ID_Linha']
  english = sources['en_us'][id].to_s
  match = english.match(/\A([A-Z][A-Za-z'-]*)([?!]?)\z/)
  groups[match[1]] << row if match && name_set[match[1]]
end

changes = {}
group_notes = {}
groups.each do |name, rows|
  text_forms = rows.each_with_object([]) do |row, forms|
    match = row['Texto'].to_s.match(/\A([가-힣]+)\(#{Regexp.escape(name)}\)[?!]?\z/)
    forms << match[1] if match
  end
  available_forms = context_forms[name]
  canonical =
    if OVERRIDES[name]
      OVERRIDES[name]
    elsif !text_forms.empty?
      text_forms.group_by(&:itself).max_by { |form, values| [values.length, form] }[0]
    elsif !available_forms.empty?
      available_forms.max_by { |form, count| [count, form] }[0]
    else
      hangul = rows.each_with_object([]) do |row, forms|
        match = row['Texto'].to_s.match(/\A([가-힣]+)[?!]?\z/)
        forms << match[1] if match
      end
      hangul.group_by(&:itself).max_by { |form, values| [values.length, form] }&.[](0)
    end

  rows.each do |row|
    id = row['ID_Linha']
    old = row['Texto'].to_s
    next if old.match?(/\A[가-힣]+\(#{Regexp.escape(name)}\)[?!]?\z/)
    match = old.match(/\A(?:([가-힣]+)|#{Regexp.escape(name)})([?!]?)\z/)
    next unless match
    abort "no supported Korean form for #{name} at ID #{id}" unless canonical
    replacement = "#{canonical}(#{name})#{match[2]}"
    changes[id] = [old, replacement, name]
  end

  group_notes[name] = {
    'canonical' => canonical,
    'standalone_ids' => rows.map { |row| row['ID_Linha'] },
    'evidence_forms' => available_forms.sort_by { |form, count| [-count, form] }
  }
end

header = active_bytes.sub(/\A\xEF\xBB\xBF/n, '').split(/\r?\n/, 2).first
columns = CSV.parse_line(header, col_sep: ';')
texto_index = columns.index('Texto')
abort 'Texto column missing' unless texto_index

def record_match(bytes, id)
  match = bytes.match(/^#{Regexp.escape(id)};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  match
end

def field_spans(record)
  spans = []
  start = 0
  quoted = false
  i = 0
  while i < record.bytesize
    byte = record.getbyte(i)
    if byte == 34
      if quoted && record.getbyte(i + 1) == 34
        i += 1
      else
        quoted = !quoted
      end
    elsif byte == 59 && !quoted
      spans << (start...i)
      start = i + 1
    end
    i += 1
  end
  finish = record.bytesize
  finish -= 2 if record.byteslice(finish - 2, 2) == "\r\n".b
  finish -= 1 if finish > start && record.getbyte(finish - 1) == 10
  spans << (start...finish)
  spans
end

def cell_value(record, span)
  field = record.byteslice(span).dup.force_encoding(Encoding::UTF_8)
  CSV.parse_line(field, col_sep: ';').first
end

changes.each do |id, (old, _replacement, _name)|
  row_match = record_match(active_bytes, id)
  spans = field_spans(row_match[0])
  abort "Texto field missing at ID #{id}" unless cell_value(row_match[0], spans[texto_index]) == old
end

puts "confirmed-name groups=#{groups.length}; pending Texto cells=#{changes.length}"
groups.keys.sort.each do |name|
  ids = changes.select { |_id, (_old, _new, candidate)| candidate == name }.keys
  next if ids.empty?
  puts "#{name}\t#{group_notes[name]['canonical']}\t#{ids.join(',')}"
end
exit unless ENV['APPLY'] == '1'

updated = active_bytes.dup
changes.keys.sort_by { |id| -id.to_i }.each do |id|
  old, replacement, = changes[id]
  row_match = record_match(updated, id)
  spans = field_spans(row_match[0])
  span = spans[texto_index]
  abort "old target mismatch at ID #{id}" unless cell_value(row_match[0], span) == old
  start_at = row_match.begin(0) + span.begin
  end_at = row_match.begin(0) + span.end
  updated[start_at...end_at] = replacement.b
end

inverse = updated.dup
changes.keys.sort_by { |id| -id.to_i }.each do |id|
  old, replacement, = changes[id]
  row_match = record_match(inverse, id)
  spans = field_spans(row_match[0])
  span = spans[texto_index]
  abort "new target mismatch at ID #{id}" unless cell_value(row_match[0], span) == replacement
  start_at = row_match.begin(0) + span.begin
  end_at = row_match.begin(0) + span.end
  inverse[start_at...end_at] = old.b
end
abort 'inverse edit did not restore original bytes' unless inverse == active_bytes

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
abort 'BOM, line endings, or ID order changed' unless shape.call(active_bytes) == shape.call(updated)
parsed_bytes = updated.sub(/\A\xEF\xBB\xBF/n, '').force_encoding(Encoding::UTF_8)
parsed_after = CSV.parse(parsed_bytes, col_sep: ';', headers: true)
abort 'parsed row count changed' unless parsed_after.length == ko_rows.length
abort 'target cell verification failed' unless changes.all? do |id, (_old, replacement, _)|
  parsed_after.find { |row| row['ID_Linha'] == id }['Texto'] == replacement
end

File.binwrite(PATH, updated)
File.open(REPORT, 'w') do |file|
  file.puts "ID\tEnglish\tJapanese\tChinese\tPrevious Korean\tKorean with English"
  changes.each do |id, (old, replacement, name)|
    file.puts [
      id, sources['en_us'][id], sources['ja_jp'][id], sources['zh_cn'][id], old, replacement
    ].map { |value| value.to_s.gsub(/[\t\r\n]/, ' ') }.join("\t")
  end
end
puts "pre=#{EXPECTED} post=#{Digest::SHA256.hexdigest(updated)} edited=#{changes.length} inverse/BOM/endings/order/CSV=OK"
