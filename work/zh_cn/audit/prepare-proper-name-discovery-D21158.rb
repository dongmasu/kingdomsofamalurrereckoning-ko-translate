#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
inventory = m.refresh_inventory
specs = [
  ['person:kierna-brenner', 'Kierna Brenner', '키에르나 브레너(Kierna Brenner)', 'Brenner|Ambassador Brenner', 21,
   'English full-name/self-introduction and Varani embassy/dagger-security plot identify Kierna Brenner and Ambassador Brenner; Japanese キアーナ・ブレナー/ブレナー大使 and Chinese 基耶娜·布伦纳/布伦纳大使 corroborate. Reuse 키에르나 브레너 and 브레너 대사. The Rathir military letter signed Captain Brenner at default 44750 does not establish the ambassador’s identity and is excluded, unchanged. This is a scoped exclusion, not an assertion that the two people must be different.'],
  ['person:belmaid', 'Belmaid', '벨메이드(Belmaid)', 'Queen Belmaid|Lady Belmaid', 36,
   'English names Wencen’s beloved and the House of Ballads heroine/role through dialogue, ballads and the Court roster. Japanese ベルメイド and Chinese 贝尔梅德/贝尔美 corroborate. Preserve 벨메이드; pair Queen Belmaid atomically as 벨메이드 여왕(Queen Belmaid) and Lady Belmaid as 레이디 벨메이드(Lady Belmaid), without merging the Maid of Windemere. English-only fallback label 36897 remains unchanged, not treated as absent evidence.'],
  ['person:delf', 'Delf', '델프(Delf)', 'Brother Delf', 36,
   'English Red Legion desertion/Blood Rite and St. Odwig’s Mission context identifies the monk Brother Delf and local short Delf references. Japanese ブラザー・デルフ/デルフ and Chinese 德尔夫修士/代夫修士 corroborate. Standardize monastic Brother as 수사, preserving personal name 델프. Do not mistake it for a literal sibling or leave 브라더 as a separate personal name. Exclude the three Akara memorial lists naming Delf Loerthic from this monk’s scope. English-only fallback label 10223 remains unchanged.'],
  ['person:delf-loerthic', 'Delf Loerthic', '델프 로어식(Delf Loerthic)', '', 3,
   'English names Delf Loerthic in three Akara memorial lists alongside Cape Solace people. Japanese デルフ・レルシック and Chinese 德尔福·罗尔斯克 corroborate. Reuse the repeated Korean surname 로어식 rather than isolated 로어딕. Register only the full name; no identity link with Brother Delf is established.'],
  ['person:lord-ohn', 'Lord Ohn', '오운 경(Lord Ohn)', '', 15,
   'English Withering War history identifies the Winter/Unseelie lord opposed to Ysa; Japanese オーン卿 and Chinese 欧恩领主 corroborate. Reuse base 3022’s 오운 경(Lord Ohn), normalizing 오언/오른/오온 only in this explicit person scope. Preserve different translated ranks and winter-lord phrasing rather than forcing every Ohn reference to contain 경. Same-row short Ohn references remain local; no global Ohn alias or unproved identity with a named place is introduced.']
]
definitions = specs.map do |entity, english, bilingual, aliases, _count, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english, 'category' => 'person',
    'korean_canonical' => bilingual, 'english_aliases' => aliases,
    'korean_variants' => '', 'evidence_ids' => 'D-21158-D-21160',
    'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF pp. 1 and 7 supplies Fae/war/faction context, not an exhaustive character roster."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
specs.each do |entity, _english, _bilingual, _aliases, count, _note|
  raise "#{entity}: unexpected source count" unless generated.count { |r| r['entity_key'] == entity } == count
end
by_key = generated.group_by { |r| m.key(r) }
reviews = by_key.keys.sort_by { |resource, id, variant| [m::RESOURCES.index(resource), id.to_i, variant] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  entities = by_key.fetch(key).map { |r| r.fetch('entity_key') }.sort
  decisions = {}
  entities.each do |entity|
    if (entity == 'person:kierna-brenner' && key[1] == '44750') ||
       (entity == 'person:delf' && %w[15889 19539 29020].include?(key[1]))
      decisions[entity] = 'excluded'
      next
    end
    before_entity = new_text.dup
    case entity
    when 'person:kierna-brenner'
      new_text.gsub!(/키에르나 브레너(?:\(Kierna Brenner\))?/, '키에르나 브레너(Kierna Brenner)')
      new_text.gsub!(/(?:브레너|베너)(?:\(Brenner\))? 대사(?:\(Ambassador Brenner\))?/, '브레너 대사(Ambassador Brenner)')
      new_text.gsub!(/(?<!키에르나 )(?:브레너|베너)(?! 대사|\(Kierna Brenner\)|\(Ambassador Brenner\)|\(Brenner\))/, '브레너(Brenner)')
    when 'person:belmaid'
      new_text.gsub!(/벨메이드(?:\(Belmaid\))? 여왕(?:\(Queen Belmaid\))?/, '벨메이드 여왕(Queen Belmaid)')
      new_text.gsub!(/레이디 벨메이드(?:\(Lady Belmaid\))?/, '레이디 벨메이드(Lady Belmaid)')
      new_text.gsub!(/(?<!레이디 )벨메이드(?! 여왕|\(Belmaid\))/, '벨메이드(Belmaid)')
    when 'person:delf'
      new_text.gsub!(/(?:델프 (?:형제|수사)|브라더 델프)(?:\(Brother Delf\))?/, '델프 수사(Brother Delf)')
      new_text.gsub!(/델프(?! 수사|\(Delf\))/, '델프(Delf)')
    when 'person:delf-loerthic'
      new_text.gsub!(/델프 (?:로어식|로어딕)(?:\(Delf Loerthic\))?/, '델프 로어식(Delf Loerthic)')
    when 'person:lord-ohn'
      new_text.gsub!(/(?:오운|오언|오른|오온)(?:\(Ohn\))? 경(?:\(Lord Ohn\))?/, '오운 경(Lord Ohn)')
      new_text.gsub!(/(?:오언|오른|오온)(?:\(Ohn\))?/, '오운(Ohn)')
      new_text.gsub!(/오운(?! 경|\(Ohn\))/, '오운(Ohn)')
    end
    decisions[entity] = new_text == before_entity ? 'not-an-issue' : 'accepted'
  end
  status = if new_text != old
             'accepted'
           elsif decisions.values.all? { |s| s == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  note = entities.map { |entity| specs.find { |s| s.first == entity }.last }.join(' ')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => new_text,
    'evidence' => "#{note} Only reviewed name/title spans change. All three resources were searched. Prior entity/key decisions on overlapping cells and historical global totals are preserved.",
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(decisions)
  }
end
raise 'expected 108 distinct name keys' unless reviews.length == 108
paths = %w[proper-name-discovery-definitions-D21158.tsv proper-name-discovery-D21158.tsv]
paths.each { |path| raise "already exists: #{path}" if File.exist?(File.join(__dir__, path)) }
m.write_table(File.join(__dir__, paths[0]), glossary.headers, definitions)
m.write_table(File.join(__dir__, paths[1]), m::HEADERS.take(12), reviews)
puts "D-21158-D-21160: #{reviews.length} keys; #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
