#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ArneCrasDiscoveryD21056
  M = ReviewedNameBatches
  FAMILY = 'faction:house-arne'
  CRAS = 'person:cras'
  FAMILY_IDS = %w[18087 21201 49288 49827 57263 62199 63362].freeze
  OUT = File.join(M::AUDIT, 'proper-name-discovery-D21056.tsv')
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21056.tsv')

  module_function

  def definitions
    [
      [FAMILY, 'House Arne', 'faction', '아른 가문(House Arne)', 'Arne',
       '아른 가문|아르네 가문', 'default:18087|default:21201|default:49288|default:62199',
       'English explicitly identifies House Arne as a Dokkalfar royal family. Japanese アーン家 and Chinese 阿恩家族 confirm the bloodline. Arne is a component candidate alias, not a blanket identity rule: exclude Dolve Arne, Clyeth Arne, Cras Arne, the two complete item labels, the historical sorcerer, and Maid of the Arne. Preserve 아른 for the surname, distinct from established place 돌브 아르네.'],
      ['item:talisman-of-arne', 'Talisman of Arne', 'unique item',
       '아른의 부적(Talisman of Arne)', '', '아르네(Arne)의 부적',
       'base:433|default:2261|default:21201',
       'Complete named talisman label, distinct from the family and its bearers. Japanese アーネのタリスマン and Chinese 阿恩护符 corroborate the label. Use the established surname 아른 rather than importing the different Dolve Arne place spelling. The historical description does not establish that its sorcerer is Clyeth Arne.'],
      ['item:staff-of-arne', 'Staff of Arne', 'unique item',
       '아른의 지팡이(Staff of Arne)', '', '아르네(Arne)의 지팡이',
       'base:2018|default:21201|default:57263',
       'Complete named staff label. Japanese アーネのスタッフ and Chinese 阿恩法杖 confirm this is the ancestral staff, not a place or a personal label. Preserve the surname 아른 and pair the full item name.'],
      [CRAS, 'Cras', 'person', '크라스(Cras)', 'Lord Cras|Cras Arne',
       '크라스|로드 크라스', 'default:3764|default:23836|default:30169|default:8736',
       'English identifies the Culn refugee benefactor and self-proclaimed lord. Japanese クラス卿 and Chinese 克拉斯领主 confirm the same character. Letter to Lord Cras Arne is a full addressed name; pair 크라스 아른 경(Lord Cras Arne), while short references remain 크라스(Cras) or 크라스 경(Lord Cras). Do not conflate with Clyeth Arne or endorse his disputed nobility as fact.']
    ].map do |key, english, category, korean, aliases, variants, ids, notes|
      {
        'entity_key' => key, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-21056-D-21057|#{ids}", 'status' => 'confirmed',
        'notes' => notes
      }
    end
  end

  def family_evidence(source)
    id = source.fetch('ID_Linha')
    return 'English Arne is a family/bloodline reference, corroborated by Japanese family terminology and Chinese surname/family wording; keep the surname 아른, not the place spelling 아르네.' if
      source['resource'] == 'default' && FAMILY_IDS.include?(id)

    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    reason = if source['resource'] == 'base' && %w[433 2018].include?(id)
               'Complete named item, independently reviewed under its own item entity.'
             elsif id == '2261'
               'Historical sorcerer Arne in the talisman description, not an established family collective or Clyeth identity.'
             elsif id == '30169'
               'Complete personal name Cras Arne in a letter title; independently reviewed under person:cras.'
             elsif id == '40473'
               'Maid of the Arne is a story-specific woman/title, not an explicit bloodline collective; Dolve Arne in the same row remains a separately reviewed place.'
             elsif english.match?(/\b(?:Dolve|Clyeth) Arne\b/i)
               'Only the established place Dolve Arne and/or full personal name Clyeth Arne occur; their prior dispositions are unchanged.'
             end
    raise "unclassified Arne homonym #{M.key(source).inspect}" unless reason
    "Exclude the Arne component from family normalization. #{reason}"
  end

  def edit_family(text, source)
    return text unless source['resource'] == 'default' &&
      FAMILY_IDS.include?(source['ID_Linha'])

    if %w[49288 62199].include?(source['ID_Linha'])
      text.sub(/아른(?:\(Arne\))? 가문/, '아른 가문(House Arne)')
    else
      text.gsub(/아른(?!\(Arne\))/, '아른(Arne)')
    end
  end

  def edit_cras(text, source)
    return text.sub('크라스 아른 경', '크라스 아른 경(Lord Cras Arne)') if
      source['resource'] == 'default' && source['ID_Linha'] == '30169'

    text = text.gsub(/로드 크라스(?![가-힣]*\()/, '크라스 경(Lord Cras)')
    text = text.gsub(/크라스(?:\(Cras\))? 경(?!\(Lord Cras\))/, '크라스 경(Lord Cras)')
    text.gsub(/크라스(?! 경| 아른|\(Cras\))/, '크라스(Cras)')
  end

  def run
    defs = definitions
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      evidence = []
      matches.each do |match|
        entity = match.fetch('entity_key')
        before = new_text.dup
        if entity == FAMILY
          family = key[0] == 'default' && FAMILY_IDS.include?(key[1])
          new_text = edit_family(new_text, source) if family
          dispositions[entity] = family ? (before == new_text ? 'not-an-issue' : 'accepted') : 'excluded'
          evidence << family_evidence(source)
        elsif entity == CRAS
          new_text = edit_cras(new_text, source)
          dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
          evidence << 'English Cras/Lord Cras identifies the same Culn refugee quest character. Japanese and Chinese corroborate each aligned reference. Pair every source-present occurrence; retain full names and the existing surrounding wording.'
        else
          canonical = defs.find { |row| row['entity_key'] == entity }.fetch('korean_canonical')
          expected = entity == 'item:talisman-of-arne' ? '아르네(Arne)의 부적' : '아르네(Arne)의 지팡이'
          raise "stale named item #{key.inspect}" unless before == expected
          new_text = canonical
          dispositions[entity] = 'accepted'
          evidence << 'English names a complete ancestral item. Japanese and Chinese corroborate the full item label. Use 아른 for the family surname and pair the complete English item title once.'
        end
      end
      status = if new_text != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text,
        'evidence' => "D-21056-D-21057 new-entity discovery. #{evidence.join(' ')} Official manual PDF p. 1 supplies Dokkalfar background, not a surname roster. Earlier terminal entity/key decisions are preserved; these new entity scopes are not global translation totals.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(defs, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, defs)
    M.write_table(OUT, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} distinct rows, #{generated.length} entity matches: #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
    puts "Definitions: #{DEFINITIONS}"
    puts "Review: #{OUT}"
  end
end

ArneCrasDiscoveryD21056.run if $PROGRAM_NAME == __FILE__
