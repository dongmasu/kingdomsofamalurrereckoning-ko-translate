#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "organization:grand-bursars", english: "Grand Bursar's", category: "organization",
   korean: "대회계원(Grand Bursar's)", aliases: "Grand Bursar|Grand Bursars|Bursar's|Bursars",
   count: 40, variants: "대재무관|대회계관|수석 재무관|회계관|재무관",
   notes: "English default:24378 explicitly describes founding an institution that manages city finances; default:5077 calls it the city's financial heart, and default:20203 uses its clients. Japanese 大会計院/会計院 corroborates an institution rather than a named official; Chinese 大财务司 supports this despite inconsistent person-like 财政大臣 elsewhere. The possessive Bursar's and plural-looking Bursars are source variants for the same institution in these reviewed city/loan/vault contexts, not Korean plural people. Keep each source-local English form in its annotation; no bare Bursar alias is registered, so unrelated or owner-key labels are not guessed. Default:42405's truncated title reference is restored from the complete English sentence."}
]
context = "English-led institutional name review across affix/base/default, including 24 Grand forms and 16 contextual short forms. Official Korean manual PDF pages 7-8 describe merchants/dialogue generally but do not name this financial institution. Normalize to 대회계원, not an individual grand treasurer. Preserve vault, investment, renovation and office context, all figures, paragraph breaks and unrelated names."
ReviewedDiscoverySpecs.run(21_226, "Grand Bursar Financial Institution", specs, context,
  "## D-21225: Four Registered Title Consistency Groups") do |_spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  forms = english.scan(/(?<![A-Za-z])(?:Grand )?Bursar(?:'s|s)?(?![A-Za-z])/)
  raise "missing English institution form #{key}" if forms.empty?
  if key == ["base", "4347", "11"]
    text = "대회계원(The Grand Bursar's)"
  elsif key == ["default", "33521", ""]
    text = "대회계원(Grand Bursar's)"
  elsif key == ["default", "63797", ""]
    text = "제5장: 대회계원(The Grand Bursar's)"
  elsif key == ["default", "42405", ""]
    raise "unexpected truncated reference" unless text.end_with?("대회계관의...")
    text = text.sub("대회계관의...", "대회계원(Grand Bursar's)을 다룬다고 적혀 있다.")
  else
    ordinal = 0
    pattern = /(?:대회계원|대회계관|대재무관|수석 재무관|회계관|회계원|재무관|회계 담당자)(?:의 집무실| 사무실|실)?(?:들)? ?(?:\((?:The )?(?:Grand )?Bursar(?:'s|s)?\))?(?:들)?/
    text = text.gsub(pattern) do
      form = forms.fetch(ordinal)
      ordinal += 1
      "대회계원(#{form})"
    end
    raise "institution mention-count mismatch #{key}: #{ordinal}/#{forms.length}" unless ordinal == forms.length
    # Institution locations take 에, and 원 requires 으로 rather than 로.
    text.gsub!(/(대회계원\([^)]*\))에게/, '\1에')
    text.gsub!(/(대회계원\([^)]*\))로/, '\1으로')
  end
  [text, false]
end
