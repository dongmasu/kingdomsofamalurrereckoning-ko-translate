#!/usr/bin/env ruby

require "csv"
require "json"

DEFAULT_PATH = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
AUDIT_PATH = "work/zh_cn/audit/codex-term-consistency-20261103.json"

EDITS = {
  "781" => ["지고왕(High King)은 그 코덱스(Codex)를 썼을 리 없다고", "지고왕(High King)이 그 코덱스(Codex)를 썼을 리 없다고"],
  "4603" => ["서책을 건네면", "코덱스(Codex)를 건네면"],
  "4837" => ["여기 코덱스가 있네", "여기 코덱스(Codex)가 있네"],
  "5809" => ["네가 찾은 건 평범한 로어스톤이 아니야.", "네가 찾은 코덱스(Codex)는 평범한 로어스톤이 아니야."],
  "7222" => ["내 예지, 즉 대전서는", "내 예지, 즉 코덱스(Codex)는"],
  "7258" => ["대전서 제시", "코덱스(Codex) 제시"],
  "7428" => ["대전서(Codex)", "코덱스(Codex)"],
  "7932" => ["이건 이야기에서 나오던 바로 그 고대 사본이야.", "이건 이야기에서 나오던 바로 그 고대 코덱스(Codex)야."],
  "8794" => ["코덱스를 두고", "코덱스(Codex)에 관해"],
  "10397" => ["코덱스의 일부", "코덱스(Codex)의 일부"],
  "10529" => ["그 코덱스가", "그 코덱스(Codex)가"],
  "10581" => ["코덱스를 읽을", "코덱스(Codex)를 읽을"],
  "11005" => ["이 코덱스부터", "이 코덱스(Codex)부터"],
  "12357" => ["성스러운 법전(Codex)에", "성스러운 코덱스(Codex)에"],
  "13127" => ["《운명의 서》에", "코덱스(Codex)에"],
  "13845" => ["그 서(Codex)에는", "코덱스(Codex)에는"],
  "15061" => ["코덱스에 예외가", "코덱스(Codex)에 예외가"],
  "16846" => ["이 법전이", "이 코덱스(Codex)가"],
  "17368" => ["법전에 예외가", "코덱스(Codex)에 예외가"],
  "19031" => ["《대전서》에", "코덱스(Codex)에"],
  "25041" => ["그 문서가 정말 위조품인가?", "그 코덱스(Codex)가 정말 위조품인가?"],
  "27020" => ["이 운명의 서에는", "이 코덱스(Codex)에는"],
  "33413" => ["그 서책에 관해서는", "그 코덱스(Codex)에 관해서는"],
  "34495" => ["그 코덱스도", "그 코덱스(Codex)도"],
  "37527" => ["그 코덱스는", "그 코덱스(Codex)는"],
  "38839" => ["그 책에 관한", "그 코덱스(Codex)에 관한"],
  "39117" => ["이 법전을 보자", "이 코덱스(Codex)를 보자"],
  "40343" => ["그 서책을 가져가는", "그 코덱스(Codex)를 가져가는"],
  "45206" => ["질서의 서에 남은 마지막 장 가운데 하나인", "질서의 서(Codex of Order)에 남은 마지막 장 가운데 하나인"],
  "46305" => ["코덱스를 여기서", "코덱스(Codex)를 여기서"],
  "50067" => ["진짜 서책이 발견되길", "진짜 코덱스(Codex)가 발견되길"],
  "52070" => ["너와 그 서를 기다리고 있어", "너와 코덱스(Codex)를 기다리고 있어"],
  "48051" => ["글리아날(Glianal)에게 법전을 보여 주기", "글리아날(Glianal)에게 코덱스(Codex)를 보여 주기"],
  "52653" => ["그 법전(Codex)은", "그 코덱스(Codex)는"],
  "56525" => ["바칠 법전이 있어", "바칠 코덱스(Codex)가 있어"],
  "58186" => ["코덱스를 해독했다", "코덱스(Codex)를 해독했다"],
  "62408" => ["저 고서를 살펴볼", "저 코덱스(Codex)를 살펴볼"],
  "63284" => ["율서의 형식을 따라", "코덱스(Codex)의 형식을 따라"]
}.freeze

def parse(bytes)
  CSV.parse(bytes.dup.force_encoding("UTF-8").sub(/\A\uFEFF/, "").gsub("\r\n", "\n"),
            headers: true, col_sep: ";", row_sep: "\n").reject { |row| row["ID_Linha"].nil? }
end

def load_texts(path)
  parse(File.binread(path)).to_h { |row| [row["ID_Linha"], row["Texto"]] }
end

before_bytes = File.binread(DEFAULT_PATH)
before_rows = parse(before_bytes)
before_by_id = before_rows.to_h { |row| [row["ID_Linha"], row] }
previous_audit = if File.exist?(AUDIT_PATH)
                   JSON.parse(File.read(AUDIT_PATH)).to_h { |entry| [entry.fetch("id"), entry] }
                 else
                   {}
                 end
refs = %w[en_us ja_jp zh_cn].to_h do |locale|
  path = "src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv"
  [locale, load_texts(path)]
end

raw = before_bytes.dup.force_encoding("UTF-8")
original_texts = {}
EDITS.each do |id, (old_fragment, new_fragment)|
  row = before_by_id.fetch(id) { abort "missing target ID #{id}" }
  source = refs.fetch("en_us").fetch(id)
  abort "source has no Codex: #{id}" unless source.match?(/\bcodex\b/i)
  original_texts[id] = row["Texto"]
  if row["Texto"].include?(old_fragment)
    occurrences = raw.scan(Regexp.new(Regexp.escape(old_fragment))).length
    abort "fragment occurrence count #{id}: #{occurrences}" unless occurrences == 1
    raw.sub!(old_fragment, new_fragment)
  elsif !row["Texto"].include?(new_fragment)
    abort "expected fragment missing at #{id}: #{old_fragment}"
  end
end

after_rows = parse(raw)
abort "record count changed" unless before_rows.length == after_rows.length
before_rows.zip(after_rows).each do |before, after|
  abort "row key/order changed at #{before['ID_Linha']}" unless
    before.to_h.reject { |key, _| key == "Texto" } == after.to_h.reject { |key, _| key == "Texto" }
end
abort "BOM changed" unless before_bytes.byteslice(0, 3) == raw.b.byteslice(0, 3)
abort "line endings changed" unless before_bytes.scan(/\r\n|\n|\r/n) == raw.b.scan(/\r\n|\n|\r/n)

after_by_id = after_rows.to_h { |row| [row["ID_Linha"], row] }
audit = EDITS.keys.map do |id|
  row = after_by_id.fetch(id)
  {
    id: id,
    before: previous_audit.dig(id, "before") || original_texts.fetch(id),
    after: row["Texto"],
    en: refs.fetch("en_us").fetch(id),
    ja: refs.fetch("ja_jp").fetch(id),
    zh: refs.fetch("zh_cn").fetch(id)
  }
end

File.binwrite(DEFAULT_PATH, raw.b)
File.write(AUDIT_PATH, JSON.pretty_generate(audit) + "\n")
puts "Updated #{EDITS.length} Codex rows; BOM, row keys/order, and exact line endings preserved."
