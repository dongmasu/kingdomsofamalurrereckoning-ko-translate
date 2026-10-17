#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
inventory = m.refresh_inventory
specs = [
  ['place:castle-ansilla', 'Castle Ansilla', '안실라 성',
   /(?:안실라(?:\(Ansilla\))? 성|앤실라 성)(?!\(Castle Ansilla\))/,
   '안실라 성(Castle Ansilla)', 29,
   'English distinguishes the named fortress from House Ansilla and individual Ansillas. Japanese アンシラ城 and Chinese 安西拉城堡 corroborate. Reuse the established complete bilingual label 안실라 성(Castle Ansilla); combine the split base-label gloss atomically and normalize 앤실라 only in the fortress name. No global Ansilla alias is introduced.'],
  ['place:rond-farm', 'Rond Farm', '론드 농장',
   /론드 농장(?!\(Rond [Ff]arm\))/,
   '론드 농장(Rond Farm)', 33,
   'English names the farm run by Dennrit and Arlette Rond and describes its madness/fire quest. Japanese ロンド農園 and Chinese 朗多农场 corroborate. Reuse 론드 농장; do not register the shared personal surname Rond as a place alias. Retain existing local Farm/farm English capitalization.'],
  ['place:scuttle-beach', 'Scuttle Beach', '스커틀 해변',
   /스커틀 해변(?!\(Scuttle Beach\))/,
   '스커틀 해변(Scuttle Beach)', 27,
   'English explicitly names the Gallows End beach in survivor, root-golem, material-gathering, and treasure-map contexts. Japanese スカトル浜 and Chinese 舷窗海滩 corroborate. Reuse the established bilingual form 스커틀 해변(Scuttle Beach), preserving map-title prefixes and unrelated people/monster terms.'],
  ['place:southern-passage', 'Southern Passage', '남쪽 통로',
   /(?:남쪽 통로|남부 통로)(?!\(Southern Passage\))/,
   '남쪽 통로(Southern Passage)', 29,
   'English names the passage under the southwestern Dalentarth mountains leading toward the Teeth of Naros. Japanese 南側通路 (also 南通り) and Chinese 南部通道/南方通道/南部走廊 support the same named route. Reuse the dominant 남쪽 통로 and already paired default 18377 label. Pair repeated explicit Korean mentions; leave omitted repetitions and unrelated narration intact.']
]

definitions = specs.map do |entity, english, korean, _pattern, bilingual, _count, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => 'place', 'korean_canonical' => bilingual,
    'english_aliases' => '', 'korean_variants' => korean,
    'evidence_ids' => 'D-21150-D-21152', 'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF p. 4 explains named map locations and p. 7 distinguishes quest objectives; it is not an exhaustive DLC/place roster."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end
reviews = {}
specs.each do |entity, english, _korean, pattern, bilingual, count, note|
  matcher = /(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i
  scoped = inventory.values.select do |row|
    JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(matcher) }
  end
  raise "#{entity}: source coverage changed" unless scoped.length == count
  scoped.each do |source|
    key = m.key(source)
    old = source.fetch('work_text')
    new_text = old.gsub(pattern, bilingual)
    raise "#{key}: expected Korean name not found" if new_text == old &&
      !old.match?(/#{Regexp.escape(bilingual.sub(/\)\z/, ''))}[)]/i)
    status = old == new_text ? 'not-an-issue' : 'accepted'
    raise "overlapping source key #{key}" if reviews.key?(key)
    reviews[key] = {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => "#{note} #{status == 'accepted' ? 'Only the reviewed place-name span is changed.' : 'The complete bilingual place name is already present; retain it.'} All three resources were searched; no affix row matches. No prior entity/key disposition or historical global tally is reopened.",
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(entity => status)
    }
  end
end
ordered = reviews.values.sort_by do |row|
  [m::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
   row['Tipo_Variante'].to_s]
end
raise 'expected 118 distinct place rows' unless ordered.length == 118
paths = %w[proper-name-discovery-definitions-D21150.tsv proper-name-discovery-D21150.tsv]
paths.each { |path| raise "already exists: #{path}" if File.exist?(File.join(__dir__, path)) }
m.write_table(File.join(__dir__, paths[0]), glossary.headers, definitions)
m.write_table(File.join(__dir__, paths[1]), m::HEADERS.take(12), ordered)
puts "D-21150-D-21152: #{ordered.length} keys; #{ordered.group_by { |r| r['status'] }.transform_values(&:length)}"
