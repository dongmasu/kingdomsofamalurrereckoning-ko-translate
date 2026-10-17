#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
audit = File.dirname(__FILE__)
context = 'English-led all-resource review; Japanese/Chinese corroborate each source key. Official manual PDF pp. 1, 6 and 9 gives Faelands, item and world context, but is not an expansion gazetteer. Preserve unrelated names, clauses, variables and line endings; complete item names have their own scopes. These focused discovery records do not reopen historical translation decisions or global totals.'
specs = [
  ['place:nyxaros', 'Nyxaros', 'place', '닉사로스(Nyxaros)', 34,
   'default:64554 describes an unraised city section used as a retreat; 23318 identifies the Primos catacombs and 18882 calls it a dungeon. Japanese ニクサロス and Chinese 尼科萨罗斯 corroborate. Reuse majority 닉사로스, not 니크사로스. Exclude the Stone/Cell Key item rows from the parent place scope. At 52272 correct the person-only 에게서 to the place particle 에서. At 13562 correct the geography: Nyxaros is the monastic retreat in the wilderness, not the name of the wilderness.'],
  ['place:felltown', 'Felltown', 'place', '펠타운(Felltown)', 32,
   'English default:5165 identifies a settlement/district with merchants, smithy and tavern; 65018 places it in the Gardens of Ysa. Japanese フェルタウン and Chinese 费尔镇 corroborate. Preserve consistent 펠타운, adding missing annotations; do not merge Asker’s Alley, the Embassy or United Merchants Delegation building into this place.'],
  ['place:cursewood', 'Cursewood', 'place', '커스우드(Cursewood)', 26,
   'English names the woodland/region in travel, battles and the village destruction accounts. Japanese カースウッド and Chinese 诅咒森林 corroborate identity; reuse the established phonetic 커스우드 rather than mixed 저주숲/저주받은 숲/저주의 숲/카스우드 forms. Preserve Foe’s Hearth as a separate place and do not infer that the village and wider woodland are separate named entities.'],
  ['unique item:nyxaros-stone', 'Nyxaros Stone', 'unique item', '닉사로스의 돌(Nyxaros Stone)', 1,
   'base:1222 is the complete Nyxaros Stone title, Japanese ニクサロスの石 and Chinese 尼科萨罗斯之石. Preserve 닉사로스의 돌 but pair the full item title, without nested place annotations.'],
  ['unique item:nyxaros-cell-key', 'Nyxaros Cell Key', 'unique item', '닉사로스 감방 열쇠(Nyxaros Cell Key)', 1,
   'base:3040 names the complete Nyxaros Cell Key, Japanese ニクサロスの監房の鍵 and Chinese 尼科萨罗斯牢房钥匙. Preserve the Korean and pair the full key name, without nested place annotations.']
]
headers = m.table(File.join(audit, 'proper-name-glossary.tsv')).headers
definitions = specs.map do |entity, english, category, korean, _count, notes|
  { 'entity_key' => entity, 'english_canonical' => english, 'category' => category,
    'korean_canonical' => korean, 'english_aliases' => '', 'korean_variants' => '',
    'evidence_ids' => 'D-21314-D-21315', 'status' => 'confirmed', 'notes' => notes }
end
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
raise 'source count mismatch' unless generated.group_by { |r| r['entity_key'] }.transform_values(&:length) ==
  specs.to_h { |s| [s[0], s[4]] }
grouped = generated.group_by { |r| m.key(r) }
raise 'distinct row coverage differs' unless grouped.length == 92
reviews = grouped.keys.sort_by { |key| [m::RESOURCES.index(key[0]), key[1].to_i, key[2]] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  dispositions = {}
  grouped.fetch(key).each do |occurrence|
    spec = specs.find { |s| s[0] == occurrence['entity_key'] }
    entity, _english, _category, canonical = spec
    if entity == 'place:nyxaros' && key[0] == 'base' && %w[1222 3040].include?(key[1])
      dispositions[entity] = 'excluded'
      next
    end
    case entity
    when 'place:nyxaros'
      pattern = /(?:니크사로스|닉사로스)(?:\(Nyxaros\))?/
      raise "missing Nyxaros span #{key.inspect}" unless new_text.match?(pattern)
      new_text = new_text.gsub(pattern, canonical)
      new_text = new_text.sub("#{canonical}에게서", "#{canonical}에서") if key[1] == '52272'
      if key[1] == '13562'
        before = "#{canonical}라는 황야에 수도원 은둔처를"
        raise 'unexpected Nyxaros geographic clause' unless new_text.include?(before)
        new_text = new_text.sub(before, "황야에 #{canonical}라는 수도원 은둔처를")
      end
    when 'place:felltown'
      raise "missing Felltown span #{key.inspect}" unless new_text.include?('펠타운')
      new_text = new_text.gsub(/펠타운(?:\(Felltown\))?/, canonical)
    when 'place:cursewood'
      pattern = /(?:저주받은 숲|저주의 숲|저주숲|카스우드|커스우드)(?:\(Cursewood\))?/
      raise "missing Cursewood span #{key.inspect}" unless new_text.match?(pattern)
      new_text = new_text.gsub(pattern, canonical)
    when 'unique item:nyxaros-stone'
      raise 'unexpected stone title' unless new_text == '닉사로스(Nyxaros)의 돌'
      new_text = canonical
    else
      raise 'unexpected key title' unless new_text == '닉사로스(Nyxaros) 감방 열쇠'
      new_text = canonical
    end
    dispositions[entity] = nil
  end
  status = old == new_text ? 'not-an-issue' : 'accepted'
  dispositions.transform_values! { |v| v || status }
  { 'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => context + ' ' + grouped.fetch(key).map { |o| specs.find { |s| s[0] == o['entity_key'] }[5] }.uniq.join(' '),
    'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text'], 'entity_dispositions_json' => JSON.generate(dispositions) }
end
definitions_path = File.join(audit, 'proper-name-discovery-definitions-D21314.tsv')
review_path = File.join(audit, 'proper-name-discovery-D21314.tsv')
raise 'refusing to replace prepared records' if [definitions_path, review_path].any? { |p| File.exist?(p) }
ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
  m.table(File.join(audit, 'proper-name-glossary.tsv')).map(&:to_h), m.table(m::INDEX).map(&:to_h))
ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
m.write_table(definitions_path, headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} rows / #{generated.length} entity matches in two <=50-row batches."
