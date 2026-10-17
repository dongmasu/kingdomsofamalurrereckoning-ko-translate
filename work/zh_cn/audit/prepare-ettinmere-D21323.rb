#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
audit = File.dirname(__FILE__)
context = 'English Ettinmere is a named locale: default:469 describes its southern approach, 4427 a resident fisherman, 5064 its shores, and 61496 the Oratory palace there. Japanese エティンメア and Chinese 艾丁米尔 corroborate. Reuse the established 에틴미어. Keep the named stone, full lake name and complete quest title as separate scopes, not aliases of the locale; do not infer their identities from shared spelling. Preserve source-local short place references, every paragraph/variant and all other names. Official Korean manual PDF pp. 1 and 9 provide Faelands/exploration context, not these exact names.'
specs = [
  ['place:ettinmere', 'Ettinmere', 'place', '에틴미어(Ettinmere)', 51,
   'Annotate explicit locale references only; exclude Ettinmere Stone, Lake Ettinmere and Ettinmere Inquiry from the parent-place scope.'],
  ['title:ettinmere-stone', 'Ettinmere Stone', 'title', '에틴미어의 돌(Ettinmere Stone)', 1,
   'Standalone base:1540:11 Ettinmere Stone, Japanese エティンメアの石 and Chinese 艾丁米尔之石. Pair the complete label, not the place inside it; no unproven item rarity/subtype.'],
  ['place:lake-ettinmere', 'Lake Ettinmere', 'place', '에틴미어 호수(Lake Ettinmere)', 1,
   'Default:51816 names the old dock of Lake Ettinmere; Japanese エティンメア湖 and Chinese 艾丁米尔湖 corroborate the full lake name. Preserve its already-correct whole-name annotation.'],
  ['quest:ettinmere-inquiry', 'Ettinmere Inquiry', 'quest', '에틴미어 조사(Ettinmere Inquiry)', 1,
   'Default:7081 is the complete Ettinmere Inquiry quest label; Japanese エティンメア探訪 and Chinese 艾丁米尔调查 support the title. Keep 조사 and annotate the whole title rather than only the place.']
]
headers = m.table(File.join(audit, 'proper-name-glossary.tsv')).headers
definitions = specs.map do |key, english, category, korean, _count, note|
  headers.zip([key, english, category, korean, '', '', 'D-21323-D-21324',
               'confirmed', "#{context} #{note}"]).to_h
end
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map { |row| OCCURRENCE_HEADERS.zip(row).to_h }
raise 'Ettinmere source coverage changed' unless generated.group_by { |row| row['entity_key'] }.transform_values(&:length) ==
  specs.to_h { |key, _english, _category, _korean, count, _note| [key, count] }
grouped = generated.group_by { |row| m.key(row) }
raise 'expected 51 distinct keys' unless grouped.length == 51
reviews = grouped.keys.sort_by { |key| [m::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.dup
  dispositions = {}
  full = grouped.fetch(key).any? { |row| row['entity_key'] != 'place:ettinmere' }
  grouped.fetch(key).each do |row|
    entity = definitions.find { |definition| definition['entity_key'] == row['entity_key'] }
    if row['entity_key'] == 'place:ettinmere' && full
      dispositions[row['entity_key']] = 'excluded'
      next
    end
    proposed = case row['entity_key']
               when 'title:ettinmere-stone'
                 raise 'stone title changed' unless key == ['base', '1540', '11'] && proposed == '에틴미어(Ettinmere)의 돌'
                 entity['korean_canonical']
               when 'quest:ettinmere-inquiry'
                 raise 'quest label changed' unless key == ['default', '7081', ''] && proposed == '에틴미어(Ettinmere) 조사'
                 entity['korean_canonical']
               when 'place:lake-ettinmere'
                 raise 'whole lake label changed' unless proposed.include?(entity['korean_canonical'])
                 proposed
               else
                 raise 'missing explicit locale name' unless proposed.include?('에틴미어')
                 proposed.gsub(/에틴미어(?: ?\(Ettinmere\))?/, entity['korean_canonical'])
               end
    dispositions[row['entity_key']] = nil
  end
  status = old == proposed ? 'not-an-issue' : 'accepted'
  dispositions.transform_values! { |value| value || status }
  { 'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
    'old' => old, 'new' => proposed,
    'evidence' => grouped.fetch(key).map { |row| definitions.find { |d| d['entity_key'] == row['entity_key'] }['notes'] }.uniq.join(' '),
    'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text'], 'entity_dispositions_json' => JSON.generate(dispositions) }
end
definition_path = File.join(audit, 'proper-name-discovery-definitions-D21323.tsv')
review_path = File.join(audit, 'proper-name-discovery-D21323.tsv')
raise 'prepared artifacts already exist' if [definition_path, review_path].any? { |path| File.exist?(path) }
ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
  m.table(File.join(audit, 'proper-name-glossary.tsv')).map(&:to_h), m.table(m::INDEX).map(&:to_h))
ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
m.write_table(definition_path, headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} keys / #{generated.length} matches in 50+1 slices; #{reviews.count { |row| row['status'] == 'accepted' }} edits."
