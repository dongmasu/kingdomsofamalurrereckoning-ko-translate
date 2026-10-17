#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ZefwynLanD21048
  M = ReviewedNameBatches
  DEFINITION_PATH = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21048.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21048.tsv'
  PERSON = {
    'entity_key' => 'person:zefwyn-lan',
    'english_canonical' => 'Zefwyn Lan',
    'category' => 'person',
    'korean_canonical' => '제프윈 랜(Zefwyn Lan)',
    'english_aliases' => 'Zefwyn',
    'korean_variants' => '제프윈 랜|제프윈 란|제프윈',
    'evidence_ids' => 'D-21048|base:1506:11|base:4353:11|default:22504',
    'status' => 'confirmed',
    'notes' => 'English identifies Zefwyn Lan as the same Cape Solace/Gravehal scout in full-name and short-name references; first-name-only mentions are an English alias of this person, not a separate entity. Japanese ゼフィン・ラン/ゼフィン and Chinese 泽夫温·兰/泽夫温 corroborate. Standardize full-name references as 제프윈 랜(Zefwyn Lan) and short-name references as 제프윈(Zefwyn), preserving Korean particles and possessives. The official Korean manual has no direct entry for this Fatesworn character. No PAK-derived evidence.'
  }.freeze

  module_function

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def english_counts(source)
    english = texts(source, 'en').join("\n")
    full = english.scan(/(?<![A-Za-z])Zefwyn Lan(?![A-Za-z])/i).length
    short = english.scan(/(?<![A-Za-z])Zefwyn(?![A-Za-z])/i).length - full
    [full, short]
  end

  def korean_counts(text)
    full = text.scan(/제프윈\s*(?:랜|란)(?:\((?:Zefwyn Lan|Zefwyn)\))?/).length
    short = text.scan(/제프윈(?!\s*(?:랜|란))(?:\((?:Zefwyn Lan|Zefwyn)\))?/).length
    [full, short]
  end

  def canonicalize(text)
    text.gsub(/(?<![가-힣])제프윈\s*(?:랜|란)(?:\((?:Zefwyn Lan|Zefwyn)\))?|(?<![가-힣])제프윈(?:\((?:Zefwyn Lan|Zefwyn)\))?/) do |match|
      match.match?(/랜|란/) ? '제프윈 랜(Zefwyn Lan)' : '제프윈(Zefwyn)'
    end
  end

  def run
    [DEFINITION_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'entity already registered' if glossary.any? { |row| row['entity_key'] == PERSON['entity_key'] }
    inventory = M.refresh_inventory
    reviews = inventory.values.each_with_object([]) do |source, result|
      full_count, short_count = english_counts(source)
      next if full_count + short_count == 0

      expected_resource = %w[base default].include?(source['resource'])
      raise "unexpected resource for Zefwyn: #{M.key(source).inspect}" unless expected_resource
      expected_korean = [full_count, short_count]
      actual_korean = korean_counts(source.fetch('work_text'))
      raise "Korean/source mention mismatch at #{M.key(source).inspect}: #{expected_korean.inspect} != #{actual_korean.inspect}" unless
        expected_korean == actual_korean

      old = source.fetch('work_text')
      new_text = canonicalize(old)
      raise "unpaired Zefwyn remains at #{M.key(source).inspect}" unless
        korean_counts(new_text) == expected_korean &&
        (full_count.zero? || new_text.scan(/제프윈 랜\(Zefwyn Lan\)/).length == full_count) &&
        (short_count.zero? || new_text.scan(/제프윈\(Zefwyn\)/).length == short_count)
      result << {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => PERSON.fetch('entity_key'),
        'status' => old == new_text ? 'not-an-issue' : 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => PERSON.fetch('notes'),
        'english' => texts(source, 'en').join("\n"),
        'japanese' => texts(source, 'ja').join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(
          PERSON.fetch('entity_key') => (old == new_text ? 'not-an-issue' : 'accepted')
        ),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    raise 'duplicate reviewed row key' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    M.write_table(DEFINITION_PATH, glossary.headers, [PERSON])
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} Zefwyn rows across #{reviews.map { |row| row['resource'] }.uniq.join(', ')}: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

ZefwynLanD21048.run if $PROGRAM_NAME == __FILE__
