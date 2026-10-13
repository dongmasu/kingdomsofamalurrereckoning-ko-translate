require "digest"
require "fileutils"
require "json"

number = Integer(ARGV.fetch(0))
first = Integer(ARGV.fetch(1))
last = Integer(ARGV.fetch(2))
evidence = ARGV.fetch(3)
edits = JSON.parse(ARGV.fetch(4, "{}"))
raise "Non-sequential scope" unless last == [first + 49, 65134].min
raise "Scope outside remaining default" unless first >= 62401 && last <= 65134
raise "Wrong decision number" unless number == 20323 + (first - 62401) / 50
raise "Empty review evidence" if evidence.strip.empty?

root = "work/zh_cn"
audit = "#{root}/audit"
path = "#{root}/locatexts_zh_cn.koalocatext_default.csv"
old = File.binread(path).force_encoding("UTF-8")
old_sha = Digest::SHA256.hexdigest(old)
date = "20261014"
backup = "/private/tmp/ko-translate-backups/#{date}/before-named-scope-D#{number}/locatexts_zh_cn.koalocatext_default.csv"
data = old.dup
changes = []
edits.each do |key, pair|
  id = Integer(key)
  raise "Out-of-scope edit #{id}" unless (first..last).cover?(id)
  before, after = pair
  raise "No-op #{id}" if before == after || before.empty? || after.empty?
  pattern = /(?<=\n)#{id};(?:(?!\r?\n\d+;).)*?#{Regexp.escape(before)}/m
  raise "Expected exactly one occurrence at #{id}" unless data.scan(pattern).length == 1
  data = data.sub(pattern) { |row| row.sub(before, after) }
  changes << [id, before, after]
end

if changes.any?
  FileUtils.mkdir_p(File.dirname(backup))
  FileUtils.cp(path, backup)
  raise "Backup mismatch" unless File.binread(backup).force_encoding("UTF-8") == old
  File.binwrite(path, data)
end

inverse = data.dup
changes.reverse_each do |id, before, after|
  pattern = /(?<=\n)#{id};(?:(?!\r?\n\d+;).)*?#{Regexp.escape(after)}/m
  raise "Post-edit target missing #{id}" unless inverse.scan(pattern).length == 1
  inverse = inverse.sub(pattern) { |row| row.sub(after, before) }
end
raise "Inverse mismatch" unless inverse == old
bytes = File.binread(path)
raise "BOM mismatch" unless bytes.start_with?("\xEF\xBB\xBF".b)
raise "Newline mismatch" unless bytes.scan(/\r\n/).size == 72_011 &&
                                bytes.scan(/(?<!\r)\n/).size == 73
ids = bytes.scan(/(?:\A|(?<=\n))(\d+);/).flatten.map(&:to_i)
raise "Row order mismatch" unless ids == (0..65134).to_a
raise "Review scope not in active CSV" unless ids[first..last] == (first..last).to_a
sha = Digest::SHA256.hexdigest(bytes)
remaining = 65134 - last
next_scope = remaining.positive? ? "next D-#{number + 1} / #{last + 1}-#{[last + 50, 65134].min}" : "no remaining default IDs"
previous_backup = File.read("NEXT-SESSION.md", encoding: "UTF-8")[%r{/private/tmp/ko-translate-backups/\d+/before-named-scope-D\d+/locatexts_zh_cn\.koalocatext_default\.csv}]
raise "Missing previous pre-edit backup" unless previous_backup
backup_note = changes.any? ? "Pre-edit SHA-256 `#{old_sha}`; byte-identical backup `#{backup}`." :
  "No CSV edit; last pre-edit byte-identical backup `#{previous_backup}`."
description = changes.any? ? "Corrected #{changes.map(&:first).join('/')} `Texto`." : "No CSV edit."
verification = changes.any? ? "Inverse bytes, BOM, 72,011 CRLF, 73 bare LF and 65,135 ordered IDs passed." :
  "BOM, 72,011 CRLF, 73 bare LF and 65,135 ordered IDs passed; no CSV edit."
end_note = "Last reviewed #{last}; #{next_scope}; #{remaining} actual rows remain through 65134. " \
  "#{remaining.positive? ? 'Review incomplete.' : 'All requested default IDs reviewed.'} " \
  "Global tally unreconciled; affix 55 closed D-19565."
report_name = "named-scope-review-D#{number}-#{date}.md"
addendum_name = "named-scope-edit-addendum-D#{number}-#{date}.md"

report = <<~TEXT
  # Consolidated Context Review D-#{number}

  2026-10-14. Reviewed all #{last - first + 1} active default IDs #{first}-#{last}
  against English meaning and Korean; Japanese informs voice,
  Chinese is secondary. Earlier exact-key outcomes checked
  without recount; official Korean manual background consulted
  where relevant. No PAK consulted.

  #{evidence}

  #{description} No duplicate classification or global tally update.
  #{backup_note} Active SHA-256 `#{sha}`.
  #{verification} #{end_note}
TEXT
addendum = <<~TEXT
  # Edit Addendum D-#{number}

  #{description} #{backup_note}
  #{changes.map { |id, before, after| "- #{id}: `#{before}` -> `#{after}`" }.join("\n")}
  #{changes.any? ? "Only the listed `Texto` cells changed; inverse row-scoped substitutions reconstruct the backup byte for byte." : "The active CSV is unchanged."}
  Active SHA-256 `#{sha}`. #{verification}
TEXT
File.write("#{audit}/#{report_name}", report)
File.write("#{audit}/#{addendum_name}", addendum)

[
  ["NEXT-SESSION.md", "## Current Work State\n\n", "## Current Work State\n\n",
   "- **D-#{number} (2026-10-14; #{last - first + 1} IDs):** #{description} [Report](work/zh_cn/audit/#{report_name}); [addendum](work/zh_cn/audit/#{addendum_name}). #{backup_note} Active SHA-256 `#{sha}`. #{verification} #{end_note}\n\n"],
  ["#{root}/TRANSLATION_PROGRESS.md", "## Active Work\n\n", "## Active Work\n\n",
   "**Current (D-#{number}, 2026-10-14):** Reviewed active default #{first}-#{last}; #{description} [Report](audit/#{report_name}); [addendum](audit/#{addendum_name}). #{backup_note} Active SHA-256 `#{sha}`. #{verification} #{end_note}\n\n"],
  ["#{audit}/README.md", nil, nil,
   "## Current Checkpoint (D-#{number}, 2026-10-14; #{last - first + 1} IDs)\n\nReviewed #{first}-#{last}. #{description} [Report](#{report_name}); [addendum](#{addendum_name}). #{backup_note} Active SHA-256 `#{sha}`. #{verification} #{end_note}\n\n"],
  ["#{audit}/decision-register-20261009.md", nil, nil,
   "## D-#{number}: Review of Default IDs #{first}-#{last}\n\n#{description} [Report](#{report_name}); [addendum](#{addendum_name}). No duplicate classification or global tally update. #{backup_note} Active SHA-256 `#{sha}`. #{end_note}\n\n"]
].each do |file, marker, replacement, entry|
  text = File.read(file, encoding: "UTF-8")
  case file
  when "NEXT-SESSION.md"
    raise "Missing handoff marker" unless text.include?(marker)
    text = text.sub(marker, replacement + entry)
  when "#{root}/TRANSLATION_PROGRESS.md"
    raise "Missing progress marker" unless text.include?(marker)
    text = text.sub(/\*\*Current \(D-\d+/, "**Historical (D-#{number - 1}")
    text = text.sub(marker, replacement + entry)
  when "#{audit}/README.md"
    raise "Missing README marker" unless text.include?("## Current Checkpoint")
    text = text.sub("## Current Checkpoint", "## Historical Checkpoint")
    text = text.sub(/(?=## Historical Checkpoint)/, entry)
  else
    raise "Missing register marker" unless text.include?("## D-#{number - 1}:")
    text = text.sub(/(?=## D-#{number - 1}:)/, entry)
  end
  File.write(file, text)
end
puts "D-#{number} #{first}-#{last} SHA=#{sha} remaining=#{remaining} edits=#{changes.size}"
