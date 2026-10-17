#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21_186)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
context = 'Manual PDF p. 1 describes Almain migration and the Faelands; p. 9 describes named resources, lore and factions. It does not prescribe these particular place names. English determines identity, Japanese/Chinese corroborate; no PAK-derived evidence.'
definitions = [
  ['place:coilsbain', 'Coilsbain', '코일스베인(Coilsbain)', '', '코일즈베인',
   'base:323:11|default:57702',
   'English identifies the boggart cave north of Didenhil. Japanese コイルズベイン and Chinese 科尔斯班 corroborate. Reuse the base-label spelling 코일스베인; full Cavern/Caverns and Ruins compounds remain atomic and separately indexed.'],
  ['place:coilsbain-cavern', 'Coilsbain Cavern', '코일스베인 동굴(Coilsbain Cavern)', 'Coilsbain Caverns', '코일즈베인 동굴',
   'default:11318|default:16208|default:51069|default:59187',
   'The singular/plural English cave labels are used in the same Didenhil/Jottun quest. Japanese コイルズベイン洞窟 and Chinese 科尔斯班洞穴 corroborate. Retain each source row’s Cavern/Caverns spelling in its annotation. Do not merge the Ruins label.'],
  ['place:coilsbain-ruins', 'Coilsbain Ruins', '코일스베인 유적(Coilsbain Ruins)', '', '코일즈베인 유적',
   'base:3978:11|default:56353',
   'A distinct full map label, corroborated by Japanese コイルズベイン遺跡 and Chinese 科尔斯班废墟. Keep the entire compound annotation, not an annotation inserted between stem and 유적.'],
  ['place:seafoam-tavern', 'Seafoam Tavern', '시폼 선술집(Seafoam Tavern)', 'Seafoam|The Seafoam', '씨폼|시폼 주점|시폼 여관|바다거품',
   'base:2961:11|default:27337|default:53184|default:64800',
   'English identifies the Rathir tavern, with food/drink/beds and ale; Japanese シーフォーム酒場 and Chinese 海沫酒馆 corroborate. Reuse 시폼 and normalize Tavern as 선술집. Short Seafoam references retain the short English annotation. The untranslated JA/ZH stub at default 52655 supplies no competing identity.'],
  ['place:almere-valley', 'Almere Valley', '알메어 계곡(Almere Valley)', '', '알메레 계곡|알메레(Almere) 계곡',
   'default:37|default:8480|default:18494|default:42666',
   'English identifies the western valley beyond the mountains; Japanese アルメア谷 and Chinese 阿尔梅勒山谷 corroborate. Use 알메어 계곡. Bare Almere and King Almere/Almere the Bold are outside this entry; do not conflate the place with the Almain founder.'],
  ['place:kandrian-stockade', 'Kandrian Stockade', '칸드리안 감금소(Kandrian Stockade)', '', '칸드리안 감옥',
   'base:1228:11|default:3979',
   'English distinguishes this named Stockade from the region and Keep. Japanese カンドリアン懲罰房 and Chinese 坎德利安监狱 corroborate. Reuse the existing base label 감금소 and canonical 칸드리안 stem. Do not merge Kandrian Jail or Keep.']
].map do |entity, english, korean, aliases, variants, ids, note|
  glossary.headers.zip([
    entity, english, 'place', korean, aliases, variants,
    "D-21186|#{ids}", 'confirmed', "#{note} #{context}"
  ]).to_h
end

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  old = source.fetch('work_text')
  new_text = old.dup
  entities = matches.map { |row| row['entity_key'] }
  if entities.include?('place:coilsbain')
    if english.match?(/Coilsbain Caverns?/i)
      annotation = english.match(/Coilsbain Caverns?/i)[0]
      new_text.gsub!(/코일[스즈]베인(?:\s*\(Coilsbain\))?\s+동굴(?:\s*\(Coilsbain Caverns?\))?/i,
                    "코일스베인 동굴(#{annotation})")
    elsif english.match?(/Coilsbain Ruins/i)
      new_text.gsub!(/코일[스즈]베인(?:\s*\(Coilsbain\))?\s+유적(?:\s*\(Coilsbain Ruins\))?/i,
                    '코일스베인 유적(Coilsbain Ruins)')
    else
      new_text.gsub!(/코일[스즈]베인(?:\s*\(Coilsbain\))?/i, '코일스베인(Coilsbain)')
    end
  end
  if entities.include?('place:seafoam-tavern')
    if english.match?(/Seafoam Tavern/i)
      new_text.gsub!(/(?:시폼|씨폼|바다거품)(?:\s*\(Seafoam\))?\s+(?:주점|선술집|여관)(?:\s*\(Seafoam Tavern\))?/i,
                    '시폼 선술집(Seafoam Tavern)')
    else
      new_text.gsub!(/(?:시폼|씨폼|바다거품)(?:\s+선술집)?(?:\s*\(Seafoam\))?/i, '시폼(Seafoam)')
    end
  end
  if entities.include?('place:almere-valley')
    new_text.gsub!(/알메[어레](?:\s*\(Almere\))?\s+계곡(?:\s*\(Almere Valley\))?/i,
                  '알메어 계곡(Almere Valley)')
  end
  if entities.include?('place:kandrian-stockade')
    new_text.gsub!(/칸드리안\s+(?:감금소|감옥)(?:\s*\(Kandrian Stockade\))?/i,
                  '칸드리안 감금소(Kandrian Stockade)')
  end
  status = old == new_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => definitions.select { |d| entities.include?(d['entity_key']) }
      .map { |d| "#{d['english_canonical']}: #{d['notes']}" }.join(' '),
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise "unexpected row coverage #{reviews.length}" unless reviews.length == 45
definitions_path = File.join(__dir__, 'proper-name-discovery-definitions-D21186.tsv')
reviews_path = File.join(__dir__, 'proper-name-discovery-D21186.tsv')
raise 'preparation output exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "45 distinct row keys; #{generated.group_by { |row| row['entity_key'] }.transform_values(&:length).inspect}"
puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
