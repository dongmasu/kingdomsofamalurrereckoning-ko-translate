#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module NarosRelatedD20974
  extend self
  M = ReviewedNameBatches
  DEITY = 'deity:naros'
  ATOMIC = [
    ['unique_item:tooth-of-naros', 'Tooth of Naros', '나로스의 이빨', 'unique item', 'base', '249'],
    ['work:naros-chronicle', 'Naros Chronicle', '나로스 연대기', 'named work', 'base', '1994'],
    ['unique_item:teeth-of-naros-stone', 'Teeth of Naros Stone', '나로스의 이빨석', 'unique item', 'base', '2082'],
    ['unique_item:the-naros-fang', 'The Naros Fang', '나로스의 송곳니', 'unique item', 'base', '2143'],
    ['unique_item:naros-splinter-charm', 'Naros Splinter Charm', '나로스의 파편 부적', 'unique item', 'base', '2208'],
    ['monster:naros-jottun-runewielder', 'Naros Jottun Runewielder', '나로스의 요툰 룬술사', 'monster', 'default', '787'],
    ['monster:naros-jottun-chieftain', 'Naros Jottun Chieftain', '나로스 요툰 족장', 'monster', 'default', '8905'],
    ['monster:naros-jottun-slave', 'Naros Jottun Slave', '나로스의 요툰 노예', 'monster', 'default', '29551'],
    ['monster:naros-jottun-warrior', 'Naros Jottun Warrior', '나로스 요툰 전사', 'monster', 'default', '31022'],
    ['monster:naros-jottun-runelord', 'Naros Jottun Runelord', '나로스의 요툰 룬 군주', 'monster', 'default', '31352']
  ].freeze
  DEITY_IDS = %w[2056 2850 10683 14961 57081].freeze

  def definitions
    deity = {
      'entity_key' => DEITY, 'english_canonical' => 'Naros', 'category' => 'deity',
      'korean_canonical' => '나로스(Naros)', 'english_aliases' => '',
      'korean_variants' => '나로스', 'evidence_ids' => 'D-20974-D-20977|default:2056|default:2850|default:10683|default:57081',
      'status' => 'confirmed',
      'notes' => 'Troll god, explicitly identified by English and corroborated by Japanese ナロス神/トロールの神 and Chinese 巨魔之神/纳罗斯. Naros within region, equipment, chronicle and creature titles is not an independent deity mention. At default 57081 only the second, literal teeth-of-the-god mention is the deity; the first is the named region. No official-manual spelling is available.'
    }
    items = ATOMIC.map do |key, english, korean, category, resource, id|
      {
        'entity_key' => key, 'english_canonical' => english, 'category' => category,
        'korean_canonical' => "#{korean}(#{english})", 'english_aliases' => '',
        'korean_variants' => korean, 'evidence_ids' => "D-20974-D-20977|#{resource}:#{id}",
        'status' => 'confirmed',
        'notes' => 'Complete source label, corroborated by its aligned Japanese and Chinese label. Preserve it atomically rather than nesting Naros or Jottun inside its full English pair. Singular Tooth, plural Teeth, Stone, Fang and Charm remain distinct names; Runelord is 룬 군주, distinct from Runewielder 룬술사.'
      }
    end
    lands = {
      'entity_key' => 'place:naroslands', 'english_canonical' => 'Naroslands', 'category' => 'place',
      'korean_canonical' => '나로스랜드(Naroslands)', 'english_aliases' => '',
      'korean_variants' => '나로스랜드', 'evidence_ids' => 'D-20977|default:59176', 'status' => 'confirmed',
      'notes' => 'English in the Naroslands and Japanese ナロスランド identify a geographic derivative; retain the established Korean 나로스랜드 with its source spelling. Do not make it an automatic alias for the region Teeth of Naros or the deity.'
    }
    [deity, *items, lands]
  end

  def transform(old, key)
    resource, id, = key
    spec = ATOMIC.find { |s| s[4] == resource && s[5] == id }
    return "#{spec[2]}(#{spec[1]})" if spec
    return old.sub('나로스랜드', '나로스랜드(Naroslands)') if id == '59176'
    return old unless resource == 'default' && DEITY_IDS.include?(id)
    if id == '57081'
      target = '트롤(Troll) 신 나로스의 이빨'
      raise 'missing literal deity span at 57081' unless old.include?(target)
      return old.sub(target, '트롤(Troll) 신 나로스(Naros)의 이빨')
    end
    old.gsub(/나로스(?:\(Naros\))?/, '나로스(Naros)')
  end

  def run
    inventory = M.refresh_inventory
    defs = definitions
    generated = build_occurrences(inventory.values, defs).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    groups = generated.group_by { |r| M.key(r) }
    raise "Naros related scope changed: #{generated.length}/#{groups.length}" unless generated.length == 169 && groups.length == 159
    reviews = groups.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = transform(old, key)
      genuine_deity = key[0] == 'default' && DEITY_IDS.include?(key[1])
      dispositions = matches.to_h do |match|
        entity = match['entity_key']
        status = if entity == DEITY && !genuine_deity
          'excluded'
        else
          old == updated ? 'not-an-issue' : 'accepted'
        end
        [entity, status]
      end
      status = old != updated ? 'accepted' : dispositions.values.all? { |s| s == 'excluded' } ? 'excluded' : 'not-an-issue'
      evidence = if genuine_deity
        'English explicitly names Naros as the troll god, corroborated by Japanese ナロス and Chinese 纳罗斯 in divine context. Add only the deity-name label; preserve the separately reviewed region name, literal fang/teeth description, and other entities.'
      elsif matches.any? { |r| r['entity_key'] != DEITY }
        'English names a complete item, chronicle, monster subtype, or geographic derivative; aligned Japanese/Chinese corroborate the whole label. Pair it atomically without nesting component annotations. Exclude the contained Naros token from independent deity normalization.'
      else
        'English Naros occurs only as part of the Teeth of Naros region/title or another compound name. This is not an explicit free-standing mention of the troll god; exclude the deity match and preserve the already-reviewed region text byte-for-byte.'
      end
      evidence += ' English Runelord, Japanese ルーンロード and Chinese 符文领主 distinguish this title from Runewielder; correct the previously conflated 룬술사 to 룬 군주.' if key[1] == '31352'
      evidence += ' The first Teeth of Naros span is the place; only the subsequent 트롤 신 나로스 span is the god.' if key[1] == '57081'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => matches.map { |r| r['entity_key'] }.join('|'), 'status' => status,
        'old' => old, 'new' => updated, 'evidence' => evidence,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"), 'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(dispositions), 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions_path = File.join(__dir__, 'proper-name-discovery-definitions-D20974.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20974.tsv')
    M.write_table(definitions_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, defs)
    M.write_table(proposals, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([definitions_path, proposals, '20974'])
  end
end

NarosRelatedD20974.run if $PROGRAM_NAME == __FILE__
