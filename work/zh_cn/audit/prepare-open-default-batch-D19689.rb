#!/usr/bin/env ruby
require "csv"
require "digest"
require "json"
require "set"

ROOT = "work/zh_cn"
REGISTER = "#{ROOT}/audit/decision-register-20261009.md"
ACTIVE = "#{ROOT}/locatexts_zh_cn.koalocatext_default.csv"
EXPECTED_SHA = "2b88478d34c309dfb7b87b905135213cfa6760ccfb250282709d203fb8e0b991"
EXPECTED_OPEN = 1502
BATCH_SIZE = 200

abort "active CSV hash mismatch" unless Digest::SHA256.file(ACTIVE).hexdigest == EXPECTED_SHA

def parse_ids(spec)
  values = spec.gsub(/`?default`?|\bIDs?\b/i, "").scan(/(\d+)(?:\s*-\s*(\d+))?/)
  values.flat_map do |first, last|
    first = first.to_i
    if last && last.length < first.to_s.length
      last = "#{first.to_s[0, first.to_s.length - last.length]}#{last}"
    end
    last = (last || first).to_i
    abort "invalid or oversized ID range: #{first}-#{last}" if last < first || last - first > 1000
    (first..last).to_a
  end.uniq
end

uncertain = Hash.new { |hash, id| hash[id] = [] }
closed_at = Hash.new(-1)
File.foreach(REGISTER) do |line|
  next unless line.start_with?("|")
  cells = line.split("|").map(&:strip)
  decision = cells[1][/D-(\d+)/i, 1]&.to_i
  id_spec = cells[2].match(/\A`?default`?\s+(.+)\z/i)&.[](1)
  next unless decision && id_spec
  status = cells[3..].find do |cell|
    cell.match?(/\A(?:accepted|not an issue|uncertain)\b/i)
  end
  next unless status
  ids = parse_ids(id_spec)
  if status.match?(/\A(?:accepted|not an issue)\b/i) &&
      !status.match?(/\Apartial\b/i)
    ids.each { |id| closed_at[id] = decision if decision > closed_at[id] }
  end
  next unless status.match?(/\Auncertain\b/i)
  ids.each do |id|
    uncertain[id] << {
      decision: decision,
      prior_finding: cells[3..6]
    }
  end
end

completed_snapshots = Dir.glob("#{ROOT}/audit/consolidated-context-review-default-uncertain-200-*.md")
  .map { |report| File.read(report)[/`(uncertain-200-[A-Za-z0-9-]+\.jsonl)`/, 1] }
  .compact
  .uniq
completed_ids = completed_snapshots.flat_map do |snapshot|
  path = "#{ROOT}/audit/#{snapshot}"
  abort "completed snapshot missing: #{path}" unless File.file?(path)
  File.foreach(path).map { |line| JSON.parse(line).fetch("id") }
end.to_set

focused_closed_ids = Dir.glob("#{ROOT}/audit/consolidated-context-review-*.md").flat_map do |report|
  File.foreach(report).flat_map do |line|
    next [] unless line.start_with?("|")
    cells = line.split("|").map(&:strip)
    status_index = cells.index do |cell|
      cell.match?(/\A(?:(?:previously )?accepted|not an issue)\b/i) &&
        !cell.match?(/\Apartial\b/i)
    end
    next [] unless status_index && status_index > 1
    id_cell = cells[1...status_index].reverse.find do |cell|
      cell.gsub(/D-\d+/i, "").gsub(/`?default`?|\bIDs?\b/i, "")
        .gsub(/[\/:]/, " ").strip.match?(/\A(?=.*\d)[\d,\s;and-]+\z/i)
    end
    id_cell ? parse_ids(id_cell) : []
  end
end.to_set

closed_ids = completed_ids | focused_closed_ids
open = uncertain.map do |id, entries|
  latest = entries.max_by { |entry| entry.fetch(:decision) }
  next if closed_ids.include?(id) || closed_at[id] >= latest.fetch(:decision)
  latest.merge(id: id)
end.compact.sort_by { |entry| [entry.fetch(:decision), entry.fetch(:id)] }

if open.size != EXPECTED_OPEN
  puts "diagnostic register_open=#{open.size} uncertain_ids=#{uncertain.size} closed_at_ids=#{closed_at.size}"
  puts "diagnostic completed_snapshot_ids=#{completed_ids.size} focused_closed_ids=#{focused_closed_ids.size}"
  [110, 760, 2097, 31887, 58499, 57932].each do |id|
    entries = uncertain[id]
    puts "diagnostic id=#{id} uncertainty=#{entries.map { |entry| entry[:decision] }.inspect} closed_at=#{closed_at[id]} snapshot_closed=#{completed_ids.include?(id)} focused_closed=#{focused_closed_ids.include?(id)}"
  end
  puts "diagnostic first_open=#{open.first(30).map { |entry| [entry[:decision], entry[:id]] }.inspect}"
  abort "open-key reconciliation mismatch: register=#{open.size}, expected=#{EXPECTED_OPEN}"
end
selected = open.first(BATCH_SIZE)
abort "prepared batch size mismatch" unless selected.size == BATCH_SIZE
abort "duplicate IDs in selected batch" unless selected.map { |entry| entry.fetch(:id) }.uniq.size == selected.size

sources = {
  en: "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  ja: "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  zh: "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  ko: ACTIVE
}
indexed = selected.to_h { |entry| [entry.fetch(:id), entry] }

def records_by_id(path, wanted_ids)
  records = {}
  current_id = nil
  record = +"".b
  File.foreach(path, mode: "rb") do |line|
    id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if id
      records[current_id] = record if current_id && wanted_ids.include?(current_id)
      break if id > wanted_ids.max
      current_id = id
      record = line.dup
    elsif current_id
      record << line
    end
  end
  records[current_id] = record if current_id && wanted_ids.include?(current_id)
  records
end

def text_cell(record)
  CSV.parse_line(record.dup.force_encoding("UTF-8"), col_sep: ";", row_sep: :auto).fetch(1)
rescue CSV::MalformedCSVError
  raw = record.sub(/\A(?:\xEF\xBB\xBF)?\d+;/n, "").sub(/\r?\n\z/n, "")
  raw = raw[1...-1].gsub('""', '"') if raw.start_with?('"') && raw.end_with?('"')
  raw.force_encoding("UTF-8")
end

sources.each do |locale, path|
  rows = records_by_id(path, indexed.keys.to_set)
  indexed.each do |id, entry|
    row = rows[id]
    abort "#{locale} source row missing: #{id}" unless row
    entry[locale] = text_cell(row)
  end
end

def group(english)
  case english
  when /\A.{0,85}\z/m then "short"
  when /(?:Rank|Knight|Pledgeshield|Adept|Beckoned|Travelers|Hierophant|Sorrows|House of)/i then "term"
  when /(?:Damage|Ability|Skill|Reagent|Potion|Weapon|Attack|Mana|Health)/i then "mechanic"
  else "context"
  end
end

selected.each_with_index do |entry, index|
  entry[:position] = index + 1
  entry[:group] = group(entry.fetch(:en))
end

first_id = selected.first.fetch(:id)
last_id = selected.last.fetch(:id)
output = "#{ROOT}/audit/uncertain-200-D19689-IDs#{first_id}-#{last_id}-20261012.jsonl"
abort "refusing to overwrite existing snapshot: #{output}" if File.exist?(output)
File.open(output, "wx:utf-8") do |file|
  selected.each { |entry| file.puts(JSON.generate(entry)) }
end
puts "open=#{open.size} selected=#{selected.size} ids=#{first_id}-#{last_id}"
puts "groups=#{selected.group_by { |entry| entry.fetch(:group) }.transform_values(&:size)}"
puts "snapshot=#{output}"
