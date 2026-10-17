#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

M = ReviewedNameBatches
AUDIT = File.dirname(__FILE__)
INDEX = M::INDEX
REVIEW = File.join(AUDIT, 'proper-name-review-senshir-D21302.tsv')

entity = 'place:mel-senshir'
key = ['default', '27686', '']
evidence = <<~TEXT.strip
  English presents the standalone map/location label Senshir; the aligned Japanese and Chinese cells also read Senshir. The established place:mel-senshir entry identifies the city Mel Senshir, and this isolated location label is a row-scoped short form of that city. The Korean 센시르(Senshir) already preserves the source form bilingually. Record only this exact row under the existing city entity; do not add a global English alias or reopen other Mel Senshir occurrences. The official Korean manual does not enumerate this city; its omission is not contrary evidence.
TEXT

reserved_paths = [
  File.join(AUDIT, "named-scope-review-D21302-#{M::RUN_DATE_COMPACT}.md"),
  File.join(AUDIT, "named-scope-edit-addendum-D21302-#{M::RUN_DATE_COMPACT}.md"),
  File.join(AUDIT, 'proper-name-edits-D21302.tsv'),
  File.join('/private/tmp/ko-translate-backups', M::RUN_DATE_COMPACT, 'before-proper-name-D21302')
]
raise 'D-21302 artifacts already exist' if reserved_paths.any? { |path| File.exist?(path) }
inventory = M.refresh_inventory
source = inventory.fetch(key)
expected = {
  'english' => ['Senshir'],
  'japanese' => ['Senshir'],
  'chinese' => 'Senshir',
  'work' => '센시르(Senshir)'
}
actual = {
  'english' => JSON.parse(source.fetch('en_texts_json')).compact,
  'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact,
  'chinese' => source.fetch('zh_text'),
  'work' => source.fetch('work_text')
}
raise "unexpected aligned source/current text: #{actual.inspect}" unless actual == expected

glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv'))
raise 'registered Mel Senshir place entity is missing' unless
  glossary.any? { |row| row['entity_key'] == entity && row['english_canonical'] == 'Mel Senshir' }

index = M.table(INDEX)
raise 'Senshir row is already indexed' if
  index.any? { |row| row['entity_key'] == entity && M.key(row) == key }

index << {
  'entity_key' => entity,
  'resource' => key[0],
  'ID_Linha' => key[1],
  'Tipo_Variante' => key[2],
  'matched_english' => 'Senshir',
  'english_source' => 'Senshir',
  'korean_current' => actual.fetch('work'),
  'status' => 'needs-context',
  'evidence' => 'D-21302 candidate: verify this exact standalone Senshir label as a scoped reference to the registered Mel Senshir city; no global alias.'
}
M.write_table(INDEX, index.headers, index.map(&:to_h))

review = {
  'resource' => key[0],
  'ID_Linha' => key[1],
  'Tipo_Variante' => key[2],
  'entity_key' => entity,
  'status' => 'not-an-issue',
  'old' => actual.fetch('work'),
  'new' => actual.fetch('work'),
  'evidence' => evidence,
  'english' => actual.fetch('english').join("\n"),
  'japanese' => actual.fetch('japanese').join("\n---\n"),
  'chinese' => actual.fetch('chinese'),
  'entity_dispositions_json' => JSON.generate(entity => 'not-an-issue')
}
M.write_table(REVIEW, M::HEADERS.take(12), [review])
puts 'Prepared D-21302: one row-scoped Senshir label; existing place glossary retained; no CSV text change.'
