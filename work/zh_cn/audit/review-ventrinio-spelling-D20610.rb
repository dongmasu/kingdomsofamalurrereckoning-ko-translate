#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entry = glossary.find { |row| row['entity_key'] == 'person:ventrinio' }
raise 'unexpected Ventrinio dictionary baseline' unless
  entry && entry['korean_canonical'] == '벤티리니오(Ventrinio)'
index = m.table(m::INDEX)
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
occurrences = index.select { |row| row['entity_key'] == 'person:ventrinio' }
raise "unexpected Ventrinio scope #{occurrences.length}" unless occurrences.length == 112
reviews = occurrences.map do |occurrence|
  source = inventory.fetch(m.key(occurrence))
  raise 'non-terminal Ventrinio occurrence' unless
    %w[accepted not-an-issue].include?(occurrence['status'])
  old = source['work_text']
  raise 'missing known Ventrinio spelling' unless old.match?(/벤티리니오|벤트리니오/)
  text = old.gsub('벤티리니오', '벤트리니오')
  status = old == text ? 'not-an-issue' : 'accepted'
  {
    'resource' => occurrence['resource'], 'ID_Linha' => occurrence['ID_Linha'],
    'Tipo_Variante' => occurrence['Tipo_Variante'], 'entity_key' => 'person:ventrinio',
    'status' => status, 'old' => old, 'new' => text,
    'evidence' => 'Correct the dictionary spelling itself rather than forcing source-faithful existing rows to a typo. English Ventrinio has the Ventrin- sequence, Japanese ヴェントリニーオ corroborates 벤트리니오, and Chinese 凡特里尼奥 supports the same identity. The earlier 벤티리니오 sequence was an inconsistent syllable ordering. Compare the aligned source row and replace only that Korean spelling with 벤트리니오; existing English labels/full compounds, all other wording and names, markers, and line breaks remain unchanged. The official manual does not enumerate this character. This is a focused correction of already reviewed rows, not a repeated global disposition.',
    'entity_dispositions_json' => JSON.generate('person:ventrinio' => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
entry['korean_canonical'] = '벤트리니오(Ventrinio)'
entry['korean_variants'] = '벤티리니오'
entry['evidence_ids'] += '|D-20610-D-20612|default:23403|default:62424'
entry['notes'] += ' D-20610-D-20612 correct the former dictionary typo 벤티리니오 to 벤트리니오, supported by English Ventrinio, Japanese ヴェントリニーオ and Chinese 凡特里尼奥; all 112 indexed rows are checked together.'
out = File.join(__dir__, 'proper-name-reviewed-ventrinio-D20610.tsv')
m.write_table(out, m::HEADERS, reviews)
m.write_table(glossary_path, glossary.headers, glossary)
m.run(out, 20610, nil, review_states: %w[accepted not-an-issue])
