#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module SkaldDiscoveryD21066
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21066.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21066.tsv')
  ENTITY = 'person:skald-atlas'
  PLACE_IDS = %w[23359 62878].freeze
  NOTES = 'English identifies Skald Atlas as the female Fateweaver and master blacksmith sought through Orella Axl, then as the Chaos-weapon mentor. Japanese スカルド・アトラス and Chinese 斯卡尔德·阿特拉斯 confirm that Atlas is part of this person name, not a map book. Use 스칼드 아틀라스(Skald Atlas) and contextual 스칼드(Skald), preserving full versus short source forms and every repeated mention. The official manual establishes 페이트위버 and crafting context but does not enumerate this DLC character. Standalone place titles Skald’s House and Skald’s Forge are excluded from person-name normalization; their complete title labels are a separate place scope. No prior sequential or other-entity dispositions are reopened or recounted.'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Skald Atlas',
    'category' => 'person', 'korean_canonical' => '스칼드 아틀라스(Skald Atlas)',
    'english_aliases' => 'Skald',
    'korean_variants' => '스칼드 아틀라스|스칼드 지도서|스칼드',
    'evidence_ids' => 'D-21066|default:10063|default:12654|default:13037|default:15247|default:13306',
    'status' => 'confirmed', 'notes' => NOTES
  }.freeze

  module_function

  def definitions
    [DEFINITION]
  end

  def excluded?(source)
    source['resource'] == 'default' && PLACE_IDS.include?(source['ID_Linha'])
  end

  def edit_name(text)
    text = text.gsub(
      /스칼드 (?:아틀라스|지도서)(?:\(Skald Atlas\))?/,
      '스칼드 아틀라스(Skald Atlas)'
    )
    text.gsub(/스칼드(?! 아틀라스|\(Skald\))/, '스칼드(Skald)')
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = excluded?(source) ? old : edit_name(old)
      status = if excluded?(source)
                 'excluded'
               else
                 old == new_text ? 'not-an-issue' : 'accepted'
               end
      dispositions = matches.to_h { |match| [match.fetch('entity_key'), status] }
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => NOTES,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared Skald Atlas: #{reviews.length} rows, #{generated.length} entity matches: " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

SkaldDiscoveryD21066.run if $PROGRAM_NAME == __FILE__
