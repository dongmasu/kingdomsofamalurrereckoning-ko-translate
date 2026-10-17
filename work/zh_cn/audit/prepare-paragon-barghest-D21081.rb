#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ParagonBarghestD21081
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21081.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21081.tsv')
  ENTITY = 'monster:paragon-barghest'
  IDS = %w[7153 10902 11948 15280 21797 25885 42132 47095 61518 62706 63508].freeze
  NOTES = 'English explicitly names the ranked creature Paragon Barghest, whose heart supplies the Shardfall protective charm. Japanese パラゴン・バーゲスト and Chinese 精英魔狼 corroborate every reviewed row. Reuse established species 바게스트 and the already registered Paragon Thresh modifier 파라곤; normalize the complete compound to 파라곤 바게스트(Paragon Barghest), not a nested species-only label. The official manual describes general enemy/combat and crafting context but not this creature roster. This registers a distinct qualified creature name; existing monster:barghest row dispositions/evidence remain unchanged and are not counted again as newly reviewed species keys. Counts here are qualified-entity/row index states, not new globally unique translation rows.'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Paragon Barghest',
    'category' => 'monster',
    'korean_canonical' => '파라곤 바게스트(Paragon Barghest)',
    'english_aliases' => '',
    'korean_variants' => '파라곤 바게스트|파라곤 바르게스트|패러곤 바르게스트|최상급 바게스트',
    'evidence_ids' => 'D-21081|default:15280|default:11948|default:62706',
    'status' => 'confirmed', 'notes' => NOTES
  }.freeze

  module_function

  def definitions
    [DEFINITION]
  end

  def edit_name(text)
    text.gsub(
      /(?:파라곤|패러곤|최상급) 바(?:르)?게스트(?:\((?:Paragon Barghest|Barghest)\))?/,
      '파라곤 바게스트(Paragon Barghest)'
    )
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = IDS.map { |id| ['default', id, ''] }.sort
    raise 'Paragon Barghest source scope changed' unless generated.map { |row| M.key(row) }.sort == expected
    reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = edit_name(old)
      raise "unrecognized Paragon Barghest Korean #{key.inspect}" unless
        new_text.include?('파라곤 바게스트(Paragon Barghest)')
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => NOTES,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
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
    puts "Prepared Paragon Barghest: #{reviews.length} rows: " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

ParagonBarghestD21081.run if $PROGRAM_NAME == __FILE__
