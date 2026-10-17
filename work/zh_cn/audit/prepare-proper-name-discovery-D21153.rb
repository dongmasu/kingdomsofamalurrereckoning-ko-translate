#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
inventory = m.refresh_inventory
specs = [
  ['person:nina-malloi', 'Nina Malloi', '니나 말로이(Nina Malloi)', '', 16,
   'English explicitly identifies Alder Malloi and Bridgette’s daughter and the Gallows End companion. Japanese ニーナ・マロイ and Chinese 尼娜·马洛伊 corroborate. Preserve established 니나 말로이. Nina Taggert is a distinct person; shared Nina is not a global alias. The same-row short name at default 41076 is locally explicit.'],
  ['person:nina-taggert', 'Nina Taggert', '니나 태거트(Nina Taggert)', '', 2,
   'English full-name labels, Japanese ニーナ・タガート and Chinese 尼娜·塔吉特 establish Nina Taggert separately from Nina Malloi. Preserve the already bilingual 니나 태거트 canonical. Do not assert that every isolated Nina reference belongs to either full-name entity.'],
  ['person:fynwick-iver', 'Fynwick Iver', '핀윅 아이버(Fynwick Iver)', 'Fynwick|Fynwick Ive', 19,
   'English names the Ayten warden, bounty payer and ceremonial-weapon collector. Japanese フィンウィック・アイヴァー and Chinese 费恩威克/芬维克·艾维尔 corroborate. Reuse 핀윅 아이버 and short 핀윅(Fynwick). The Ayten journal description at default 64871 spells the surname Ive; preserve that local English, but normalize its Korean surname to 아이버 because its unique first name, Ayten/journal context and Japanese full surname identify the same person. Iver House and other Iver people are not aliases.'],
  ['person:sveri-brond', 'Sveri Brond', '스베리 브론드(Sveri Brond)', 'Sveri', 26,
   'English identifies the female expedition scout and her short Sveri references in the Teeth of Naros journey, introduction and trap/death narration. Japanese スヴェリ・ブロンド/スヴェリ and Chinese 斯薇里·布朗德/斯薇里 corroborate. Reuse established 스베리 브론드 and 스베리. Do not register Brond as an alias or conflate Elwa Brond.']
]

definitions = specs.map do |entity, english, korean, aliases, _count, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => 'person', 'korean_canonical' => korean,
    'english_aliases' => aliases, 'korean_variants' => '',
    'evidence_ids' => 'D-21153-D-21154', 'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF pp. 6-7 supplies conversation/quest context, not these characters’ names."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
specs.each do |entity, _english, _korean, _aliases, count, _note|
  raise "#{entity}: source count changed" unless generated.count { |r| r['entity_key'] == entity } == count
end
by_key = generated.group_by { |r| m.key(r) }
reviews = by_key.keys.sort_by { |resource, id, variant| [m::RESOURCES.index(resource), id.to_i, variant] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  entities = by_key.fetch(key).map { |r| r.fetch('entity_key') }
  raise "unexpected overlapping people at #{key}" unless entities.length == 1
  entity = entities.first
  case entity
  when 'person:nina-malloi'
    new_text.gsub!(/니나 말로이(?!\(Nina Malloi\))/, '니나 말로이(Nina Malloi)')
    new_text.gsub!(/니나(?! 말로이|\(Nina\))/, '니나(Nina)') if key[1] == '41076'
  when 'person:nina-taggert'
    new_text.gsub!(/니나 태거트(?!\(Nina Taggert\))/, '니나 태거트(Nina Taggert)')
  when 'person:fynwick-iver'
    new_text.gsub!(/핀윅 아이브\(Fynwick Ive\)/, '핀윅 아이버(Fynwick Ive)')
    new_text.gsub!(/핀윅 아이버(?!\(Fynwick (?:Iver|Ive)\))/, '핀윅 아이버(Fynwick Iver)')
    new_text.gsub!(/핀윅(?! 아이버|\(Fynwick\))/, '핀윅(Fynwick)')
  when 'person:sveri-brond'
    new_text.gsub!(/스베리 브론드(?!\(Sveri Brond\))/, '스베리 브론드(Sveri Brond)')
    new_text.gsub!(/스베리(?! 브론드|\(Sveri\))/, '스베리(Sveri)')
  end
  status = new_text == old ? 'not-an-issue' : 'accepted'
  note = specs.find { |spec| spec.first == entity }.last
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
    'evidence' => "#{note} #{status == 'accepted' ? 'Correct only the scoped name/gloss; preserve all other text.' : 'The existing scoped name/gloss is already adequate; retain it.'} All three resources were searched; no affix hit. Preserve prior place/person decisions on overlapping rows and do not recount historical global totals.",
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end
raise 'expected 63 distinct personal-name keys' unless reviews.length == 63
paths = %w[proper-name-discovery-definitions-D21153.tsv proper-name-discovery-D21153.tsv]
paths.each { |path| raise "already exists: #{path}" if File.exist?(File.join(__dir__, path)) }
m.write_table(File.join(__dir__, paths[0]), glossary.headers, definitions)
m.write_table(File.join(__dir__, paths[1]), m::HEADERS.take(12), reviews)
puts "D-21153-D-21154: #{reviews.length} keys; #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
