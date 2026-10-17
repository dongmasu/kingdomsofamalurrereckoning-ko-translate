#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module DeirdreKesterD21047
  M = ReviewedNameBatches
  DEFINITION_PATH = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21047.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21047.tsv'
  PEOPLE = [
    {
      'entity_key' => 'person:deirdre-gwint',
      'english_canonical' => 'Deirdre Gwint',
      'category' => 'person',
      'korean_canonical' => '디어드리 그윈트(Deirdre Gwint)',
      'english_aliases' => '',
      'korean_variants' => '디어드리 그윈트|디어드리 귄트|데어드리 귄트|데어드레 그윈트',
      'evidence_ids' => 'D-21047|default:1314|default:5289|default:30123',
      'status' => 'confirmed',
      'notes' => 'English identifies the Gravehal linguist and recurring text-translator Deirdre Gwint. Japanese デイダー・グイント and Chinese 迪尔德利·格温特 corroborate. Standardize the complete personal name to the dominant Korean form 디어드리 그윈트. Keep the registered complete name atomic; no global Gwint alias is introduced. The official Korean manual has no direct entry for this character. No PAK-derived evidence.'
    },
    {
      'entity_key' => 'person:kester-barclay',
      'english_canonical' => 'Kester Barclay',
      'category' => 'person',
      'korean_canonical' => '케스터 바클레이(Kester Barclay)',
      'english_aliases' => '',
      'korean_variants' => '케스터 바클레이|케스터 바클리',
      'evidence_ids' => 'D-21047|default:21097|default:59187|base:306:11',
      'status' => 'confirmed',
      'notes' => 'English identifies Kester Barclay as the leader of Didenhil and the same quest contact throughout the boggart/Blood Plague storyline. Japanese ケスター・バークレイ and Chinese 科斯特尔·巴克雷 corroborate. Standardize the complete personal name to the dominant Korean form 케스터 바클레이. Preserve surrounding titles and possessive grammar; no global Barclay alias is introduced. The official Korean manual has no direct entry for this character. No PAK-derived evidence.'
    }
  ].freeze

  module_function

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def korean_pattern(person)
    variants = person.fetch('korean_variants').split('|')
      .sort_by { |variant| -variant.length }
      .map { |variant| Regexp.escape(variant) }.join('|')
    english = Regexp.escape(person.fetch('english_canonical'))
    /(?<!\p{Hangul})(?:#{variants})(?:\(#{english}\))?/
  end

  def run
    [DEFINITION_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    PEOPLE.each do |person|
      raise "entity already registered: #{person['entity_key']}" if
        glossary.any? { |row| row['entity_key'] == person['entity_key'] }
    end

    inventory = M.refresh_inventory
    reviews = []
    PEOPLE.each do |person|
      english_name = person.fetch('english_canonical')
      sources = inventory.values.select do |source|
        texts(source, 'en').join("\n")
          .match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
      end
      expected_rows = { 'Deirdre Gwint' => 17, 'Kester Barclay' => 20 }.fetch(english_name)
      raise "#{english_name}: expected #{expected_rows} rows, found #{sources.length}" unless
        sources.length == expected_rows

      pattern = korean_pattern(person)
      sources.each do |source|
        expected_resource = english_name == 'Kester Barclay' &&
          source['resource'] == 'base' &&
          source['ID_Linha'] == '306' &&
          source['Tipo_Variante'] == '11'
        raise "unexpected resource/key for #{english_name}: #{M.key(source).inspect}" unless
          source['resource'] == 'default' || expected_resource
        old = source.fetch('work_text')
        raise "expected one Korean full-name span for #{english_name} at #{source['ID_Linha']}" unless
          old.to_enum(:scan, pattern).count == 1
        english = texts(source, 'en').join("\n")
        raise "English occurrence count differs for #{english_name} at #{source['ID_Linha']}" unless
          english.scan(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i).length == 1
        new_text = old.sub(pattern, person.fetch('korean_canonical'))
        reviews << {
          'resource' => source.fetch('resource'),
          'ID_Linha' => source.fetch('ID_Linha'),
          'Tipo_Variante' => source['Tipo_Variante'].to_s,
          'entity_key' => person.fetch('entity_key'),
          'status' => old == new_text ? 'not-an-issue' : 'accepted',
          'old' => old,
          'new' => new_text,
          'evidence' => person.fetch('notes'),
          'english' => english,
          'japanese' => texts(source, 'ja').join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(
            person.fetch('entity_key') => (old == new_text ? 'not-an-issue' : 'accepted')
          ),
          'previous_status' => '',
          'previous_evidence' => ''
        }
      end
    end
    raise 'duplicate reviewed row key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    M.write_table(DEFINITION_PATH, glossary.headers, PEOPLE)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} complete-name rows: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

DeirdreKesterD21047.run if $PROGRAM_NAME == __FILE__
