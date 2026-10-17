#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["place:hall-of-appointments", "Hall of Appointments", "알현 준비의 전당(Hall of Appointments)", "place", 16,
   "English default:5748/16959/29500/43811/59224 explicitly concerns preparing ambassadors and obtaining permission to meet the king, not appointment to office. Japanese 約束の間 and Chinese 会见厅/预约大厅 corroborate. Retain the contextual Korean already used at default:43811/43928; replace misleading 임명 variants and inconsistent reception-room labels."],
  ["place:summer-sanctuary", "Summer Sanctuary", "여름 성역(Summer Sanctuary)", "place", 6,
   "English default:29381/30347/34653/36507 identifies the named place with trainers, an alchemist, and the nurturing of knowledge. Japanese サマー・フェイの聖域 and Chinese 夏之圣所 corroborate. Reuse base:2551 and keep this place distinct from the Summer Court or Fae faction."],
  ["place:primos-sanctuary", "Primos Sanctuary", "프리모스의 성역(Primos Sanctuary)", "place", 2,
   "English base:4414/default:24629 and Japanese プリモスの聖域/Chinese 首领圣所 corroborate the complete place label. Primos is the already registered Kollossae office/title, not a newly inferred person. Reuse base 성역 and retain the previous title dispositions."],
  ["place:adessa-prison", "Adessa Prison", "아데사 감옥(Adessa Prison)", "place", 13,
   "English default:14456/20249/32831/35155/33227 identifies Esklad Teiner's prison and its restricted entry. Japanese アデッサの監獄 and Chinese 阿德萨监狱 corroborate. Keep the facility distinct from the city; Prisoner is not an exact facility-name match."],
  ["place:rathir-prison", "Rathir Prison", "라시르 감옥(Rathir Prison)", "place", 4,
   "English default:5357/13543/49792 and Japanese ラシーアの監獄/Chinese 拉瑟里监狱 corroborate the named prison. Preserve the city canonical 라시르 and source-local lowercase prison in the narrative without interpreting it as another institution."],
  ["place:mel-senshir-prison", "Mel Senshir Prison", "멜 센시르 감옥(Mel Senshir Prison)", "place", 3,
   "English default:5357/10836 and Japanese メル・センシアの監獄/Chinese 梅尔森溪监狱 corroborate the named prison. Preserve the city canonical 멜 센시르."],
  ["item:adessa-prison-key", "Adessa Prison Key", "아데사 감옥 열쇠(Adessa Prison Key)", "unique item", 1,
   "English base:1546, Japanese アデッサの監獄の鍵, and Chinese 阿德萨监狱钥匙 corroborate the full key label. Already canonical; register without changing the cell."],
  ["item:rathir-prison-key", "Rathir Prison Key", "라시르 감옥 열쇠(Rathir Prison Key)", "unique item", 1,
   "English base:2435, Japanese ラシーアの監獄の鍵, and Chinese 拉瑟里监狱钥匙 corroborate the full key label. Already canonical; register without changing the cell."],
  ["item:mel-senshir-prison-key", "Mel Senshir Prison Key", "멜 센시르 감옥 열쇠(Mel Senshir Prison Key)", "unique item", 1,
   "English base:1928, Japanese メル・センシアの監獄の鍵, and Chinese 梅尔森溪监狱钥匙 corroborate the complete key label. Replace the embedded city-only annotation with one full-name annotation."]
]
specs = data.map do |key, english, korean, category, count, notes|
  { key: key, english: english, korean: korean, category: category,
    count: count, notes: notes }
end
patterns = {
  "Hall of Appointments" => /(?:알현 준비의 전당|알현 신청실|알현의 전당|임명자의 전당|약속의 전당|임명의 전당|임명 전당|임명 회관|임명실|임명관|알현실|접견실)(?:\(Hall of Appointments\))?/,
  "Summer Sanctuary" => /(?:여름의 성소|여름 안식처|여름 성소|여름 성역)(?:\(Summer Sanctuary\))?/,
  "Primos Sanctuary" => /프리모스(?:\(Primos\))?의 (?:성역|성소)/,
  "Adessa Prison" => /아데사(?:\(Adessa\))? 감옥(?:\(Adessa Prison\))?/,
  "Rathir Prison" => /라시르(?:\(Rathir\))? 감옥(?:\(Rathir Prison\))?/,
  "Mel Senshir Prison" => /멜 센시르(?:\(Mel Senshir\))? 감옥(?:\(Mel Senshir Prison\))?/
}.freeze
context = <<~TEXT.strip
  English-led contextual review across affix/base/default of halls,
  sanctuaries, prisons and their exact key labels. The appointments hall
  prepares royal audiences: do not derive its meaning from Japanese or
  from the appointment-to-office sense in older Korean. The manual's
  PDF pp. 7-8 distinguishes quest locations, conversation, trainers,
  alchemy and quest items; it gives no direct facility spellings.
  Keep Primos's prior office/title judgment and all city-name judgments.
  Multiple entity matches on one row are counted once for batch row
  coverage. The shared prison list at default:5357 is expanded into three
  complete bilingual prison names without changing its English meaning.
TEXT

ReviewedDiscoverySpecs.run(
  21_356, "Audience Hall, Sanctuaries And Three City Prisons", specs, context,
  "## D-21355: Arduath Totem, Ghennig Key And Gloamfrost Component"
) do |spec, key, text, source|
  english = spec.fetch(:english)
  if key == ["default", "5357", ""]
    from = "아데사(Adessa), 라시르(Rathir), 멜 센시르(Mel Senshir) 감옥"
    to = "아데사 감옥(Adessa Prison), 라시르 감옥(Rathir Prison), 멜 센시르 감옥(Mel Senshir Prison)"
    if text.include?(from)
      raise "ambiguous shared list" unless text.scan(from).length == 1
      text = text.sub(from, to)
    end
    raise "shared facility label missing" unless text.include?(spec.fetch(:korean))
    [text, false]
  elsif english.end_with?(" Key")
    if english == "Mel Senshir Prison Key"
      raise "key label differs" unless text == "멜 센시르(Mel Senshir) 감옥 열쇠"
      [spec.fetch(:korean), false]
    else
      raise "canonical key label differs" unless text == spec.fetch(:korean)
      [text, false]
    end
  elsif JSON.parse(source.fetch("en_texts_json")).compact.any? { |t| t.match?(/\A#{Regexp.escape(english)} Key\z/i) }
    # A full key label already covers the facility name without nesting.
    [text, false]
  else
    pattern = patterns.fetch(english)
    raise "missing reviewed facility #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec.fetch(:korean)), false]
  end
end
