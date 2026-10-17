#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module TywiliD21008
  extend self
  M = ReviewedNameBatches
  COAST = 'place:tywili-coast'
  CLIFFS = 'place:tywili-cliffs'
  BATTLE = 'event:battle-of-tywili-bluffs'
  NAME = '(?:타이윌리|티윌리)(?:\s*\(Tywili\))?'
  COAST_LABEL = '타이윌리 해안(Tywili Coast)'
  SHORT_LABEL = '타이윌리(Tywili)'
  CLIFFS_LABEL = '타이윌리 절벽(Tywili Cliffs)'
  BATTLE_LABEL = '타이윌리 절벽 전투(Battle of Tywili Bluffs)'
  STAND_LABEL = "오리에이터의 항전(Orieator's Stand)"

  def definitions
    [
      {
        'entity_key' => COAST, 'english_canonical' => 'Tywili Coast',
        'category' => 'place', 'korean_canonical' => COAST_LABEL,
        'english_aliases' => 'Tywili|coast of Tywili',
        'korean_variants' => '타이윌리|티윌리',
        'evidence_ids' => 'D-21008-D-21009|base:519:11|default:4214|default:44696|default:45826',
        'status' => 'confirmed',
        'notes' => 'English names the coastal region, also locally shortened to Tywili in war/refugee/geographic contexts. Japanese タイウィリ海岸/タイウィリ and Chinese 提威利海岸/泰威里 corroborate. Unify the existing Korean 타이윌리/티윌리 as 타이윌리. Preserve short source labels as 타이윌리(Tywili); full Coast and reversed coast of Tywili references use the full bilingual coast name. Distinct named cliffs and battle compounds stay atomic, not nested coastal references. The manual establishes world/quest background but not this place spelling.'
      },
      {
        'entity_key' => CLIFFS, 'english_canonical' => 'Tywili Cliffs',
        'category' => 'place', 'korean_canonical' => CLIFFS_LABEL,
        'english_aliases' => "Tywili bluffs|bluffs of Tywili|Tywili's bluffs",
        'korean_variants' => '티윌리 절벽|타이윌리 절벽|타이윌리의 절벽',
        'evidence_ids' => 'D-21008-D-21009|default:2224|default:4937|default:10266|default:14082|default:31988',
        'status' => 'confirmed',
        'notes' => 'English names the Tywili Cliffs of the coastal settlement history, with bluffs as its descriptive alternative in the same Rathir/Gleir Rathwen history. Japanese タイウィリの崖 and Chinese 泰威里悬崖 corroborate the cliffs. Preserve the complete place label; do not interpret Battle of Tywili Bluffs as an independent cliffs mention. Generic bluffs of the Tywili coast at 6766 remains a coast reference plus an ordinary terrain noun.'
      },
      {
        'entity_key' => BATTLE, 'english_canonical' => 'Battle of Tywili Bluffs',
        'category' => 'named event', 'korean_canonical' => BATTLE_LABEL,
        'english_aliases' => "Orieator's Stand|Orieator’s Stand",
        'korean_variants' => "티윌리 절벽 전투|타이윌리 절벽 전투|오리에이터의 항전|오리에이터의 결전|오리에이터의 방어전",
        'evidence_ids' => 'D-21008-D-21009|default:3201|default:34336|default:52524|default:57263',
        'status' => 'confirmed',
        'notes' => "English default 52524 explicitly equates Orieator's Stand and the Battle of Tywili Bluffs. Retain each source-local name as an atomic bilingual event label: 타이윌리 절벽 전투(Battle of Tywili Bluffs), 오리에이터의 항전(Orieator's Stand). Reuse 항전 from 52524 for the source Stand, replacing the inconsistent 결전/방어전 alternatives. Japanese オリエーターの防衛戦/タイウィリ断崖の戦い and Chinese 奥瑞亚特保卫战/提威利峭壁战役 support the named battle; do not reclassify the event as a person or region. No direct manual battle entry is available."
      }
    ]
  end

  def transform(old, english, key)
    text = old.dup
    protected = []
    states = {}
    protect = lambda do |entity, pattern, label|
      count = 0
      changed = false
      text = text.gsub(pattern) do |span|
        count += 1
        changed ||= span != label
        ordinal = protected.length
        protected << label
        "__TYWILI_ATOMIC_#{ordinal}__"
      end
      raise "missing Korean compound #{entity} #{key.inspect}" if count.zero?
      previous = states[entity]
      states[entity] = previous == 'accepted' || changed ? 'accepted' : 'not-an-issue'
    end

    if english.match?(/Battle of Tywili Bluffs/i)
      protect.call(BATTLE, /#{NAME}\s+절벽 전투(?:\s*\(Battle of Tywili Bluffs\))?/, BATTLE_LABEL)
      states[CLIFFS] = 'excluded'
    end
    if english.match?(/Orieator['’]s Stand/i)
      protect.call(BATTLE, /오리에이터(?:\(Orieator\))?의 (?:항전|결전|방어전)(?:\s*\(Orieator['’]s Stand\))?/, STAND_LABEL)
    end

    remaining_english = english.gsub(/Battle of Tywili Bluffs|Orieator['’]s Stand/i, '')
    if remaining_english.match?(/Tywili Cliffs|Tywili bluffs|bluffs of Tywili|Tywili's bluffs/i)
      protect.call(CLIFFS, /#{NAME}(?:의)?\s+절벽(?:\s*\(Tywili (?:Cliffs|Bluffs)\))?/, CLIFFS_LABEL)
    end
    remaining_english.gsub!(/Tywili Cliffs|Tywili bluffs|bluffs of Tywili|Tywili's bluffs/i, '')
    coastal = remaining_english.match?(/\bTywili\b/i)
    if coastal
      before_coast = text.dup
      changed_coast = false
      if remaining_english.match?(/Tywili Coast|coast of Tywili/i)
        text.gsub!(/#{NAME}\s+해안(?:\s*\(Tywili Coast\))?/, COAST_LABEL)
        raise "missing full coast label #{key.inspect}" unless text.include?(COAST_LABEL)
        changed_coast = text != before_coast
        ordinal = protected.length
        protected << COAST_LABEL
        text.gsub!(COAST_LABEL, "__TYWILI_ATOMIC_#{ordinal}__")
      elsif key == ['default', '43248', '']
        if text.include?('타이윌리 해안은')
          text.sub!('타이윌리 해안은', "#{SHORT_LABEL}는")
          changed_coast = true
        else
          raise 'unexpected short Tywili at 43248' unless text.include?("#{SHORT_LABEL}는")
        end
      end
      before_short = text.dup
      text.gsub!(/#{NAME}/, SHORT_LABEL)
      changed_coast ||= text != before_short
      states[COAST] = changed_coast ? 'accepted' : 'not-an-issue'
    else
      states[COAST] = 'excluded'
    end
    text.gsub!(/__TYWILI_ATOMIC_(\d+)__/) { protected.fetch(Regexp.last_match(1).to_i) }
    [text, states]
  end

  def run(mode)
    inventory = M.refresh_inventory
    defs = definitions
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    grouped = generated.group_by { |row| M.key(row) }
    raise "Tywili scope changed #{grouped.length}" unless grouped.length == 77
    reviews = grouped.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      updated, states = transform(old, english, key)
      entities = matches.map { |row| row['entity_key'] }
      dispositions = states.select { |entity, _status| entities.include?(entity) }
      raise "unreviewed Tywili entity #{key.inspect}" unless dispositions.keys.sort == entities.sort
      status = updated != old ? 'accepted' : 'not-an-issue'
      status = 'excluded' if dispositions.values.all? { |value| value == 'excluded' }
      reason = 'English names the Tywili coastal region and its locally shortened form; Japanese and Chinese corroborate geographic identity. Standardize 타이윌리 and pair complete Coast/Cliffs/battle names atomically, without nesting component names. The source expressly equates the two battle names at 52524; retain each locally used battle label. Short source Tywili stays short, and unrelated Korean text, particles, tokens and line breaks are preserved.'
      reason += ' Remove the existing expanded 해안 from this source-shortened Tywili mention and use vowel-final 는 after 타이윌리.' if key == ['default', '43248', '']
      reason += ' Tywili pool is a poetic physical-water description, not enough evidence for a distinct named pool entity; pair only Tywili and preserve 연못.' if key == ['default', '23185', '']
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => reason, 'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    definition_path = File.join(__dir__, 'proper-name-discovery-definitions-D21008.tsv')
    review_path = File.join(__dir__, 'proper-name-discovery-D21008.tsv')
    M.write_table(definition_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, defs)
    M.write_table(review_path, M::HEADERS, reviews)
    puts "Tywili: #{reviews.length} row keys / #{generated.length} entity matches; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    if mode == 'apply'
      ReviewedProperNameDiscovery.run([definition_path, review_path, '21008'])
    elsif mode != 'prepare'
      abort 'usage: review-tywili-D21008.rb [prepare|apply]'
    end
  end
end

TywiliD21008.run(ARGV.fetch(0, 'prepare')) if $PROGRAM_NAME == __FILE__
