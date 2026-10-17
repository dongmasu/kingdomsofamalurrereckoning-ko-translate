#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
specs = [
  ['Storm Bolt', '폭풍의 번개', %w[폭풍의번개], ['폭풍의 번개', '폭풍 번개', '폭풍 화살', '스톰 볼트'], 'ストームボルト', '风暴雷霆'],
  ['Mark of Flame', '화염의 표식', [], ['화염의 표식', '발화 표식', '화염 징표', '화염의 징표', '불꽃의 표식', '화염 표식', '불꽃의 징표'], 'マークオブフレイム', '烈焰印记'],
  ['Ice Barrage', '얼음 탄막', [], ['얼음 탄막', '빙결 탄막', '얼음 포화', '얼음 폭격'], 'アイスバラージ', '寒冰弹幕'],
  ['Tempest', '템페스트', [], ['템페스트', '폭풍'], 'テンペスト', '暴风雨'],
  ['Meteor', '운석', [], ['운석', '유성'], 'メテオ', '流星'],
  ['Shadow Flare', '그림자 섬광', [], ['그림자 섬광', '섀도 플레어', '암흑 섬광'], 'シャドウフレア', '暗影耀斑'],
  ['Relentless Assault', '끈질긴 맹공', [], ['끈질긴 맹공', '가차 없는 공세', '무자비한 공격', '맹렬한 공격', '무자비한 습격', '무자비한 맹공', '맹렬한 맹공', '맹렬한 강습', '무자비한 강습', '가차 없는 맹공', '맹공'], 'リレントレスアサルト', '无情突袭'],
  ['Battle Frenzy', '전투 광란', [], ['전투 광란', '전투 격노', '배틀 프렌지', '전투의 열광'], 'バトルフレンジー', '战斗狂热'],
  ['Harpoon', '작살', [], ['작살'], 'ハープーン', '鱼叉'],
  ['Blade Honing', '칼날 연마', [], ['칼날 연마'], 'ブレードホーニング', '磨刀'],
  ['Sphere of Protection', '보호의 구체', [], ['보호의 구체', '보호 구체', '보호막 구체', '수호의 구체'], 'プロテクションスフィア', '保护之球'],
  ['Healing Surge', '치유 파동', [], ['치유 파동', '치유 쇄도'], 'ヒーリングサージ', '治疗波涌'],
  ['Summon Faer Gorta', '페어 고르타 소환', [], ['페르 고르타(Faer Gorta) 소환', '페어 고르타 소환'], 'サモン・フェア・ゴータ', '召唤骷髅兵'],
  ['Elemental Rage', '원소의 격노', [], ['원소의 격노', '원소 격노'], 'エレメンタルレイジ', '元素愤怒'],
  ['Envenomed Edge', '맹독 칼날', [], ['맹독 칼날', '맹독의 칼날'], 'エンベノムエッジ', '淬毒的锋刃'],
  ['Shadow Prism', '그림자 프리즘', [], ['그림자 프리즘'], 'シャドウプリズム', '暗影棱镜']
]
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
inventory = m.refresh_inventory
definitions = specs.map do |english, korean, extra, variants, japanese, chinese|
  category = english == 'Shadow Prism' ? 'unique item' : 'skill'
  prefix = category == 'skill' ? 'skill' : 'unique_item'
  entity = "#{prefix}:#{english.downcase.tr(' ', '-')}"
  raise "entity already registered #{entity}" if glossary.any? { |row| row['entity_key'] == entity }
  labels = inventory.values.select { |row| JSON.parse(row['en_texts_json']).compact.include?(english) }
  evidence_ids = labels.map { |row| "#{row['resource']}:#{row['ID_Linha']}" }.join('|')
  glossary.headers.zip([
    entity, english, category, "#{korean}(#{english})", '', (variants + extra).uniq.reject { |name| name == korean }.join('|'),
    evidence_ids, 'confirmed',
    "English ability/item label and mechanics context establish identity, with Japanese #{japanese} and Chinese #{chinese} corroboration. Manual PDF pp. 4-5 distinguishes combat abilities from non-combat skills but does not supply these individual names. Exclude generic Tempest/Meteor/Harpoon senses; Shadow Prism is a usable distraction item, not a combat ability."
  ]).to_h
end
spec_by_entity = definitions.zip(specs).to_h { |definition, spec| [definition['entity_key'], spec] }
generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
reviews = generated.group_by { |row| m.key(row) }.map do |key, occurrences|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  text = old.dup
  english_texts = JSON.parse(source['en_texts_json']).compact
  english_source = english_texts.join("\n")
  decisions = {}
  evidence = []
  occurrences.each do |occurrence|
    entity = occurrence['entity_key']
    english, korean, _extra, variants, japanese, chinese = spec_by_entity.fetch(entity)
    excluded = case english
               when 'Tempest'
                 ![['base', '4434', '11'], ['default', '28448', '']].include?(key)
               when 'Meteor'
                 %w[30691 38837].include?(key[1]) && key[0] == 'default'
               when 'Harpoon'
                 key == ['default', '64528', '']
               else
                 false
               end
    if excluded
      decisions[entity] = 'excluded'
      evidence << "#{entity}: English uses the ordinary object/weather word or a separate equipment title, not this ability name; Korean remains unchanged."
      next
    end
    names_pattern = variants.sort_by { |name| -name.length }.map { |name| Regexp.escape(name) }.join('|')
    pattern = /(?<![가-힣])(?:#{names_pattern})(?:\s*\(#{Regexp.escape(english)}\))?/i
    matches = text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
    raise "missing reviewed ability span #{entity} #{key.inspect}" if matches.empty?
    before = text.dup
    matches.reverse_each do |match|
      raise "ability span inside foreign label #{key.inspect}" if text[0...match.begin(0)].count('(') > text[0...match.begin(0)].count(')')
      text[match.begin(0)...match.end(0)] = "#{korean}(#{english})"
    end
    decisions[entity] = text == before ? 'not-an-issue' : 'accepted'
    evidence << "#{entity}: English identifies the named ability/item (#{english}), corroborated by Japanese #{japanese} and Chinese #{chinese}. Normalize only its reviewed Korean span to #{korean}(#{english}); all quantities, game tokens, localized marker boundaries, particles and line breaks remain intact."
  end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => occurrences.map { |row| row['entity_key'] }.join('|'),
    'status' => text != old ? 'accepted' : (decisions.values.include?('not-an-issue') ? 'not-an-issue' : 'excluded'),
    'old' => old, 'new' => text, 'evidence' => evidence.join(' '),
    'entity_dispositions_json' => JSON.generate(decisions)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
index = m.table(m::INDEX)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, "proper-name-reviewed-combat-abilities-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
puts "#{definitions.length} abilities/items; #{generated.length} occurrences; #{reviews.length} rows"
m.run(out, start_d, nil)
