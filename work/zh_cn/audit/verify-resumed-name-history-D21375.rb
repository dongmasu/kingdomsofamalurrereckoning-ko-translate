#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

abort 'usage: verify-resumed-name-history-D21375.rb LAST_D' unless ARGV.length == 1
last_d = Integer(ARGV.first)
raise 'reversed batch range' unless last_d >= 21_375
m = ReviewedNameBatches
reviews = (21_375..last_d).flat_map do |d|
  m.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv")).map(&:to_h)
end
before_text = {}
reviews.each { |row| before_text[m.key(row)] ||= row.fetch('old') }
index = m.table(m::INDEX)
original_index = index.take(39_722).map(&:to_h).map do |row|
  row = row.dup
  row['korean_current'] = before_text.fetch(m.key(row), row['korean_current'])
  alias_term = {
    'person:jakin-madsen' => 'Jakin',
    'person:billis-aideh' => 'Billis',
    'person:nuer-bedlym' => 'Nuer'
  }[row['entity_key']]
  if alias_term
    row['matched_english'] = row['matched_english'].split('|')
      .reject { |term| term == alias_term }.join('|')
  end
  row
end
serialize = lambda do |headers, rows|
  CSV.generate(col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << headers
    rows.each { |row| csv << headers.map { |field| row[field] } }
  end
end
index_hash = Digest::SHA256.hexdigest(serialize.call(index.headers, original_index))
raise "original index differs: #{index_hash}" unless
  index_hash == '2961a069239c3a3b51186a3ffbb7548b947e6b811a23c68ad5d1a05790618fb3'

baseline = '/private/tmp/proper-name-glossary-D21381-before-aliases.tsv'
raise 'glossary baseline snapshot changed' unless Digest::SHA256.file(baseline).hexdigest ==
  '483f20dda6503991cb8300997314a842250767eba1ceae76a8a07be7d4b12a71'
old_aliases = m.table(baseline).map(&:to_h).select do |row|
  %w[person:billis-aideh person:nuer-bedlym].include?(row['entity_key'])
end.to_h { |row| [row['entity_key'], row] }
jakin = m.table(File.join(__dir__, 'proper-name-discovery-definitions-D21171.tsv'))
  .find { |row| row['entity_key'] == 'person:jakin-madsen' }.to_h
old_aliases['person:jakin-madsen'] = jakin
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
original_glossary = glossary.take(1_578).map(&:to_h).map do |row|
  old_aliases.fetch(row['entity_key'], row)
end
glossary_hash = Digest::SHA256.hexdigest(serialize.call(glossary.headers, original_glossary))
raise "original glossary differs: #{glossary_hash}" unless
  glossary_hash == '722e6f97fe04d1bc8e2eef8511123786eb846160e3fcf04f74181db2f6da2e6b'
puts "PASS D-21375-D-#{last_d}: exact original 39722-row index and 1578-entry glossary reconstruction"
puts "Index #{index_hash}; glossary #{glossary_hash}"
puts "Review events #{reviews.length}; unique row keys #{reviews.map { |row| m.key(row) }.uniq.length}; edit events #{reviews.count { |row| row['old'] != row['new'] }}"
