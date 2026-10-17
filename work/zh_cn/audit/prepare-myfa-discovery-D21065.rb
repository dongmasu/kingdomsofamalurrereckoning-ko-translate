#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module MyfaDiscoveryD21065
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21065.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21065.tsv')
  ENTITY = 'person:myfa-rhonwen'
  TOKEN_IDS = %w[4602 11869 24832].freeze
  NOTES = 'English identifies the former Rathir ambassador and Gravehal envoy across her diary, quest updates, and named references. Japanese マイファ・ロンウェン and Chinese 米法·罗文 corroborate identity. Standardize the prevailing Korean form as 마이파 론웬; pair full names and contextual short Myfa references. The official Korean manual does not provide this character roster, so its omission is not a conflicting pronunciation claim.'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Myfa Rhonwen',
    'category' => 'person',
    'korean_canonical' => '마이파 론웬(Myfa Rhonwen)',
    'english_aliases' => 'Myfa',
    'korean_variants' => '미파 론웬|마이파 론웬|미파|마이파',
    'evidence_ids' => 'D-21065|base:2227|default:5921|default:14718|default:37206',
    'status' => 'confirmed',
    'notes' => NOTES
  }.freeze

  module_function

  def definitions
    [DEFINITION]
  end

  def excluded?(source)
    source['resource'] == 'default' && TOKEN_IDS.include?(source['ID_Linha'])
  end

  def edit_name(text)
    text = text.gsub(
      /(?:미파|마이파) 론웬(?:\(Myfa Rhonwen\))?/,
      '마이파 론웬(Myfa Rhonwen)'
    )
    text = text.gsub('미파(Myfa)', '마이파(Myfa)')
    text.gsub(/(?:미파|마이파)(?! 론웬|\(Myfa\))/, '마이파(Myfa)')
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
        'old' => old, 'new' => new_text,
        'evidence' => excluded?(source) ? "#{NOTES} This row contains only the opaque MYFA_ALLOWANCE DLC token, not a displayed person-name occurrence; preserve it verbatim." : NOTES,
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
    puts "Prepared Myfa Rhonwen: #{reviews.length} rows, #{generated.length} entity matches: " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

MyfaDiscoveryD21065.run if $PROGRAM_NAME == __FILE__
