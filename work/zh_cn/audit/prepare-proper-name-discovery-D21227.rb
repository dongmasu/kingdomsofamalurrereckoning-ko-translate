#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "named work:codex-scaith", english: "Codex Scaith", category: "named work",
   korean: "스케이스의 서(Codex Scaith)", aliases: "The Codex Scaith",
   count: 11,
   notes: "English identifies a named family record-book: it contains the Scaith family's names, and Faitir must erase his own name from it to complete the banishment ritual. Japanese consistently calls it スケイスの書 (Book of Scaith); Chinese uses 《斯卡斯法典》, supporting the same named book. Reuse the already reviewed family-name spelling 스케이스 from First Scaith, and render the book's function as 서 rather than the misleading 법전. Standardize only source-matched Codex Scaith references; preserve book-title brackets and the separate Solemn Bell, Birth Candle, library, Scrivener, and ritual terms."},
  {key: "person:faitir-scaith", english: "Faitir Scaith", category: "person",
   korean: "페이티르 스케이스(Faitir Scaith)",
   count: 3,
   notes: "English explicitly gives the full name in the talisman label and two standalone character labels. Japanese フェイティル・スケイス and Chinese 费提尔·斯卡斯 corroborate the same person and family name. Reuse the established First Scaith family spelling 스케이스 and the repeated Korean personal-name spelling 페이티르; do not infer aliases for bare Faitir, the Scaith army, or other Scaith people."}
]

context = "English-led review of the named Scaith family record-book and Faitir's explicit full name across base/default. Japanese and Chinese corroborate the book/person identity; the First Scaith entry supplies the already reviewed Korean family-name comparator. Preserve source-local English annotations, title brackets, line breaks, particles, and unrelated quest details. Earlier sequential findings and historical global totals are not reopened or recounted."

ReviewedDiscoverySpecs.run(21_227, "Codex Scaith And Faitir Scaith", specs, context,
  "## D-21226: Grand Bursar Financial Institution") do |spec, key, text, _source|
  case spec[:key]
  when "named work:codex-scaith"
    pattern = /(?:스케이스 코덱스|스카이스 코덱스|스카이스 법전|스케이스 법전|스케이스의 법전|스카이스의 서|스케이스의 서|코덱스 스카이스)(?:\(Codex Scaith\))?/
    text = text.gsub(pattern, spec[:korean])
    raise "Codex Scaith Korean span missing for #{key.inspect}" if
      text == _source.fetch("work_text") && !text.include?(spec[:korean])
  when "person:faitir-scaith"
    text = text.gsub(/(?:파이티르|페이티르) 스케이스(?:\(Faitir Scaith\))?/, spec[:korean])
    raise "Faitir Scaith Korean span missing for #{key.inspect}" if
      text == _source.fetch("work_text") && !text.include?(spec[:korean])
  end
  [text, false]
end
