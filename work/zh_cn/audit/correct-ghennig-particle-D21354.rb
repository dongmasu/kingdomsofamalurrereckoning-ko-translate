#!/usr/bin/env ruby

require_relative "continue-proper-name-reviewed-batches"

m = ReviewedNameBatches
d = 21_354
inventory = m.refresh_inventory
key = ["base", "180", "11"]
source = inventory.fetch(key)
prior = m.table(File.join(__dir__, "proper-name-edits-D21351.tsv")).find do |r|
  m.key(r) == key
end
raise "missing accepted D-21351 row" unless prior && prior["status"] == "accepted"
old = source.fetch("work_text")
raise "unexpected Ghennig door label" unless old == "게니그(Ghennig)으로 가는 문"
review = prior.to_h.merge(
  "old" => old, "new" => "게니그(Ghennig)로 가는 문",
  "evidence" => "D-21354 corrective read-through of D-21351, not a new entity/occurrence finding. Ghennig is a keep/place (English Door To Ghennig, Japanese ゲンニグへの扉, Chinese 通往格尼格的门). The accepted 게니그 spelling ends in a vowel and requires directional 로, not the 으로 carried over from 게닉. Preserve D-21351's canonical name and accepted occurrence status; retain its previous evidence.",
  "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
  "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
  "chinese" => source.fetch("zh_text")
)
path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise "correction manifest already exists" if File.exist?(path)
before = m.table(m::INDEX).group_by { |r| r["status"] }.transform_values(&:length)
m.write_table(path, m::HEADERS, [review])
m.run(path, d, nil, review_states: ["accepted"])
after = m.table(m::INDEX).group_by { |r| r["status"] }.transform_values(&:length)
raise "correction changed occurrence counts" unless before == after
puts "PASS Ghennig corrective particle edit; no new entity/occurrence or count change"
