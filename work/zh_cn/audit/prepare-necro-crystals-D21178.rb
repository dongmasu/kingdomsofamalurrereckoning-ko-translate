#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_178
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definition = glossary.headers.zip([
  'resource:necro-crystal',
  'Necro Crystal',
  'resource',
  '네크로 수정(Necro Crystal)',
  'Necro Crystals',
  '네크로 크리스털|강령 수정|네크로 수정',
  'default:69|default:7465|default:24071',
  'confirmed',
  'English identifies Necro Crystal(s) as a distinct magical substance studied, removed from subjects, and considered as a power source. Japanese ネクロクリスタル and Chinese 死灵水晶 corroborate the term. Use 네크로 수정 and preserve the source singular/plural form in each English parenthetical. The official Korean manual does not mention this lore material; that omission is not contrary evidence. This focused term registration does not reopen the broader narrative/clinical translation review at default:24071.'
]).to_h

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = %w[69 7465 24071 35969 45683].map do |id|
  ['default', id, '']
end.sort
actual = generated.map { |row| m.key(row) }.sort
raise "unexpected source keys: #{actual.inspect}" unless actual == expected

plurality = {
  '69' => ['Necro Crystals'],
  '7465' => ['Necro Crystals'],
  '24071' => ['Necro Crystals', 'Necro Crystals', 'Necro Crystal', 'Necro Crystals'],
  '35969' => ['Necro Crystal'],
  '45683' => ['Necro Crystal']
}
term_pattern = /(?:네크로 크리스털|강령 수정|네크로 수정)(?:\s*\(Necro Crystals?\))?/
reviews = generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  forms = plurality.fetch(key[1])
  occurrence = 0
  proposed = old.gsub(term_pattern) do
    english_form = forms.fetch(occurrence) do
      raise "too many Korean term matches at #{key.inspect}"
    end
    occurrence += 1
    "네크로 수정(#{english_form})"
  end
  raise "term/source count differs at #{key.inspect}" unless occurrence == forms.length
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  raise "English term missing at #{key.inspect}" unless
    english.scan(/(?<![A-Za-z])Necro Crystals?(?![A-Za-z])/).length == forms.length
  status = old == proposed ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => definition.fetch('entity_key'),
    'status' => status,
    'old' => old,
    'new' => proposed,
    'evidence' => 'English identifies the same named magical substance in this exact source row; Japanese ネクロクリスタル and Chinese 死灵水晶 corroborate. Standardized the Korean term to 네크로 수정 and paired each occurrence with the exact English singular/plural form, preserving all surrounding text, particles, tokens, and line breaks. This is scoped terminology work only; default:24071’s broader translation disposition is not reopened.',
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(
      definition.fetch('entity_key') => status
    )
  }
end

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
