#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module WeepingKingD20970
  extend self
  M = ReviewedNameBatches
  ENTITY = 'title:weeping-king'
  CROWN = 'unique_item:crown-of-the-weeping-king'
  DEFINITIONS = [
    {
      'entity_key' => ENTITY, 'english_canonical' => 'Weeping King', 'category' => 'title',
      'korean_canonical' => '통곡하는 왕(Weeping King)', 'english_aliases' => 'The Weeping King',
      'korean_variants' => '통곡하는 왕|흐느끼는 왕|비탄의 왕|우는 왕|통곡의 왕|울부짖는 왕|울음의 왕|울음왕|위핑 킹|비탄왕',
      'evidence_ids' => 'D-20970-D-20971|default:22055|default:7764|default:28097|default:64093',
      'status' => 'confirmed',
      'notes' => 'Historical Fae epithet: English a Fae known only as the Weeping King and Japanese 嘆きの王とのみ知られたフェイ establish the title. Chinese 悲泣之王 corroborates. Taibreah is described as his reincarnation, not a title alias or a new duplicate person. Preserve bare King references and the separate Crown item. Official-manual Fae/court context is background, not a spelling source.'
    },
    {
      'entity_key' => CROWN, 'english_canonical' => 'Crown of the Weeping King', 'category' => 'unique item',
      'korean_canonical' => '통곡하는 왕의 왕관(Crown of the Weeping King)', 'english_aliases' => '',
      'korean_variants' => '통곡하는 왕의 왕관', 'evidence_ids' => 'D-20970|base:1124:11',
      'status' => 'confirmed',
      'notes' => 'Atomic equipment title, not a free-standing character-title occurrence. Retain the complete English item name without nesting the king annotation.'
    }
  ].freeze
  PATTERN = /(?:(?:통곡하는|흐느끼는|비탄의|우는|통곡의|울부짖는|울음의) 왕|울음왕|위핑 킹|비탄왕)(?: *\((?:(?:The )?Weeping King|King of Sorrows)\))?/

  def transform(text, resource, id)
    return '통곡하는 왕의 왕관(Crown of the Weeping King)' if resource == 'base' && id == '1124'
    raise "unmatched Weeping King rendering #{id}" unless text.match?(PATTERN)
    text.gsub(PATTERN, '통곡하는 왕(Weeping King)')
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, DEFINITIONS).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise 'Weeping King source scope changed' unless generated.length == 68
    groups = generated.group_by { |r| M.key(r) }
    raise 'Weeping King row scope changed' unless groups.length == 67
    reviews = groups.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = transform(old, key[0], key[1])
      status = old == updated ? 'not-an-issue' : 'accepted'
      crown = key[0] == 'base' && key[1] == '1124'
      dispositions = matches.to_h { |r| [r['entity_key'], crown && r['entity_key'] == ENTITY ? 'excluded' : status] }
      evidence = if crown
        'English Crown of the Weeping King is an atomic equipment name. Add its complete bilingual item title; exclude the contained king-title token from independent in-item normalization.'
      else
        'English names the historical Fae epithet Weeping King; Japanese 嘆きの王 and Chinese 悲泣之王 corroborate. Normalize only verified title spans to established 통곡하는 왕(Weeping King), retaining particles, honorifics, Sinsear place compounds and explicit Taibreah reincarnation wording. Do not register Taibreah, King, or King of Sorrows as aliases.'
      end
      evidence += ' Replace the unsupported English annotation King of Sorrows with the actual source Weeping King.' if key[1] == '60143'
      evidence += ' English and Chinese retain the invocation even though Japanese omits it; preserve Korean 이시여.' if key[1] == '26808'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => matches.map { |r| r['entity_key'] }.join('|'), 'status' => status,
        'old' => old, 'new' => updated, 'evidence' => evidence,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"), 'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(dispositions), 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D20970.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20970.tsv')
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, DEFINITIONS)
    M.write_table(proposals, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([definitions, proposals, '20970'])
  end
end

WeepingKingD20970.run if $PROGRAM_NAME == __FILE__
