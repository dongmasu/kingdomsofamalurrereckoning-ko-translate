#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
inventory = m.refresh_inventory
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
index = m.table(m::INDEX)
entity = 'resource:sky-blossom'
definition = glossary.find { |row| row['entity_key'] == entity }
raise 'missing Sky Blossom definition' unless definition
raise 'alias already registered' unless definition['english_aliases'].to_s.empty?
raise 'unexpected active default' unless m.hashes.fetch('default') ==
  '48e14535c837d39edef1f6dc90a330b155e402f46db59b42b44e386dd583a431'

definition['english_aliases'] = 'Skyblossom'
definition['evidence_ids'] += '|D-21269|base:3541:11|default:64526'
definition['korean_variants'] += '|스카이블로섬|스카이블라섬'
definition['notes'] += ' D-21269 adds the compact source alias Skyblossom: base:3541 has the same Japanese スカイ・ブロッサム and Chinese 天空之花 as the spaced form, and default:64526 explicitly calls it a reagent with Embereyes. Only newly discovered alias keys are reviewed; D-21265 keys retain their dispositions. The identity of the plant is supported, but default:60374 retains a source-fragment interpretation hold without a Korean edit.'

existing = index.map { |row| [row['entity_key'], *m.key(row)] }
generated = build_occurrences(inventory.values, [definition.to_h]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end.reject { |row| existing.include?([row['entity_key'], *m.key(row)]) }
expected = [
  ['base', '3541', '11'],
  *%w[17683 24136 39953 50873 60374 64526].map { |id| ['default', id, ''] }
]
raise 'unexpected alias coverage' unless generated.map { |row| m.key(row) }.sort == expected.sort
reviews = generated.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }.map do |row|
  source = inventory.fetch(m.key(row))
  old = source.fetch('work_text')
  uncertain = row['resource'] == 'default' && row['ID_Linha'] == '60374'
  new_text = old.dup
  unless uncertain
    pattern = /(?:하늘꽃|스카이[ \t]*블로섬|스카이블로섬|스카이블라섬)(?:[ \t]*\(Skyblossom\))?/
    raise "missing alias Korean span #{m.key(row)}" unless old.match?(pattern)
    new_text.gsub!(pattern, definition.fetch('korean_canonical'))
  end
  status = uncertain ? 'uncertain' : (old == new_text ? 'not-an-issue' : 'accepted')
  evidence = if uncertain
               'New compact Skyblossom alias occurrence. Plant identity is corroborated by base:3541 and default:64526; however English ends with the fragment "She deserves Skyblossom, whispers.", while Korean invents living at a place. Japanese supports a flower befitting her but does not resolve the trailing fragment. Retain the exact cell pending interpretation rather than silently repair the whole clause.'
             else
               'New compact Skyblossom alias occurrence, not a repeat of D-21265. English default:64526 explicitly identifies the plant as an alchemical reagent; base:3541 shares Japanese スカイ・ブロッサム and Chinese 天空之花 with the spaced Sky Blossom form. Standardize only the attested Korean plant span to 하늘꽃(Sky Blossom). Official manual PDF p. 4 supplies generic Alchemy/reagent context, not a plant-specific spelling. Preserve all quantities, prose, other names, tokens and line breaks.'
             end
  {
    'resource' => row['resource'], 'ID_Linha' => row['ID_Linha'],
    'Tipo_Variante' => row['Tipo_Variante'], 'entity_key' => entity,
    'status' => status, 'old' => old, 'new' => new_text, 'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end
raise 'duplicate proposal' unless reviews.map { |row| m.key(row) }.uniq.length == 7
m.write_table(File.join(__dir__, 'proper-name-discovery-D21269.tsv'), m::HEADERS.take(12), reviews)
m.write_table(glossary_path, glossary.headers, glossary)
combined = index.map(&:to_h) + generated
combined.sort_by! { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']] }
m.write_table(m::INDEX, index.headers, combined)
puts 'Prepared 7 new Skyblossom alias keys; 6 accepted, 1 contextual hold.'
