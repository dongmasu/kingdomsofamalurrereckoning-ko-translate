#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
audit = File.dirname(__FILE__)
d = 21331
entity = 'source-form:kingsfoil'
target = ['base', '3121', '11']
review_path = File.join(audit, 'proper-name-scoped-review-D21331.tsv')
definition_path = File.join(audit, 'proper-name-scoped-definitions-D21331.tsv')
raise 'batch already recorded' if Dir.glob(File.join(audit, "named-scope-*-D#{d}-*.md")).any? ||
  [review_path, definition_path, File.join(audit, "proper-name-edits-D#{d}.tsv")].any? { |path| File.exist?(path) }
hashes = m.hashes
inventory = m.refresh_inventory
matches = inventory.values.select do |row|
  JSON.parse(row['en_texts_json']).compact.any? { |text| text.match?(/\bKingsfoil\b/i) }
end
raise 'Kingsfoil source scope changed' unless matches.length == 1 && m.key(matches.first) == target
source = matches.first
raise 'exact source/current label changed' unless
  JSON.parse(source['en_texts_json']).compact == ['Kingsfoil'] &&
  JSON.parse(source['ja_texts_json']).compact == ['王の失敗'] &&
  source['zh_text'] == '王叶草' && source['work_text'] == '왕의 실패'
extra_sources = [
  ['de_de', '11', 'Königsvereitler'],
  ['es_es', '11', 'Florete del rey'],
  ['fr_fr', '11', 'Fleuret du Roi'],
  ['it_it', '12', 'Foglia del re']
]
extra_sources.each do |locale, variant, text|
  path = File.join(m::ROOT, 'src', 'csv', locale, "locatexts_#{locale}.koalocatext_base.csv")
  rows = CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8').select { |row| row['ID_Linha'] == '3121' }
  raise "additional source changed #{locale}" unless rows.length == 1 &&
    rows.first['Tipo_Variante'] == variant && rows.first['Texto'] == text
end
evidence = 'Explicit source-local Kingsfoil hold, base:3121:11 only. English provides a standalone Kingsfoil label and no description or subtype anywhere in affix/base/default. Japanese 王の失敗 supports the existing failure reading, while Chinese 王叶草 suggests a plant reading. One focused additional cross-check remains conflicting: German base:3121:11 Königsvereitler has a thwarting sense; Spanish base:3121:11 Florete del rey and French base:3121:11 Fleuret du Roi suggest a fencing-foil sense; Italian base:3121:12 Foglia del re suggests a leaf. The Italian variant is 12, not an assumed shared 11; its meaning is supporting evidence only, not a structural mapping. English alone does not resolve the intended sense of this compound; do not import a botanical or equipment identity, guess a pun, or silently endorse the current Korean as canonical. Official Korean manual PDF pp. 6-8 distinguishes equipment, reagents and crafting, but supplies no evidence identifying this exact item. Keep 왕의 실패 unchanged and record uncertain pending direct item/context evidence. This provisional source-form is not a confirmed additional entity, alias or approved Korean canonical; blank canonicals prevent generic matching. Existing dispositions are not reopened.'
definition = {
  'entity_key' => entity, 'english_canonical' => '', 'category' => 'title',
  'korean_canonical' => '', 'english_aliases' => '', 'korean_variants' => '왕의 실패',
  'evidence_ids' => 'D-21331|base:3121:11', 'status' => 'unresolved', 'notes' => evidence
}
review = {
  'resource' => target[0], 'ID_Linha' => target[1], 'Tipo_Variante' => target[2],
  'entity_key' => entity, 'status' => 'uncertain', 'old' => source['work_text'],
  'new' => source['work_text'], 'evidence' => evidence, 'english' => 'Kingsfoil',
  'japanese' => '王の失敗', 'chinese' => '王叶草',
  'entity_dispositions_json' => JSON.generate(entity => 'uncertain'),
  'previous_status' => '', 'previous_evidence' => ''
}
glossary_path = File.join(audit, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
index = m.table(m::INDEX)
raise 'source form already registered' if glossary.any? { |row| row['entity_key'] == entity } ||
  index.any? { |row| row['entity_key'] == entity }
existing_keys = index.map { |row| [row['entity_key'], *m.key(row)] }
raise 'duplicate original occurrence keys' unless existing_keys.uniq.length == existing_keys.length
raise 'Kingsfoil unexpectedly already belongs to an entity' if glossary.any? do |row|
  [row['english_canonical'], *row['english_aliases'].to_s.split('|')].compact.any? { |term| term.casecmp?('Kingsfoil') }
end
occurrence = OCCURRENCE_HEADERS.zip([
  entity, *target, 'Kingsfoil', 'Kingsfoil', source['work_text'], 'needs-context', evidence
]).to_h
raise 'active CSV changed during preflight' unless m.hashes == hashes
m.write_table(review_path, m::HEADERS, [review])
m.write_table(definition_path, glossary.headers, [definition])
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + [occurrence])
m.run(review_path, d, nil)
raise 'no-edit hold changed CSV bytes' unless m.hashes == hashes
final = m.table(m::INDEX).map(&:to_h)
raise 'original dispositions/evidence changed' unless final.first(index.length) == index.map(&:to_h)
puts 'One scoped unresolved Kingsfoil source-form hold; all CSV bytes and prior index records unchanged.'
