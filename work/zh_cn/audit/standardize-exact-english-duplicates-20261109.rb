#!/usr/bin/env ruby
# Standardize Korean rows whose English source text is exactly identical.

require "csv"
require "digest"
require "fileutils"

ROOT = File.expand_path("../../..", __dir__)
EN_PATH = File.join(ROOT, "src/csv/en_us/locatexts_en_us.koalocatext_default.csv")
KO_PATH = File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
AUDIT_DIR = File.join(ROOT, "work/zh_cn/audit")

Row = Struct.new(:id, :raw, :text, :normalized_text, :field_quoted, :record_eol, :inner_eols)

def records(path)
  result = []
  header = nil
  current = nil

  File.open(path, "rb") do |file|
    file.each_line do |line|
      if line.match?(/\A\d+;/)
        result << current if current
        current = line.dup
      elsif current
        current << line
      elsif header.nil?
        header = line.dup
      else
        raise "unexpected content before first record in #{path}"
      end
    end
  end
  result << current if current
  raise "missing header in #{path}" unless header
  [header, result]
end

def decode_row(raw)
  eol = if raw.end_with?("\r\n")
    "\r\n"
  elsif raw.end_with?("\n")
    "\n"
  elsif raw.end_with?("\r")
    "\r"
  else
    raise "record is missing its final line ending"
  end
  body = raw.byteslice(0, raw.bytesize - eol.bytesize)
  match = body.match(/\A(\d+);(.*)\z/m)
  raise "malformed row boundary" unless match

  id = Integer(match[1], 10)
  field = match[2]
  quoted = field.start_with?('"')
  if quoted
    raise "unclosed quoted field at ID #{id}" unless field.end_with?('"')
    text = field[1...-1].gsub('""', '"')
    raise "invalid CSV escaping at ID #{id}" unless encode_field(text, true) == field
  else
    raise "unquoted delimiter or quote at ID #{id}" if field.match?(/[;"]/)
    text = field
  end

  inner_eols = text.scan(/\r\n|\n|\r/)
  Row.new(
    id,
    raw,
    text,
    text.gsub(/\r\n?/, "\n"),
    quoted,
    eol,
    inner_eols
  )
end

def encode_field(text, quoted)
  return %("#{text.gsub('"', '""')}") if quoted
  raise "field requires CSV quoting" if text.match?(/[;"\r\n]/)
  text
end

def parse_file(path)
  header, raw_records = records(path)
  header = header.sub(/\A\xEF\xBB\xBF/n, "")
  rows = raw_records.map { |raw| decode_row(raw) }
  ids = rows.map(&:id)
  raise "duplicate IDs in #{path}" unless ids.uniq.length == ids.length
  [header, rows]
end

def eol_counts(bytes)
  crlf = bytes.scan(/\r\n/).length
  lf = bytes.scan(/(?<!\r)\n/).length
  cr = bytes.scan(/\r(?!\n)/).length
  { crlf: crlf, lf: lf, cr: cr }
end

def serialize_translation(text, row)
  normalized = text.gsub(/\r\n?/, "\n")
  separators = normalized.count("\n")
  if separators.positive?
    styles = row.inner_eols
    if styles.length == separators
      pieces = styles
    else
      fallback = styles.group_by(&:itself).max_by { |style, occurrences| [occurrences.length, style == "\r\n" ? 1 : 0] }&.first || "\r\n"
      pieces = Array.new(separators, fallback)
    end
    parts = normalized.split("\n", -1)
    text = parts.each_with_index.each_with_object(+"") do |(part, index), output|
      output << part
      output << pieces[index] if index < pieces.length
    end
  else
    text = normalized
  end

  quote = row.field_quoted || text.match?(/[;"\r\n]/)
  encode_field(text, quote)
end

apply_index = ARGV.index("--apply")
expected_sha = apply_index && ARGV[apply_index + 1]
if apply_index && (!expected_sha || expected_sha !~ /\A[0-9a-f]{64}\z/)
  abort "usage: #{$PROGRAM_NAME} [--apply EXPECTED_INPUT_SHA256]"
end

ko_bytes = File.binread(KO_PATH)
input_sha = Digest::SHA256.hexdigest(ko_bytes)
if apply_index && input_sha != expected_sha
  abort "input changed: expected #{expected_sha}, found #{input_sha}"
end

_en_header, en_rows = parse_file(EN_PATH)
_ko_header, ko_rows = parse_file(KO_PATH)
en_by_id = en_rows.to_h { |row| [row.id, row] }
ko_by_id = ko_rows.to_h { |row| [row.id, row] }
abort "English/Korean ID sets differ" unless en_by_id.keys.sort == ko_by_id.keys.sort

groups = Hash.new { |hash, key| hash[key] = [] }
en_by_id.each do |id, row|
  groups[row.normalized_text] << [id, ko_by_id.fetch(id)]
end
duplicate_groups = groups.select { |_source, entries| entries.length > 1 }
divergent_groups = duplicate_groups.select do |_source, entries|
  entries.map { |_id, row| row.normalized_text }.uniq.length > 1
end

edits = []
canonical_by_source = {}
divergent_groups.each do |source, entries|
  counts = Hash.new(0)
  lowest_id_by_translation = {}
  entries.each do |id, row|
    counts[row.normalized_text] += 1
    lowest_id_by_translation[row.normalized_text] = [lowest_id_by_translation.fetch(row.normalized_text, id), id].min
  end
  canonical_text = counts.max_by do |text, count|
    [count, -lowest_id_by_translation.fetch(text)]
  end.first
  canonical_id = lowest_id_by_translation.fetch(canonical_text)
  canonical_by_source[source] = [canonical_id, canonical_text, entries.length]
  entries.each do |id, row|
    next if row.normalized_text == canonical_text
    edits << [source, canonical_id, id, row, canonical_text, entries.length]
  end
end

puts "input_sha256=#{input_sha}"
puts "records=#{ko_rows.length}"
puts "exact_english_duplicate_groups=#{duplicate_groups.length}"
puts "divergent_groups=#{divergent_groups.length}"
puts "rows_in_divergent_groups=#{divergent_groups.values.sum(&:length)}"
puts "rows_to_change=#{edits.length}"
puts "mode=majority_translation_tie=lowest_id"
abort "no divergent groups found" if divergent_groups.empty?

unless apply_index
  puts "dry_run_only=true"
  exit 0
end

original_ids = ko_rows.map(&:id)
rows_to_write = ko_rows.to_h { |row| [row.id, row] }
edits.each do |_source, _canonical_id, id, row, canonical_text, _group_size|
  encoded = serialize_translation(canonical_text, row)
  body = "#{id};#{encoded}#{row.record_eol}"
  rows_to_write[id] = decode_row(body)
end

header_bytes = File.binread(KO_PATH).lines.first
output = header_bytes + original_ids.map { |id| rows_to_write.fetch(id).raw }.join
out_rows = original_ids.map { |id| decode_row(rows_to_write.fetch(id).raw) }
raise "record count changed" unless out_rows.length == ko_rows.length
raise "ID order changed" unless out_rows.map(&:id) == original_ids
raise "BOM changed" unless output.start_with?("\xEF\xBB\xBF".b)

out_by_id = out_rows.to_h { |row| [row.id, row] }
remaining = duplicate_groups.count do |source, entries|
  entries.map { |id, _row| out_by_id.fetch(id).normalized_text }.uniq.length > 1
end
raise "#{remaining} exact-English duplicate groups remain divergent" unless remaining.zero?

after_sha = Digest::SHA256.hexdigest(output)
edits_path = File.join(AUDIT_DIR, "exact-english-duplicate-edits-20261109.tsv")
summary_path = File.join(AUDIT_DIR, "exact-english-duplicate-summary-20261109.md")
CSV.open(edits_path, "wb", col_sep: "\t", row_sep: "\n") do |csv|
  csv << %w[source_sha256 canonical_id changed_id group_size old_korean new_korean]
  edits.each do |source, canonical_id, id, row, canonical_text, group_size|
    csv << [
      Digest::SHA256.hexdigest(source),
      canonical_id,
      id,
      group_size,
      row.normalized_text,
      canonical_text
    ]
  end
end

File.binwrite(KO_PATH, output)
File.write(
  summary_path,
  <<~REPORT
    # Exact English-source duplicate normalization - November 9, 2026

    - English source rows: #{en_rows.length}
    - Korean rows: #{ko_rows.length}
    - Exact-English duplicate groups: #{duplicate_groups.length}
    - Initially divergent groups: #{divergent_groups.length} (#{divergent_groups.values.sum(&:length)} rows)
    - Korean rows changed: #{edits.length}
    - Canonical rule: most frequent existing Korean translation; ties use the translation from the lowest ID.
    - Remaining divergent groups: #{remaining}
    - Input Korean SHA-256: `#{input_sha}`
    - Output Korean SHA-256: `#{after_sha}`
    - Per-ID changes: `#{File.basename(edits_path)}`
  REPORT
)

puts "output_sha256=#{after_sha}"
puts "remaining_divergent_groups=#{remaining}"
puts "edits_manifest=#{edits_path}"
puts "summary=#{summary_path}"
