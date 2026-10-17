#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module OrellaDiscoveryD21064
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21064.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21064.tsv')
  ENTITY = 'person:orella-axl'
  NOTES_ID = '1328'
  NOTES = 'English identifies the smuggler involved in the Skald Atlas quest chain. Japanese オレラ・アクスル and Chinese 奥雷拉·阿克塞尔 corroborate the identity. Standardize the established majority Korean form as 오렐라 액슬 and pair full and contextual short forms with their exact English names. Treat Orella as a short form only in this connected quest context. New cross-locale identity evidence resolves the earlier provisional name questions at default:15247, default:25188, and default:40743; those prior sequential dispositions and global tallies are not recomputed. Exclude base:1328, the distinct complete title Orella’s Notes, from personal-name normalization.'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Orella Axl',
    'category' => 'person',
    'korean_canonical' => '오렐라 액슬(Orella Axl)',
    'english_aliases' => 'Orella',
    'korean_variants' => '오렐라 악슬|오렐라 액슬|오렐라',
    'evidence_ids' => 'D-21064|default:15247|default:25188|default:40217|base:1328',
    'status' => 'confirmed',
    'notes' => NOTES
  }.freeze

  module_function

  def definitions
    [DEFINITION]
  end

  def excluded?(source)
    source['resource'] == 'base' && source['ID_Linha'] == NOTES_ID
  end

  def edit_name(text)
    text = text.gsub(
      /오렐라 (?:악슬|액슬)(?:\(Orella Axl\))?/,
      '오렐라 액슬(Orella Axl)'
    )
    text.gsub(/오렐라(?! 액슬|\(Orella\))/, '오렐라(Orella)')
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
      dispositions = matches.to_h do |match|
        status = if excluded?(source)
                   'excluded'
                 else
                   edit_name(old) == old ? 'not-an-issue' : 'accepted'
                 end
        [match.fetch('entity_key'), status]
      end
      new_text = dispositions.value?('excluded') ? old : edit_name(old)
      status = if old != new_text
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
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
    puts "Prepared Orella Axl: #{reviews.length} rows, #{generated.length} entity matches: " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

OrellaDiscoveryD21064.run if $PROGRAM_NAME == __FILE__
