#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_180
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definition = glossary.headers.zip([
  'person:famor',
  'Famor',
  'person',
  '파모르(Famor)',
  '',
  '파모르',
  "D-#{d}|default:39204|default:40618",
  'confirmed',
  'English explicitly states that the person formerly known as Famor became Bloody Bones (default:39204, 40618). Keep Famor as a distinct English-indexed personal-name entry rather than collapsing it into the later name. Existing Korean usage establishes 파모르; Japanese ファモーア/フェイモア and Chinese 法莫 corroborate the identity, while transliteration differences do not override the English anchor. The official Korean manual does not cover this character; its omission is not contrary evidence.'
]).to_h

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_ids = %w[1782 6688 10362 31674 37984 39204 40618 52389]
expected = expected_ids.map { |id| ['default', id, ''] }.sort
actual = generated.map { |row| m.key(row) }.sort
raise "Famor source key mismatch: #{actual.inspect}" unless actual == expected

canonical = '파모르(Famor)'
reviews = generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.gsub(/파모르(?!\(Famor\))/, canonical)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  expected_mentions = english.scan(/(?<![A-Za-z])Famor(?![A-Za-z])/i).length
  korean_mentions = proposed.scan(/파모르(?:\(Famor\))?/).length
  raise "Famor alignment mismatch #{key.inspect}" unless
    expected_mentions == korean_mentions

  status = proposed == old ? 'not-an-issue' : 'accepted'
  evidence = 'English explicitly identifies Famor as the same person later known as Bloody Bones (default:39204 and 40618); this batch reviews only the earlier personal-name label and does not reopen the later monster name or surrounding sentence. Existing Korean establishes 파모르(Famor). Japanese ファモーア/フェイモア and Chinese 法莫 corroborate the identity; English remains the meaning and identity anchor. The official Korean manual does not cover this character.'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => definition.fetch('entity_key'),
    'status' => status,
    'old' => old,
    'new' => proposed,
    'evidence' => evidence,
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(definition.fetch('entity_key') => status)
  }
end

raise 'more than 50 distinct row keys' if reviews.map { |row| m.key(row) }.uniq.length > 50
definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definition_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definition_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{reviews.length} keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
reviews.each do |row|
  next if row['old'] == row['new']
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
