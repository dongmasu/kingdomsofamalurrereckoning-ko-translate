#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
d = 21_201
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

inventory = m.refresh_inventory
glossary_path = File.join(audit, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = glossary.find { |row| row['entity_key'] == 'person:zoef' }
raise 'expected registered Zoef entity' unless entity
raise 'unexpected Zoef glossary state' unless
  entity['english_canonical'] == 'Zoef' && entity['korean_canonical'] == '조프(Zoef)'

entity['english_canonical'] = 'Albert Zoef'
entity['english_aliases'] = 'Zoef'
entity['korean_canonical'] = '앨버트 조프(Albert Zoef)'
entity['korean_variants'] = ['앨버트 조프', '앨버트 조에프', '조프'].join('|')
entity['evidence_ids'] = %w[
  D-20383 D-21201 default:22944 default:55618 default:63838
].join('|')
entity['notes'] =
  'D-20383 established Zoef = 조프 at default:63838. D-20565 and D-20570 separately retained complete bilingual labels for Albert Zoef, but a full-name consistency comparison shows the same English label, Japanese アルバート・ゾエフ, and Chinese 艾伯特·佐夫 in both rows while the Korean forms differ. Standardize the full name as 앨버트 조프(Albert Zoef), preserving the source short form 조프(Zoef) at 63838. D-21201 reopens only the two already-indexed full-name keys on this new cross-row evidence; it does not add or recount entity matches.'

inventory_matches = build_occurrences(inventory.values, [entity]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_keys = [
  ['default', '22944', ''],
  ['default', '55618', ''],
  ['default', '63838', '']
]
actual_keys = inventory_matches.map { |row| m.key(row) }.uniq.sort
raise 'Zoef occurrence coverage changed' unless actual_keys == expected_keys.sort

index = m.table(m::INDEX)
indexed_zoef = index.select { |row| row['entity_key'] == 'person:zoef' }
raise 'Zoef index coverage changed' unless
  indexed_zoef.map { |row| m.key(row) }.uniq.sort == expected_keys.sort
raise 'unexpected existing Zoef review state' unless
  indexed_zoef.select { |row| %w[default:22944 default:55618].include?("#{row['resource']}:#{row['ID_Linha']}") }
    .all? { |row| row['status'] == 'not-an-issue' }

evidence = entity.fetch('notes')
reviews = expected_keys.take(2).map do |key|
  source = inventory.fetch(key)
  expected_english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  expected_japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  raise "unexpected English source at #{key.inspect}" unless expected_english == 'Albert Zoef'
  raise "unexpected Japanese source at #{key.inspect}" unless expected_japanese == 'アルバート・ゾエフ'
  raise "unexpected Chinese source at #{key.inspect}" unless source.fetch('zh_text') == '艾伯特·佐夫'

  old = source.fetch('work_text')
  new_text = if key[1] == '55618'
               old.sub('앨버트 조에프(Albert Zoef)', '앨버트 조프(Albert Zoef)')
             else
               old
             end
  raise "stale Zoef Korean value at #{key.inspect}" if new_text == old && key[1] == '55618'
  status = old == new_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => 'person:zoef', 'status' => status,
    'old' => old, 'new' => new_text, 'evidence' => evidence,
    'english' => expected_english, 'japanese' => expected_japanese,
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate('person:zoef' => status)
  }
end

reviews_path = "/private/tmp/proper-name-edits-D#{d}-proposal.tsv"
m.write_table(reviews_path, m::HEADERS.take(12), reviews)

candidate_path = File.join(audit, 'proper-name-variant-discovery-candidates-20261015.tsv')
candidates = m.table(candidate_path)
candidate = candidates.find { |row| row['english_candidate'] == 'Albert Zoef' }
raise 'expected unique Albert Zoef candidate' unless candidate
raise 'unexpected Albert Zoef candidate status' unless candidate['status'] == 'heuristic-not-reviewed'

m.write_table(glossary_path, glossary.headers, glossary)
candidate['status'] = 'registered-reviewed'
m.write_table(candidate_path, candidates.headers, candidates)

begin
  m.run(reviews_path, d, nil, review_states: ['not-an-issue'])
rescue StandardError
  raise
end

review_note = <<~TEXT

## Cross-Row Re-review

This batch updates the existing `person:zoef` entry; it does not create
another entity or append duplicate occurrence keys. D-20565 and D-20570 had
retained each complete bilingual full-name cell independently. Comparing the
two exact rows together revealed inconsistent Korean transliteration despite
identical English, Japanese, and Chinese names. The established `조프` form
from default ID 63838 is retained; only default ID 55618 changes to
`앨버트 조프(Albert Zoef)`. The prior decisions are superseded only for these
two full-name rows, and the index entries are updated in place.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), 'a') { |file| file.write(review_note) }
end

puts "D-#{d}: re-reviewed #{reviews.length} existing person:zoef keys; one corrected, one retained; no new index keys."
