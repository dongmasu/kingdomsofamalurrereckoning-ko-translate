#!/usr/bin/env ruby
require "json"

root = "work/zh_cn"
register = "#{root}/audit/decision-register-20261009.md"
active = "#{root}/locatexts_zh_cn.koalocatext_default.csv"
reports = Dir.glob("#{root}/audit/consolidated-context-review-*.md")

def expand_ids(value)
  value.scan(/(\d+)(?:\s*-\s*(\d+))?/).flat_map do |first, last|
    first = first.to_i
    last = last ? last.to_i : first
    last >= first && last - first <= 1000 ? (first..last).to_a : [first]
  end
end

active_ids = File.foreach(active, mode: "rb").each_with_object({}) do |line, ids|
  id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
  ids[id] = true if id
end

initial_uncertain = {}
initial_findings = {}
register_closed = {}
File.foreach(register) do |line|
  if (match = line.match(/^\| D-(\d+) \| `default` ([\d,\s-]+) \|.*\| uncertain(?:[ ;|]|$)/i))
    expand_ids(match[2]).each do |id|
      if active_ids[id]
        initial_uncertain[id] = match[1].to_i
        initial_findings[id] = line.split("|")[3..6].map(&:strip)
      end
    end
  end
  cells = line.split("|").map(&:strip)
  scope = cells.find { |cell| cell.match?(/\A`?default`? [\d,\s-]+\z/i) }
  disposition = cells.find do |cell|
    cell.match?(/\b(?:accepted|not an issue)\b/i) &&
      !cell.match?(/\buncertain\b/i)
  end
  if cells.length >= 5 && cells[1].match?(/\AD-\d+/i) && scope && disposition
    ids = scope.sub(/\A`?default`?\s+/i, "")
    expand_ids(ids).each do |id|
      register_closed[id] = true if active_ids[id]
    end
  end
end

snapshot_names = reports.each_with_object([]) do |report, names|
  name = File.read(report)[/`(uncertain-\d+-[A-Za-z0-9-]+\.jsonl)`/, 1]
  names << name if name
end.uniq
snapshot_ids = snapshot_names.flat_map do |name|
  file = "#{root}/audit/#{name}"
  abort "missing source snapshot #{file}" unless File.file?(file)
  File.foreach(file).map { |line| JSON.parse(line).fetch("id") }
end.select { |id| active_ids[id] }.uniq.to_h { |id| [id, true] }

report_closed = {}
reports.each do |report|
  report_text = File.read(report)
  File.foreach(report) do |line|
    next unless line.start_with?("|")
    cells = line.split("|").map(&:strip)
    status = cells.index do |cell|
      cell.match?(/\A(?:(?:previously )?accepted|not an issue)\b/i) &&
        !cell.match?(/\Apartial\b/i)
    end
    next unless status && status > 1
    id_cell = cells[1...status].reverse.find do |cell|
      normalized = cell.gsub(/D-\d+/i, "")
        .gsub(/`?default`?|\bIDs?\b/i, "")
        .gsub(/[\/:]/, " ").strip
      normalized.match?(/\A(?=.*\d)[\d,\s;and-]+\z/i)
    end
    next unless id_cell
    expand_ids(id_cell.gsub(/D-\d+/i, "")).each do |id|
      report_closed[id] = true if active_ids[id]
    end
  end

  # A batch-level terminal statement can close exact scopes in mixed-result
  # rows without closing unrelated or explicitly retained findings.
  terminal_batch = report_text.match?(
    /\b(?:no reviewed\s+finding remains uncertain|no uncertainty remains\s+from this batch|no uncertainty retained|none remains uncertain|none remains open in this batch|no item remains uncertain)\b/i
  )
  next unless terminal_batch

  File.foreach(report) do |line|
    next unless line.start_with?("|")
    cells = line.split("|").map(&:strip)
    next unless cells[1].match?(/\AD-\d+/i)

    status_index = cells.index do |cell|
      cell.match?(/\A(?:mixed|accepted|not an issue)\b/i)
    end
    next unless status_index && status_index > 1
    id_cell = cells[1...status_index].reverse.find do |cell|
      normalized = cell.gsub(/D-\d+/i, "")
        .gsub(/`?default`?|\bIDs?\b/i, "")
        .gsub(/[\/:]/, " ").strip
      normalized.match?(/\A(?=.*\d)[\d,\s;and-]+\z/i)
    end
    next unless id_cell

    expand_ids(id_cell.gsub(/D-\d+/i, "")).each do |id|
      report_closed[id] = true if active_ids[id]
    end
  end
end

# Focused corrigenda often record exact closure lists in prose rather than
# tables. Read only explicit numeric lists attached to a closure statement;
# broad review ranges are not treated as fully closed.
closure_notes = Dir.glob("#{root}/audit/*.md")
closure_notes.each do |path|
  File.read(path).split(/\n\s*\n+/).each do |paragraph|
    next unless paragraph.match?(/\b(?:clear(?:s|ed)?|resolv(?:e|es|ed)|reclassif(?:y|ies|ied)|clos(?:e|es|ed|ing)|accept(?:s|ed)?)\b/i)
    next unless paragraph.match?(/\b(?:uncertain|uncertaint(?:y|ies)|not an issue|accepted)\b/i)

    clean = paragraph.gsub(/D-\d+/i, "")
    explicit_lists = []
    clean.scan(/\b(?:clear(?:s|ed)?|resolv(?:e|es|ed)|reclassif(?:y|ies|ied)|clos(?:e|es|ed|ing))\s+IDs?\s+([\d,\s-]+)/i) do |match|
      explicit_lists << match.first
    end
    if (match = clean.match(/\b(?:clear(?:s|ed)?|resolv(?:e|es|ed)|reclassif(?:y|ies|ied)|clos(?:e|es|ed|ing))\b[^:]{0,180}:\s*(.*)/im))
      explicit_lists << match[1].scan(/\d+(?:-\d+)?/).join(", ")
    end
    clean.scan(/\(([\d][\d,\s-]*)\)\s*(?:are|were)\s*(?:accepted|not an issue)\b/i) do |match|
      explicit_lists << match.first
    end
    explicit_lists.each do |list|
      expand_ids(list).each do |id|
        report_closed[id] = true if active_ids[id]
      end
    end
  end

end

closed = register_closed.keys | snapshot_ids.keys | report_closed.keys
open = initial_uncertain.keys.reject { |id| closed.include?(id) }
abort "D-18286 prose closure regression" if open.include?(20403)
resolved_d19303 = [26354, 26357, 26367, 26369, 26371, 26372, 26381, 26387, 26391, 26393, 26395]
abort "D-19303 mixed batch closure regression" if
  (resolved_d19303 & open).any?

# D-19727 was prepared from the pre-fix 1,105-item inventory. Its only
# overlap with now-closed keys is the exact D-19303 mixed-result closure set.
if File.file?("#{root}/audit/uncertain-100-D19727-20261012.jsonl") &&
    !File.read(register).include?("## D-19727")
  prior_batch = File.foreach("#{root}/audit/uncertain-100-D19727-20261012.jsonl")
    .map { |line| JSON.parse(line).fetch("id") }
  excluded = prior_batch & resolved_d19303
  remaining = prior_batch - resolved_d19303
  abort "D-19727 unexpected resolved overlap: #{excluded.inspect}" unless
    excluded == [26354, 26367, 26369, 26371, 26372, 26381, 26391, 26393]
  abort "D-19727 remaining-key inventory regression" unless
    remaining == open.sort.first(remaining.size)
end
puts "active_rows=#{active_ids.size}"
puts "initial_uncertain_unique=#{initial_uncertain.size}"
puts "register_closed_unique=#{register_closed.size}"
puts "completed_snapshot_count=#{snapshot_names.size} completed_snapshot_unique_ids=#{snapshot_ids.size}"
puts "report_table_closed_unique=#{report_closed.size}"
puts "union_closed_uncertain=#{(initial_uncertain.keys & closed).size}"
puts "derived_open=#{open.size}"
puts "last_recorded_pre_D19727_uncertain=987"
puts "D19727_candidate_keys_closed=92"
puts "conditional_post_D19727_uncertain=895"
puts "conditional_derived_open_gap=#{open.size - 895}"
puts "lowest_open=#{open.min} highest_open=#{open.max}"
puts "lowest_open_sources=#{open.first(20).map { |id| "#{id}:D-#{initial_uncertain[id]}" }.join(",")}"
if (output = ENV["OPEN_IDS_OUTPUT"])
  manifest = open.sort.map do |id|
    { decision: initial_uncertain[id], id: id, prior_finding: initial_findings[id] }
  end
  File.write(output, JSON.pretty_generate(manifest) + "\n")
end
