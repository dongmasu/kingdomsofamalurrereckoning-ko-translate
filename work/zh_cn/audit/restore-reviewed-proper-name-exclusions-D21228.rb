#!/usr/bin/env ruby

require "digest"
require_relative "continue-proper-name-reviewed-batches"

m = ReviewedNameBatches
index = m.table(m::INDEX)
matches = index.select do |row|
  row["entity_key"] == "person:phasmer-humm" &&
    m.key(row) == ["default", "13525", ""]
end
raise "expected one Phasmer's Curse person match" unless matches.length == 1
row = matches.first
raise "unexpected Phasmer's Curse source" unless row["matched_english"] == "Phasmer"
raise "unexpected active title text" unless row["korean_current"] == "파스머(Phasmer)의 저주"
raise "unexpected prior disposition" unless row["status"] == "needs-context"

row["status"] = "excluded"
row["evidence"] = "D-21079 prior exclusion restored during occurrence-index reconstruction: default:13525 is the complete standalone title Phasmer's Curse, not a person-name occurrence. The D-21079 review explicitly excluded this title from person:phasmer-humm. The title translation is preserved unchanged; no prior finding or global tally is reopened."
m.write_table(m::INDEX, index.headers, index)

manifest = File.join(__dir__, "proper-name-edits-D21228.tsv")
reviews = m.table(manifest).map(&:to_h)
backup = "/private/tmp/ko-translate-backups/20261016/before-proper-name-D21228/locatexts_zh_cn.koalocatext_default.csv"
before = Digest::SHA256.file(backup).hexdigest
after = Digest::SHA256.file(m.csv_path("default")).hexdigest
raise "unexpected pre-edit backup hash #{before}" unless
  before == "39222363bb4fd6815234a63f41da1537135bd60f882d7d84502f2adf4abfd897"
raise "unexpected active hash #{after}" unless
  after == "64216a57cd690d97bbe2d96b49e420ee32b95decbe3db0b43c2c5080b45633e6"
check = {
  resource: "default", cells: 7, before_sha256: before, after_sha256: after,
  backup: backup
}
verification = m.command!(
  "ruby", File.join(__dir__, "verify-proper-name-edits.rb"),
  "--review", manifest, "--backup-dir",
  "/private/tmp/ko-translate-backups/20261016/before-proper-name-D21228"
)
inventory = m.refresh_inventory
m.checkpoint(21_228, reviews, [check], verification, inventory)

theme_note = <<~TEXT

## D-21228: Existing Character Name Aliases

Added source-supported English spelling aliases to the existing
`person:hreid-amlethoe` and `person:nuala-ignas` entries; no duplicate people
were registered. Reviewed all seven newly matched rows across the Galette
Tunnels and Aodh/Sun Stone contexts, correcting the Korean names in each, and
preserved each source-local English spelling in parentheses. Japanese and
Chinese identify the same characters as the existing canonical entries.
The earlier dispositions for other entities on these rows and all historical
global totals remain unchanged.
TEXT

reconciliation_note = <<~TEXT

Index reconciliation restored the previously documented exclusion for
`person:phasmer-humm` at `default:13525`: “Phasmer's Curse” is a complete
title, not a person-name occurrence (D-21079). The Korean title was left
unchanged. This reinstates an existing scoped disposition; it is not a new
translation finding or a change to historical global totals.
TEXT

%W[named-scope-review-D21228-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D21228-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  File.write(path, text + theme_note + reconciliation_note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21228: Existing Character Name Aliases"
  raise "missing D-21228 marker" unless text.include?(marker)
  File.write(path, text.sub(marker, reconciliation_note + "\n" + marker))
end

puts "Restored the documented exclusion for person:phasmer-humm/default:13525."
