#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21173)
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
specs = [
  ['person:lady-ansilla', 'Lady Ansilla', '안실라 부인(Lady Ansilla)', 'person',
   'English identifies the deceased final bride of House Ansilla, the historical doll collector, and the correspondent in Gastyr’s letter. Japanese レディー・アンシラ and Chinese 安西拉夫人 corroborate. Register this person/title only; keep House Ansilla, Castle Ansilla, Clary Ansilla, Captain Drewn Ansilla, and the dolls distinct. When a row mentions only the collection title Lady Ansilla’s Children, disposition the person match as excluded.'],
  ['unique item:lady-ansillas-children', "Lady Ansilla's Children", "안실라 부인의 아이들(Lady Ansilla's Children)", 'unique item',
   'English explicitly names the lost doll collection, identifies the dolls as the collection’s referent, and distinguishes the title from Lady Ansilla herself. Japanese レディー・アンシラの子供たち and Chinese 安西拉夫人的孩子/安西拉夫人的孩子之谜 corroborate. Pair the complete title atomically; do not nest the person label.']
]
definitions = specs.map do |entity, english, korean, category, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => category, 'korean_canonical' => korean,
    'english_aliases' => '', 'korean_variants' => '',
    'evidence_ids' => 'D-21173', 'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF p. 7 confirms House Ansilla belongs to the faction/noble-house layer, but does not enumerate Lady Ansilla or her toy collection."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
by_key = generated.group_by { |row| m.key(row) }
reviews = by_key.keys.sort_by { |resource, id, variant| [m::RESOURCES.index(resource), id.to_i, variant] }.map do |key|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  old = source.fetch('work_text')
  text = old.dup
  entities = by_key.fetch(key).map { |row| row['entity_key'] }.sort
  excluded_person = %w[8108 40933 42681].include?(key[1]) &&
    english.match?(/Lady Ansilla.s Children/i)
  if entities.include?('unique item:lady-ansillas-children')
    text.gsub!(/(?:레이디 안실라|안실라(?:\(Ansilla\))? 부인|안실라(?:\(Ansilla\))? 여사|앤실라 부인)(?:\(Lady Ansilla\))?의 아이들(?:\(Lady Ansilla.s Children\))?/, "\u0001DOLLS\u0002")
  end
  if entities.include?('person:lady-ansilla')
    text.gsub!(/안실라 가문(?:\(House Ansilla\))?/, "\u0001HOUSE\u0002")
    text.gsub!(/안실라 성(?:\(Castle Ansilla\))?/, "\u0001CASTLE\u0002")
    text.gsub!(/(?:레이디 )?앤실라 부인(?:\(Lady Ansilla\))?/, '안실라 부인(Lady Ansilla)')
    text.gsub!(/(?:레이디 )?안실라(?:\(Ansilla\))? (?:부인|여사|여인)(?:\(Lady Ansilla\))?/, '안실라 부인(Lady Ansilla)')
    text.gsub!(/레이디 안실라(?:\(Lady Ansilla\))?/, '안실라 부인(Lady Ansilla)')
    text.gsub!('그 인형들은 안실라가 가지고 있었다', '그 인형들은 안실라 부인(Lady Ansilla)이 가지고 있었다') if key[1] == '26824'
  end
  text.gsub!("\u0001DOLLS\u0002", "안실라 부인의 아이들(Lady Ansilla's Children)")
  text.gsub!("\u0001HOUSE\u0002", '안실라 가문(House Ansilla)')
  text.gsub!("\u0001CASTLE\u0002", '안실라 성(Castle Ansilla)')
  text.gsub!('안실라 부인(Lady Ansilla)는', '안실라 부인(Lady Ansilla)은')
  dispositions = entities.to_h do |entity|
    state = if entity == 'person:lady-ansilla' && excluded_person
              'excluded'
            else
              text == old ? 'not-an-issue' : 'accepted'
            end
    [entity, state]
  end
  status = if text != old
             'accepted'
           elsif dispositions.values.all? { |state| state == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => text,
    'evidence' => entities.map { |entity| definitions.find { |row| row['entity_key'] == entity }.fetch('notes') }.join(' ') + ' English establishes the individual-versus-doll-title distinction; aligned Japanese and Chinese were checked. Preserve separately registered House Ansilla/Castle Ansilla spans, prior dispositions, formatting and historical global totals.',
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end
raise "unexpected source count #{reviews.length}" unless reviews.length == 20
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21173.tsv'), glossary.headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21173.tsv'), m::HEADERS.take(12), reviews)
puts "#{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
