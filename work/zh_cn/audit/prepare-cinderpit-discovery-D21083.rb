#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module CinderpitDiscoveryD21083
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21083.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21083.tsv')
  ENTITY = 'place:cinderpit'
  IDS = %w[2182 5571 11803 15362 18223 21753 33507 34881 39808 43373 55594 55682 58129 61921].freeze
  NOTES = 'English identifies Cinderpit as the old caldera reached through the Crow Peak mechanism and containing Skald’s forge, arena and the wolf-plagued pond. Japanese シンダーピット and Chinese 灰烬坑 corroborate all 14 rows. Reuse the dominant Korean form 신더핏(Cinderpit); normalize minority 시더핏 and 시너더핏, including existing paired labels. Preserve every unrelated person/place label, lore text, token and line break. The official manual establishes general quest/map and forge context (PDF pp. 7-8), not this DLC place list. Existing other-entity and historical sequential dispositions remain unchanged and are not recounted.'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Cinderpit', 'category' => 'place',
    'korean_canonical' => '신더핏(Cinderpit)', 'english_aliases' => '',
    'korean_variants' => '신더핏|시더핏|시너더핏',
    'evidence_ids' => 'D-21083|default:2182|default:39808|default:43373|default:55594',
    'status' => 'confirmed', 'notes' => NOTES
  }.freeze

  module_function

  def definitions
    [DEFINITION]
  end

  def edit_name(text)
    text.gsub(/(?:신더핏|시더핏|시너더핏)(?:\(Cinderpit\))?/, '신더핏(Cinderpit)')
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Cinderpit exact source scope changed' unless
      generated.map { |row| M.key(row) }.sort == IDS.map { |id| ['default', id, ''] }.sort
    reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = edit_name(old)
      raise "Cinderpit Korean name missing #{key.inspect}" unless new_text.include?('신더핏(Cinderpit)')
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
    puts "Prepared Cinderpit: #{reviews.length} rows: " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

CinderpitDiscoveryD21083.run if $PROGRAM_NAME == __FILE__
