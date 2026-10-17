#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
index = m.table(m::INDEX).map(&:to_h)
raise 'verify this checkpoint before further batches' unless index.length == 40_420
headers = m.table(m::INDEX).headers
new_keys = {}
(21391..21401).reject { |d| d == 21399 }.each do |d|
  m.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv")).each do |review|
    previous = JSON.parse(review['previous_status'])
    review['entity_key'].split('|').each do |entity|
      raise 'discovery reopened an earlier decision' unless previous.fetch(entity) == 'needs-context'
      key = [entity, *m.key(review)]
      raise 'discovery counted a key twice' if new_keys.key?(key)
      new_keys[key] = true
    end
  end
end
raise 'unexpected new occurrence count' unless new_keys.length == 182
restored = index.reject { |row| new_keys.key?([row['entity_key'], *m.key(row)]) }
by_key = restored.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
m.table(File.join(__dir__, 'proper-name-edits-D21399.tsv')).each do |review|
  statuses = JSON.parse(review['previous_status'])
  evidence = JSON.parse(review['previous_evidence'])
  review['entity_key'].split('|').each do |entity|
    row = by_key.fetch([entity, *m.key(review)])
    row['status'] = statuses.fetch(entity)
    row['evidence'] = evidence.fetch(entity)
  end
end
initial_text = m::RESOURCES.to_h do |resource|
  path = if resource == 'affix'
           m.csv_path(resource)
         else
           "/private/tmp/ko-translate-backups/20261017/before-proper-name-D21391/locatexts_zh_cn.koalocatext_#{resource}.csv"
         end
  cells = ProperNameCellEditor.parse(File.binread(path)).to_h do |row|
    [ProperNameCellEditor.key(row), row['Texto']]
  end
  [resource, cells]
end
restored.each do |row|
  row['korean_current'] = initial_text.fetch(row['resource']).fetch(
    [row['ID_Linha'], row['Tipo_Variante'].to_s]
  )
end
raise 'unexpected restored occurrence count' unless restored.length == 40_238
# Discovery appended records before D-21391; the resumed scripts sorted the
# index. Reproduce the historical append order without changing field values.
order = m.table('/private/tmp/proper-name-occurrences-D21381-before-aliases.tsv').map do |row|
  [row['entity_key'], *m.key(row)]
end
raise 'unexpected seed-order length' unless order.length == 39_931
seen = order.to_h { |key| [key, true] }
inventory = m.table(m::INVENTORY).map(&:to_h)
definitions = [
  'proper-name-alias-definition-D21382.tsv',
  *%w[21383 21384 21385 21386 21387].map do |d|
    "proper-name-discovery-definitions-D#{d}.tsv"
  end
]
definitions.each do |filename|
  generated = build_occurrences(inventory, m.table(File.join(__dir__, filename)).map(&:to_h))
  generated.each do |values|
    row = OCCURRENCE_HEADERS.zip(values).to_h
    key = [row['entity_key'], *m.key(row)]
    next if seen.key?(key)
    seen[key] = true
    order << key
  end
end
raise 'historical order does not cover restored records' unless order.length == restored.length &&
  order.sort == by_key.keys.sort
restored = order.map { |key| by_key.fetch(key) }
path = '/private/tmp/proper-name-restored-index-D21391.tsv'
m.write_table(path, headers, restored)
actual = Digest::SHA256.file(path).hexdigest
expected = '48fc20aec65b4850bd42e4597656b10c0abc2fd199bfd7001cd6963537654ba4'
raise "prior history differs: #{actual}" unless actual == expected
puts "PASS restored 40238-row pre-D-21391 index exactly: #{actual}"
puts 'Removed only 182 new entity/key records, restored four explicit previous dispositions/evidence, and restored initial Korean snapshots.'
