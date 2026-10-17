#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'continue-proper-name-reviewed-batches'

path = File.join(__dir__, 'proper-name-discovery-D20839.tsv')
table = ReviewedNameBatches.table(path)
cach_books = %w[5064 5887 9898 12359 35560 47986 57932 64733]
table.each do |row|
  id = row['ID_Linha']
  next unless row['resource'] == 'default'

  if cach_books.include?(id)
    raise 'unexpected book entity' unless row['entity_key'] == 'person:cach-cranwyn'
    expected = row['english'].scan(/\bCach\b/).length -
      row['english'].scan(/\bCach Cranwyn\b/).length
    pattern = /(?<![가-힣])(?:카슈|카크|캐치|캐시|캐크)(?=(?:는|처럼)(?![가-힣]))/
    count = row['new'].scan(pattern).length
    raise "short-name coverage differs #{id}: #{count}/#{expected}" unless count == expected && count.positive?
    row['new'] = row['new'].gsub(pattern, '카슈(Cach)')
  elsif %w[22298 47541].include?(id)
    raise 'unexpected Scion entity' unless row['entity_key'] == 'person:bridgette-malloi'
    pattern = /브리짓(?=을 찾아|과 이야기)/
    raise "unexpected short Bridgette #{id}" unless row['new'].scan(pattern).length == 1
    row['new'] = row['new'].sub(pattern, '브리짓(Bridgette)')
  else
    next
  end
  row['status'] = 'accepted'
  row['entity_dispositions_json'] = JSON.generate(row['entity_key'] => 'accepted')
  row['evidence'] += ' The aligned narrative also repeats this individual by first name; normalize those exact row-local short mentions, preserving the short English spelling. No family-name collective, unrelated person, or global alias is changed.'
end
raise 'unexpected review count' unless table.length == 108
ReviewedNameBatches.write_table(path, table.headers, table)
puts "Wrote #{table.length} reviewed keys: #{table.group_by { |row| row['status'] }.transform_values(&:length)}"
