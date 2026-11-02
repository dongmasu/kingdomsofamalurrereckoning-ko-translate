#!/usr/bin/env ruby

require "csv"
require "json"

# Only reviewed effect-description IDs are eligible; dialogue and lore are excluded.
tone_ids = %w[
  620 1798 2300 2314 2446 2447 7423 8629 8698 9427 9430 9536 9652 9733
  9839 10001 10067 10086
  10116 10179 10263 10286 10436 10494 10499 10513 10830 10976
  11163 11327 11363 11385 11688 11895 11934 12051 12054
  16206 29367 29413 29432 29479 29579 29648 29672 29907 29929 30196 30202 30266 30303
  30462 30534 30654 30691 30696 30879 31441 31467 31804 33511 33520 34020 34151
  31166 33993 35029 42945 44393 44583 44602 44889 45722 47936 48108 48129
  48476 48914 49345 49632 49745 49758 49850 49871 50395 50494 50503 50837
  54090 58484 61206 61954 63422 63511 63545 63640 63708 63852 64036 64143
]

endings = {
  "되었다" => "되었습니다",
  "기절시킨다" => "기절시킵니다",
  "베어낸다" => "베어냅니다",
  "내리친다" => "내리칩니다",
  "날린다" => "날립니다",
  "부여한다" => "부여합니다",
  "발사한다" => "발사합니다",
  "표시한다" => "표시합니다",
  "증가한다" => "증가합니다",
  "상승한다" => "상승합니다",
  "향상된다" => "향상됩니다",
  "감소한다" => "감소합니다",
  "방해한다" => "방해합니다",
  "흩뿌린다" => "흩뿌립니다",
  "늘어난다" => "늘어납니다",
  "발생한다" => "발생합니다",
  "해금한다" => "해금합니다",
  "추가된다" => "추가됩니다",
  "불러낸다" => "불러냅니다",
  "소모한다" => "소모합니다",
  "중첩된다" => "중첩됩니다",
  "불태운다" => "불태웁니다",
  "일으킨다" => "일으킵니다",
  "흡수한다" => "흡수합니다",
  "지속된다" => "지속됩니다",
  "휘청이게 한다" => "휘청이게 합니다",
  "비틀거리게 한다" => "비틀거리게 합니다",
  "입힌다" => "입힙니다",
  "얻는다" => "얻습니다",
  "획득한다" => "획득합니다",
  "입는다" => "입습니다",
  "줄인다" => "줄입니다",
  "가한다" => "가합니다",
  "퍼붓는다" => "퍼붓습니다",
  "빠져든다" => "빠져듭니다",
  "소환한다" => "소환합니다",
  "줄어든다" => "줄어듭니다",
  "초기화된다" => "초기화됩니다",
  "커진다" => "커집니다",
  "막는다" => "막습니다",
  "없다" => "없습니다",
  "있다" => "있습니다",
  "책이다" => "책입니다",
  "일지다" => "일지입니다",
  "맥동한다" => "맥동합니다",
  "머금는다" => "머금습니다",
  "견딘다" => "견딥니다",
  "이름값을 한다" => "이름값을 합니다",
  "다치기 십상이다" => "다치기 십상입니다",
  "준다" => "줍니다"
}

tiers = {
  "2013" => ["재주(Finesse)", 2],
  "4520" => ["마법(Sorcery)", 4],
  "19890" => ["재주(Finesse)", 4],
  "21976" => ["힘(Might)", 4],
  "23521" => ["마법(Sorcery)", 2],
  "29062" => ["힘(Might)", 2],
  "47684" => ["힘(Might), 재주(Finesse), 마법(Sorcery)", 4],
  "51501" => ["힘(Might), 재주(Finesse), 마법(Sorcery)", 3],
  "55683" => ["힘(Might), 재주(Finesse), 마법(Sorcery)", 2]
}

def parse(bytes)
  CSV.parse(bytes.dup.force_encoding("UTF-8").sub(/\A\uFEFF/, "").gsub("\r\n", "\n"),
            headers: true, col_sep: ";", row_sep: "\n")
end

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
original = File.binread(path)
rows = parse(original)
references = %w[en_us ja_jp zh_cn].to_h do |locale|
  source = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  [locale, parse(source).to_h { |row| [row["ID_Linha"], row["Texto"]] }]
end
changes = {}
unconverted = []
rows.each do |row|
  id = row["ID_Linha"]
  before = row["Texto"]
  next unless tone_ids.include?(id) || tiers.key?(id) || id == "10202" || id == "31992"
  after = before.dup
  reason = "effect-register"
  if tone_ids.include?(id)
    endings.each do |old, replacement|
      after.gsub!(/#{Regexp.escape(old)}(?=[.!]|\z)/, replacement)
    end
    # Remove the player-directed informal pronoun from an otherwise formal tooltip.
    after.sub!("다른 사람을 네 뜻대로", "다른 사람을 자신의 뜻대로") if id == "29648"
    unconverted << [id, after] if after.match?(/(?<!니)다(?:[.!]|\z)/)
  elsif tiers.key?(id)
    tree, tier = tiers.fetch(id)
    expected = "+1 to the first #{tier} tiers of unlocked "
    abort "source mismatch #{id}" unless references["en_us"].fetch(id).start_with?(expected)
    after = "#{tree} 능력 트리의 1~#{tier}단계에서 이미 습득한 능력의 레벨이 각각 1 증가합니다."
    reason = "ability-tree-tier-versus-ability-rank"
  else
    after.sub!("탈취", "흡수")
    after.sub!("훔침", "흡수")
    reason = "mana-steal-terminology"
  end
  next if after == before
  abort "line breaks changed #{id}" unless before.count("\n") == after.count("\n")
  abort "tokens changed #{id}" unless before.scan(/\{[^}]*\}/) == after.scan(/\{[^}]*\}/)
  changes[id] = { before: before, after: after, reason: reason,
                  en: references["en_us"].fetch(id),
                  ja: references["ja_jp"].fetch(id),
                  zh: references["zh_cn"].fetch(id) }
end
unless unconverted.empty?
  abort "unconverted endings:\n" + unconverted.map { |id, text| "#{id}: #{text}" }.join("\n")
end

# Replace serialized text in its original record, preserving every byte outside it.
updated = original.split(/(?=^\d+;)/).map do |record|
  id = record[/\A(\d+);/n, 1]
  next record unless changes.key?(id)
  change = changes.fetch(id)
  csv_record = parse("ID_Linha;Texto\n".b + record).first
  abort "record mismatch #{id}" unless csv_record["Texto"] == change[:before]
  text = change[:after]
  old_field = record.byteslice(id.bytesize + 1..).sub(/\r?\n\z/n, "")
  encoded = if old_field.start_with?('"'.b)
              '"' + text.gsub('"', '""') + '"'
            else
              abort "quoting required #{id}" if text.match?(/[;"\n]/)
              text
            end
  # Newlines inside the field retain their original per-record template.
  separators = old_field.scan(/\r\n|\n/n)
  index = 0
  encoded = encoded.gsub("\n") { separators.fetch(index).tap { index += 1 } }
  abort "newline template mismatch #{id}" unless index == separators.length
  id.b + ";".b + encoded.b + (record.end_with?("\r\n".b) ? "\r\n".b : "\n".b)
end.join

after_rows = parse(updated)
abort "keys changed" unless rows.map { |r| r["ID_Linha"] } == after_rows.map { |r| r["ID_Linha"] }
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "EOL changed" unless original.scan(/\r\n|\n|\r/n) == updated.scan(/\r\n|\n|\r/n)
after_rows.each_with_index do |row, index|
  id = row["ID_Linha"]
  expected = changes.key?(id) ? changes.fetch(id)[:after] : rows[index]["Texto"]
  abort "unexpected text change #{id}" unless row["Texto"] == expected
end
report = "work/zh_cn/audit/item-effect-consistency-20261103.json"
history = File.exist?(report) ? JSON.parse(File.read(report)) : {}
changes.each do |id, change|
  if history.key?(id)
    abort "audit history mismatch #{id}" unless history[id]["after"] == change[:before]
    change[:before] = history[id]["before"]
  end
  history[id] = change
end
File.binwrite(path, updated)
File.write(report, JSON.pretty_generate(history) + "\n")
puts "changed #{changes.length} default rows; keys, tokens, BOM and EOL preserved"
puts changes.group_by { |_, c| c[:reason] }.transform_values(&:length)
