#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
audit = File.dirname(__FILE__)
definition = {
  'entity_key' => 'organization:lykeios', 'english_canonical' => 'Lykeios',
  'category' => 'organization', 'korean_canonical' => '리케이오스(Lykeios)',
  'english_aliases' => '', 'korean_variants' => '라이케이오스',
  'evidence_ids' => 'D-21316-D-21317|base:1758:11|default:2629|default:50683|default:63650',
  'status' => 'confirmed',
  'notes' => 'English default:2629 identifies the Lykeios as Idylla’s academy of theology, 50683 names Onesimos its schoolmaster, and 63650 identifies the Kollossae institution for moral/ethical debate. Japanese リュケイオス/リケイオス/ライケイオス varies while Chinese 莱克欧斯 corroborates identity. Reuse base:1758 and the established 리케이오스 labels, not mixed 라이케이오스. English The Lykeios at standalone base:1758/default:61349 is a full proper-name label and retains The in those annotations. Lowercase grammatical the in prose is not part of the annotated name. Official Korean manual PDF p. 2 supplies 에테네(Ethene), a deity linked by the source lore at 58934; pp. 1 and 9 provide general world/peoples context, not this expansion institution’s name. Preserve all other identities and text.'
}
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
raise 'expected 64 unique Lykeios keys' unless generated.length == 64 &&
  generated.map { |r| m.key(r) }.uniq.length == 64
reviews = generated.sort_by { |r| key = m.key(r); [m::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  old = source['work_text']
  pattern = /(?:라이케이오스|리케이오스)(?: ?\((?:The )?Lykeios\))?/
  raise "missing reviewed Korean name #{key.inspect}" unless old.match?(pattern)
  label = english == 'The Lykeios' ? '리케이오스(The Lykeios)' : definition['korean_canonical']
  proposed = old.gsub(pattern, label)
  status = old == proposed ? 'not-an-issue' : 'accepted'
  { 'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => definition['entity_key'], 'status' => status,
    'old' => old, 'new' => proposed, 'evidence' => definition['notes'],
    'english' => english,
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text'],
    'entity_dispositions_json' => JSON.generate(definition['entity_key'] => status) }
end
definitions_path = File.join(audit, 'proper-name-discovery-definitions-D21316.tsv')
reviews_path = File.join(audit, 'proper-name-discovery-D21316.tsv')
raise 'refusing to replace prepared records' if [definitions_path, reviews_path].any? { |p| File.exist?(p) }
ReviewedProperNameDiscovery.validate!([definition], reviews, generated,
  m.table(File.join(audit, 'proper-name-glossary.tsv')).map(&:to_h), m.table(m::INDEX).map(&:to_h))
ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
m.write_table(definitions_path, m.table(File.join(audit, 'proper-name-glossary.tsv')).headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} Lykeios rows in 50+14 slices; #{reviews.count { |r| r['status'] == 'accepted' }} edits."
