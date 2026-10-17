#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module EliTemsD21045
  M = ReviewedNameBatches
  ENTITY = 'person:eli-tems'
  ENGLISH = 'Eli Tems'
  KOREAN = '엘리 템스'
  DEFINITION_PATH = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21045.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21045.tsv'
  EVIDENCE = 'English identifies Eli Tems as one person throughout the Kandrian signet-ring quest; aligned Japanese エリ・テムス and Chinese 伊莱·特姆斯 corroborate. Standardize the complete name to the established corpus-majority 엘리 템스(Eli Tems), correcting the isolated 에리 spelling at default:2937. The existing person:tems surname component remains a separate entity and is not reclassified or recounted. The official Korean manual has no direct entry for this character.'

  module_function

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def run
    [DEFINITION_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'Eli Tems already registered' if glossary.any? do |row|
      row['entity_key'] == ENTITY ||
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .any? { |term| term.casecmp?(ENGLISH) }
    end

    inventory = M.refresh_inventory
    sources = inventory.values.select do |source|
      texts(source, 'en').join("\n").match?(/(?<![A-Za-z])Eli Tems(?![A-Za-z])/i)
    end.sort_by { |source| source['ID_Linha'].to_i }
    raise "expected 19 source rows, found #{sources.length}" unless sources.length == 19

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'person',
      'korean_canonical' => "#{KOREAN}(#{ENGLISH})",
      'english_aliases' => '',
      'korean_variants' => '에리 템스|엘리 템스',
      'evidence_ids' => "D-21045|#{sources.map { |source| "default:#{source['ID_Linha']}" }.join('|')}",
      'status' => 'confirmed',
      'notes' => "#{EVIDENCE} No global Eli alias is introduced; the source-short Eli at default:62331 remains a locally shortened reference. No PAK-derived evidence."
    }
    M.write_table(DEFINITION_PATH, glossary.headers, [definition])

    reviews = sources.map do |source|
      old = source.fetch('work_text')
      matches = old.scan(/(?:에리|엘리) 템스(?:\(Eli Tems\))?/)
      raise "missing or repeated full-name span at #{source['ID_Linha']}" unless matches.length == 1
      new_text = old.sub(/(?:에리|엘리) 템스(?:\(Eli Tems\))?/, "#{KOREAN}(#{ENGLISH})")
      english = texts(source, 'en').join("\n")
      raise "English full-name count differs at #{source['ID_Linha']}" unless
        english.scan(/(?<![A-Za-z])Eli Tems(?![A-Za-z])/i).length == 1
      {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => old == new_text ? 'not-an-issue' : 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => EVIDENCE,
        'english' => english,
        'japanese' => texts(source, 'ja').join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => (old == new_text ? 'not-an-issue' : 'accepted')),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} complete-name rows: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

EliTemsD21045.run if $PROGRAM_NAME == __FILE__
