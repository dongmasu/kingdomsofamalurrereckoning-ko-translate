#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module VeilBoneWallD21035
  M = ReviewedNameBatches
  DEFINITIONS = [
    {
      'entity_key' => 'lore:arcane-veil',
      'english_canonical' => 'Arcane Veil',
      'category' => 'lore term',
      'korean_canonical' => '비전의 장막(Arcane Veil)',
      'english_aliases' => '',
      'korean_variants' => '비전 장막|신비의 장막',
      'evidence_ids' => 'D-21035|default:1496|default:9813|default:18166',
      'status' => 'confirmed',
      'notes' => 'Named cosmological veil related to Fate, Hecatyr and the separation of Esharra; not a combat skill. English default:9813 identifies its threshold/afterlife context and default:18166 its world-separating function. Japanese 霊力のベール and Chinese 奥术帷幕 corroborate identity. Reuse the established 비전의 장막 wording. Official Korean manual PDF pages 1-2 supply the Fate/deity context but do not prescribe this term.'
    },
    {
      'entity_key' => 'place:bone-wall',
      'english_canonical' => 'Bone Wall',
      'category' => 'place',
      'korean_canonical' => '뼈의 벽(Bone Wall)',
      'english_aliases' => '',
      'korean_variants' => '본 월|본벽|뼈 장벽',
      'evidence_ids' => 'D-21035|base:1342|default:29245|default:12725',
      'status' => 'confirmed',
      'notes' => 'Named bounty/contract posting site in Whitestone, kept by Hera Orhelm; not an ordinary wall or combat skill. English default:29245 explicitly defines its posting function; default:12725 locates it in Whitestone. Japanese 依頼掲示板/骨の壁 and Chinese 骨墙 corroborate function and identity. Retain The Bone Wall in existing standalone title labels, without inserting The into ordinary mentions. Official manual PDF page 7 distinguishes tasks and side quests but does not name this site.'
    }
  ].freeze
  FORMS = {
    'lore:arcane-veil' => /비전의 장막|비전 장막|신비의 장막/,
    'place:bone-wall' => /뼈의 벽|뼈 장벽|본 월|본벽/
  }.freeze

  module_function

  def normalize(text, definition)
    canonical = definition.fetch('korean_canonical')
    korean = canonical.split('(').first
    english = definition.fetch('english_canonical')
    pattern = /(?:#{FORMS.fetch(definition.fetch('entity_key'))})(?:[ \t]*\((?:The )?#{Regexp.escape(english)}\))?/
    matches = text.to_enum(:scan, pattern).map { Regexp.last_match[0] }
    raise 'source match has no reviewed Korean span' if matches.empty?

    updated = text.gsub(pattern) do |span|
      # Keep existing title articles, spacing and labels where already correct.
      next span if span.start_with?(korean) &&
        span.match?(/\A#{Regexp.escape(korean)}[ \t]*\((?:The )?#{Regexp.escape(english)}\)\z/)

      canonical
    end
    [updated, matches.uniq]
  end

  def run
    definition_path = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21035.tsv')
    review_path = '/private/tmp/proper-name-reviewed-D21035.tsv'
    [definition_path, review_path].each { |path| raise "already exists: #{path}" if File.exist?(path) }
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'entity already registered' if glossary.any? do |row|
      DEFINITIONS.any? { |definition| definition['entity_key'] == row['entity_key'] }
    end
    inventory = M.refresh_inventory.values
    reviews = []
    counts = {}
    DEFINITIONS.each do |definition|
      english = definition.fetch('english_canonical')
      sources = inventory.select do |row|
        JSON.parse(row.fetch('en_texts_json')).compact.any? do |text|
          text.match?(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i)
        end
      end
      expected = english == 'Arcane Veil' ? 16 : 13
      raise "source coverage differs: #{english}" unless sources.length == expected
      counts[english] = sources.group_by { |row| row['resource'] }.transform_values(&:length)
      sources.each do |row|
        old = row.fetch('work_text')
        updated, forms = normalize(old, definition)
        entity = definition.fetch('entity_key')
        status = old == updated ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => row.fetch('resource'),
          'ID_Linha' => row.fetch('ID_Linha'),
          'Tipo_Variante' => row['Tipo_Variante'].to_s,
          'entity_key' => entity, 'status' => status,
          'old' => old, 'new' => updated,
          'evidence' => "#{definition.fetch('notes')} Aligned English, Japanese and Chinese were checked for this exact row. Reviewed Korean span(s): #{forms.join('|')}. Change only the named span; preserve unrelated wording, other entities and particles. This focused registration does not reopen earlier sequential findings.",
          'english' => JSON.parse(row.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(row.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => row.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => status),
          'previous_status' => '', 'previous_evidence' => ''
        }
      end
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    raise 'duplicate reviewed row' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'batch size exceeds 50' unless reviews.length <= 50
    M.write_table(definition_path, glossary.headers, DEFINITIONS)
    M.write_table(review_path, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} rows: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
    puts counts.inspect
  end
end

VeilBoneWallD21035.run if $PROGRAM_NAME == __FILE__
