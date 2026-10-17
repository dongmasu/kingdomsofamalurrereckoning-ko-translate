#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "person:pearse", english: "Pearse", korean: "피어스(Pearse)",
    category: "person", count: 6,
    notes: "English default:37312/43099/63380 names Pearse as the scribe to Lir and describes entries from his journal. Japanese ピアース and Chinese 皮尔斯 corroborate the existing 피어스 spelling. Register only the attested scribe, not an inferred full name or an identity for Lir. In complete volume labels, annotate the whole title rather than nesting a person annotation."
  },
  {
    key: "unique item:wavemaker", english: "Wavemaker",
    korean: "파도지기(Wavemaker)", category: "unique item", count: 2,
    notes: "English default:18441 explicitly names the coral wand Wavemaker carried by the Whispering Witch; base:2844 supplies The Wavemaker. Japanese ウェーブメーカー and Chinese 驭浪者 corroborate the weapon. Reuse the existing descriptive-row name 파도지기 instead of the inconsistent literal 파도 제작자. Preserve the complete local English The Wavemaker on the base label."
  },
  {
    key: "title:the-mantle-passes", english: "The Mantle Passes",
    korean: "전해지는 망토(The Mantle Passes)", category: "title", count: 2,
    notes: "English base:2108/4615 has the same verbal title The Mantle Passes, corroborated by Japanese 渡されたマント. Neither says road, way or place; remove the unsupported 곳/길 additions and align both labels as 전해지는 망토. Chinese 帷幔通路 is not used to override the English verb or the Japanese transferred-cloak sense. This source-local title registration asserts no particular quest, location, wearer or symbolic succession."
  }
]
[
  ["Journal of Scribe Pearse, Vol. 1", "서기관 피어스의 일지 제1권"],
  ["The Journal of Scribe Pearse, Vol. 2", "서기관 피어스의 일지 제2권"],
  ["The Journal of Scribe Pearse, Vol. 3", "서기관 피어스의 일지 제3권"]
].each_with_index do |(english, korean), index|
  specs << {
    key: "named work:journal-of-scribe-pearse-vol-#{index + 1}",
    english: english, korean: "#{korean}(#{english})",
    category: "named work", count: 1,
    notes: "The exact English source label distinguishes volume #{index + 1} of Scribe Pearse's journal. Japanese 書記ピアースの日誌 and Chinese 书吏皮尔斯的日记 corroborate the journal and number. Preserve the existing Korean volume wording and each local English article; the first volume alone lacks The. Do not assign an individual prose journal entry to a specific volume without further evidence."
  }
end
%w[I II III IV V VI VII VIII IX X].each do |roman|
  english = "The Adventure #{roman}"
  specs << {
    key: "title:the-adventure-#{roman.downcase}", english: english,
    korean: "모험 #{roman}(#{english})", category: "title", count: 1,
    notes: "Exact English source title #{english}, Japanese \"冒険\"#{roman} and Chinese 冒险#{roman} agree on the title and numeral. Retain the already complete bilingual Korean label without a cosmetic whitespace edit. This exact numbered title does not establish an author, text-to-volume association or an identity with The Adventures of the One Without a Fate; no generic Adventure alias is registered."
  }
end
context = <<~TEXT.strip
  Review 20 distinct base/default keys for the scribe Pearse, his three
  journal-volume labels, the Wavemaker weapon, two identical Mantle Passes
  titles and ten exact numbered Adventure titles. Overlapping journal and
  person matches count once per CSV row. Keep source-full title annotations
  atomic and preserve already-bilingual spacing where no correction is
  needed. The official Korean manual PDF pp. 6-8 explains inventory,
  equipment and quest structure; it does not list these exact names.
  No affix key matches; all neighboring names and existing dispositions
  remain untouched. No inferred manuscript/quest identity or rarity.
TEXT
ReviewedDiscoverySpecs.run(
  21_365, "Numbered Titles, Pearse Journals And Wavemaker",
  specs, context, "## D-21364: Seasteel Material And Complete Book Titles"
) do |spec, key, text, _source|
  entity = spec.fetch(:key)
  updated = case entity
            when "person:pearse"
              if key.first == "base"
                text
              else
                raise "Pearse span missing" unless text.include?("피어스")
                text.gsub(/피어스(?:\(Pearse\))?/, spec.fetch(:korean))
              end
            when "unique item:wavemaker"
              if key.first == "base"
                raise "Wavemaker base label changed" unless text == "파도 제작자 (The Wavemaker)"
                "파도지기(The Wavemaker)"
              else
                raise "Wavemaker prose annotation changed" unless text.include?(spec.fetch(:korean))
                text
              end
            when "title:the-mantle-passes"
              raise "Mantle label changed" unless
                ["망토가 지나가는 곳 (The Mantle Passes)", "망토가 건네지는 길 (The Mantle Passes)"].include?(text)
              spec.fetch(:korean)
            when /\Anamed work:journal-of-scribe-pearse-vol-/
              if key.take(2) == %w[base 1279]
                raise "first volume label changed" unless text == "서기관 피어스(Pearse)의 일지 제1권"
                spec.fetch(:korean)
              else
                raise "complete journal label missing" unless text.include?("(#{spec.fetch(:english)})")
                text
              end
            else
              raise "complete Adventure label missing" unless
                entity.start_with?("title:the-adventure-") &&
                text.include?("(#{spec.fetch(:english)})")
              text
            end
  [updated, false]
end
