#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module OleanderSinclairD21049
  M = ReviewedNameBatches
  DEFINITION_PATH = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21049.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21049.tsv'
  PERSON = {
    'entity_key' => 'person:oleander-sinclair',
    'english_canonical' => 'Oleander Sinclair',
    'category' => 'person',
    'korean_canonical' => '올리앤더 싱클레어(Oleander Sinclair)',
    'english_aliases' => 'Oleander|Old Oleander',
    'korean_variants' => '올리앤더 싱클레어|올랜더 싱클레어|오리앤더 싱클레어|올리앤더|올랜더|오리앤더|늙은 올리앤더|늙은 오리앤더',
    'evidence_ids' => 'D-21049|default:22111|default:33212|default:35208|default:39837|default:62263',
    'status' => 'confirmed',
    'notes' => 'English identifies a famous alchemist named Oleander Sinclair, whose book is signed by him at default:33212 and default:62263. The quest NPC explicitly admits at default:22111 and default:39837 that he is an impostor using the dead alchemist’s name; default:35208 explains he became Oleander after robbing other traveling alchemists. Register the shared source name as a display-name entry, not as a claim that both referents are one person. Pair full-name mentions as 올리앤더 싱클레어(Oleander Sinclair), first-name mentions as 올리앤더(Oleander), and the established descriptor Old Oleander as 늙은 올리앤더(Old Oleander). Japanese オリアンダー・シンクレア/老オリアンダー and Chinese 欧利安德·辛克莱/老欧利安德 corroborate. No direct official Korean manual entry or PAK-derived evidence.'
  }.freeze

  module_function

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def english_counts(source)
    english = texts(source, 'en').join("\n")
    full = english.scan(/(?<![A-Za-z])Oleander Sinclair(?![A-Za-z])/i).length
    old = english.scan(/(?<![A-Za-z])Old Oleander(?![A-Za-z])/i).length
    total = english.scan(/(?<![A-Za-z])Oleander(?![A-Za-z])/i).length
    [full, old, total - full - old]
  end

  def korean_counts(text)
    full = text.scan(/(?:올리앤더|올랜더|오리앤더)\s+싱클레어(?:\((?:Oleander Sinclair|Oleander)\))?/).length
    old = text.scan(/늙은\s+(?:올리앤더|올랜더|오리앤더)(?:\((?:Old Oleander|Oleander)\))?/).length
    all = text.scan(/올리앤더|올랜더|오리앤더/).length
    [full, old, all - full - old]
  end

  def canonicalize(text)
    text = text.gsub(
      /(?<![가-힣])(?:올리앤더|올랜더|오리앤더)\s+싱클레어(?:\((?:Oleander Sinclair|Oleander)\))?/,
      '올리앤더 싱클레어(Oleander Sinclair)'
    )
    text = text.gsub(
      /늙은\s+(?:올리앤더|올랜더|오리앤더)(?:\((?:Old Oleander|Oleander)\))?/,
      '늙은 올리앤더(Old Oleander)'
    )
    text.gsub(
      /(?<!늙은 )(?<![가-힣])(?:올리앤더|올랜더|오리앤더)(?!\s+싱클레어)(?:\((?:Oleander|Oleander Sinclair)\))?/,
      '올리앤더(Oleander)'
    )
  end

  def run
    [DEFINITION_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'entity already registered' if glossary.any? { |row| row['entity_key'] == PERSON['entity_key'] }
    inventory = M.refresh_inventory
    reviews = inventory.values.each_with_object([]) do |source, result|
      expected = english_counts(source)
      next if expected.sum == 0

      raise "unexpected resource for Oleander: #{M.key(source).inspect}" unless
        %w[base default].include?(source['resource'])
      actual = korean_counts(source.fetch('work_text'))
      raise "Korean/source mention mismatch at #{M.key(source).inspect}: #{expected.inspect} != #{actual.inspect}" unless
        expected == actual

      old = source.fetch('work_text')
      new_text = canonicalize(old)
      raise "canonical forms incomplete at #{M.key(source).inspect}" unless
        korean_counts(new_text) == expected &&
        new_text.scan(/올리앤더 싱클레어\(Oleander Sinclair\)/).length == expected[0] &&
        new_text.scan(/늙은 올리앤더\(Old Oleander\)/).length == expected[1] &&
        new_text.scan(/올리앤더\(Oleander\)/).length == expected[2]
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
    puts "Prepared #{reviews.length} Oleander rows across #{reviews.map { |row| row['resource'] }.uniq.join(', ')}: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

OleanderSinclairD21049.run if $PROGRAM_NAME == __FILE__
