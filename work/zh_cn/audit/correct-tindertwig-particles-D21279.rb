#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
entity = 'resource:tindertwig'
corrections = {
  '8159' => ['틴더트윅(Tindertwig)와', '틴더트윅(Tindertwig)과'],
  '8629' => ['틴더트윅(Tindertwig)는', '틴더트윅(Tindertwig)은'],
  '18996' => ['틴더트윅(Tindertwig)는', '틴더트윅(Tindertwig)은'],
  '50439' => ['틴더트윅(Tindertwig)는', '틴더트윅(Tindertwig)은'],
  '54169' => ['틴더트윅(Tindertwig)는', '틴더트윅(Tindertwig)은']
}
path = File.join(__dir__, 'proper-name-discovery-D21279.tsv')
raise 'particle correction already prepared' if File.exist?(path)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
before_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
reviews = corrections.map do |id, (from, to)|
  key = ['default', id, '']
  source = inventory.fetch(key)
  matches = index.select { |row| row['entity_key'] == entity && m.key(row) == key }
  raise "not an existing accepted Tindertwig key #{id}" unless
    matches.length == 1 && matches.first['status'] == 'accepted'
  old = source.fetch('work_text')
  raise "particle target absent or ambiguous #{id}" unless old.scan(from).length == 1
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => entity, 'status' => 'accepted',
    'old' => old, 'new' => old.sub(from, to),
    'evidence' => 'Corrective particle-only residual audit. D-21273 standardized the vowel-final 틴더트위그 to consonant-final 틴더트윅 but left five incompatible adjacent particles. Correct 와-to-과 at default:8159 and 는-to-은 at default:8629/18996/50439/54169. The name, English/Japanese/Chinese identity evidence, all other Korean prose, quantities, markup, tokens and line breaks stay unchanged. Preserve the existing accepted disposition, entity and row key; do not add a new finding, occurrence, or historical/global count. The original D-21273 manifest remains historical and is retained in previous_evidence.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => 'accepted'),
    'previous_status' => '', 'previous_evidence' => ''
  }
end
m.write_table(path, m::HEADERS, reviews)
m.run(path, 21_279, nil, review_states: ['accepted'])
after_counts = m.table(m::INDEX).group_by { |row| row['status'] }.transform_values(&:length)
raise 'particle correction altered counts' unless before_counts == after_counts
puts 'PASS five Tindertwig particle corrections; every occurrence/status count unchanged.'
