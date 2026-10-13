#!/usr/bin/env ruby
require "csv"
require "digest"
require "json"

root = "work/zh_cn"
register = "#{root}/audit/decision-register-20261009.md"
expected = ENV.fetch("EXPECTED_SHA256",
  "46fa12187700312a890abb123721cd72d6b07b9332373a6a7a2111c6dd381c69")
active = "#{root}/locatexts_zh_cn.koalocatext_default.csv"
snapshot_ko = ENV.fetch("KO_SNAPSHOT_SOURCE", active)
abort "active CSV changed" unless Digest::SHA256.file(active).hexdigest == expected

minimum_id = Integer(ENV.fetch("MIN_ID", "0"))
if (manifest_path = ENV["OPEN_IDS_FILE"])
  decisions = JSON.parse(File.read(manifest_path))
    .map { |item| item.transform_keys(&:to_sym) }
    .select { |item| item.fetch(:id) >= minimum_id }
    .first(Integer(ENV.fetch("LIMIT", "100")))
else
# These first-pass holds were explicitly closed in later consolidated
# decisions; do not inflate the new batch by recounting them.
already_closed = [5643, 6004, 6044, 6156, 6172, 6231, 6341,
                  6566, 6758, 6797, 6848]
completed_snapshots = Dir.glob("#{root}/audit/consolidated-context-review-default-uncertain-*.md")
  .map do |report|
    # Later snapshot mentions are resume pointers, not completed batches.
    File.read(report)[/`(uncertain-\d+-[A-Za-z0-9-]+\.jsonl)`/, 1]
  end.compact.uniq
completed_ids = completed_snapshots.flat_map do |snapshot|
  path = "#{root}/audit/#{snapshot}"
  abort "completed snapshot missing: #{path}" unless File.file?(path)
  File.foreach(path).map { |line| JSON.parse(line).fetch("id") }
end

# Older focused reports may close keys without a 200-row source snapshot.
reported_closed_ids = Dir.glob("#{root}/audit/consolidated-context-review-*.md")
  .flat_map do |report|
    File.foreach(report).flat_map do |line|
      next [] unless line.start_with?("|")
      cells = line.split("|").map(&:strip)
      status_index = cells.index do |cell|
        cell.match?(/\A(?:(?:previously )?accepted|not an issue)\b/i) &&
          !cell.match?(/\Apartial\b/i)
      end
      next [] unless status_index && status_index > 1
      key_cells = cells[1...status_index]
      id_cell = key_cells.reverse.find do |cell|
        normalized = cell.gsub(/D-\d+/i, "")
          .gsub(/`?default`?|\bIDs?\b/i, "")
          .gsub(/[\/:]/, " ").strip
        normalized.match?(/\A(?=.*\d)[\d,\s;and-]+\z/i)
      end
      next [] unless id_cell
      id_cell.gsub(/D-\d+/i, "")
        .gsub(/`?default`?|\bIDs?\b|[\/:]/i, "")
        .scan(/(\d+)(?:\s*-\s*(\d+))?/).flat_map do |first, last|
        first = first.to_i
        last = last ? last.to_i : first
        last >= first && last - first <= 1000 ? (first..last).to_a : [first]
      end
    end
  end

already_closed |= completed_ids | reported_closed_ids
active_ids = File.foreach(active, mode: "rb").each_with_object({}) do |line, ids|
  id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
  ids[id] = true if id
end
register_closures = Hash.new(-1)
File.foreach(register) do |line|
  match = line.match(/^\| D-(\d+)[^|]*\| `default` ([\d,\s-]+) \| (accepted|not an issue)\b/i)
  next unless match
  decision = match[1].to_i
  match[2].scan(/\d+/).each do |id|
    register_closures[id.to_i] = decision if decision > register_closures[id.to_i]
  end
end
seen_ids = {}
decisions = File.foreach(register).map do |line|
  match = line.match(/^\| D-(\d+) \| `default` ([\d,\s-]+) \|.*\| uncertain(?:[ ;|]|$)/)
  next unless match
  number = match[1].to_i
  ids = match[2].scan(/(\d+)(?:\s*-\s*(\d+))?/).flat_map do |first, last|
    first = first.to_i
    last = last ? last.to_i : first
    last - first <= 1000 ? (first..last).to_a : [first]
  end
  ids.each_with_object([]) do |id, open_ids|
    next unless id >= minimum_id && active_ids[id]
    next if already_closed.include?(id) || register_closures[id] > number || seen_ids[id]
    seen_ids[id] = true
    open_ids << { decision: number, id: id, prior_finding: line.split("|")[3..6].map(&:strip) }
  end
end.compact.flatten.sort_by { |item| item.fetch(:id) }
  .first(Integer(ENV.fetch("LIMIT", "100")))
end
abort "no open keys found" if decisions.empty?
abort "duplicate IDs in prepared batch" unless
  decisions.map { |item| item[:id] }.uniq.size == decisions.size
output = ENV.fetch("OUTPUT",
  "#{root}/audit/uncertain-#{decisions.size}-D#{decisions.first[:decision]}-D#{decisions.last[:decision]}-20261012.jsonl")

indexed = decisions.to_h { |item| [item[:id], item] }
sources = {
  en: "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  ja: "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  zh: "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  ko: snapshot_ko
}
def texto(record)
  CSV.parse_line(record.dup.force_encoding("UTF-8"),
    col_sep: ";", row_sep: :auto).fetch(1)
rescue CSV::MalformedCSVError
  # Some untouched source records contain unquoted embedded newlines.
  raw = record.sub(/\A\d+;/n, "").sub(/\r?\n\z/n, "")
  raw = raw[1...-1].gsub('""', '"') if raw.start_with?('"') && raw.end_with?('"')
  raw.force_encoding("UTF-8")
end

sources.each do |lang, path|
  current_id = nil
  record = nil
  File.foreach(path, mode: "rb") do |line|
    id = line[/\A(\d+);/n, 1]&.to_i
    if id
      indexed[current_id][lang] = texto(record) if indexed.key?(current_id)
      current_id = id
      record = line.dup
    elsif record
      record << line
    end
  end
  indexed[current_id][lang] = texto(record) if current_id && indexed.key?(current_id)
end
missing = indexed.values.select { |item| sources.keys.any? { |lang| !item.key?(lang) } }
abort "source row missing: #{missing.map { |item| [item[:decision], item[:id], sources.keys - item.keys] }.first(10)}" unless missing.empty?

def group(english)
  case english
  when /\A.{0,85}\z/m
    "short"
  when /(?:Rank|Knight|Pledgeshield|Adept|Beckoned|Travelers|Hierophant|Sorrows|House of)/i
    "term"
  when /(?:Damage|Ability|Skill|Reagent|Potion|Weapon|Attack|Mana|Health)/i
    "mechanic"
  else
    "context"
  end
end

File.open(output, "w:utf-8") do |file|
  decisions.each_with_index do |item, index|
    file.puts(JSON.generate(item.merge(position: index + 1, group: group(item.fetch(:en)))))
  end
end
puts "prepared=#{decisions.size} ids=#{decisions.first[:id]}-#{decisions.last[:id]} groups=#{decisions.group_by { |i| group(i.fetch(:en)) }.transform_values(&:size)} snapshot=#{output}"
