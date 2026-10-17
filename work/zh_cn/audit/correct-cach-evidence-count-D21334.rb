#!/usr/bin/env ruby

require_relative "continue-proper-name-reviewed-batches"

m = ReviewedNameBatches
before_hashes = m.hashes
from = "Retain all 13 already-indexed"
to = "Retain all 12 already-indexed"
paths = [
  File.join(__dir__, "proper-name-scoped-review-D21334.tsv"),
  File.join(__dir__, "proper-name-edits-D21334.tsv"),
  m::INDEX
]
original = paths.to_h { |path| [path, File.binread(path)] }
original.each do |path, bytes|
  raise "unexpected evidence correction count #{path}" unless
    bytes.scan(from).length + bytes.scan(to).length == 10
  rows = m.table(path)
  targeted = rows.select do |row|
    row["entity_key"] == "person:cach-cranwyn" &&
      [from, to].any? { |phrase| row["evidence"].include?(phrase) }
  end
  raise "unexpected evidence owners #{path}" unless targeted.length == 10
end
index = m.table(m::INDEX)
full_name_rows = index.select do |row|
  row["entity_key"] == "person:cach-cranwyn" &&
    row["english_source"].match?(/\bCach Cranwyn\b/)
end
raise "pre-existing full-name coverage differs" unless full_name_rows.length == 12
original.each do |path, bytes|
  File.binwrite(path, bytes.gsub(from, to))
  after = m.table(path)
  before = CSV.parse(bytes.dup.force_encoding(Encoding::UTF_8), headers: true, col_sep: "\t")
  raise "keys/statuses changed" unless before.length == after.length &&
    before.zip(after).all? do |left, right|
      expected = left.to_h
      expected["evidence"] = expected["evidence"].gsub(from, to)
      expected == right.to_h
    end
end
raise "CSV changed during clerical correction" unless before_hashes == m.hashes
puts "PASS D-21334 clerical evidence count: 13 -> 12 in ten rows per artifact; all keys/statuses/CSV bytes preserved."
