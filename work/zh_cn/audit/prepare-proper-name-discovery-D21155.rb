#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
inventory = m.refresh_inventory
specs = [
  ['place:drowned-forest', 'Drowned Forest', '물에 잠긴 숲(Drowned Forest)', 18,
   /(?:물에 잠긴 숲|익사자의 숲|익사한 숲|가라앉은 숲|침수림|드라운드 포레스트)(?:\(Drowned Forest\))?/,
   'English names the swamp region, including Sioran Crypt, banshaen/murghan missions and Hallam’s territorial title. Japanese 溺れ森 and Chinese 水下森林/淹没森林 corroborate. Reuse the base 3714 and established bilingual 물에 잠긴 숲 label; normalize literal and phonetic variants without altering monster/person names.'],
  ['place:undersea-fasting', 'Undersea Fasting', '언더시 패스팅(Undersea Fasting)', 15,
   /(?:언더시 패스팅|언더시 패스|해저 단식 통로|해저 단식|해저 패스팅|해저 통로)(?:\(Undersea Fasting\))?/,
   'English identifies a named Dverga ruin, treasure hall and exploration route, not dietary fasting. Japanese アンダーシー地下通路 and contextual Chinese 海底通道 corroborate; Chinese 海底禁食地 is a divergent literal rendering, not semantic authority. Reuse the already repeated bilingual 언더시 패스팅 form.'],
  ['place:ohns-stand', "Ohn's Stand", "오운의 거점(Ohn's Stand)", 15,
   /(?:오운스 스탠드|온스 스탠드|오운(?:\(Ohn\))?의 거점|오운의 진지|오운의 언덕|오언의 거점|오언의 요새|온의 거점|온의 진지|오온의 거점|오른의 기지)(?:\(Ohn's Stand\))?/,
   'English consistently names the Lorca-Rane fortress where Grim was imprisoned/rescued. Japanese オーン要塞/オーンの陣地 and Chinese 欧恩城堡 support the location rather than ordinary hill/stand vocabulary. Reuse base 3115’s 오운 and existing 오운의 거점 bilingual label, joining the split Ohn gloss atomically. Do not introduce a global Ohn person alias.'],
  ['place:canyon-hill', 'Canyon Hill', '캐니언 힐(Canyon Hill)', 24,
   /(?:캐니언 힐|협곡 언덕)(?!\(Canyon Hill)/,
   'English names the mine/site associated with Enser, Aurenda’s projection and returning miners. Japanese キャニオンヒル/キャニオン・ヒル鉱山 and Chinese 峡谷山矿场 corroborate. Reuse 캐니언 힐, not the isolated literal 협곡 언덕. Preserve complete existing Mine/Site glosses and pair unglossed full Canyon Hill Mine labels atomically.'],
  ['place:burren-cove', 'Burren Cove', '버렌 만(Burren Cove)', 15,
   /(?:(?:버렌|버런|뷰런|부런)(?:\(Burren\))? (?:만|코브))(?:\(Burren Cove\))?/,
   'English identifies the named cove/prison associated with Adar’s iron gate and magical confinement. Japanese ブーレン洞穴 and Chinese 巴伦湾 corroborate identity, with a cave/cove wording difference. Reuse the established complete 버렌 만(Burren Cove) form; keep Cove as 만 rather than inferring a different place from Japanese.'],
  ['place:tidal-pools', 'Tidal Pools', '조수 웅덩이(Tidal Pools)', 14,
   /(?:조수 웅덩이|타이달 풀스)(?:\(Tidal Pools\))?/,
   'English explicitly names the southern Gallows End destination in map, ring-cache and Zefwyn challenge contexts. Japanese 潮の泉 (often quoted) and Chinese 潮汐池 corroborate. Reuse 조수 웅덩이. Lowercase generic wharfs-and-tidal-pools prose at default 21465/36835 is excluded and unchanged, not inferred to be a proper name solely from lexical matching.'],
  ['place:snaketail-grotto', 'Snaketail Grotto', '스네이크테일 동굴(Snaketail Grotto)', 12,
   /(?:스네이크테일 동굴|스네크테일 동굴)(?:\(Snaketail Grotto\))?/,
   'English names the grotto in Maun’s hoard and Motus refinement-disaster records. Japanese スネークテイル洞 and Chinese 蛇尾洞 corroborate. Reuse the dominant complete bilingual 스네이크테일 동굴 form and normalize 스네크테일. Do not conflate the separately named Snaketail River.']
]
definitions = specs.map do |entity, english, bilingual, _count, _pattern, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => 'place', 'korean_canonical' => bilingual,
    'english_aliases' => '', 'korean_variants' => '',
    'evidence_ids' => 'D-21155-D-21157', 'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF p. 4 distinguishes world/local map destinations and p. 7 quest objectives; it does not enumerate these place names."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
specs.each do |entity, _english, _bilingual, count, _pattern, _note|
  raise "#{entity}: source count changed" unless generated.count { |r| r['entity_key'] == entity } == count
end
by_key = generated.group_by { |r| m.key(r) }
reviews = by_key.keys.sort_by { |resource, id, variant| [m::RESOURCES.index(resource), id.to_i, variant] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  entities = by_key.fetch(key).map { |r| r.fetch('entity_key') }
  raise "unexpected place overlap #{key}" unless entities.length == 1
  entity = entities.first
  _entity, _english, bilingual, _count, pattern, note = specs.find { |spec| spec.first == entity }
  excluded = entity == 'place:tidal-pools' && %w[21465 36835].include?(key[1])
  unless excluded
    if entity == 'place:canyon-hill'
      if JSON.parse(source.fetch('en_texts_json')).compact.any? { |s| s.include?('Canyon Hill Mine') }
        new_text.gsub!(/캐니언 힐 광산(?!\(Canyon Hill Mine\))/, '캐니언 힐 광산(Canyon Hill Mine)')
      end
      new_text.gsub!(pattern, bilingual)
      # Do not match the Korean component of an already atomic full Mine label.
      new_text.gsub!('캐니언 힐(Canyon Hill) 광산(Canyon Hill Mine)', '캐니언 힐 광산(Canyon Hill Mine)')
    else
      raise "no scoped Korean span at #{key}" unless new_text.match?(pattern)
      new_text.gsub!(pattern, bilingual)
    end
    new_text.sub!('드라운드 포레스트', '물에 잠긴 숲') if entity == 'place:drowned-forest'
    new_text.gsub!('물에 잠긴 숲(Drowned Forest)를', '물에 잠긴 숲(Drowned Forest)을')
    new_text.gsub!("오운의 거점(Ohn's Stand)로", "오운의 거점(Ohn's Stand)으로")
  end
  status = excluded ? 'excluded' : (new_text == old ? 'not-an-issue' : 'accepted')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
    'evidence' => "#{note} #{excluded ? 'This row is generic lowercase prose; retain it without a proper-name gloss.' : 'Only the reviewed place-name span and any particle required by its final Korean syllable may change.'} Search covers affix/base/default. Prior overlapping entity/key decisions and historical global totals remain untouched.",
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end
raise 'expected 113 distinct place keys' unless reviews.length == 113
paths = %w[proper-name-discovery-definitions-D21155.tsv proper-name-discovery-D21155.tsv]
paths.each { |path| raise "already exists: #{path}" if File.exist?(File.join(__dir__, path)) }
m.write_table(File.join(__dir__, paths[0]), glossary.headers, definitions)
m.write_table(File.join(__dir__, paths[1]), m::HEADERS.take(12), reviews)
puts "D-21155-D-21157: #{reviews.length} keys; #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
