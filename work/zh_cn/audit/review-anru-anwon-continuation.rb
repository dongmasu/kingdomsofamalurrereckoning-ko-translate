#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

audit = __dir__
inventory = CSV.read('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t")
  .to_h { |row| [ReviewedNameBatches.key(row), row.to_h] }
occurrences = CSV.read(File.join(audit, 'proper-name-occurrences.tsv'), headers: true, col_sep: "\t")
rows = occurrences.select do |row|
  row['status'] == 'needs-context' && %w[person:anru person:anwon].include?(row['entity_key'])
end.sort_by { |row| [row['entity_key'], ReviewedNameBatches::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
reviews = rows.map do |occurrence|
  source = inventory.fetch(ReviewedNameBatches.key(occurrence))
  old = source['work_text']
  english = JSON.parse(source['en_texts_json']).join("\n")
  replacement = old.dup
  entity = occurrence['entity_key']
  if entity == 'person:anru'
    replacement.gsub!(/안루(?:\(Anru\))?\s+베신(?:\(Anru Besin\))?/, '안루 베신(Anru Besin)')
    replacement.gsub!(/안루(?! 베신|\(Anru)/, '안루(Anru)')
    evidence = 'English Anru Besin identifies the Alfar lord; Japanese アンル・ベシン and Chinese 安鲁·贝辛 corroborate the complete name. Preserve complete-name pairing, not an annotation on the first-name component alone.'
    status = replacement == old ? 'not-an-issue' : 'accepted'
  elsif english.match?(/\b(?:Coriana|Mallion|Mahlew)\s+Anwon\b/i) || english.strip == 'Anwon'
    replacement.gsub!(/(?:말리온|말리언|맬리언)(?:\(Mallion\))?\s+(?:안원|앤원)(?:\(Mallion Anwon\))?/, '말리온 안원(Mallion Anwon)')
    replacement.gsub!(/말류\s+안원(?:\(Mahlew Anwon\))?/, '말류 안원(Mahlew Anwon)')
    evidence = 'English explicitly identifies Coriana Anwon, Mallion Anwon, or Mahlew Anwon, rather than the House as a collective. Japanese/Chinese corroborate identity. At default:36684 Japanese substitutes Mallion, but English/Chinese give Mahlew; retain Mahlew rather than invent an alias.'
    status = replacement == old ? 'not-an-issue' : 'accepted'
  else
    status = 'excluded'
    evidence = 'English names House Anwon, its bloodline, heirs, or family as a collective; Japanese アンウォン家 and Chinese 安文家族 corroborate. This is not a personal-name occurrence. The separate faction:house-anwon glossary entry governs any later family-label residual corrections.'
  end
  {
    'resource' => source['resource'], 'ID_Linha' => source['ID_Linha'],
    'Tipo_Variante' => source['Tipo_Variante'].to_s, 'entity_key' => entity,
    'status' => status, 'old' => old, 'new' => replacement, 'evidence' => evidence,
    'english' => english,
    'japanese' => JSON.parse(source['ja_texts_json']).join("\n---\n"),
    'chinese' => source['zh_text']
  }
end
ReviewedNameBatches.write_table(File.join(audit, 'proper-name-reviewed-anru-anwon-continuation.tsv'),
                               ReviewedNameBatches::HEADERS, reviews)
puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
