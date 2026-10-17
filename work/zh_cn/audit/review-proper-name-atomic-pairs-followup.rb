#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
inventory = m.refresh_inventory
index = m.table(m::INDEX)
targets = {
  '39547' => ['place:lollyrs-home', '롤리스(Lollyrs)의 집', '롤리스의 집'],
  '56147' => ['unique_item:caerwyns-tome', '케어윈(Caerwyn)의 서', '케어윈의 서'],
  '22852' => ['people:seelie-fae', '시리 페이(Seelie Fae)', '실리 페이(Seelie Fae)'],
  '52077' => ['people:seelie-fae', '시일리 페이(Seelie Fae)', '실리 페이(Seelie Fae)'],
  '52396' => ['people:seelie-fae', '시일리 페이(Seelie Fae)', '실리 페이(Seelie Fae)']
}.freeze
reviews = targets.sort_by { |id, _target| id.to_i }.map do |id, target|
  entity, from, to = target
  source = inventory.fetch(['default', id, ''])
  old = source.fetch('work_text')
  occurrence = index.find { |row| row['entity_key'] == entity && m.key(row) == ['default', id, ''] }
  raise "no terminal atomic label #{id}" unless occurrence && %w[accepted not-an-issue].include?(occurrence['status'])
  raise "atomic label changed #{id}" unless old.include?(from)
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => entity, 'status' => 'accepted', 'old' => old,
    'new' => old.sub(from, to),
    'evidence' => 'Independent exact-label residual check found an existing confirmed full English name with either a noncanonical Korean prefix (시리/시일리 versus 실리 for Seelie Fae) or a redundant component English label inside the already paired whole house/book name. Retain the confirmed full bilingual label atomically, without changing identity, item/title wording, or surrounding prose. Update only the existing terminal occurrence; no new occurrence or historical tally.',
    'entity_dispositions_json' => JSON.generate(entity => 'accepted')
  }
end
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
row = glossary.find { |entry| entry['entity_key'] == 'people:seelie-fae' }
row['korean_variants'] = (row['korean_variants'].to_s.split('|') + ['시리 페이', '시일리 페이', '세엘리 페이']).uniq.join('|')
m.write_table(glossary_path, glossary.headers, glossary)
out = File.join(__dir__, "proper-name-reviewed-atomic-pairs-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil, review_states: %w[accepted not-an-issue])
